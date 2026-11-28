Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.simulations.RocqOfSolidity.
Require Import RocqOfSolidity.RocqEvm.Instructions.
Require Import RocqOfSolidity.Evm.Semantics.

Definition test_address : U256.t := 10.
Definition test_beneficiary : U256.t := 11.
Definition test_external_address : U256.t := 20.

Definition test_environment : Environment.t := {|
  Environment.protocol := Protocol.Osaka;
  Environment.caller := 7;
  Environment.origin := 7;
  Environment.callvalue := 3;
  Environment.gas_price := 10;
  Environment.calldata := [1; 2; 3];
  Environment.address := test_address;
  Environment.code_name := 0;
  Environment.chain_id := 1;
  Environment.block_coinbase := 0x2adc25665018aa1fe0e6bc666dac8fc2697ff9ba;
  Environment.block_gas_limit := 90000000;
  Environment.block_difficulty := 0;
  Environment.block_prev_randao := 0;
  Environment.block_base_fee := 7;
  Environment.block_blob_base_fee := 1;
  Environment.blob_hashes := [88; 99];
|}.

Definition test_account
    (balance code : U256.t)
    (codedata : list Z)
    (storage : Storage.t)
    (storage_keys : list U256.t) : Account.t := {|
  Account.balance := balance;
  Account.nonce := 1;
  Account.code := code;
  Account.codedata := codedata;
  Account.storage := storage;
  Account.storage_keys := storage_keys;
  Account.immutables := [];
|}.

Definition test_storage : Storage.t :=
  Storage.update Storage.empty 1 9.

Definition test_current_account : Account.t :=
  test_account 100 0 [] test_storage [1].

Definition test_external_account : Account.t :=
  test_account 0 0 [1; 2] Storage.empty [].

Definition test_state : State.t :=
  State.init
    <| State.accounts := [
      (test_address, test_current_account);
      (test_external_address, test_external_account)
    ] |>
    <| State.block_number := 10 |>
    <| State.block_timestamp := 123 |>.

Definition state_with_memory (bytes : list Z) : State.t :=
  test_state <| State.memory := Memory.update_bytes Memory.empty 0 bytes |>.

Definition state_with_return_data (bytes : list Z) : State.t :=
  test_state <| State.return_data := ReturnData.of_bytes bytes |>.

Definition frame_with_code_stack (code : list Z) (stack : OperandStack.t) : Frame.t :=
  Frame.with_stack (make_frame code) stack.

Definition frame_with_stack (stack : OperandStack.t) : Frame.t :=
  frame_with_code_stack [] stack.

Definition frame_with_pc_stack (pc : U256.t) (stack : OperandStack.t) : Frame.t :=
  Frame.with_stack (Frame.with_pc (make_frame []) pc) stack.

Definition frame_with_memory_size_stack (memory_size : U256.t) (stack : OperandStack.t) : Frame.t :=
  Frame.with_stack (Frame.with_memory_size (make_frame []) memory_size) stack.

Definition exec_on
    (op : instruction)
    (stack : OperandStack.t) : Step.t * State.t :=
  exec_instruction 200 [] test_environment op 0 (frame_with_stack stack) test_state.

Definition exec_on_state
    (op : instruction)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  exec_instruction 200 [] test_environment op 0 (frame_with_stack stack) state.

Definition exec_on_frame_state
    (op : instruction)
    (frame : Frame.t)
    (state : State.t) : Step.t * State.t :=
  exec_instruction 200 [] test_environment op 0 frame state.

Definition stack_after (result : Step.t * State.t) : option OperandStack.t :=
  match result with
  | (Step.Continue frame, _) => Some frame.(Frame.stack)
  | _ => None
  end.

Definition pc_after (result : Step.t * State.t) : option U256.t :=
  match result with
  | (Step.Continue frame, _) => Some frame.(Frame.pc)
  | _ => None
  end.

Definition memory_size_after (result : Step.t * State.t) : option U256.t :=
  match result with
  | (Step.Continue frame, _) => Some frame.(Frame.memory_size)
  | _ => None
  end.

