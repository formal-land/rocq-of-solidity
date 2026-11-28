#!/usr/bin/env python3
"""
Generate Rocq EVM fixture tests from official EEST state-test JSON fixtures.

The generated Rocq checks are intentionally a conservative subset of Ethereum
state tests. They execute the destination account bytecode directly through the
current Rocq EVM runner and assert only effects that the runner models today.
"""

from __future__ import annotations

import argparse
import collections
import hashlib
import json
import re
import shutil
from dataclasses import dataclass
from pathlib import Path
from string import Template
from typing import Any


REPO_ROOT = Path(__file__).resolve().parents[2]
ROCQ_ROOT = REPO_ROOT / "rocq" / "RocqOfSolidity"
DEFAULT_ALLOWLIST = REPO_ROOT / "rocq" / "scripts" / "evm_tests_allowlist.json"
DEFAULT_BLACKLIST = ROCQ_ROOT / "blacklist.txt"
DEFAULT_OUT = ROCQ_ROOT / "Evm" / "Tests" / "Ethereum" / "Generated"
MAX_ROCQ_EVALUATION_STEPS = 1_000_000
ROCQ_EVALUATION_SPEED_SKIP_REASON = (
    "fixture execution exceeds current Rocq evaluation speed budget"
)
ECRECOVER_SPEED_SKIP_REASON = (
    "ecrecover precompile fixtures exceed current Rocq evaluation speed budget"
)
PRECOMPILE_SWEEP_SPEED_SKIP_REASON = (
    "precompile sweep fixtures exceed current Rocq evaluation speed budget"
)


SUPPORTED_OPCODES = (
    set(range(0x00, 0x0C))
    | set(range(0x10, 0x1F))
    | {0x20}
    | set(range(0x30, 0x40))
    | set(range(0x40, 0x4B))
    | set(range(0x50, 0x60))
    | set(range(0x60, 0x80))
    | set(range(0x80, 0xA0))
    | set(range(0xA0, 0xA5))
    | {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xFA, 0xFD, 0xFF}
)

DISALLOWED_DIRECT_EXECUTION_OPCODES: dict[int, str] = {}

UNSUPPORTED_DIRECT_CALL_FIXTURE_PATTERNS = (
    "blake2",
    "eip152",
    "eip2537",
    "eip7883",
    "modexp",
    "precompile",
    "precompiledcontracts",
    "stcallcreatecallcodetest",
    "strandom2",
    "stspecialtest/jumpdest_attack",
    "ststaticcall",
    "stsystemoperationstest",
    "test_calldatacopy",
    "zeroknowledge",
)

SUPPORTED_DIRECT_CALL_FIXTURE_PATTERNS = (
    "blake2",
    "eip7951_p256verify",
    "frontier/precompiles",
    "identity_precompile",
    "modexp",
    "ripemd",
    "sha256",
    "ststaticcall",
    "stprecompiledcontracts",
    "stprecompiledcontracts2",
)

UNSUPPORTED_OPCODES: dict[int, str] = {}

DIRECT_RUNNER_UNMODELED_OPCODES: dict[int, str] = {}


class FixtureError(Exception):
    pass


@dataclass(frozen=True)
class AccountAssertion:
    address: int
    balance: int
    nonce: int
    code: list[int]
    storage: list[tuple[int, int]]


@dataclass(frozen=True)
class GeneratedCase:
    case_id: str
    file: str
    test_name: str
    fork: str
    protocol: str
    post_index: int
    fixture_name: str
    pre: list[tuple[int, dict[str, Any]]]
    block_coinbase: int
    block_gas_limit: int
    block_number: int
    block_timestamp: int
    block_difficulty: int
    block_random: int
    block_base_fee: int
    block_blob_base_fee: int
    blob_hashes: list[int]
    transaction_kind: str
    nonce: int
    sender: int
    to: int
    is_create: bool
    value: int
    gas_limit: int
    gas_price: int
    gas_fee_cap: int
    priority_fee_cap: int
    blob_gas_fee_cap: int
    data: list[int]
    access_list: list[tuple[int, list[int]]]
    steps: int
    account_assertions: list[AccountAssertion]
    expected_error: str | None
    chain_id: int = 1
    authorizations: tuple[tuple[int, int, int, int, int, int], ...] = ()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate Rocq EVM tests from EEST state-test JSON fixtures.",
    )
    parser.add_argument(
        "--fixtures",
        required=True,
        type=Path,
        help="Path to an extracted EEST fixture directory containing fixtures/state_tests/.",
    )
    parser.add_argument(
        "--allowlist",
        default=DEFAULT_ALLOWLIST,
        type=Path,
        help="JSON allowlist of fixture cases to generate unless --all is set.",
    )
    parser.add_argument(
        "--all",
        action="store_true",
        help="Generate every fixture post-state entry that passes the conservative filter.",
    )
    parser.add_argument(
        "--blacklist",
        default=DEFAULT_BLACKLIST,
        type=Path,
        help="Rocq Makefile blacklist. Blacklisted generated files are omitted from Manifest.v.",
    )
    parser.add_argument(
        "--out",
        default=DEFAULT_OUT,
        type=Path,
        help="Output directory for generated Rocq modules.",
    )
    parser.add_argument(
        "--summary",
        type=Path,
        help="Optional JSON summary path for generated and skipped fixture counts.",
    )
    return parser.parse_args()


def read_json(path: Path) -> Any:
    with path.open(encoding="utf-8") as handle:
        return json.load(handle)


def parse_hex_int(value: Any) -> int:
    if isinstance(value, int):
        return value
    if not isinstance(value, str):
        raise FixtureError(f"expected hex string or int, got {value!r}")
    if value in ("", "0x"):
        return 0
    if not value.startswith("0x"):
        raise FixtureError(f"expected hex string, got {value!r}")
    return int(value[2:], 16)


def parse_hex_bytes(value: Any) -> list[int]:
    if not isinstance(value, str) or not value.startswith("0x"):
        raise FixtureError(f"expected bytes hex string, got {value!r}")
    digits = value[2:]
    if len(digits) % 2 != 0:
        raise FixtureError(f"expected even-length bytes hex string, got {value!r}")
    return [int(digits[i : i + 2], 16) for i in range(0, len(digits), 2)]


