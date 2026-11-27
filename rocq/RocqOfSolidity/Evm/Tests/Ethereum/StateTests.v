Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.simulations.RocqOfSolidity.
Require Import RocqOfSolidity.Evm.Semantics.
Require Import RocqOfSolidity.Evm.Tests.Ethereum.Fixture.

(* Osaka reserves low addresses for native precompiles. *)
Definition test_contract : U256.t := 0x10000.
Definition test_sender : U256.t := 32.
Definition test_beneficiary : U256.t := 48.

Definition default_block : Fixture.BlockEnv.t :=
  Fixture.BlockEnv.make
    0
    90000000
    1
    1000
    0
    0
    0
    1
    [].

Definition tx_to_test_contract (value : U256.t) (data : list Z) : Fixture.Transaction.t :=
  Fixture.Transaction.make test_sender test_contract value 1000000 0 data.

Definition single_contract_fixture
    (name : string)
    (code : list Z)
    (storage : list Fixture.StorageEntry.t)
    (transaction : Fixture.Transaction.t) : Fixture.t := {|
  Fixture.name := name;
  Fixture.protocol := Protocol.Osaka;
  Fixture.codes := [];
  Fixture.pre := [
    Fixture.Alloc.make test_contract 100 0 code storage;
    Fixture.Alloc.make test_sender 1000 0 [] []
  ];
  Fixture.block := default_block;
  Fixture.transaction := transaction;
  Fixture.steps := 80;
|}.

Definition simple_tx_fixture (name : string) (code : list Z) : Fixture.t :=
  single_contract_fixture name code [] (tx_to_test_contract 0 []).

Definition run (fixture : Fixture.t) : Step.t * State.t :=
  Fixture.run fixture.

Definition storage_at_test_contract (fixture : Fixture.t) (slot : U256.t) : option U256.t :=
  Fixture.storage_after (run fixture) test_contract slot.

Example transaction_can_execute_more_opcodes_than_its_fixture_step_hint :
  storage_at_test_contract (simple_tx_fixture "gas-bounded execution"
    (List.repeat 91 100 ++ [96; 1; 96; 0; 85; 0])) 0 = Some 1.
Proof. vm_compute. reflexivity. Qed.

Definition miner_settlement_fixture
    (protocol : Protocol.t) (miner price : Z) (code : list Z) : Fixture.t := {|
  Fixture.name := "miner settlement";
  Fixture.protocol := protocol;
  Fixture.codes := [];
  Fixture.pre := [
    Fixture.Alloc.make test_contract 0 1 code [];
    Fixture.Alloc.make test_sender 1000000 0 [] []
  ];
  Fixture.block := Fixture.BlockEnv.make miner 90000000 1 1000 0 0 0 1 [];
  Fixture.transaction := Fixture.Transaction.make test_sender test_contract 0 100000 price [];
  Fixture.steps := 80;
|}.

Example zero_fee_miner_before_and_after_empty_account_clearing :
  let balance protocol :=
    Fixture.balance_after (run (miner_settlement_fixture protocol test_beneficiary 0 [0]))
      test_beneficiary in
  (balance Protocol.Frontier, balance Protocol.Homestead, balance Protocol.Byzantium) =
    (Some 0, Some 0, None).
Proof. vm_compute. reflexivity. Qed.

Example selfdestructed_miner_is_deleted_after_fee_settlement :
  Fixture.balance_after
    (run (miner_settlement_fixture Protocol.Homestead test_contract 1
      [96; test_beneficiary; 255])) test_contract = None.
Proof. vm_compute. reflexivity. Qed.

Definition create_with_deposit_budget (protocol : Protocol.t) (budget : Z) : Fixture.t :=
  let init := [96; 1; 96; 0; 243] in (* Return one zero byte. *)
  {| Fixture.name := "creation code deposit";
     Fixture.protocol := protocol;
     Fixture.codes := [];
     Fixture.pre := [Fixture.Alloc.make test_sender 1000000 0 [] [] ];
     Fixture.block := default_block;
     Fixture.transaction := Fixture.Transaction.make_create test_sender 7
       (Gas.intrinsic_transaction_cost protocol true init [] + budget) 1 init;
     Fixture.steps := 80 |}.