Definition halt_after (result : Step.t * State.t) : option Halt.t :=
  match result with
  | (Step.Halt halt, _) => Some halt
  | _ => None
  end.

Definition error_after (result : Step.t * State.t) : option string :=
  match result with
  | (Step.Error message, _) => Some message
  | _ => None
  end.

Definition memory_after (result : Step.t * State.t) (offset size : U256.t) : list Z :=
  match result with
  | (_, state) => Memory.get_bytes state.(State.memory) offset size
  end.

Definition storage_after (result : Step.t * State.t) (slot : U256.t) : option U256.t :=
  match result with
  | (_, state) =>
    match Dict.get state.(State.accounts) test_address with
    | Some account => Some (account.(Account.storage) slot)
    | None => None
    end
  end.

Definition logs_after (result : Step.t * State.t) : list (list U256.t * list Z) :=
  match result with
  | (_, state) => List.map Log.materialize state.(State.logs)
  end.

Definition transient_storage_after (result : Step.t * State.t) (slot : U256.t) : U256.t :=
  match result with
  | (_, state) => state.(State.transient_storage) (transient_key test_address slot)
  end.

Definition top_after (result : Step.t * State.t) : option U256.t :=
  match stack_after result with
  | Some (value :: _) => Some value
  | _ => None
  end.

Definition account_exists_after (result : Step.t * State.t) (address : U256.t) : bool :=
  match result with
  | (_, state) =>
    match Dict.get state.(State.accounts) address with
    | Some _ => true
    | None => false
    end
  end.

Definition created_account_after (result : Step.t * State.t) : option U256.t :=
  match result with
  | (_, state) =>
    match state.(State.created_accounts) with
    | address :: _ => Some address
    | [] => None
    end
  end.

Definition callcode_code_name : U256.t := 4242.

Definition callcode_target_code : Code.t := {|
  Code.name := "callcode_target";
  Code.hex_name := callcode_code_name;
  Code.functions := [];
  Code.body :=
    LowM.Primitive (Primitive.SStore 2 99) (fun _ =>
    LowM.Pure (Result.Return 0 0));
|}.

Definition callcode_external_account : Account.t :=
  test_account 0 0 [96; 99; 96; 2; 85; 96; 0; 96; 0; 243] Storage.empty [].

Definition callcode_state : State.t :=
  test_state <| State.accounts := [
    (test_address, test_current_account);
    (test_external_address, callcode_external_account)
  ] |>.

Example test_STOP :
  halt_after (exec_on STOP []) = Some Halt.Stop.
Proof. reflexivity. Qed.

Example test_ADD :
  stack_after (exec_on ADD [2; 3]) = Some [5].
Proof. reflexivity. Qed.

Example test_MUL :
  stack_after (exec_on MUL [2; 3]) = Some [6].
Proof. reflexivity. Qed.

Example test_SUB :
  stack_after (exec_on SUB [5; 2]) = Some [3].
Proof. reflexivity. Qed.

Example test_DIV :
  stack_after (exec_on DIV [6; 2]) = Some [3].
Proof. reflexivity. Qed.

Example test_SDIV :
  stack_after (exec_on SDIV [6; 2]) = Some [3].
Proof. reflexivity. Qed.

Example test_MOD :
  stack_after (exec_on MOD [5; 2]) = Some [1].
Proof. reflexivity. Qed.

Example test_SMOD :
  stack_after (exec_on SMOD [5; 2]) = Some [1].
Proof. reflexivity. Qed.

Example test_ADDMOD :
  stack_after (exec_on ADDMOD [2; 3; 5]) = Some [0].
Proof. reflexivity. Qed.

Example test_MULMOD :
  stack_after (exec_on MULMOD [2; 3; 5]) = Some [1].
Proof. reflexivity. Qed.

Example test_EXP :
  stack_after (exec_on EXP [2; 3]) = Some [8].
Proof. reflexivity. Qed.