def protocol_constructor(fork: str) -> str:
    known = {
        "Frontier",
        "Homestead",
        "Byzantium",
        "ConstantinopleFix",
        "Istanbul",
        "Berlin",
        "London",
        "Paris",
        "Shanghai",
        "Cancun",
        "Prague",
        "Osaka",
    }
    if fork not in known:
        raise FixtureError(f"unsupported fork {fork!r}")
    return f"Protocol.{fork}"


def fake_exponential(factor: int, numerator: int, denominator: int) -> int:
    output = 0
    numerator_accum = factor * denominator
    i = 1
    while numerator_accum > 0:
        output += numerator_accum
        numerator_accum = (numerator_accum * numerator) // (denominator * i)
        i += 1
    return output // denominator


def blob_base_fee(env: dict[str, Any], fork: str = "Cancun") -> int:
    fraction = 5007716 if fork in {"Prague", "Osaka"} else 3338477
    if "currentExcessBlobGas" in env:
        excess = parse_hex_int(env["currentExcessBlobGas"])
    else:
        gas_per_blob = 1 << 17
        target = 6 if fork in {"Prague", "Osaka"} else 3
        parent_excess = parse_hex_int(env.get("parentExcessBlobGas", "0x0"))
        used = parse_hex_int(env.get("parentBlobGasUsed", "0x0"))
        excess = parent_excess + used - target * gas_per_blob
        if fork == "Osaka" and excess >= 0:
            # EIP-7918 uses the child schedule for the parent's blob price.
            parent_price = fake_exponential(1, parent_excess, fraction)
            base_fee = parse_hex_int(env.get("parentBaseFee", "0x0"))
            if 8192 * base_fee > gas_per_blob * parent_price:
                excess = parent_excess + used * (9 - target) // 9
    return fake_exponential(1, max(0, excess), fraction)


def transaction_gas_price(transaction: dict[str, Any], env: dict[str, Any]) -> int:
    if "gasPrice" in transaction:
        return parse_hex_int(transaction["gasPrice"])
    max_fee = parse_hex_int(transaction.get("maxFeePerGas", "0x00"))
    priority_fee = parse_hex_int(transaction.get("maxPriorityFeePerGas", "0x00"))
    base_fee = parse_hex_int(env.get("currentBaseFee", "0x00"))
    return min(max_fee, base_fee + priority_fee)


def transaction_gas_fee_cap(transaction: dict[str, Any]) -> int:
    if "maxFeePerGas" in transaction:
        return parse_hex_int(transaction["maxFeePerGas"])
    return parse_hex_int(transaction.get("gasPrice", "0x00"))


def transaction_priority_fee_cap(transaction: dict[str, Any]) -> int:
    if "maxPriorityFeePerGas" in transaction:
        return parse_hex_int(transaction["maxPriorityFeePerGas"])
    return parse_hex_int(transaction.get("gasPrice", "0x00"))


def transaction_blob_gas_fee_cap(transaction: dict[str, Any]) -> int:
    return parse_hex_int(transaction.get("maxFeePerBlobGas", "0x00"))


def transaction_authorizations(transaction: dict[str, Any]) -> tuple[tuple[int, int, int, int, int, int], ...]:
    entries = []
    for auth in transaction.get("authorizationList", []):
        address = parse_hex_bytes(auth["address"])
        if len(address) != 20:
            raise FixtureError("authorization address must contain exactly 20 bytes")
        parity = auth["yParity"] if "yParity" in auth else auth["v"]
        entries.append((parse_hex_int(auth["chainId"]), int.from_bytes(bytes(address), "big"),
                        parse_hex_int(auth["nonce"]), parse_hex_int(parity),
                        parse_hex_int(auth["r"]), parse_hex_int(auth["s"])))
    return tuple(entries)


def transaction_kind_constructor(transaction: dict[str, Any]) -> str:
    if "authorizationList" in transaction:
        return "Fixture.TransactionKind.SetCode"
    if "maxFeePerBlobGas" in transaction or "blobVersionedHashes" in transaction:
        return "Fixture.TransactionKind.Blob"
    if "maxFeePerGas" in transaction or "maxPriorityFeePerGas" in transaction:
        return "Fixture.TransactionKind.DynamicFee"
    if "accessLists" in transaction:
        return "Fixture.TransactionKind.AccessList"
    return "Fixture.TransactionKind.Legacy"


def modeled_expected_error(expect_exception: str) -> str | None:
    reasons = set(expect_exception.split("|"))
    intrinsic_gas_reasons = {
        "TransactionException.INTRINSIC_GAS_TOO_LOW",
        "TransactionException.INTRINSIC_GAS_BELOW_FLOOR_GAS_COST",
        "TransactionException.GAS_ALLOWANCE_EXCEEDED",
    }
    unsupported_type_reasons = {
        "TransactionException.TYPE_1_TX_PRE_FORK",
        "TransactionException.TYPE_2_TX_PRE_FORK",
        "TransactionException.TYPE_3_TX_PRE_FORK",
        "TransactionException.TYPE_4_TX_PRE_FORK",
    }
    if reasons == {"TransactionException.TYPE_4_EMPTY_AUTHORIZATION_LIST"}:
        return "invalid transaction: empty authorization list"
    if reasons == {"TransactionException.TYPE_4_TX_CONTRACT_CREATION"}:
        return "invalid transaction: set-code transaction cannot create contract"
    if reasons == {"TransactionException.GAS_LIMIT_EXCEEDS_MAXIMUM"}:
        return "invalid transaction: gas limit exceeds protocol cap"
    if reasons & unsupported_type_reasons:
        return "invalid transaction: transaction type not supported by protocol"
    if reasons == {"TransactionException.SENDER_NOT_EOA"}:
        return "invalid transaction: sender account has code"
    if reasons == {"TransactionException.NONCE_IS_MAX"}:
        return "invalid transaction: sender nonce too high"
    if reasons == {"TransactionException.PRIORITY_GREATER_THAN_MAX_FEE_PER_GAS"}:
        return "invalid transaction: priority fee exceeds fee cap"
    if reasons == {"TransactionException.TYPE_3_TX_CONTRACT_CREATION"}:
        return "invalid transaction: blob transaction cannot create contract"
    if reasons == {"TransactionException.TYPE_3_TX_ZERO_BLOBS"}:
        return "invalid transaction: blob transaction has no blobs"
    if "TransactionException.TYPE_3_TX_BLOB_COUNT_EXCEEDED" in reasons and reasons <= {
        "TransactionException.TYPE_3_TX_MAX_BLOB_GAS_ALLOWANCE_EXCEEDED",
        "TransactionException.TYPE_3_TX_BLOB_COUNT_EXCEEDED",
    }:
        return "invalid transaction: blob transaction has too many blobs"
    if reasons == {"TransactionException.TYPE_3_TX_INVALID_BLOB_VERSIONED_HASH"}:
        return "invalid transaction: invalid blob hash version"
    if reasons == {"TransactionException.INSUFFICIENT_MAX_FEE_PER_BLOB_GAS"}:
        return "invalid transaction: blob fee cap below blob base fee"
    if reasons == {"TransactionException.INITCODE_SIZE_EXCEEDED"}:
        return "invalid transaction: init code size exceeds maximum"
    if reasons == {"TransactionException.INSUFFICIENT_MAX_FEE_PER_GAS"}:
        return "invalid transaction: gas price below block base fee"
    if reasons and reasons <= intrinsic_gas_reasons:
        return "invalid transaction: gas limit below transaction minimum"
    if "TransactionException.INSUFFICIENT_ACCOUNT_FUNDS" in reasons:
        if reasons <= {
            "TransactionException.INSUFFICIENT_ACCOUNT_FUNDS",
            "TransactionException.GASLIMIT_PRICE_PRODUCT_OVERFLOW",
        }:
            return "invalid transaction: insufficient sender balance"
        if reasons <= intrinsic_gas_reasons | {
            "TransactionException.INSUFFICIENT_ACCOUNT_FUNDS",
        }:
            return "invalid transaction: gas limit below transaction minimum"
    if reasons == {"TransactionException.INSUFFICIENT_ACCOUNT_FUNDS"}:
        return "invalid transaction: insufficient sender balance"
    return None


