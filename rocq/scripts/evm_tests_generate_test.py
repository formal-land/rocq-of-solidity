#!/usr/bin/env python3

import importlib.util
import sys
import unittest
from pathlib import Path


SCRIPT_PATH = Path(__file__).with_name("evm_tests_generate.py")
SPEC = importlib.util.spec_from_file_location("evm_tests_generate", SCRIPT_PATH)
assert SPEC is not None
GENERATOR = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
sys.modules[SPEC.name] = GENERATOR
SPEC.loader.exec_module(GENERATOR)


class EvmTestsGenerateTest(unittest.TestCase):
    def test_authorization_uses_signature_fields(self):
        auth = dict(chainId="0x0", address="0x" + "01" * 20, nonce="0x1",
                    yParity="0x0", r="0x2", s="0x3", signer="ignored")
        entries = GENERATOR.transaction_authorizations({"authorizationList": [auth]})
        address = int(auth["address"], 16)
        self.assertEqual(entries, ((0, address, 1, 0, 2, 3),))
        self.assertEqual(GENERATOR.transaction_kind_constructor({"authorizationList": []}),
                         "Fixture.TransactionKind.SetCode")
        with self.assertRaises(GENERATOR.FixtureError):
            GENERATOR.transaction_authorizations({"authorizationList": [dict(auth, address="0x01")]})

    def test_parse_hex_int(self):
        self.assertEqual(GENERATOR.parse_hex_int("0x"), 0)
        self.assertEqual(GENERATOR.parse_hex_int("0x2a"), 42)
        self.assertEqual(GENERATOR.parse_hex_int(7), 7)

    def test_parse_hex_bytes(self):
        self.assertEqual(GENERATOR.parse_hex_bytes("0x"), [])
        self.assertEqual(GENERATOR.parse_hex_bytes("0x6001"), [0x60, 0x01])

    def test_rocq_list_compresses_long_runs(self):
        rendered = GENERATOR.rocq_list([1, 2] + [0] * 300 + [3])
        self.assertEqual(rendered, "([1; 2] ++ List.repeat 0 300 ++ [3])")

    def test_rocq_list_compresses_repeated_chunks(self):
        rendered = GENERATOR.rocq_list([1] + [90, 90, 93] * 100 + [2])
        self.assertEqual(
            rendered,
            "([1] ++ List.concat (List.repeat [90; 90; 93] 100) ++ [2])",
        )

    def test_scan_ignores_push_data(self):
        self.assertEqual(GENERATOR.scan_bytecode([0x60, 0xF1, 0x00]), [])

    def test_scan_allows_unknown_opcode_as_invalid_instruction(self):
        self.assertEqual(GENERATOR.scan_bytecode([0xFE]), [])

    def test_scan_allows_selfdestruct_opcode(self):
        self.assertEqual(GENERATOR.scan_bytecode([0xFF]), [])

    def test_scan_allows_call_opcode(self):
        self.assertEqual(GENERATOR.scan_bytecode([0xF1]), [])

    def test_scan_allows_staticcall_opcode(self):
        self.assertEqual(GENERATOR.scan_bytecode([0xFA]), [])

    def test_scan_allows_delegatecall_opcode(self):
        self.assertEqual(GENERATOR.scan_bytecode([0xF4]), [])

    def test_scan_allows_callcode_opcode(self):
        self.assertEqual(GENERATOR.scan_bytecode([0xF2]), [])

    def test_scan_allows_create_opcode(self):
        self.assertEqual(GENERATOR.scan_bytecode([0xF0]), [])

    def test_scan_allows_create2_opcode(self):
        self.assertEqual(GENERATOR.scan_bytecode([0xF5]), [])

    def test_bytecode_contains_opcode_ignores_push_data(self):
        self.assertFalse(GENERATOR.bytecode_contains_opcode([0x60, 0xF1, 0x00], {0xF1}))
        self.assertTrue(GENERATOR.bytecode_contains_opcode([0x60, 0x00, 0xF1], {0xF1}))

    def test_max_pre_account_instruction_count_ignores_push_data(self):
        self.assertEqual(
            GENERATOR.max_pre_account_instruction_count(
                {
                    "0x01": {"code": "0x6000f1"},
                    "0x02": {"code": "0x60f100"},
                }
            ),
            2,
        )

    def test_max_small_push_value_ignores_large_literals(self):
        self.assertEqual(
            GENERATOR.max_small_push_value([0x61, 0xC3, 0x50, 0x73] + [0xFF] * 20),
            50_000,
        )

    def test_max_backward_loop_push_value_requires_backward_jump(self):
        self.assertEqual(
            GENERATOR.max_backward_loop_push_value([0x61, 0xC3, 0x50, 0xFA]),
            0,
        )
        self.assertEqual(
            GENERATOR.max_backward_loop_push_value([0x5B, 0x61, 0xC3, 0x50, 0x60, 0x00, 0x56]),
            50_000,
        )

    def test_scan_pre_account_bytecode_allows_nested_delegatecall(self):
        self.assertEqual(
            GENERATOR.scan_pre_account_bytecode(
                {"0x01": {"code": "0xf4"}},
                allow_direct_calls=False,
            ),
            [],
        )

    def test_scan_pre_account_bytecode_allows_nested_callcode(self):
        self.assertEqual(
            GENERATOR.scan_pre_account_bytecode(
                {"0x01": {"code": "0xf2"}},
                allow_direct_calls=False,
            ),
            [],
        )

    def test_scan_pre_account_bytecode_allows_nested_create(self):
        self.assertEqual(
            GENERATOR.scan_pre_account_bytecode(
                {"0x01": {"code": "0xf0f5"}},
                allow_direct_calls=False,
            ),
            [],
        )

    def test_unsupported_direct_call_fixture_family_matches_precompiles(self):
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/istanbul/eip152_blake2/test_blake2b.json"
            )
        )
        self.assertTrue(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/prague/eip2537_bls_12_381_precompiles/test_valid.json"
            )
        )
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/berlin/eip2929_gas_cost_increases/test_call.json"
            )
        )
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/frontier/identity_precompile/test_call_identity_precompile.json"
            )
        )
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/frontier/precompiles/test_precompile_absence.json"
            )
        )
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/frontier/precompiles/test_precompiles.json"
            )
        )
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/byzantium/eip198_modexp_precompile/test_modexp.json"
            )
        )
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/static/state_tests/stPreCompiledContracts/precompsEIP2929Cancun.json"
            )
        )
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/static/state_tests/stStaticCall/static_Call10.json"
            )
        )
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/static/state_tests/stPreCompiledContracts2/CALLCODESha256_5.json"
            )
        )
        self.assertFalse(
            GENERATOR.unsupported_direct_call_fixture_family(
                "fixtures/state_tests/static/state_tests/stPreCompiledContracts2/CALLCODERipemd160_5.json"
            )
        )

    def test_unsupported_direct_call_fixture_reason_matches_stzeroknowledge(self):
        self.assertIsNone(
            GENERATOR.unsupported_direct_call_fixture_reason(
                "fixtures/state_tests/static/state_tests/stZeroKnowledge/ecmul_1-2_9935_21000_96.json",
                "ecmul_1-2_9935_21000_96",
            )
        )
        self.assertEqual(
            GENERATOR.unsupported_direct_call_fixture_reason(
                "fixtures/state_tests/static/state_tests/stZeroKnowledge/ecpairing_inputs.json",
                "ecpairing_inputs",
            ),
            "BN254 pairing precompile fixtures are not generated in this pass",
        )
        self.assertEqual(
            GENERATOR.unsupported_direct_call_fixture_reason(
                "fixtures/state_tests/static/state_tests/stZeroKnowledge2/pairingTest.json",
                "pairingTest",
            ),
            "BN254 pairing precompile fixtures are not generated in this pass",
        )

    def test_performance_limited_fixture_reason_matches_ecrecover(self):
        self.assertEqual(
            GENERATOR.performance_limited_fixture_reason(
                "fixtures/state_tests/static/state_tests/stStaticCall/static_CallEcrecover0_completeReturnValue.json",
                "static_CallEcrecover0_completeReturnValue",
            ),
            GENERATOR.ECRECOVER_SPEED_SKIP_REASON,
        )
        self.assertEqual(
            GENERATOR.performance_limited_fixture_reason(
                "fixtures/state_tests/static/state_tests/stStaticCall/static_Call50000_ecrec.json",
                "static_Call50000_ecrec",
            ),
            GENERATOR.ECRECOVER_SPEED_SKIP_REASON,
        )
        self.assertEqual(
            GENERATOR.performance_limited_fixture_reason(
                "fixtures/state_tests/static/state_tests/stStaticCall/StaticcallToPrecompileFromCalledContract.json",
                "StaticcallToPrecompileFromCalledContract",
            ),
            GENERATOR.PRECOMPILE_SWEEP_SPEED_SKIP_REASON,
        )

    def test_sanitize_identifier(self):
        self.assertEqual(GENERATOR.sanitize_identifier("frontier/push-1"), "frontier_push_1")

    def test_protocol_constructor(self):
        self.assertEqual(GENERATOR.protocol_constructor("Prague"), "Protocol.Prague")

    def test_blob_base_fee_at_zero_excess(self):
        self.assertEqual(GENERATOR.blob_base_fee({"currentExcessBlobGas": "0x00"}), 1)

    def test_prague_and_osaka_blob_price_fraction(self):
        env = {"currentExcessBlobGas": hex(10_000_000)}
        self.assertEqual(GENERATOR.blob_base_fee(env, "Cancun"), 19)
        self.assertEqual(GENERATOR.blob_base_fee(env, "Prague"), 7)
        self.assertEqual(GENERATOR.blob_base_fee(env, "Osaka"), 7)

    def test_pinned_prague_case_uses_prague_blob_price(self):
        sender = "0x" + "aa" * 20
        account = {"balance": "0x100000", "nonce": "0x0", "code": "0x", "storage": {}}
        fixture = {
            "env": {
                "currentCoinbase": "0x" + "cc" * 20,
                "currentGasLimit": "0x100000",
                "currentNumber": "0x1",
                "currentTimestamp": "0x2",
                "currentBaseFee": "0x1",
                "currentExcessBlobGas": hex(10_000_000),
            },
            "pre": {sender: account},
            "transaction": {
                "sender": sender, "to": sender, "gasPrice": "0x1",
                "gasLimit": ["0x5208"], "value": ["0x0"], "data": ["0x"],
            },
            "post": {"Prague": [{
                "indexes": {"data": 0, "gas": 0, "value": 0},
                "state": {sender: dict(account, balance="0xfadf8", nonce="0x1")},
            }]},
        }
        entry = {"id": "blob_fee", "file": "example.json", "test": "blob_fee", "fork": "Prague"}
        case = GENERATOR.build_case_from_fixture(1000, entry, fixture, pinned_case=True)
        self.assertEqual(case.block_blob_base_fee, 7)

    def test_osaka_blob_price_from_parent(self):
        env = {"parentExcessBlobGas": hex(10_000_000), "parentBlobGasUsed": "0x0"}
        self.assertEqual(GENERATOR.blob_base_fee(env, "Osaka"), 6)
        env["parentBaseFee"] = hex(16 * 7)
        self.assertEqual(GENERATOR.blob_base_fee(env, "Osaka"), 6)
        env["parentBaseFee"] = hex(16 * 7 + 1)
        self.assertEqual(GENERATOR.blob_base_fee(env, "Osaka"), 7)
        self.assertEqual(GENERATOR.blob_base_fee(env, "Prague"), 6)
        env["currentExcessBlobGas"] = "0x0"
        self.assertEqual(GENERATOR.blob_base_fee(env, "Osaka"), 1)

    def test_osaka_blob_price_with_parent_at_target(self):
        env = {
            "parentExcessBlobGas": hex(11_000_000),
            "parentBlobGasUsed": hex(6 * 131072),
            "parentBaseFee": "0x100",
        }
        self.assertEqual(GENERATOR.blob_base_fee(env, "Osaka"), 9)
        self.assertEqual(GENERATOR.blob_base_fee(env, "Prague"), 8)

    def test_osaka_transaction_limit_exception(self):
        self.assertEqual(
            GENERATOR.modeled_expected_error("TransactionException.GAS_LIMIT_EXCEEDS_MAXIMUM"),
            "invalid transaction: gas limit exceeds protocol cap",
        )

    def test_eip1559_effective_gas_price(self):
        transaction = {
            "maxFeePerGas": "0x0a",
            "maxPriorityFeePerGas": "0x02",
        }
        env = {"currentBaseFee": "0x07"}
        self.assertEqual(GENERATOR.transaction_gas_price(transaction, env), 9)

    def test_missing_target_account_uses_empty_code(self):
        sender = "0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        target = "0xbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
        fixture = {
            "env": {
                "currentCoinbase": "0xcccccccccccccccccccccccccccccccccccccccc",
                "currentGasLimit": "0x100000",
                "currentNumber": "0x01",
                "currentTimestamp": "0x02",
                "currentDifficulty": "0x03",
            },
            "pre": {
                sender: {
                    "balance": "0x100000",
                    "nonce": "0x00",
                    "code": "0x",
                    "storage": {},
                },
            },
            "transaction": {
                "sender": sender,
                "to": target,
                "gasPrice": "0x01",
                "gasLimit": ["0x5208"],
                "value": ["0x00"],
                "data": ["0x"],
            },
            "post": {
                "Frontier": [
                    {
                        "indexes": {"data": 0, "gas": 0, "value": 0},
                        "state": {
                            sender: {
                                "balance": "0x100000",
                                "nonce": "0x00",
                                "code": "0x",
                                "storage": {},
                            }
                        },
                    }
                ]
            },
        }
        entry = {
            "id": "missing-target",
            "file": "fixtures/state_tests/example.json",
            "test": "example",
            "fork": "Frontier",
            "post_index": 0,
        }

        case = GENERATOR.build_case_from_fixture(10, entry, fixture)

        self.assertEqual(case.to, GENERATOR.hex_address_to_int(target))
        self.assertEqual(case.steps, 100)

    def test_contract_creation_uses_init_code(self):
        sender = "0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        fixture = {
            "env": {
                "currentCoinbase": "0xcccccccccccccccccccccccccccccccccccccccc",
                "currentGasLimit": "0x100000",
                "currentNumber": "0x01",
                "currentTimestamp": "0x02",
                "currentDifficulty": "0x03",
            },
            "pre": {
                sender: {
                    "balance": "0x100000",
                    "nonce": "0x00",
                    "code": "0x",
                    "storage": {},
                },
            },
            "transaction": {
                "sender": sender,
                "to": "",
                "gasPrice": "0x01",
                "gasLimit": ["0x5208"],
                "value": ["0x00"],
                "data": ["0x00"],
            },
            "post": {
                "Frontier": [
                    {
                        "indexes": {"data": 0, "gas": 0, "value": 0},
                        "state": {
                            sender: {
                                "balance": "0x100000",
                                "nonce": "0x00",
                                "code": "0x",
                                "storage": {},
                            }
                        },
                    }
                ]
            },
        }
        entry = {
            "id": "create",
            "file": "fixtures/state_tests/example.json",
            "test": "example",
            "fork": "Frontier",
            "post_index": 0,
        }

        case = GENERATOR.build_case_from_fixture(10, entry, fixture)

        self.assertTrue(case.is_create)
        self.assertEqual(case.to, 0)
        self.assertEqual(case.steps, 1000)


if __name__ == "__main__":
    unittest.main()