Example test_SIGNEXTEND :
  stack_after (exec_on SIGNEXTEND [0; 127]) = Some [127].
Proof. reflexivity. Qed.

Example test_LT :
  stack_after (exec_on LT [2; 3]) = Some [1].
Proof. reflexivity. Qed.

Example test_GT :
  stack_after (exec_on GT [3; 2]) = Some [1].
Proof. reflexivity. Qed.

Example test_SLT :
  stack_after (exec_on SLT [2; 3]) = Some [1].
Proof. reflexivity. Qed.

Example test_SGT :
  stack_after (exec_on SGT [3; 2]) = Some [1].
Proof. reflexivity. Qed.

Example test_EQ :
  stack_after (exec_on EQ [7; 7]) = Some [1].
Proof. reflexivity. Qed.

Example test_ISZERO :
  stack_after (exec_on ISZERO [0]) = Some [1].
Proof. reflexivity. Qed.

Example test_AND :
  stack_after (exec_on AND [3; 1]) = Some [1].
Proof. reflexivity. Qed.

Example test_OR :
  stack_after (exec_on OR [2; 1]) = Some [3].
Proof. reflexivity. Qed.

Example test_XOR :
  stack_after (exec_on XOR [3; 1]) = Some [2].
Proof. reflexivity. Qed.

Example test_NOT :
  stack_after (exec_on NOT [0]) = Some [2 ^ 256 - 1].
Proof. reflexivity. Qed.

Example test_BYTE :
  stack_after (exec_on BYTE [31; 1]) = Some [1].
Proof. reflexivity. Qed.

Example test_SHL :
  stack_after (exec_on SHL [1; 2]) = Some [4].
Proof. reflexivity. Qed.

Example test_SHR :
  stack_after (exec_on SHR [1; 4]) = Some [2].
Proof. reflexivity. Qed.

Example test_SAR :
  stack_after (exec_on SAR [1; 4]) = Some [2].
Proof. reflexivity. Qed.

Example test_CLZ :
  stack_after (exec_on CLZ [1]) = Some [255].
Proof. reflexivity. Qed.

Example test_SHA3 :
  stack_after (exec_on_state SHA3 [0; 0] (state_with_memory [])) =
  Some [(StdlibAux.keccak256 [])].
Proof. reflexivity. Qed.

Example test_ADDRESS :
  stack_after (exec_on ADDRESS []) = Some [test_address].
Proof. reflexivity. Qed.

Example test_BALANCE :
  (stack_after (exec_on BALANCE [1]), stack_after (exec_on BALANCE [test_address])) =
  (Some [0], Some [100]).
Proof. reflexivity. Qed.

Example test_ORIGIN :
  stack_after (exec_on ORIGIN []) = Some [7].
Proof. reflexivity. Qed.

Example test_CALLER :
  stack_after (exec_on CALLER []) = Some [7].
Proof. reflexivity. Qed.

Example test_CALLVALUE :
  stack_after (exec_on CALLVALUE []) = Some [3].
Proof. reflexivity. Qed.

Example test_CALLDATALOAD :
  stack_after (exec_on CALLDATALOAD [0]) =
  Some [StdlibAux.get_calldata_u256 [1; 2; 3] 0].
Proof. reflexivity. Qed.

Example test_CALLDATASIZE :
  stack_after (exec_on CALLDATASIZE []) = Some [3].
Proof. reflexivity. Qed.

Example test_CALLDATACOPY :
  memory_after (exec_on CALLDATACOPY [0; 1; 2]) 0 2 = [2; 3].
Proof. reflexivity. Qed.

Example test_CODESIZE :
  stack_after (exec_on_frame_state CODESIZE (frame_with_code_stack [1; 2; 3] []) test_state) =
  Some [3].
Proof. reflexivity. Qed.

Example test_CODECOPY :
  memory_after
    (exec_on_frame_state CODECOPY (frame_with_code_stack [1; 2; 3] [0; 1; 2]) test_state)
    0 2 =
  [2; 3].