def transaction_blob_hashes(transaction: dict[str, Any]) -> list[int]:
    hashes = transaction.get("blobVersionedHashes", [])
    if not isinstance(hashes, list):
        raise FixtureError("blobVersionedHashes is not a list")
    return [parse_hex_int(blob_hash) for blob_hash in hashes]


def hex_address_to_int(value: str) -> int:
    if not isinstance(value, str) or value == "" or not value.startswith("0x"):
        raise FixtureError(f"expected non-empty hex address, got {value!r}")
    return int(value[2:], 16)


def account_lookup(accounts: dict[str, Any], address: str) -> dict[str, Any]:
    address_lower = address.lower()
    for current, account in accounts.items():
        if current.lower() == address_lower:
            return account
    raise FixtureError(f"account {address} not found")


def optional_account_lookup(accounts: dict[str, Any], address: str) -> dict[str, Any] | None:
    address_lower = address.lower()
    for current, account in accounts.items():
        if current.lower() == address_lower:
            return account
    return None


def selected_fixture_path(root: Path, relative_path: str) -> Path:
    candidates = [root / relative_path]
    if relative_path.startswith("fixtures/"):
        candidates.append(root / relative_path.removeprefix("fixtures/"))
    for candidate in candidates:
        if candidate.exists():
            return candidate
    raise FixtureError(f"fixture JSON not found: {relative_path}")


def fixture_relative_path(root: Path, path: Path) -> str:
    relative = path.relative_to(root).as_posix()
    if relative.startswith("fixtures/"):
        return relative
    return f"fixtures/{relative}"


def selected_transaction_value(transaction: dict[str, Any], field: str, index: int) -> Any:
    values = transaction.get(field)
    if not isinstance(values, list):
        raise FixtureError(f"transaction field {field!r} is not a list")
    try:
        return values[index]
    except IndexError as exc:
        raise FixtureError(f"transaction field {field!r} has no index {index}") from exc


def selected_access_list(transaction: dict[str, Any], indexes: dict[str, Any]) -> list[Any]:
    access_lists = transaction.get("accessLists", [])
    if not isinstance(access_lists, list):
        raise FixtureError("transaction field 'accessLists' is not a list")
    if not access_lists:
        return []
    data_index = int(indexes.get("data", 0))
    if len(access_lists) == 1:
        selected = access_lists[0]
    else:
        try:
            selected = access_lists[data_index]
        except IndexError as exc:
            raise FixtureError(
                f"transaction field 'accessLists' has no index {data_index}"
            ) from exc
    if not isinstance(selected, list):
        raise FixtureError("selected access list is not a list")
    return selected


def parse_access_list(access_list: list[Any]) -> list[tuple[int, list[int]]]:
    entries: list[tuple[int, list[int]]] = []
    for entry in access_list:
        if not isinstance(entry, dict):
            raise FixtureError(f"access list entry is not an object: {entry!r}")
        storage_keys = entry.get("storageKeys", [])
        if not isinstance(storage_keys, list):
            raise FixtureError("access list storageKeys is not a list")
        entries.append(
            (
                hex_address_to_int(entry["address"]),
                [parse_hex_int(slot) for slot in storage_keys],
            )
        )
    return entries


def scan_bytecode(code: list[int], *, allow_direct_calls: bool = False) -> list[str]:
    errors: list[str] = []
    i = 0
    while i < len(code):
        opcode = code[i]
        if 0x60 <= opcode <= 0x7F:
            i += 1 + (opcode - 0x5F)
            continue
        if opcode in UNSUPPORTED_OPCODES:
            errors.append(f"unsupported opcode {UNSUPPORTED_OPCODES[opcode]} at byte {i}")
        elif opcode in DIRECT_RUNNER_UNMODELED_OPCODES:
            name = DIRECT_RUNNER_UNMODELED_OPCODES[opcode]
            errors.append(f"gas-accounting opcode {name} at byte {i}")
        elif opcode in DISALLOWED_DIRECT_EXECUTION_OPCODES and not allow_direct_calls:
            name = DISALLOWED_DIRECT_EXECUTION_OPCODES[opcode]
            errors.append(f"direct-execution skip opcode {name} at byte {i}")
        i += 1
    return errors


def bytecode_contains_opcode(code: list[int], opcodes: set[int]) -> bool:
    i = 0
    while i < len(code):
        opcode = code[i]
        if 0x60 <= opcode <= 0x7F:
            i += 1 + (opcode - 0x5F)
            continue
        if opcode in opcodes:
            return True
        i += 1
    return False