Example creation_code_deposit_at_homestead :
  let observed protocol budget :=
    let fixture := create_with_deposit_budget protocol budget in
    let result := run fixture in
    (Fixture.error_after result, Fixture.return_data_after result,
     Fixture.balance_after result (Fixture.created_address fixture)) in
  (observed Protocol.Frontier 20, observed Protocol.Homestead 20,
   observed Protocol.Frontier 250) =
    ((None, Some [], Some 7), (Some "out of gas: code deposit", None, None),
     (None, Some [0], Some 7)).
Proof. vm_compute. reflexivity. Qed.

Definition stExample_add11 : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stExample/add11"
    [96; 1; 96; 1; 1; 96; 0; 85; 0].

Example test_stExample_add11_storage :
  storage_at_test_contract stExample_add11 0 = Some 2.
Proof. vm_compute. reflexivity. Qed.

Definition stArithmetic_mulmod : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stArithmeticTest/mulmod"
    [96; 2; 96; 3; 96; 5; 9; 96; 0; 85; 0].

Example test_stArithmetic_mulmod_storage :
  storage_at_test_contract stArithmetic_mulmod 0 = Some 1.
Proof. vm_compute. reflexivity. Qed.

Definition stSystemOperations_sload_sstore : Fixture.t :=
  single_contract_fixture
    "CuratedStateTests/stSystemOperationsTest/sload_sstore"
    [96; 1; 84; 96; 2; 85; 0]
    [(1, 9)]
    (tx_to_test_contract 0 []).

Example test_stSystemOperations_sload_sstore :
  storage_at_test_contract stSystemOperations_sload_sstore 2 = Some 9.
Proof. vm_compute. reflexivity. Qed.

Definition stMemory_return_value : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stMemoryTest/return_value"
    [96; 42; 96; 0; 82; 96; 32; 96; 0; 243].

Example test_stMemory_return_value_halt :
  Fixture.halt_after (run stMemory_return_value) = Some (Halt.Return 0 32).
Proof. vm_compute. reflexivity. Qed.

Example test_stMemory_return_value_data :
  Fixture.return_data_after (run stMemory_return_value) =
  Some (Memory.u256_as_bytes 42).
Proof. vm_compute. reflexivity. Qed.

Definition stRevert_revert_value : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stRevertTest/revert_value"
    [96; 42; 96; 0; 82; 96; 32; 96; 0; 253].

Example test_stRevert_revert_value_halt :
  Fixture.halt_after (run stRevert_revert_value) = Some (Halt.Revert 0 32).
Proof. vm_compute. reflexivity. Qed.

Example test_stRevert_revert_value_data :
  Fixture.revert_data_after (run stRevert_revert_value) =
  Some (Memory.u256_as_bytes 42).
Proof. vm_compute. reflexivity. Qed.

Definition stJump_valid_jump : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stJumpTest/valid_jump"
    [96; 3; 86; 91; 96; 7; 96; 0; 85; 0].

Example test_stJump_valid_jump :
  storage_at_test_contract stJump_valid_jump 0 = Some 7.
Proof. vm_compute. reflexivity. Qed.

Definition stJumpi_false_condition : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stJumpTest/jumpi_false_condition"
    [96; 0; 96; 11; 87; 96; 3; 96; 0; 85; 0; 91; 96; 9; 96; 0; 85; 0].

Example test_stJumpi_false_condition :
  storage_at_test_contract stJumpi_false_condition 0 = Some 3.
Proof. vm_compute. reflexivity. Qed.