Proof. reflexivity. Qed.

Example test_GASPRICE :
  stack_after (exec_on GASPRICE []) = Some [10].
Proof. reflexivity. Qed.

Example test_EXTCODESIZE :
  stack_after (exec_on EXTCODESIZE [test_external_address]) = Some [2].
Proof. reflexivity. Qed.

Example test_EXTCODECOPY :
  memory_after (exec_on EXTCODECOPY [test_external_address; 0; 0; 2]) 0 2 = [1; 2].
Proof. reflexivity. Qed.

Example test_RETURNDATASIZE :
  stack_after (exec_on_state RETURNDATASIZE [] (state_with_return_data [4; 5])) = Some [2].
Proof. reflexivity. Qed.

Example test_RETURNDATACOPY :
  memory_after (exec_on_state RETURNDATACOPY [0; 1; 1] (state_with_return_data [4; 5])) 0 1 = [5].
Proof. reflexivity. Qed.

Example test_EXTCODEHASH :
  stack_after (exec_on EXTCODEHASH [9]) = Some [0].
Proof. reflexivity. Qed.

Example test_BLOCKHASH :
  stack_after (exec_on BLOCKHASH [10]) = Some [0].
Proof. reflexivity. Qed.

Example test_COINBASE :
  stack_after (exec_on COINBASE []) = Some [0x2adc25665018aa1fe0e6bc666dac8fc2697ff9ba].
Proof. reflexivity. Qed.

Example test_TIMESTAMP :
  stack_after (exec_on TIMESTAMP []) = Some [123].
Proof. reflexivity. Qed.

Example test_NUMBER :
  stack_after (exec_on NUMBER []) = Some [10].
Proof. reflexivity. Qed.

Example test_DIFFICULTY :
  stack_after (exec_on DIFFICULTY []) =
  Some [0].
Proof. reflexivity. Qed.

Example test_GASLIMIT :
  stack_after (exec_on GASLIMIT []) = Some [90000000].
Proof. reflexivity. Qed.

Example test_CHAINID :
  stack_after (exec_on CHAINID []) = Some [1].
Proof. reflexivity. Qed.

Example test_SELFBALANCE :
  stack_after (exec_on SELFBALANCE []) = Some [100].
Proof. reflexivity. Qed.

Example test_BASEFEE :
  stack_after (exec_on BASEFEE []) = Some [7].
Proof. reflexivity. Qed.

Example test_BLOBHASH :
  stack_after (exec_on BLOBHASH [1]) = Some [99].
Proof. reflexivity. Qed.

Example test_BLOBBASEFEE :
  stack_after (exec_on BLOBBASEFEE []) = Some [1].
Proof. reflexivity. Qed.

Example test_POP :
  stack_after (exec_on POP [1; 2]) = Some [2].
Proof. reflexivity. Qed.

Example test_MLOAD :
  stack_after
    (exec_on_state MLOAD [0] (state_with_memory (Memory.u256_as_bytes 7))) =
  Some [7].
Proof. reflexivity. Qed.

Example test_MSTORE :
  memory_after (exec_on MSTORE [0; 7]) 0 32 = Memory.u256_as_bytes 7.
Proof. reflexivity. Qed.

Example test_MSTORE8 :
  memory_after (exec_on MSTORE8 [0; 258]) 0 1 = [2].
Proof. reflexivity. Qed.

Example test_MSTORE8_memory_size :
  memory_size_after (exec_on MSTORE8 [0; 258]) = Some 32.
Proof. reflexivity. Qed.

Example test_SLOAD :
  stack_after (exec_on SLOAD [1]) = Some [9].
Proof. reflexivity. Qed.

Example test_SSTORE :
  storage_after (exec_on SSTORE [1; 9]) 1 = Some 9.
Proof. reflexivity. Qed.

Example test_JUMP :
  pc_after
    (exec_on_frame_state JUMP
      (Frame.with_stack
        {| Frame.pc := 0; Frame.stack := []; Frame.code := []; Frame.memory_size := 0;
           Frame.valid_jump_destinations := [3] |}
        [3])
      test_state) =
  Some 3.