def scan_pre_account_bytecode(
    pre: dict[str, Any],
    *,
    allow_direct_calls: bool = False,
) -> list[str]:
    errors: set[str] = set()
    for account in pre.values():
        code = parse_hex_bytes(account.get("code", "0x"))
        for error in scan_bytecode(code, allow_direct_calls=allow_direct_calls):
            errors.add(f"nested account code {error}")
    return sorted(errors)


def max_pre_account_instruction_count(pre: dict[str, Any]) -> int:
    return max(
        (
            instruction_count(parse_hex_bytes(account.get("code", "0x")))
            for account in pre.values()
        ),
        default=0,
    )


def unsupported_direct_call_fixture_family(fixture_file: str) -> bool:
    normalized = fixture_file.lower()
    if any(pattern in normalized for pattern in SUPPORTED_DIRECT_CALL_FIXTURE_PATTERNS):
        return False
    return any(pattern in normalized for pattern in UNSUPPORTED_DIRECT_CALL_FIXTURE_PATTERNS)


def stzeroknowledge_pairing_fixture(fixture_file: str, test_name: str) -> bool:
    normalized = f"{fixture_file}/{test_name}".lower()
    return "stzeroknowledge" in normalized and "pairing" in normalized


def unsupported_direct_call_fixture_reason(
    fixture_file: str,
    test_name: str,
) -> str | None:
    normalized = fixture_file.lower()
    if stzeroknowledge_pairing_fixture(fixture_file, test_name):
        return "BN254 pairing precompile fixtures are not generated in this pass"
    if "stzeroknowledge" in normalized:
        return None
    if unsupported_direct_call_fixture_family(fixture_file):
        return "direct CALL-family fixture requires unsupported precompile semantics"
    return None


def performance_limited_fixture_reason(fixture_file: str, test_name: str) -> str | None:
    normalized = f"{fixture_file}/{test_name}".lower()
    if "ecrecover" in normalized or "ecrec" in normalized:
        return ECRECOVER_SPEED_SKIP_REASON
    if "staticcalltoprecompile" in normalized:
        return PRECOMPILE_SWEEP_SPEED_SKIP_REASON
    return None


def instruction_count(code: list[int]) -> int:
    count = 0
    i = 0
    while i < len(code):
        opcode = code[i]
        count += 1
        if 0x60 <= opcode <= 0x7F:
            i += 1 + (opcode - 0x5F)
        else:
            i += 1
    return count


def max_small_push_value(code: list[int], limit: int = 100_000) -> int:
    best = 0
    i = 0
    while i < len(code):
        opcode = code[i]
        if 0x60 <= opcode <= 0x7F:
            size = opcode - 0x5F
            value = int.from_bytes(bytes(code[i + 1 : i + 1 + size]), "big")
            if value <= limit:
                best = max(best, value)
            i += 1 + size
        else:
            i += 1
    return best


def bytecode_push_immediates(code: list[int]) -> list[tuple[int, int, int | None]]:
    instructions: list[tuple[int, int, int | None]] = []
    i = 0
    while i < len(code):
        pc = i
        opcode = code[i]
        if 0x60 <= opcode <= 0x7F:
            size = opcode - 0x5F
            value = int.from_bytes(bytes(code[i + 1 : i + 1 + size]), "big")
            instructions.append((pc, opcode, value))
            i += 1 + size
        else:
            instructions.append((pc, opcode, None))
            i += 1
    return instructions


def max_backward_loop_push_value(code: list[int]) -> int:
    instructions = bytecode_push_immediates(code)
    jumpdests = {pc for pc, opcode, _ in instructions if opcode == 0x5B}
    best = 0
    previous: tuple[int, int, int | None] | None = None
    for pc, opcode, _ in instructions:
        if opcode == 0x56 and previous is not None:
            _push_pc, _push_opcode, target = previous
            if target is not None and target in jumpdests and target < pc:
                best = max(best, max_small_push_value(code[target : pc + 1]))
        previous = (pc, opcode, _)
    return best


def max_pre_account_backward_loop_push_value(pre: dict[str, Any]) -> int:
    return max(
        (
            max_backward_loop_push_value(parse_hex_bytes(account.get("code", "0x")))
            for account in pre.values()
        ),
        default=0,
    )


def execution_steps(
    default_steps: int,
    entry: dict[str, Any],
    code_instruction_count: int,
    loop_bound_hint: int,
    storage_assertion_count: int,
) -> int:
    configured_steps = int(entry.get("steps", default_steps))
    structural_steps = max(
        code_instruction_count + 10,
        code_instruction_count * 1000,
        loop_bound_hint * 100,
        storage_assertion_count * 100,
    )
    return max(configured_steps, structural_steps)


def storage_entries(storage: dict[str, Any]) -> list[tuple[int, int]]:
    return sorted(
        ((parse_hex_int(slot), parse_hex_int(value)) for slot, value in storage.items()),
        key=lambda entry: entry[0],
    )


def post_account_assertions(
    pre: dict[str, Any],
    post_state: dict[str, Any],
    *,
    requested_storage_address: str | None = None,
    requested_storage_slots: list[str] | None = None,
) -> list[AccountAssertion]:
    requested_slots = (
        {parse_hex_int(slot) for slot in requested_storage_slots}
        if requested_storage_slots is not None
        else None
    )
    assertions: list[AccountAssertion] = []
    for address_raw, post_account in sorted(
        post_state.items(),
        key=lambda entry: hex_address_to_int(entry[0]),
    ):
        post_storage = dict(storage_entries(post_account.get("storage", {})))
        pre_account = optional_account_lookup(pre, address_raw)
        pre_storage_slots = (
            set(dict(storage_entries(pre_account.get("storage", {}))).keys())
            if pre_account is not None
            else set()
        )
        slots = sorted(pre_storage_slots | set(post_storage.keys()))
        storage = [(slot, post_storage.get(slot, 0)) for slot in slots]
        if requested_slots is not None:
            if (
                requested_storage_address is not None
                and address_raw.lower() == requested_storage_address.lower()
            ):
                storage = [entry for entry in storage if entry[0] in requested_slots]
            else:
                storage = []
        assertions.append(
            AccountAssertion(
                address=hex_address_to_int(address_raw),
                balance=parse_hex_int(post_account["balance"]),
                nonce=parse_hex_int(post_account["nonce"]),
                code=parse_hex_bytes(post_account["code"]),
                storage=storage,
            )
        )
    return assertions


