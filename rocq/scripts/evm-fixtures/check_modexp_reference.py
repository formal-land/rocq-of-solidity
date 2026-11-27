"""Replay the two MODEXP probe families with upstream execution-specs at faf6637766.

Run with the reference implementation and its Python dependencies on the import
path. Pass the directory containing the extracted EEST v5.4.0 fixtures/ tree.
"""
import argparse
import json
from importlib import import_module
from pathlib import Path

from ethereum.state import Account
from ethereum.state_mpt import State, set_account, set_storage, store_code
from ethereum.trace import TransactionEnd, set_evm_trace
from ethereum_rlp import rlp
from ethereum_types.bytes import Bytes, Bytes20, Bytes32
from ethereum_types.numeric import U64, U256, Uint

from generate_suite import SUITES, gen


def raw(value):
    return bytes.fromhex(value.removeprefix("0x"))


def word(value):
    return Bytes32(int(value, 16).to_bytes(32, "big"))


def replay(fixture, fork, post):
    spec = import_module(f"ethereum.forks.{fork.lower()}.fork")
    state = State()
    for address, entry in fixture["pre"].items():
        account = Bytes20(raw(address))
        set_account(state, account, Account(
            Uint(int(entry["nonce"], 16)), U256(int(entry["balance"], 16)),
            store_code(state, Bytes(raw(entry["code"])))))
        for slot, value in entry["storage"].items():
            set_storage(state, account, word(slot), U256(int(value, 16)))

    block_state = spec.BlockState(state)
    env = fixture["env"]
    block = spec.vm.BlockEnvironment(
        chain_id=U64(int(fixture["config"]["chainid"], 16)), state=block_state,
        block_gas_limit=Uint(int(env["currentGasLimit"], 16)), block_hashes=[],
        coinbase=Bytes20(raw(env["currentCoinbase"])), number=Uint(int(env["currentNumber"], 16)),
        base_fee_per_gas=Uint(int(env["currentBaseFee"], 16)), time=U256(int(env["currentTimestamp"], 16)),
        prev_randao=word(env["currentRandom"]), excess_blob_gas=U64(int(env["currentExcessBlobGas"], 16)),
        parent_beacon_block_root=None)
    output = spec.vm.BlockOutput()
    transaction = rlp.decode_to(spec.LegacyTransaction, raw(post["txbytes"]))
    outcomes = []

    def record(evm, event):
        if isinstance(event, TransactionEnd):
            outcomes.append(type(event.error).__name__ if event.error else "Success")

    original = set_evm_trace(record)
    try:
        spec.process_transaction(block, output, transaction, Uint(0))
    finally:
        set_evm_trace(original)
    root = state.compute_state_root(spec.extract_block_diff(block_state))
    if bytes(root) != raw(post["hash"]) or len(outcomes) != 1:
        raise ValueError("reference execution disagrees with the fixture post-state or transaction count")
    return dict(accepted=True, outcome=outcomes[0], gas_used=int(output.block_gas_used),
                state_root=post["hash"])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", type=Path)
    root = parser.parse_args().root
    directory = root / "fixtures/state_tests/static/state_tests/stPreCompiledContracts2"
    expected = SUITES["GeneratedStPre2Probe"]["execution_errors"]
    observed_errors = set()
    for filename in ("modexpRandomInput.json", "modexp_0_0_0_20500.json"):
        path = directory / filename
        for test, fixture in gen.read_json(path).items():
            for fork, posts in fixture["post"].items():
                for index, post in enumerate(posts):
                    identifier = gen.discovered_identifier(path.relative_to(root).as_posix(), test, fork, index)
                    result = replay(fixture, fork, post)
                    want = "OutOfGasError" if identifier in expected else "Success"
                    if result["outcome"] != want:
                        raise ValueError(f"{identifier}: expected {want}, observed {result}")
                    if want == "OutOfGasError":
                        observed_errors.add(identifier)
                    print(json.dumps(dict(case=identifier, **result)))
    if observed_errors != set(expected):
        raise ValueError("missing reference result for a corrected probe")


if __name__ == "__main__":
    main()