Proof. reflexivity. Qed.

Example test_JUMPI :
  pc_after
    (exec_on_frame_state JUMPI
      (Frame.with_stack
        {| Frame.pc := 0; Frame.stack := []; Frame.code := []; Frame.memory_size := 0;
           Frame.valid_jump_destinations := [3] |}
        [3; 1])
      test_state) =
  Some 3.
Proof. reflexivity. Qed.

Example test_PC :
  stack_after (exec_on_frame_state PC (frame_with_pc_stack 5 []) test_state) = Some [5].
Proof. reflexivity. Qed.

Example test_MSIZE :
  stack_after (exec_on_frame_state MSIZE (frame_with_memory_size_stack 64 []) test_state) =
  Some [64].
Proof. reflexivity. Qed.

Example test_GAS :
  stack_after (exec_on GAS []) = Some [1000000000].
Proof. reflexivity. Qed.

Example test_JUMPDEST :
  pc_after (exec_on JUMPDEST []) = Some 1.
Proof. reflexivity. Qed.

Example test_TLOAD :
  stack_after
    (exec_on_state TLOAD [5]
      (test_state <| State.transient_storage :=
        Storage.update Storage.empty (transient_key test_address 5) 9
      |>)) =
  Some [9].
Proof. reflexivity. Qed.

Example test_TSTORE :
  transient_storage_after (exec_on TSTORE [5; 9]) 5 = 9.
Proof. reflexivity. Qed.

Example test_MCOPY :
  memory_after (exec_on_state MCOPY [2; 0; 2] (state_with_memory [7; 8])) 2 2 = [7; 8].
Proof. reflexivity. Qed.

Definition PUSH1 : instruction := PUSH 1 eq_refl.
Definition DUP1 : instruction := DUP 1 eq_refl.
Definition SWAP1 : instruction := SWAP 1 eq_refl.
Definition LOG0 : instruction := LOG 0 eq_refl.

Example test_PUSH0 :
  stack_after (exec_on PUSH0 []) = Some [0].
Proof. reflexivity. Qed.

Example test_PUSH :
  stack_after (exec_instruction 200 [] test_environment PUSH1 42 (frame_with_stack []) test_state) =
  Some [42].
Proof. reflexivity. Qed.

Example test_DUP :
  stack_after (exec_on DUP1 [1; 2]) = Some [1; 1; 2].
Proof. reflexivity. Qed.

Example test_SWAP :
  stack_after (exec_on SWAP1 [1; 2]) = Some [2; 1].
Proof. reflexivity. Qed.

Example test_LOG :
  logs_after (exec_on_state LOG0 [0; 1] (state_with_memory [42])) = [([], [42])].
Proof. reflexivity. Qed.

Example test_CREATE :
  let result :=
    run 200 20 [] test_environment
      (frame_with_code_stack [240] [0; 0; 0])
      test_state in
  match created_account_after result with
  | Some address => account_exists_after result address = true
  | None => False
  end.
Proof. vm_compute. reflexivity. Qed.

Definition small_modexp_input : list Z :=
  Memory.u256_as_bytes 1 ++
  Memory.u256_as_bytes 1 ++
  Memory.u256_as_bytes 1 ++
  [2; 5; 13].

Example test_MODEXP_output :
  Stdlib.modexp_output small_modexp_input = [6].
Proof. vm_compute. reflexivity. Qed.

Example test_MODEXP_pow_mod_bytes_leading_zeroes :
  Stdlib.Pure.pow_mod_bytes [0; 2] [0; 5] 13 =
  Stdlib.Pure.pow_mod 2 5 13.
Proof. vm_compute. reflexivity. Qed.

Example test_MODEXP_pow_mod_bytes_bigN_leading_zeroes :
  Stdlib.Pure.pow_mod_bytes_bigN [0; 2] [0; 5] 13 =
  Stdlib.Pure.pow_mod 2 5 13.