def sorted_alloc(pre: dict[str, Any]) -> list[tuple[int, dict[str, Any]]]:
    return sorted(
        ((hex_address_to_int(address), account) for address, account in pre.items()),
        key=lambda entry: entry[0],
    )


def build_case_from_fixture(
    default_steps: int,
    entry: dict[str, Any],
    fixture: dict[str, Any],
    *,
    pinned_case: bool = False,
    include_nested_budget: bool = True,
    cap_step_hint: bool = False,
) -> GeneratedCase:
    case_id = sanitize_identifier(entry["id"])
    fixture_file = entry["file"]
    test_name = entry["test"]
    performance_limited_reason = performance_limited_fixture_reason(
        fixture_file,
        test_name,
    )
    if performance_limited_reason is not None and not pinned_case:
        raise FixtureError(performance_limited_reason)
    unsupported_direct_call_reason = unsupported_direct_call_fixture_reason(
        fixture_file,
        test_name,
    )
    if unsupported_direct_call_reason is not None:
        raise FixtureError(unsupported_direct_call_reason)
    fork = entry["fork"]
    post_index = int(entry.get("post_index", 0))
    try:
        post = fixture["post"][fork][post_index]
    except (KeyError, IndexError) as exc:
        raise FixtureError(f"post entry {fork}[{post_index}] not found") from exc

    expected_error = None
    expected_reasons: set[str] = set()
    if "expectException" in post:
        expected_reasons = set(post["expectException"].split("|"))
        expected_error = modeled_expected_error(post["expectException"])
        if expected_error is None:
            raise FixtureError("expected exception fixtures are not generated in this pass")

    transaction = fixture["transaction"]
    if (
        "TransactionException.INSUFFICIENT_ACCOUNT_FUNDS" in expected_reasons
        and optional_account_lookup(fixture["pre"], transaction["sender"]) is None
    ):
        expected_error = "invalid transaction: sender account not found"
    to_raw = transaction["to"]
    is_create = to_raw == ""
    indexes = post["indexes"]
    selected_data = selected_transaction_value(transaction, "data", int(indexes["data"]))
    selected_value = selected_transaction_value(transaction, "value", int(indexes["value"]))
    selected_gas_limit = selected_transaction_value(transaction, "gasLimit", int(indexes["gas"]))
    access_list = parse_access_list(selected_access_list(transaction, indexes))

    value = parse_hex_int(selected_value)

    to = 0 if is_create else hex_address_to_int(to_raw)
    if expected_error is None:
        if is_create:
            target_code = parse_hex_bytes(selected_data)
        else:
            target_pre_account = optional_account_lookup(fixture["pre"], to_raw)
            target_code = (
                parse_hex_bytes(target_pre_account["code"])
                if target_pre_account is not None
                else []
            )
        code_instruction_count = instruction_count(target_code)
        loop_bound_hint = max_backward_loop_push_value(target_code) if include_nested_budget else 0
        if include_nested_budget and bytecode_contains_opcode(target_code, {0xF0, 0xF1, 0xF2, 0xF4, 0xF5, 0xFA}):
            code_instruction_count = max(
                code_instruction_count,
                max_pre_account_instruction_count(fixture["pre"]),
            )
            loop_bound_hint = max(
                loop_bound_hint,
                max_pre_account_backward_loop_push_value(fixture["pre"]),
            )
        scan_errors = scan_bytecode(
            target_code,
            allow_direct_calls=bool(entry.get("allow_direct_calls", False)),
        )
        if bytecode_contains_opcode(target_code, {0xF1, 0xF2, 0xF4, 0xFA}):
            unsupported_direct_call_reason = unsupported_direct_call_fixture_reason(
                fixture_file,
                test_name,
            )
            if unsupported_direct_call_reason is not None:
                scan_errors.append(unsupported_direct_call_reason)
            scan_errors.extend(
                scan_pre_account_bytecode(
                    fixture["pre"],
                    allow_direct_calls=False,
                )
            )
        if scan_errors:
            raise FixtureError("; ".join(scan_errors))
    else:
        code_instruction_count = 0
        loop_bound_hint = 0

    requested_slots = entry.get("storage_slots")
    account_assertions = post_account_assertions(
        fixture["pre"],
        post["state"],
        requested_storage_address=to_raw,
        requested_storage_slots=requested_slots,
    )
    storage_assertion_count = sum(
        len(account.storage) for account in account_assertions
    )
    if not account_assertions:
        raise FixtureError("no modeled post-state account assertions")

    env = fixture["env"]
    sender = hex_address_to_int(transaction["sender"])
    steps = execution_steps(
        default_steps,
        entry,
        code_instruction_count,
        loop_bound_hint,
        storage_assertion_count + len(account_assertions),
    )
    if cap_step_hint:
        # Frame gas bounds opcode execution. The hint supplies recursive fuel.
        steps = min(steps, MAX_ROCQ_EVALUATION_STEPS)
    elif steps > MAX_ROCQ_EVALUATION_STEPS and not pinned_case:
        raise FixtureError(ROCQ_EVALUATION_SPEED_SKIP_REASON)

    return GeneratedCase(
        case_id=case_id,
        file=fixture_file,
        test_name=test_name,
        fork=fork,
        protocol=protocol_constructor(fork),
        post_index=post_index,
        fixture_name=f"{fixture_file}:{test_name}:{fork}[{post_index}]",
        pre=sorted_alloc(fixture["pre"]),
        chain_id=parse_hex_int(fixture.get("config", {}).get("chainid", "0x1")),
        block_coinbase=hex_address_to_int(env["currentCoinbase"]),
        block_gas_limit=parse_hex_int(env["currentGasLimit"]),
        block_number=parse_hex_int(env["currentNumber"]),
        block_timestamp=parse_hex_int(env["currentTimestamp"]),
        block_difficulty=parse_hex_int(env.get("currentDifficulty", "0x00")),
        block_random=parse_hex_int(env.get("currentRandom", env.get("currentDifficulty", "0x00"))),
        block_base_fee=parse_hex_int(env.get("currentBaseFee", "0x00")),
        block_blob_base_fee=blob_base_fee(env, fork),
        blob_hashes=transaction_blob_hashes(transaction),
        transaction_kind=transaction_kind_constructor(transaction),
        authorizations=transaction_authorizations(transaction),
        nonce=parse_hex_int(transaction.get("nonce", "0x00")),
        sender=sender,
        to=to,
        is_create=is_create,
        value=value,
        gas_limit=parse_hex_int(selected_gas_limit),
        gas_price=transaction_gas_price(transaction, env),
        gas_fee_cap=transaction_gas_fee_cap(transaction),
        priority_fee_cap=transaction_priority_fee_cap(transaction),
        blob_gas_fee_cap=transaction_blob_gas_fee_cap(transaction),
        data=parse_hex_bytes(selected_data),
        access_list=access_list,
        steps=steps,
        account_assertions=account_assertions,
        expected_error=expected_error,
    )