Definition stJumpi_true_condition : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stJumpTest/jumpi_true_condition"
    [96; 1; 96; 11; 87; 96; 3; 96; 0; 85; 0; 91; 96; 9; 96; 0; 85; 0].

Example test_stJumpi_true_condition :
  storage_at_test_contract stJumpi_true_condition 0 = Some 9.
Proof. vm_compute. reflexivity. Qed.

Definition stJump_invalid_destination : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stJumpTest/invalid_destination"
    [96; 3; 86; 0; 91; 0].

Example test_stJump_invalid_destination :
  Fixture.error_after (run stJump_invalid_destination) = Some "invalid jump destination".
Proof. vm_compute. reflexivity. Qed.

Definition stBadOpcode_invalid : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stBadOpcode/invalid"
    [254].

Example test_stBadOpcode_invalid :
  Fixture.error_after (run stBadOpcode_invalid) = Some "invalid instruction".
Proof. vm_compute. reflexivity. Qed.

Definition stCallData_transaction_context : Fixture.t :=
  single_contract_fixture
    "CuratedStateTests/stCallDataTest/transaction_context"
    [51; 96; 0; 85; 52; 96; 1; 85; 54; 96; 2; 85; 0]
    []
    (tx_to_test_contract 5 [1; 2; 3]).

Example test_stCallData_transaction_context_caller :
  storage_at_test_contract stCallData_transaction_context 0 = Some test_sender.
Proof. vm_compute. reflexivity. Qed.

Example test_stCallData_transaction_context_value :
  storage_at_test_contract stCallData_transaction_context 1 = Some 5.
Proof. vm_compute. reflexivity. Qed.

Example test_stCallData_transaction_context_size :
  storage_at_test_contract stCallData_transaction_context 2 = Some 3.
Proof. vm_compute. reflexivity. Qed.

Definition stLog_log0_payload : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stLogTests/log0_payload"
    [96; 42; 96; 0; 83; 96; 1; 96; 0; 160; 0].

Example test_stLog_log0_payload :
  Fixture.logs_after (run stLog_log0_payload) = [([], [42])].
Proof. vm_compute. reflexivity. Qed.

Definition stSelfDestruct_balance_transfer : Fixture.t :=
  simple_tx_fixture
    "CuratedStateTests/stSelfDestruct/selfdestruct_balance_transfer"
    [96; test_beneficiary; 255].

Example test_stSelfDestruct_halt :
  Fixture.halt_after (run stSelfDestruct_balance_transfer) = Some Halt.Selfdestruct.
Proof. vm_compute. reflexivity. Qed.

Example test_stSelfDestruct_current_balance :
  Fixture.balance_after (run stSelfDestruct_balance_transfer) test_contract = Some 0.
Proof. vm_compute. reflexivity. Qed.

Example test_stSelfDestruct_beneficiary_balance :
  Fixture.balance_after (run stSelfDestruct_balance_transfer) test_beneficiary = Some 100.
Proof. vm_compute. reflexivity. Qed.

Definition gas_cap_fixture (protocol : Protocol.t) (limit : Z) : Fixture.t :=
  {| Fixture.name := "transaction gas limit cap";
     Fixture.protocol := protocol;
     Fixture.codes := [];
     Fixture.pre := [Fixture.Alloc.make test_sender 1000 0 [] [] ];
     Fixture.block := default_block;
     Fixture.transaction := Fixture.Transaction.make test_sender test_contract 0 limit 0 [];
     Fixture.steps := 80 |}.

Example transaction_gas_cap_activates_at_osaka :
  (Fixture.error_after (run (gas_cap_fixture Protocol.Prague (2 ^ 24 + 1))),
   Fixture.error_after (run (gas_cap_fixture Protocol.Osaka (2 ^ 24))),
   Fixture.error_after (run (gas_cap_fixture Protocol.Osaka (2 ^ 24 + 1)))) =
  (None, None, Some "invalid transaction: gas limit exceeds protocol cap").
Proof. vm_compute. reflexivity. Qed.