Proof. vm_compute. reflexivity. Qed.

Example test_MODEXP_gas_by_protocol :
  (
    precompile_gas Protocol.Byzantium 5 small_modexp_input,
    precompile_gas Protocol.Berlin 5 small_modexp_input,
    precompile_gas Protocol.Osaka 5 small_modexp_input
  ) = (Some 0, Some 200, Some 500).
Proof. vm_compute. reflexivity. Qed.

Definition long_zero_head_modexp_input : list Z :=
  Memory.u256_as_bytes 32 ++
  Memory.u256_as_bytes 1024 ++
  Memory.u256_as_bytes 1024 ++
  List.repeat 0 1056 ++
  List.repeat 1 1024.

Example test_MODEXP_long_zero_exponent_head_gas :
  precompile_gas Protocol.London 5 long_zero_head_modexp_input =
  Some 43341141.
Proof. vm_compute. reflexivity. Qed.

Definition blake2f_vector_input : list Z :=
  Memory.hex_string_as_bytes
    "0000000c48c9bdf267e6096a3ba7ca8485ae67bb2bf894fe72f36e3cf1361d5f3af54fa5d182e6ad7f520e511f6c3e2b8c68059b6bbd41fbabd9831f79217e1319cde05b61626300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000001".

Definition blake2f_vector_output : list Z :=
  Memory.hex_string_as_bytes
    "ba80a53f981c4d0d6a2797b69f12f6e94c212f14685ac4b74b12bb6fdbffa2d17d87c5392aab792dc252d5de4533cc9518d38aa8dbf1925ab92386edd4009923".

Example test_BLAKE2F_output :
  Stdlib.precompile_output 9 blake2f_vector_input =
  Some blake2f_vector_output.
Proof. vm_compute. reflexivity. Qed.

Example test_BLAKE2F_gas_by_protocol :
  (
    precompile_gas Protocol.Frontier 9 blake2f_vector_input,
    precompile_gas Protocol.Istanbul 9 blake2f_vector_input
  ) = (None, Some 12).
Proof. vm_compute. reflexivity. Qed.

Example test_BLAKE2F_invalid_length :
  (
    precompile_gas Protocol.Istanbul 9 [],
    Stdlib.precompile_run_result 9 []
  ) = (Some 0, Some Stdlib.PrecompileFailure).
Proof. vm_compute. reflexivity. Qed.

Definition bn254_g1_one : list Z :=
  Memory.u256_as_bytes 1 ++ Memory.u256_as_bytes 2.

Definition bn254_g1_two : list Z :=
  Memory.hex_string_as_bytes
    "030644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd315ed738c0e0a7c92e7845f96b2ae9c0a68a6a449e3538fc7ff3ebf7a5a18a2c4".

Example test_BN254_ECADD_doubling :
  Stdlib.precompile_output 6 (bn254_g1_one ++ bn254_g1_one) =
  Some bn254_g1_two.
Proof. vm_compute. reflexivity. Qed.

Example test_BN254_ECADD_invalid_point :
  Stdlib.precompile_run_result 6 (List.repeat 255 128) =
  Some Stdlib.PrecompileFailure.
Proof. vm_compute. reflexivity. Qed.

Example test_BN254_ECMUL_by_two :
  Stdlib.precompile_output 7 (bn254_g1_one ++ Memory.u256_as_bytes 2) =
  Some bn254_g1_two.
Proof. vm_compute. reflexivity. Qed.

Example test_BN254_PAIRING_invalid_field_element :
  Stdlib.precompile_run_result 8 (List.repeat 255 192) =
  Some Stdlib.PrecompileFailure.
Proof. vm_compute. reflexivity. Qed.

Example test_POINT_EVALUATION_gas_by_protocol :
  (
    precompile_gas Protocol.Shanghai 10 [],
    precompile_gas Protocol.Cancun 10 []
  ) = (None, Some 50000).
Proof. vm_compute. reflexivity. Qed.