def build_case(root: Path, default_steps: int, entry: dict[str, Any]) -> GeneratedCase:
    fixture_file = entry["file"]
    fixture_path = selected_fixture_path(root, fixture_file)
    fixture_json = read_json(fixture_path)
    test_name = entry["test"]
    if test_name not in fixture_json:
        raise FixtureError(f"test {test_name!r} not found in {fixture_file}")
    return build_case_from_fixture(default_steps, entry, fixture_json[test_name])


def sanitize_identifier(value: str) -> str:
    identifier = re.sub(r"[^A-Za-z0-9_]", "_", value)
    identifier = re.sub(r"_+", "_", identifier).strip("_")
    if not identifier:
        raise FixtureError("empty identifier after sanitization")
    if identifier[0].isdigit():
        identifier = f"case_{identifier}"
    return identifier


def discovered_identifier(file: str, test_name: str, fork: str, post_index: int) -> str:
    source = f"{file}|{test_name}|{fork}|{post_index}"
    digest = hashlib.sha1(source.encode()).hexdigest()[:10]
    short_test_name = test_name.split("::")[-1]
    stem = (
        file.removeprefix("fixtures/state_tests/")
        .removesuffix(".json")
        .replace("/", "_")
    )
    base = sanitize_identifier(f"{stem}_{short_test_name}_{fork}_{post_index}").lower()
    return f"{base[:96]}_{digest}"


def fixture_json_files(root: Path) -> list[Path]:
    candidates = [
        root / "fixtures" / "state_tests",
        root / "state_tests",
    ]
    for candidate in candidates:
        if candidate.exists():
            return sorted(candidate.rglob("*.json"))
    raise FixtureError("no fixtures/state_tests directory found")


def discover_cases(
    root: Path,
    default_steps: int,
) -> tuple[list[GeneratedCase], collections.Counter[str]]:
    cases: list[GeneratedCase] = []
    skipped: collections.Counter[str] = collections.Counter()

    for path in fixture_json_files(root):
        fixture_file = fixture_relative_path(root, path)
        try:
            fixture_json = read_json(path)
        except Exception as exc:
            skipped[f"json error: {exc}"] += 1
            continue
        for test_name, fixture in fixture_json.items():
            posts = fixture.get("post", {})
            for fork, fork_posts in posts.items():
                for post_index, _ in enumerate(fork_posts):
                    entry = {
                        "id": discovered_identifier(fixture_file, test_name, fork, post_index),
                        "file": fixture_file,
                        "test": test_name,
                        "fork": fork,
                        "post_index": post_index,
                    }
                    try:
                        cases.append(build_case_from_fixture(default_steps, entry, fixture))
                    except FixtureError as exc:
                        skipped[str(exc)] += 1
    return cases, skipped


def rocq_string(value: str) -> str:
    return '"' + value.replace('"', '""') + '"'


def rocq_string_option(value: str | None) -> str:
    if value is None:
        return "None"
    return f"Some {rocq_string(value)}"


def rocq_list_literal(values: list[int], *, indent: str, per_line: int) -> str:
    if len(values) <= per_line:
        return "[" + "; ".join(str(value) for value in values) + "]"
    lines = ["["]
    for offset in range(0, len(values), per_line):
        chunk = values[offset : offset + per_line]
        suffix = ";" if offset + per_line < len(values) else ""
        lines.append(indent + "; ".join(str(value) for value in chunk) + suffix)
    lines.append(indent + "]")
    return "\n".join(lines)


def repeated_chunk_at(
    values: list[int],
    start: int,
    *,
    max_period: int = 64,
    min_repeats: int = 8,
    min_total: int = 64,
) -> tuple[int, int] | None:
    remaining = len(values) - start
    best: tuple[int, int] | None = None
    best_total = 0
    for period in range(2, min(max_period, remaining // min_repeats) + 1):
        pattern = values[start : start + period]
        repeats = 1
        offset = start + period
        while (
            offset + period <= len(values)
            and values[offset : offset + period] == pattern
        ):
            repeats += 1
            offset += period
        total = period * repeats
        if repeats >= min_repeats and total >= min_total and total > best_total:
            best = (period, repeats)
            best_total = total
    return best


def rocq_compressed_list(values: list[int], *, min_run: int = 16) -> str | None:
    if len(values) <= 256:
        return None
    segments: list[str] = []
    literal: list[int] = []
    used_compression = False
    i = 0
    while i < len(values):
        value = values[i]
        run_end = i + 1
        while run_end < len(values) and values[run_end] == value:
            run_end += 1
        run_length = run_end - i
        if run_length >= min_run:
            if literal:
                segments.append(rocq_list_literal(literal, indent="  ", per_line=64))
                literal = []
            segments.append(f"List.repeat {value} {run_length}")
            used_compression = True
            i = run_end
            continue

        repeated_chunk = repeated_chunk_at(values, i)
        if repeated_chunk is not None:
            period, repeats = repeated_chunk
            if literal:
                segments.append(rocq_list_literal(literal, indent="  ", per_line=64))
                literal = []
            pattern = rocq_list_literal(values[i : i + period], indent="  ", per_line=64)
            segments.append(f"List.concat (List.repeat {pattern} {repeats})")
            used_compression = True
            i += period * repeats
            continue

        else:
            literal.extend(values[i:run_end])
        i = run_end
    if literal:
        segments.append(rocq_list_literal(literal, indent="  ", per_line=64))
    if not used_compression:
        return None
    if not segments:
        return "[]"
    return "(" + " ++ ".join(segments) + ")"


def rocq_list(values: list[int], *, indent: str = "  ", per_line: int = 16) -> str:
    if not values:
        return "[]"
    compressed = rocq_compressed_list(values)
    if compressed is not None:
        return compressed
    return rocq_list_literal(values, indent=indent, per_line=per_line)


def rocq_storage(entries: list[tuple[int, int]]) -> str:
    if not entries:
        return "[]"
    return "[" + "; ".join(f"({slot}, {value})" for slot, value in entries) + "]"


def rocq_storage_options(entries: list[tuple[int, int]]) -> str:
    if not entries:
        return "[]"
    return "[" + "; ".join(f"({slot}, Some {value})" for slot, value in entries) + "]"


def indent_lines(value: str, prefix: str) -> str:
    return "\n".join(f"{prefix}{line}" if line else line for line in value.splitlines())


def rocq_account_options(entries: list[AccountAssertion]) -> str:
    if not entries:
        return "[]"
    lines = ["["]
    for index, account in enumerate(entries):
        suffix = ";" if index + 1 < len(entries) else ""
        code = rocq_list(account.code, indent="      ")
        if "\n" in code:
            lines.append(f"  ({account.address}, Some ({account.balance}, {account.nonce},")
            lines.append(indent_lines(code, "    "))
            lines.append(f"  )){suffix}")
        else:
            lines.append(
                f"  ({account.address}, Some ({account.balance}, {account.nonce}, {code})){suffix}"
            )
    lines.append("]")
    return "\n".join(lines)


def rocq_account_storage_options(entries: list[AccountAssertion]) -> str:
    storage_entries = [
        (account.address, slot, value)
        for account in entries
        for slot, value in account.storage
    ]
    if not storage_entries:
        return "[]"
    return "[" + "; ".join(
        f"({address}, {slot}, Some {value})"
        for address, slot, value in storage_entries
    ) + "]"


def rocq_access_list(entries: list[tuple[int, list[int]]]) -> str:
    if not entries:
        return "[]"
    return "[" + "; ".join(
        f"({address}, {rocq_list(slots, indent='      ')})"
        for address, slots in entries
    ) + "]"


def emitted_transaction_data(case: GeneratedCase) -> list[int]:
    # EIP-3860 oversized-initcode transactions are rejected before any rule
    # inspects the initcode bytes. Keeping only the authoritative byte length
    # avoids reducing 49 KiB list literals in vm_compute.
    if case.expected_error == "invalid transaction: init code size exceeds maximum":
        return []
    return case.data


def rocq_alloc(address: int, account: dict[str, Any]) -> str:
    balance = parse_hex_int(account["balance"])
    nonce = parse_hex_int(account["nonce"])
    code = rocq_list(parse_hex_bytes(account["code"]), indent="        ")
    storage = rocq_storage(storage_entries(account.get("storage", {})))
    return (
        "    Fixture.Alloc.make\n"
        f"      {address}\n"
        f"      {balance}\n"
        f"      {nonce}\n"
        f"      {code}\n"
        f"      {storage}"
    )


def generate_case(case: GeneratedCase, proof_template: Template | None = None,
                  check_success: bool = False, *, use_vm: bool = False) -> str:
    pre = ";\n".join(rocq_alloc(address, account) for address, account in case.pre)
    emitted_data = emitted_transaction_data(case)
    kind = case.transaction_kind
    if kind == "Fixture.TransactionKind.SetCode":
        entries = ["Fixture.Authorization.make " + " ".join(map(str, fields))
                   for fields in case.authorizations]
        kind = "(" + kind + " [" + ";\n      ".join(entries) + "])"
    if case.is_create:
        transaction_lines = [
            "  Fixture.transaction := Fixture.Transaction.make_create_kind_with_nonce_fee_caps_access_list",
            f"    {kind}",
            f"    {case.nonce}",
            f"    {case.sender}",
            f"    {case.value}",
            f"    {case.gas_limit}",
            f"    {case.gas_price}",
            f"    {case.gas_fee_cap}",
            f"    {case.priority_fee_cap}",
            f"    {case.blob_gas_fee_cap}",
            f"    {len(case.data)}",
            f"    {rocq_list(emitted_data, indent='    ')}",
            f"    {rocq_access_list(case.access_list)};",
        ]
    else:
        transaction_lines = [
            "  Fixture.transaction := Fixture.Transaction.make_kind_with_nonce_fee_caps_access_list",
            f"    {kind}",
            f"    {case.nonce}",
            f"    {case.sender}",
            f"    {case.to}",
            f"    {case.value}",
            f"    {case.gas_limit}",
            f"    {case.gas_price}",
            f"    {case.gas_fee_cap}",
            f"    {case.priority_fee_cap}",
            f"    {case.blob_gas_fee_cap}",
            f"    {len(case.data)}",
            f"    {rocq_list(emitted_data, indent='    ')}",
            f"    {rocq_access_list(case.access_list)};",
        ]
    error_assertion = (
        [
            "Definition expected_error_after : option string :=",
            f"  {rocq_string_option(case.expected_error)}.",
            "",
            f"Example test_{case.case_id}_error :",
            "  Fixture.error_after result = expected_error_after.",
            "Proof. vm_compute. reflexivity. Qed.",
            "",
        ]
        if case.expected_error is not None
        else []
    )
    fixture_lines = [
        "Require Import RocqOfSolidity.RocqOfSolidity.",
        "Require Import RocqOfSolidity.simulations.RocqOfSolidity.",
        "Require Import RocqOfSolidity.Evm.Semantics.",
        "Require Import RocqOfSolidity.Evm.Tests.Ethereum.Fixture.",
        "",
        "(* Generated from official EEST state-test JSON.",
        f"   Source: {case.file}",
        f"   Test: {case.test_name}",
        f"   Fork/post: {case.fork}[{case.post_index}]",
        "   The assertions intentionally cover only effects modeled by Fixture.run. *)",
        "",
        "Definition fixture : Fixture.t := {|",
        f"  Fixture.name := {rocq_string(case.fixture_name)};",
        f"  Fixture.protocol := {case.protocol};",
        "  Fixture.codes := [];",
        "  Fixture.pre := [",
        pre,
        "  ];",
        ("  Fixture.block := Fixture.BlockEnv.make" if case.chain_id == 1 else
         f"  Fixture.block := Fixture.BlockEnv.make_on_chain {case.chain_id}"),
        f"    {case.block_coinbase}",
        f"    {case.block_gas_limit}",
        f"    {case.block_number}",
        f"    {case.block_timestamp}",
        f"    {case.block_difficulty}",
        f"    {case.block_random}",
        f"    {case.block_base_fee}",
        f"    {case.block_blob_base_fee}",
        f"    {rocq_list(case.blob_hashes, indent='    ')};",
        *transaction_lines,
        f"  Fixture.steps := {case.steps};",
        "|}.",
        "",
        "Definition result : Step.t * State.t := Fixture.run fixture.",
        "",
    ]
    if proof_template is not None:
        if check_success:
            error_assertion = [
                "Definition expected_error_after : option string :=",
                f"  {rocq_string_option(case.expected_error)}.",
                "",
            ]
        proof = proof_template.substitute(
            case_id=case.case_id,
            accounts=rocq_account_options(case.account_assertions),
            storage=rocq_account_storage_options(case.account_assertions),
        )
        return "\n".join([*fixture_lines, *error_assertion, proof])
    # EEST marks high-memory cases, including megabytes of repeated calldata.
    # The VM evaluates their gas costs without retaining lazy reduction thunks.
    reduction = "vm_compute" if use_vm or "bigmem" in case.test_name.split("@")[1:] else "lazy"
    proof = f"Proof. {reduction}. reflexivity. Qed."
    if case.authorizations:
        # The kernel performs VM conversion at Qed. Evaluating the same
        # transaction during tactic execution doubles signature recovery work.
        proof = "Proof. vm_cast_no_check (eq_refl expected_after). Qed."
    return "\n".join(
        [
            *fixture_lines,
            *error_assertion,
            "Definition expected_accounts_after :",
            "    list (U256.t * option (U256.t * Z * list Z)) :=",
            f"  {rocq_account_options(case.account_assertions)}.",
            "",
            "Definition expected_storage_after : list (U256.t * U256.t * option U256.t) :=",
            f"  {rocq_account_storage_options(case.account_assertions)}.",
            "",
            "Definition expected_after :",
            "    list (U256.t * option (U256.t * Z * list Z)) *",
            "    list (U256.t * U256.t * option U256.t) :=",
            "  (expected_accounts_after, expected_storage_after).",
            "",
            "Definition observed_after (result : Step.t * State.t) :",
            "    list (U256.t * option (U256.t * Z * list Z)) *",
            "    list (U256.t * U256.t * option U256.t) :=",
            "  let state := Fixture.state_after result in",
            "  (List.map",
            "    (fun '(address, _) =>",
            "      (address, Fixture.account_fields_in_state state address))",
            "    expected_accounts_after,",
            "    List.map",
            "      (fun '(address, slot, _) =>",
            "        (address, slot, Fixture.storage_in_state state address slot))",
            "      expected_storage_after).",
            "",
            f"Example test_{case.case_id}_post :",
            "  observed_after result = expected_after.",
            proof,
            "",
        ]
    )


def read_blacklist(path: Path) -> tuple[set[str], list[str]]:
    if not path.exists():
        return set(), []
    patterns = [
        line.strip()
        for line in path.read_text(encoding="utf-8").splitlines()
        if line.strip() and not line.strip().startswith("#")
    ]
    generated_paths = {
        pattern
        for pattern in patterns
        if pattern.startswith("Evm/Tests/Ethereum/Generated/")
    }
    other_patterns = [
        pattern
        for pattern in patterns
        if not pattern.startswith("Evm/Tests/Ethereum/Generated/")
    ]
    return generated_paths, other_patterns


def is_blacklisted(
    relative_path: str,
    exact_paths: set[str],
    patterns: list[str],
) -> bool:
    if relative_path in exact_paths:
        return True
    for pattern in patterns:
        if pattern == relative_path or pattern in relative_path:
            return True
        try:
            if re.search(pattern, relative_path):
                return True
        except re.error:
            pass
    return False


def generated_relative_path(out: Path, case: GeneratedCase) -> str:
    return (out / f"{case.case_id}.v").relative_to(ROCQ_ROOT).as_posix()


def generate_manifest(
    cases: list[GeneratedCase],
    out: Path,
    blacklist_paths: set[str],
    blacklist_patterns: list[str],
) -> tuple[str, int]:
    lines = [
        "(* Generated by rocq/scripts/evm_tests_generate.py. *)",
    ]
    imported = 0
    for case in cases:
        relative_path = generated_relative_path(out, case)
        if is_blacklisted(relative_path, blacklist_paths, blacklist_patterns):
            continue
        lines.append(
            f"Require Import RocqOfSolidity.Evm.Tests.Ethereum.Generated.{case.case_id}."
        )
        imported += 1
    lines.append("")
    return "\n".join(lines), imported


def main() -> None:
    args = parse_args()
    allowlist = read_json(args.allowlist)
    default_steps = int(allowlist.get("default_steps", 1000))

    if args.all:
        cases, skipped = discover_cases(args.fixtures, default_steps)
    else:
        cases = [
            build_case(args.fixtures, default_steps, entry)
            for entry in allowlist.get("cases", [])
        ]
        skipped = collections.Counter()

    ids = [case.case_id for case in cases]
    duplicates = sorted({case_id for case_id in ids if ids.count(case_id) > 1})
    if duplicates:
        raise FixtureError(f"duplicate generated identifiers: {', '.join(duplicates)}")

    if args.out.exists():
        shutil.rmtree(args.out)
    args.out.mkdir(parents=True)

    for case in cases:
        (args.out / f"{case.case_id}.v").write_text(generate_case(case), encoding="utf-8")
    blacklist_paths, blacklist_patterns = read_blacklist(args.blacklist)
    manifest, imported = generate_manifest(cases, args.out, blacklist_paths, blacklist_patterns)
    (args.out / "Manifest.v").write_text(manifest, encoding="utf-8")

    summary = {
        "generated": len(cases),
        "manifest_imports": imported,
        "blacklisted": len(cases) - imported,
        "skipped": dict(skipped.most_common()),
    }
    if args.summary is not None:
        args.summary.write_text(json.dumps(summary, indent=2, sort_keys=True), encoding="utf-8")

    print(f"Generated {len(cases)} Rocq EVM fixture modules in {args.out}")
    print(f"Manifest imports {imported}; blacklisted {len(cases) - imported}")
    if skipped:
        print("Skipped fixture entries:")
        for reason, count in skipped.most_common(20):
            print(f"  {count:5d}  {reason}")


if __name__ == "__main__":
    main()