Example test_POINT_EVALUATION_invalid_versioned_hash :
  Stdlib.precompile_run_result 10 (List.repeat 0 192) =
  Some Stdlib.PrecompileFailure.
Proof. vm_compute. reflexivity. Qed.

Example test_BLS12_gas_by_protocol :
  (
    precompile_gas Protocol.Cancun 11 [],
    precompile_gas Protocol.Prague 11 [],
    precompile_gas Protocol.Prague 12 (List.repeat 0 160),
    precompile_gas Protocol.Prague 14 (List.repeat 0 288),
    precompile_gas Protocol.Prague 15 [],
    precompile_gas Protocol.Prague 17 []
  ) = (
    None,
    Some 375,
    Some 12000,
    Some 22500,
    Some 37700,
    Some 23800
  ).
Proof. vm_compute. reflexivity. Qed.

Example test_BLS12_unimplemented_execution_failure :
  Stdlib.precompile_run_result 11 (List.repeat 0 256) =
  Some Stdlib.PrecompileFailure.
Proof. vm_compute. reflexivity. Qed.

Example test_P256VERIFY_gas_by_protocol :
  (
    precompile_gas Protocol.Prague 256 [],
    precompile_gas Protocol.Osaka 256 []
  ) = (None, Some 6900).
Proof. vm_compute. reflexivity. Qed.

Example test_P256VERIFY_invalid_execution_empty_success :
  Stdlib.precompile_run_result 256 (List.repeat 0 160) =
  Some (Stdlib.PrecompileSuccess []).
Proof. vm_compute. reflexivity. Qed.

Example test_CALL :
  stack_after (exec_on_state CALL [1000; 4; 0; 0; 1; 10; 1] (state_with_memory [9])) =
  Some [1].
Proof. reflexivity. Qed.

Example test_CALLCODE :
  storage_after
    (run
      200
      20
      []
      test_environment
      (frame_with_code_stack [242] [100000; test_external_address; 0; 0; 0; 0; 0])
      callcode_state)
    2 =
  Some 99.
Proof. reflexivity. Qed.

Definition sha256_large_oog_state : State.t :=
  state_with_memory (List.repeat 255 32).

Example test_precompile_gas_from_memory_large_sha256 :
  precompile_gas_from_memory
    Protocol.Cancun 2 sha256_large_oog_state.(State.memory) 0 1000000 =
  Some (60 + 12 * Gas.words_for_bytes 1000000).
Proof. vm_compute. reflexivity. Qed.

Example test_CALLCODE_sha256_large_oog_skips_input_materialization :
  stack_after
    (exec_on_state CALLCODE
      [600; 2; 0; 0; 1000000; 0; 32]
      sha256_large_oog_state) =
  Some [0].
Proof. vm_compute. reflexivity. Qed.

Example test_RETURN :
  halt_after (exec_on RETURN [0; 1]) = Some (Halt.Return 0 1).
Proof. reflexivity. Qed.

Example test_DELEGATECALL :
  stack_after
    (exec_on_state DELEGATECALL [1000; 4; 0; 1; 10; 1] (state_with_return_data [8])) =
  Some [1].
Proof. reflexivity. Qed.

Example test_CREATE2 :
  let result :=
    run 200 20 [] test_environment
      (frame_with_code_stack [245] [0; 0; 0; 1])
      test_state in
  match created_account_after result with
  | Some address => account_exists_after result address = true
  | None => False
  end.
Proof. vm_compute. reflexivity. Qed.

Example test_STATICCALL :
  stack_after (exec_on_state STATICCALL [1000; 4; 0; 1; 10; 1] (state_with_memory [9])) =
  Some [1].
Proof. reflexivity. Qed.

Example test_REVERT :
  halt_after (exec_on REVERT [0; 1]) = Some (Halt.Revert 0 1).
Proof. reflexivity. Qed.

Example test_SELFDESTRUCT :
  halt_after (exec_on SELFDESTRUCT [test_beneficiary]) = Some Halt.Selfdestruct.
Proof. reflexivity. Qed.
