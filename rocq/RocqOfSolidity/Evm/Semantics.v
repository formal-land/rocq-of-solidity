Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.simulations.RocqOfSolidity.
Require Import RocqOfSolidity.RocqEvm.Arith.Nibble.
Require Import RocqOfSolidity.RocqEvm.Instructions.
Require Import RocqOfSolidity.RocqEvm.JumpDest.

Module OperandStack.
  Definition t : Set := list U256.t.

  Definition max_height : nat := 1024.

  Definition push (value : U256.t) (stack : t) : option t :=
    if Nat.ltb (List.length stack) max_height then
      Some (value :: stack)
    else
      None.

  Definition pop (stack : t) : option (U256.t * t) :=
    match stack with
    | [] => None
    | value :: stack => Some (value, stack)
    end.

  Definition pop2 (stack : t) : option (U256.t * U256.t * t) :=
    match pop stack with
    | Some (x, stack) =>
      match pop stack with
      | Some (y, stack) => Some (x, y, stack)
      | None => None
      end
    | None => None
    end.

  Definition pop3 (stack : t) : option (U256.t * U256.t * U256.t * t) :=
    match pop2 stack with
    | Some (x, y, stack) =>
      match pop stack with
      | Some (z, stack) => Some (x, y, z, stack)
      | None => None
      end
    | None => None
    end.

  Fixpoint popn (n : nat) (stack : t) : option (list U256.t * t) :=
    match n with
    | O => Some ([], stack)
    | S n' =>
      match pop stack with
      | Some (value, stack) =>
        match popn n' stack with
        | Some (values, stack) => Some (value :: values, stack)
        | None => None
        end
      | None => None
      end
    end.

  Fixpoint replace_nth (index : nat) (value : U256.t) (stack : t) : option t :=
    match index, stack with
    | O, _ :: stack => Some (value :: stack)
    | S index', top :: stack =>
      match replace_nth index' value stack with
      | Some stack => Some (top :: stack)
      | None => None
      end
    | _, [] => None
    end.

  Definition dup (n : N) (stack : t) : option t :=
    match List.nth_error stack (Nat.pred (N.to_nat n)) with
    | Some value => push value stack
    | None => None
    end.

  Definition swap (n : N) (stack : t) : option t :=
    match stack, List.nth_error stack (N.to_nat n) with
    | top :: _, Some value =>
      match replace_nth O value stack with
      | Some stack => replace_nth (N.to_nat n) top stack
      | None => None
      end
    | _, _ => None
    end.
End OperandStack.

Module Halt.
  Inductive t : Set :=
  | Stop
  | Return (offset size : U256.t)
  | Revert (offset size : U256.t)
  | Selfdestruct.
End Halt.

Module Frame.
  Record t : Set := {
    pc : U256.t;
    stack : OperandStack.t;
    code : list Z;
    memory_size : U256.t;
    valid_jump_destinations : list U256.t;
  }.

  Definition with_pc (frame : t) (pc : U256.t) : t := {|
    pc := pc;
    stack := frame.(stack);
    code := frame.(code);
    memory_size := frame.(memory_size);
    valid_jump_destinations := frame.(valid_jump_destinations);
  |}.

  Definition with_stack (frame : t) (stack : OperandStack.t) : t := {|
    pc := frame.(pc);
    stack := stack;
    code := frame.(code);
    memory_size := frame.(memory_size);
    valid_jump_destinations := frame.(valid_jump_destinations);
  |}.

  Definition with_memory_size (frame : t) (memory_size : U256.t) : t := {|
    pc := frame.(pc);
    stack := frame.(stack);
    code := frame.(code);
    memory_size := memory_size;
    valid_jump_destinations := frame.(valid_jump_destinations);
  |}.
End Frame.

Module Step.
  Inductive t : Set :=
  | Continue (frame : Frame.t)
  | Halt (halt : Halt.t)
  | Error (message : string).
End Step.

Definition byte_of_Z (z : Z) : byte :=
  byte_of_N (Z.to_N z).

Definition instruction_of_Z (z : Z) : option instruction :=
  instruction_of_byte (byte_of_Z z).

Definition valid_jump_destinations_of_code (code : list Z) : list U256.t :=
  List.map Z.of_N
    (paper_valid_jump_destinations_from (Memory.bytes_as_bytes code) 0 (S (List.length code))).

Definition make_frame (code : list Z) : Frame.t := {|
  Frame.pc := 0;
  Frame.stack := [];
  Frame.code := code;
  Frame.memory_size := 0;
  Frame.valid_jump_destinations := valid_jump_destinations_of_code code;
|}.

Definition instruction_size (op : instruction) : U256.t :=
  match op with
  | PUSH n _ => 1 + Z.of_N n
  | _ => 1
  end.

Definition advance_by (delta : U256.t) (frame : Frame.t) : Frame.t :=
  Frame.with_pc frame (frame.(Frame.pc) + delta).

Definition advance (op : instruction) (frame : Frame.t) : Frame.t :=
  advance_by (instruction_size op) frame.

Definition ceil32 (value : U256.t) : U256.t :=
  if value <=? 0 then
    0
  else
    ((value + 31) / 32) * 32.

Definition memory_limit : U256.t := 2 ^ 256.

Definition memory_range_end (offset size : U256.t) : option U256.t :=
  if size <=? 0 then
    Some 0
  else if (offset <? 0) || (size <? 0) then
    None
  else if memory_limit - size <? offset then
    None
  else
    Some (offset + size).

Definition memory_cost (size : U256.t) : U256.t :=
  let words := size / 32 in
  3 * words + (words * words) / 512.

Definition memory_expansion_cost (before after : U256.t) : U256.t :=
  memory_cost after - memory_cost before.

Definition touch_memory (offset size : U256.t) (frame : Frame.t) : Frame.t :=
  if size <=? 0 then
    frame
  else
    Frame.with_memory_size frame (Z.max frame.(Frame.memory_size) (ceil32 (offset + size))).

Module Gas.
  Definition zero : U256.t := 0.
  Definition jumpdest : U256.t := 1.
  Definition base : U256.t := 2.
  Definition very_low : U256.t := 3.
  Definition low : U256.t := 5.
  Definition mid : U256.t := 8.
  Definition high : U256.t := 10.
  Definition copy_word : U256.t := 3.
  Definition keccak_256 : U256.t := 30.
  Definition keccak_256_word : U256.t := 6.
  Definition blockhash : U256.t := 20.
  Definition exp_base : U256.t := 10.
  Definition log : U256.t := 375.
  Definition log_data : U256.t := 8.
  Definition log_topic : U256.t := 375.
  Definition transaction : U256.t := 21000.
  Definition tx_data_zero : U256.t := 4.
  Definition tx_data_non_zero_frontier : U256.t := 68.
  Definition tx_data_non_zero_istanbul : U256.t := 16.
  Definition access_list_address : U256.t := 2400.
  Definition access_list_storage : U256.t := 1900.
  Definition warm_storage_read : U256.t := 100.
  Definition cold_sload : U256.t := 2100.
  Definition cold_account_access : U256.t := 2600.
  Definition storage_set : U256.t := 20000.
  Definition storage_reset_frontier : U256.t := 5000.
  Definition storage_reset_berlin : U256.t := 2900.
  Definition storage_clear_refund_frontier : Z := 15000.
  Definition storage_clear_refund_london : Z := 4800.
  Definition selfdestruct_refund_frontier : Z := 24000.
  Definition transient_storage : U256.t := 100.
  Definition contract_creation_transaction : U256.t := 53000.
  Definition init_code_word : U256.t := 2.
  Definition max_init_code_size : U256.t := 49152.
  Definition max_code_size : U256.t := 24576.
  Definition max_account_nonce : Z := 2 ^ 64 - 1.
  Definition code_deposit : U256.t := 200.
  Definition call_frontier : U256.t := 40.
  Definition call : U256.t := 700.
  Definition call_value_transfer : U256.t := 9000.
  Definition call_stipend : U256.t := 2300.
  Definition call_new_account : U256.t := 25000.
  Definition create : U256.t := 32000.

  Definition is_istanbul_or_later (protocol : Protocol.t) : bool :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead | Protocol.Byzantium
    | Protocol.ConstantinopleFix => false
    | Protocol.Istanbul | Protocol.Berlin | Protocol.London | Protocol.Paris
    | Protocol.Shanghai | Protocol.Cancun | Protocol.Prague | Protocol.Osaka => true
    end.

  Definition is_berlin_or_later (protocol : Protocol.t) : bool :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead | Protocol.Byzantium
    | Protocol.ConstantinopleFix | Protocol.Istanbul => false
    | Protocol.Berlin | Protocol.London | Protocol.Paris | Protocol.Shanghai
    | Protocol.Cancun | Protocol.Prague | Protocol.Osaka => true
    end.

  Definition is_london_or_later (protocol : Protocol.t) : bool :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead | Protocol.Byzantium
    | Protocol.ConstantinopleFix | Protocol.Istanbul | Protocol.Berlin => false
    | Protocol.London | Protocol.Paris | Protocol.Shanghai | Protocol.Cancun
    | Protocol.Prague | Protocol.Osaka => true
    end.

  Definition is_shanghai_or_later (protocol : Protocol.t) : bool :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead | Protocol.Byzantium
    | Protocol.ConstantinopleFix | Protocol.Istanbul | Protocol.Berlin
    | Protocol.London | Protocol.Paris => false
    | Protocol.Shanghai | Protocol.Cancun | Protocol.Prague | Protocol.Osaka => true
    end.

  Definition is_prague_or_later (protocol : Protocol.t) : bool :=
    match protocol with
    | Protocol.Prague | Protocol.Osaka => true
    | _ => false
    end.

  Definition has_code_size_limit (protocol : Protocol.t) : bool :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead => false
    | Protocol.Byzantium | Protocol.ConstantinopleFix | Protocol.Istanbul
    | Protocol.Berlin | Protocol.London | Protocol.Paris | Protocol.Shanghai
    | Protocol.Cancun | Protocol.Prague | Protocol.Osaka => true
    end.

  Definition rejects_ef_prefix (protocol : Protocol.t) : bool :=
    is_london_or_later protocol.

  Definition tx_data_non_zero (protocol : Protocol.t) : U256.t :=
    if is_istanbul_or_later protocol then
      tx_data_non_zero_istanbul
    else
      tx_data_non_zero_frontier.

  Fixpoint calldata_cost (protocol : Protocol.t) (data : list Z) : U256.t :=
    match data with
    | [] => 0
    | byte :: data =>
      (if byte =? 0 then tx_data_zero else tx_data_non_zero protocol) +
      calldata_cost protocol data
    end.

  Fixpoint calldata_tokens (data : list Z) : U256.t :=
    match data with
    | [] => 0
    | byte :: data =>
      (if byte =? 0 then 1 else 4) + calldata_tokens data
    end.

  Definition calldata_floor_cost (data : list Z) : U256.t :=
    transaction + 10 * calldata_tokens data.

  Definition words_for_bytes (size : U256.t) : U256.t :=
    if size <=? 0 then 0 else (size + 31) / 32.

  Definition transaction_base_cost
      (protocol : Protocol.t)
      (is_create : bool) : U256.t :=
    if is_create then
      match protocol with
      | Protocol.Frontier => transaction
      | _ => contract_creation_transaction
      end
    else
      transaction.

  Definition init_code_cost
      (protocol : Protocol.t)
      (is_create : bool)
      (data : list Z) : U256.t :=
    if andb is_create (is_shanghai_or_later protocol) then
      init_code_word * words_for_bytes (Z.of_nat (List.length data))
    else
      0.

  Fixpoint access_list_storage_slots (access_list : list (U256.t * list U256.t)) : nat :=
    match access_list with
    | [] => O
    | (_, slots) :: access_list =>
      List.length slots + access_list_storage_slots access_list
    end.

  Definition access_list_gas_cost
      (protocol : Protocol.t)
      (access_list : list (U256.t * list U256.t)) : U256.t :=
    if is_berlin_or_later protocol then
      access_list_address * Z.of_nat (List.length access_list) +
      access_list_storage * Z.of_nat (access_list_storage_slots access_list)
    else
      0.

  Definition intrinsic_transaction_cost
      (protocol : Protocol.t)
      (is_create : bool)
      (data : list Z)
      (access_list : list (U256.t * list U256.t)) : U256.t :=
    transaction_base_cost protocol is_create +
    calldata_cost protocol data +
    access_list_gas_cost protocol access_list +
    init_code_cost protocol is_create data.

  Definition minimum_transaction_gas_limit
      (protocol : Protocol.t)
      (is_create : bool)
      (data : list Z)
      (access_list : list (U256.t * list U256.t)) : U256.t :=
    let intrinsic := intrinsic_transaction_cost protocol is_create data access_list in
    if is_prague_or_later protocol then
      Z.max intrinsic (calldata_floor_cost data)
    else
      intrinsic.

  Definition execution_gas
      (protocol : Protocol.t)
      (is_create : bool)
      (gas_limit : U256.t)
      (data : list Z)
      (access_list : list (U256.t * list U256.t)) : U256.t :=
    let intrinsic := intrinsic_transaction_cost protocol is_create data access_list in
    let minimum := minimum_transaction_gas_limit protocol is_create data access_list in
    if minimum <=? gas_limit then gas_limit - intrinsic else 0.

  Definition charge (cost : U256.t) (state : State.t) : option State.t :=
    if cost <=? state.(State.gas) then
      Some (state <| State.gas := state.(State.gas) - cost |>)
    else
      None.

  Definition memory_expansion
      (offset size : U256.t)
      (frame : Frame.t) : option (Frame.t * U256.t) :=
    if size <=? 0 then
      Some (frame, 0)
    else
      match memory_range_end offset size with
      | None => None
      | Some end_ =>
        let after := Z.max frame.(Frame.memory_size) (ceil32 end_) in
        Some (
          Frame.with_memory_size frame after,
          memory_expansion_cost frame.(Frame.memory_size) after
        )
      end.

  Definition charge_memory_and_extra
      (offset size extra : U256.t)
      (frame : Frame.t)
      (state : State.t) : option (Frame.t * State.t) :=
    match memory_expansion offset size frame with
    | None => None
    | Some (frame, memory_cost) =>
      match charge (memory_cost + extra) state with
      | Some state => Some (frame, state)
      | None => None
      end
    end.

  Definition charge_memory
      (offset size : U256.t)
      (frame : Frame.t)
      (state : State.t) : option (Frame.t * State.t) :=
    charge_memory_and_extra offset size 0 frame state.

  Definition words_for_size (size : U256.t) : U256.t :=
    words_for_bytes size.

  Definition code_deposit_cost (code : list Z) : U256.t :=
    code_deposit * Z.of_nat (List.length code).

  Definition create_init_code_cost
      (protocol : Protocol.t)
      (size : U256.t) : U256.t :=
    if is_shanghai_or_later protocol then
      init_code_word * words_for_bytes size
    else
      0.

  Definition create2_hash_cost (size : U256.t) : U256.t :=
    keccak_256_word * words_for_bytes size.

  Definition copy_cost (size : U256.t) : U256.t :=
    copy_word * words_for_size size.

  Definition exp_byte_cost (protocol : Protocol.t) : U256.t :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead => 10
    | _ => 50
    end.

  Definition exp_byte_length (exponent : U256.t) : U256.t :=
    if exponent =? 0 then 0 else Z.log2 exponent / 8 + 1.

  Definition exp_cost (protocol : Protocol.t) (exponent : U256.t) : U256.t :=
    exp_base + exp_byte_cost protocol * exp_byte_length exponent.

  Definition sload_legacy_cost (protocol : Protocol.t) : U256.t :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead => 50
    | Protocol.Byzantium | Protocol.ConstantinopleFix => 200
    | Protocol.Istanbul => 800
    | _ => warm_storage_read
    end.

  Definition sload_cost (protocol : Protocol.t) (slot_warm : bool) : U256.t :=
    if is_berlin_or_later protocol then
      if slot_warm then warm_storage_read else cold_sload
    else
      sload_legacy_cost protocol.

  Definition storage_reset_cost (protocol : Protocol.t) : U256.t :=
    if is_berlin_or_later protocol then
      storage_reset_berlin
    else
      storage_reset_frontier.

  Definition sstore_dirty_cost (protocol : Protocol.t) : U256.t :=
    if is_berlin_or_later protocol then
      warm_storage_read
    else
      sload_legacy_cost protocol.

  Definition sstore_cost
      (protocol : Protocol.t)
      (slot_warm : bool)
      (original current new : U256.t) : U256.t :=
    let access_cost :=
      if andb (is_berlin_or_later protocol) (negb slot_warm) then cold_sload else 0 in
    let write_cost :=
      if is_istanbul_or_later protocol then
        if current =? new then
          sstore_dirty_cost protocol
        else if original =? current then
          if original =? 0 then storage_set else storage_reset_cost protocol
        else
          sstore_dirty_cost protocol
      else if andb (negb (new =? 0)) (current =? 0) then
        storage_set
      else
        storage_reset_frontier in
    access_cost + write_cost.

  Definition storage_clear_refund (protocol : Protocol.t) : Z :=
    if is_london_or_later protocol then
      storage_clear_refund_london
    else
      storage_clear_refund_frontier.

  Definition selfdestruct_refund (protocol : Protocol.t) : Z :=
    if is_london_or_later protocol then
      0
    else
      selfdestruct_refund_frontier.

  Definition sstore_set_less_sload (protocol : Protocol.t) : Z :=
    storage_set - sstore_dirty_cost protocol.

  Definition sstore_reset_less_sload (protocol : Protocol.t) : Z :=
    storage_reset_cost protocol - sstore_dirty_cost protocol.

  Definition sstore_refund
      (protocol : Protocol.t)
      (original current new : U256.t) : Z :=
    if is_istanbul_or_later protocol then
      if current =? new then
        0
      else if original =? current then
        if andb (negb (original =? 0)) (new =? 0) then
          storage_clear_refund protocol
        else
          0
      else
        let clear_refund := storage_clear_refund protocol in
        let refund :=
          if negb (original =? 0) then
            if current =? 0 then
              - clear_refund
            else if new =? 0 then
              clear_refund
            else
              0
          else
            0 in
        if original =? new then
          refund +
            (if original =? 0 then
              sstore_set_less_sload protocol
            else
              sstore_reset_less_sload protocol)
        else
          refund
    else if andb (new =? 0) (negb (current =? 0)) then
      storage_clear_refund_frontier
    else
      0.

  Fixpoint u256_pair_in (key : U256.t * U256.t) (keys : list (U256.t * U256.t)) : bool :=
    match keys with
    | [] => false
    | current :: keys =>
      if Dict.Eq.eqb key current then true else u256_pair_in key keys
    end.

  Definition warm_address (address : U256.t) (state : State.t) : bool * State.t :=
    let was_warm := u256_in address state.(State.warm_addresses) in
    (
      was_warm,
      if was_warm then
        state
      else
        state <| State.warm_addresses := address :: state.(State.warm_addresses) |>
    ).

  Definition warm_storage (address slot : U256.t) (state : State.t) : bool * State.t :=
    let key := (address, slot) in
    let was_warm := u256_pair_in key state.(State.warm_storage_keys) in
    (
      was_warm,
      if was_warm then
        state
      else
        state <| State.warm_storage_keys := key :: state.(State.warm_storage_keys) |>
    ).

  Definition storage_value
      (accounts : list (U256.t * Account.t))
      (address slot : U256.t) : U256.t :=
    match Dict.get accounts address with
    | Some account => account.(Account.storage) slot
    | None => 0
    end.

  Definition current_storage_value (state : State.t) (address slot : U256.t) : U256.t :=
    storage_value state.(State.accounts) address slot.

  Definition original_storage_value (state : State.t) (address slot : U256.t) : U256.t :=
    storage_value state.(State.original_accounts) address slot.

  Definition balance_cost (protocol : Protocol.t) (warm : bool) : U256.t :=
    if is_berlin_or_later protocol then
      if warm then warm_storage_read else cold_account_access
    else
      match protocol with
      | Protocol.Frontier | Protocol.Homestead => 20
      | Protocol.Byzantium | Protocol.ConstantinopleFix => 400
      | _ => 700
      end.

  Definition ext_code_cost (protocol : Protocol.t) (warm : bool) : U256.t :=
    if is_berlin_or_later protocol then
      if warm then warm_storage_read else cold_account_access
    else
      match protocol with
      | Protocol.Frontier | Protocol.Homestead => 20
      | _ => 700
      end.

  Definition ext_code_hash_cost (protocol : Protocol.t) (warm : bool) : U256.t :=
    if is_berlin_or_later protocol then
      if warm then warm_storage_read else cold_account_access
    else
      match protocol with
      | Protocol.ConstantinopleFix => 400
      | _ => 700
      end.

  Definition account_empty (account : Account.t) : bool :=
    (account.(Account.balance) =? 0) &&
    (account.(Account.nonce) =? 0) &&
    (account.(Account.code) =? 0) &&
    StdlibAux.bytes_eqb account.(Account.codedata) [] &&
    match account.(Account.storage_keys) with
    | [] => true
    | _ :: _ => false
    end.

  Definition selfdestruct_base_cost (protocol : Protocol.t) : U256.t :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead => 0
    | _ => 5000
    end.

  Definition selfdestruct_new_account_cost (protocol : Protocol.t) : U256.t :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead => 0
    | _ => 25000
    end.

  Definition selfdestruct_creates_account
      (transferred_value : U256.t)
      (beneficiary_account : option Account.t) : bool :=
    if transferred_value =? 0 then
      false
    else
      match beneficiary_account with
      | None => true
      | Some account => account_empty account
      end.

  Definition selfdestruct_cost
      (protocol : Protocol.t)
      (warm : bool)
      (transferred_value : U256.t)
      (beneficiary_account : option Account.t) : U256.t :=
    selfdestruct_base_cost protocol +
    (if is_berlin_or_later protocol then
      if warm then 0 else cold_account_access
    else 0) +
    (if selfdestruct_creates_account transferred_value beneficiary_account then
      selfdestruct_new_account_cost protocol
    else 0).

  Definition has_eip150 (protocol : Protocol.t) : bool :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead => false
    | _ => true
    end.

  Definition call_base_cost (protocol : Protocol.t) (warm : bool) : U256.t :=
    if is_berlin_or_later protocol then
      if warm then warm_storage_read else cold_account_access
    else if has_eip150 protocol then
      call
    else
      call_frontier.

  Definition call_value_cost (value : U256.t) : U256.t :=
    if value =? 0 then 0 else call_value_transfer.

  Definition call_creates_account
      (value : U256.t)
      (callee_account : option Account.t) : bool :=
    if value =? 0 then
      false
    else
      match callee_account with
      | None => true
      | Some account => account_empty account
      end.

  Definition call_new_account_cost
      (value : U256.t)
      (callee_account : option Account.t) : U256.t :=
    if call_creates_account value callee_account then
      call_new_account
    else
      0.

  Definition call_dynamic_cost
      (protocol : Protocol.t)
      (warm : bool)
      (value : U256.t)
      (callee_account : option Account.t) : U256.t :=
    call_base_cost protocol warm +
    call_value_cost value +
    call_new_account_cost value callee_account.

  Definition call_dynamic_cost_without_new_account
      (protocol : Protocol.t)
      (warm : bool)
      (value : U256.t) : U256.t :=
    call_base_cost protocol warm + call_value_cost value.

  Definition max_call_gas (gas : U256.t) : U256.t :=
    gas - gas / 64.

  Definition call_forwarded_gas
      (protocol : Protocol.t)
      (requested available : U256.t) : option U256.t :=
    if has_eip150 protocol then
      Some (Z.min requested (max_call_gas available))
    else if requested <=? available then
      Some requested
    else
      None.

  Definition create_forwarded_gas
      (protocol : Protocol.t)
      (available : U256.t) : U256.t :=
    if has_eip150 protocol then max_call_gas available else available.

  Definition precompile_addresses (protocol : Protocol.t) : list U256.t :=
    match protocol with
    | Protocol.Frontier | Protocol.Homestead | Protocol.Byzantium
    | Protocol.ConstantinopleFix | Protocol.Istanbul | Protocol.Berlin
    | Protocol.London | Protocol.Paris | Protocol.Shanghai =>
      [1; 2; 3; 4; 5; 6; 7; 8; 9]
    | Protocol.Cancun =>
      [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    | Protocol.Prague | Protocol.Osaka =>
      [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17] ++
      match protocol with
      | Protocol.Osaka => [256]
      | _ => []
      end
    end.

  Fixpoint access_list_addresses (access_list : list (U256.t * list U256.t)) : list U256.t :=
    match access_list with
    | [] => []
    | (address, _) :: access_list => address :: access_list_addresses access_list
    end.

  Fixpoint access_list_storage_keys
      (access_list : list (U256.t * list U256.t)) : list (U256.t * U256.t) :=
    match access_list with
    | [] => []
    | (address, slots) :: access_list =>
      List.map (fun slot => (address, slot)) slots ++ access_list_storage_keys access_list
    end.

  Definition initial_warm_addresses
      (protocol : Protocol.t)
      (caller to coinbase : U256.t)
      (access_list : list (U256.t * list U256.t)) : list U256.t :=
    if is_berlin_or_later protocol then
      caller :: to :: (
        precompile_addresses protocol ++
        access_list_addresses access_list ++
        if is_shanghai_or_later protocol then [coinbase] else []
      )
    else
      [].

  Definition initial_warm_storage_keys
      (protocol : Protocol.t)
      (access_list : list (U256.t * list U256.t)) : list (U256.t * U256.t) :=
    if is_berlin_or_later protocol then
      access_list_storage_keys access_list
    else
      [].

  Definition static_cost (protocol : Protocol.t) (op : instruction) : U256.t :=
    match op with
    | STOP | RETURN | REVERT => zero
    | ADD | SUB | LT | GT | SLT | SGT | EQ | ISZERO | AND | OR | XOR | NOT
    | BYTE | SHL | SHR | SAR | CALLDATALOAD | CALLDATACOPY | CODECOPY
    | RETURNDATACOPY | MLOAD | MSTORE | MSTORE8 | PUSH _ _ | DUP _ _
    | SWAP _ _ | MCOPY | BLOBHASH => very_low
    | MUL | DIV | SDIV | MOD | SMOD | SIGNEXTEND | SELFBALANCE | CLZ => low
    | ADDMOD | MULMOD | JUMP => mid
    | JUMPI => high
    | EXP => exp_base
    | SHA3 => keccak_256
    | ADDRESS | ORIGIN | CALLER | CALLVALUE | GASPRICE | COINBASE | TIMESTAMP
    | NUMBER | DIFFICULTY | GASLIMIT | CHAINID | BASEFEE | BLOBBASEFEE
    | CALLDATASIZE | CODESIZE | RETURNDATASIZE | POP | PC | MSIZE | GAS
    | PUSH0 => base
    | BLOCKHASH => blockhash
    | JUMPDEST => jumpdest
    | LOG n _ => log + log_topic * Z.of_N n
    | BALANCE | EXTCODESIZE | EXTCODECOPY | EXTCODEHASH | SLOAD | SSTORE
    | TLOAD | TSTORE | CREATE | CALL | CALLCODE | DELEGATECALL | CREATE2
    | STATICCALL | SELFDESTRUCT => zero
    end.
End Gas.

Definition continue (op : instruction) (stack : OperandStack.t)
    (frame : Frame.t) (state : State.t) : Step.t * State.t :=
  (Step.Continue (Frame.with_stack (advance op frame) stack), state).

Definition continue_frame (frame : Frame.t) (state : State.t) : Step.t * State.t :=
  (Step.Continue frame, state).

Definition stack_error (state : State.t) : Step.t * State.t :=
  (Step.Error "stack underflow", state).

Definition stack_overflow_error (state : State.t) : Step.t * State.t :=
  (Step.Error "stack overflow", state).

Definition memory_expansion_error (state : State.t) : Step.t * State.t :=
  (Step.Error "out of gas: memory expansion", state <| State.gas := 0 |>).

Definition out_of_gas_error (state : State.t) : Step.t * State.t :=
  (Step.Error "out of gas", state <| State.gas := 0 |>).

Definition max_call_depth : nat := 1024%nat.

Definition call_depth_exceeded (state : State.t) : bool :=
  Nat.leb max_call_depth state.(State.call_depth).

Definition continue_push_stack (op : instruction) (value : U256.t)
    (stack : OperandStack.t) (frame : Frame.t) (state : State.t) :
    Step.t * State.t :=
  match OperandStack.push value stack with
  | Some stack => continue op stack frame state
  | None => stack_overflow_error state
  end.

Definition continue_push (op : instruction) (value : U256.t)
    (frame : Frame.t) (state : State.t) : Step.t * State.t :=
  continue_push_stack op value frame.(Frame.stack) frame state.

Definition continue_result_unit (op : instruction)
    (frame : Frame.t) (result : Result.t unit + string) (state : State.t) :
    Step.t * State.t :=
  match result with
  | inl (Result.Ok tt) => continue op frame.(Frame.stack) frame state
  | inl (Result.Return offset size) => (Step.Halt (Halt.Return offset size), state)
  | inl (Result.Revert offset size) => (Step.Halt (Halt.Revert offset size), state)
  | inr message => (Step.Error message, state)
  end.

Definition continue_result_word (op : instruction)
    (frame : Frame.t) (result : Result.t U256.t + string) (state : State.t) :
    Step.t * State.t :=
  match result with
  | inl (Result.Ok value) => continue_push op value frame state
  | inl (Result.Return offset size) => (Step.Halt (Halt.Return offset size), state)
  | inl (Result.Revert offset size) => (Step.Halt (Halt.Revert offset size), state)
  | inr message => (Step.Error message, state)
  end.

Definition eval_m {A : Set}
    (fuel : nat)
    (codes : Codes.t)
    (environment : Environment.t)
    (e : M.t A)
    (state : State.t) :
    (Result.t A + string) * State.t :=
  eval fuel codes environment e state.

Definition eval_primitive_result {A : Set}
    (environment : Environment.t)
    (primitive : Primitive.t A)
    (state : State.t) :
    (A + string) * State.t :=
  match eval_primitive environment primitive state with
  | inl (value, state) => (inl value, state)
  | inr message => (inr message, state)
  end.

Definition with_primitive_word (op : instruction)
    (environment : Environment.t)
    (primitive : Primitive.t U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) :
    Step.t * State.t :=
  let '(result, state) := eval_primitive_result environment primitive state in
  match result with
  | inl value => continue_push_stack op value stack frame state
  | inr message => (Step.Error message, state)
  end.

Definition with_primitive_unit (op : instruction)
    (environment : Environment.t)
    (primitive : Primitive.t unit)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) :
    Step.t * State.t :=
  let '(result, state) := eval_primitive_result environment primitive state in
  match result with
  | inl tt => continue op stack frame state
  | inr message => (Step.Error message, state)
  end.

Definition byte_at (code : list Z) (pc : U256.t) : option Z :=
  List.nth_error code (Z.to_nat pc).

Definition code_slice (code : list Z) (offset size : U256.t) : list Z :=
  StdlibAux.bytes_slice_with_zero_padding code offset size.

Definition push_value (frame : Frame.t) (n : N) : U256.t :=
  Memory.bytes_as_u256
    (List.firstn_or_default
      (N.to_nat n)
      0
      (List.skipn (S (Z.to_nat frame.(Frame.pc))) frame.(Frame.code))).

Definition is_valid_jump_destination (frame : Frame.t) (destination : U256.t) : bool :=
  List.existsb (fun current => current =? destination) frame.(Frame.valid_jump_destinations).

Definition evm_addmod (x y m : U256.t) : U256.t :=
  if m =? 0 then 0 else Stdlib.Pure.addmod x y m.

Definition evm_mulmod (x y m : U256.t) : U256.t :=
  if m =? 0 then 0 else Stdlib.Pure.mulmod x y m.

Definition evm_byte (n x : U256.t) : U256.t :=
  if n >=? 32 then 0 else Stdlib.Pure.byte n x.

Definition unary (op : instruction) (f : U256.t -> U256.t)
    (frame : Frame.t) (state : State.t) : Step.t * State.t :=
  match OperandStack.pop frame.(Frame.stack) with
  | Some (x, stack) => continue op (f x :: stack) frame state
  | None => stack_error state
  end.

Definition binary (op : instruction) (f : U256.t -> U256.t -> U256.t)
    (frame : Frame.t) (state : State.t) : Step.t * State.t :=
  match OperandStack.pop2 frame.(Frame.stack) with
  | Some (x, y, stack) => continue op (f x y :: stack) frame state
  | None => stack_error state
  end.

Definition ternary (op : instruction) (f : U256.t -> U256.t -> U256.t -> U256.t)
    (frame : Frame.t) (state : State.t) : Step.t * State.t :=
  match OperandStack.pop3 frame.(Frame.stack) with
  | Some (x, y, z, stack) => continue op (f x y z :: stack) frame state
  | None => stack_error state
  end.

Definition copy_to_memory_with_environment (op : instruction)
    (environment : Environment.t)
    (dst offset size : U256.t)
    (bytes : list Z)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  match Gas.charge_memory_and_extra dst size (Gas.copy_cost size) frame state with
  | Some (frame, state) =>
    let bytes := StdlibAux.bytes_slice_with_zero_padding bytes offset size in
    with_primitive_unit op environment (Primitive.MStore dst bytes) frame stack state
  | None => memory_expansion_error state
  end.

Definition return_data_copy_in_bounds
    (return_data : ReturnData.t) (offset size : U256.t) : bool :=
  offset + size <=? ReturnData.length return_data.

Definition copy_return_data_to_memory
    (op : instruction)
    (environment : Environment.t)
    (dst offset size : U256.t)
    (return_data : ReturnData.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  match Gas.charge_memory_and_extra dst size (Gas.copy_cost size) frame state with
  | Some (frame, state) =>
    with_primitive_unit op environment
      (Primitive.MStore dst (ReturnData.get_bytes return_data offset size))
      frame stack state
  | None => memory_expansion_error state
  end.

Definition call_runner : Set :=
  nat -> Codes.t -> Environment.t -> Frame.t -> State.t -> Step.t * State.t.

Definition default_call_runner : call_runner :=
  fun _ _ _ _ state => (Step.Error "nested EVM call runner unavailable", state).

Definition account_code_bytes (account : Account.t) : list Z :=
  if account.(Account.code) =? 0 then
    account.(Account.codedata)
  else
    Memory.u256_as_bytes account.(Account.code) ++ account.(Account.codedata).

Definition account_has_bytecode (account : Account.t) : bool :=
  negb (StdlibAux.bytes_eqb (account_code_bytes account) []).

Definition empty_call_account (balance : U256.t) : Account.t := {|
  Account.balance := balance;
  Account.nonce := 0;
  Account.code := 0;
  Account.codedata := [];
  Account.storage := Storage.empty;
  Account.storage_keys := [];
  Account.immutables := [];
|}.

Definition credit_call_account
    (accounts : list (U256.t * Account.t))
    (address value : U256.t) : list (U256.t * Account.t) :=
  if value =? 0 then
    accounts
  else
    Dict.declare_or_assign_function accounts address (fun account =>
      match account with
      | Some account =>
        account <| Account.balance := account.(Account.balance) + value |>
      | None => empty_call_account value
      end
    ).

Definition transfer_call_value
    (from to value : U256.t)
    (state : State.t) : State.t + string :=
  if value =? 0 then
    inl state
  else
    match Dict.get state.(State.accounts) from with
    | None =>
      inr ("balance not found for the address " ++ HexString.of_Z from)%string
    | Some from_account =>
      if value >? from_account.(Account.balance) then
        inr "insufficient balance"
      else if from =? to then
        inl state
      else
        match Dict.assign_function state.(State.accounts) from (fun account =>
            account <| Account.balance := account.(Account.balance) - value |>
          ) with
        | None =>
          inr ("balance not found for the address " ++ HexString.of_Z from)%string
        | Some accounts =>
          inl (
            state <| State.accounts := credit_call_account accounts to value |>
          )
        end
    end.

Definition charge_two_memory_regions_and_extra
    (first_offset first_size second_offset second_size extra : U256.t)
    (frame : Frame.t)
    (state : State.t) : option (Frame.t * State.t) :=
  match Gas.memory_expansion first_offset first_size frame with
  | None => None
  | Some (frame, first_cost) =>
    match Gas.memory_expansion second_offset second_size frame with
    | None => None
    | Some (frame, second_cost) =>
      match Gas.charge (first_cost + second_cost + extra) state with
      | Some state => Some (frame, state)
      | None => None
      end
    end
  end.

Definition call_child_environment
    (environment : Environment.t)
    (callee_address code_name value : U256.t)
    (input : list Z)
    (is_static is_delegate : bool) : Environment.t := {|
  Environment.protocol := environment.(Environment.protocol);
  Environment.caller :=
    if is_delegate then environment.(Environment.caller) else environment.(Environment.address);
  Environment.origin := environment.(Environment.origin);
  Environment.callvalue :=
    if is_delegate then environment.(Environment.callvalue) else value;
  Environment.gas_price := environment.(Environment.gas_price);
  Environment.calldata := input;
  Environment.address :=
    if is_delegate then environment.(Environment.address) else callee_address;
  Environment.code_name := code_name;
  Environment.chain_id := environment.(Environment.chain_id);
  Environment.block_coinbase := environment.(Environment.block_coinbase);
  Environment.block_gas_limit := environment.(Environment.block_gas_limit);
  Environment.block_difficulty := environment.(Environment.block_difficulty);
  Environment.block_prev_randao := environment.(Environment.block_prev_randao);
  Environment.block_base_fee := environment.(Environment.block_base_fee);
  Environment.block_blob_base_fee := environment.(Environment.block_blob_base_fee);
  Environment.blob_hashes := environment.(Environment.blob_hashes);
|}.

Definition call_child_state
    (state : State.t)
    (gas : U256.t)
    (is_static : bool) : State.t :=
  State.init
    <| State.accounts := state.(State.accounts) |>
    <| State.transient_storage := state.(State.transient_storage) |>
    <| State.gas := gas |>
    <| State.gas_refund := state.(State.gas_refund) |>
    <| State.call_depth := S state.(State.call_depth) |>
    <| State.precompile_cache := state.(State.precompile_cache) |>
    <| State.ecrecover_cache := state.(State.ecrecover_cache) |>
    <| State.warm_addresses := state.(State.warm_addresses) |>
    <| State.warm_storage_keys := state.(State.warm_storage_keys) |>
    <| State.original_accounts := state.(State.original_accounts) |>
    <| State.is_static := is_static |>
    <| State.block_number := state.(State.block_number) |>
    <| State.block_timestamp := state.(State.block_timestamp) |>
    <| State.created_accounts := state.(State.created_accounts) |>
    <| State.selfdestructed_created_accounts :=
      state.(State.selfdestructed_created_accounts)
    |>
    <| State.logs := state.(State.logs) |>
    <| State.call_stack := state.(State.call_stack) |>.

Definition commit_child_state
    (parent_state callee_state : State.t)
    (return_data : list Z) : State.t :=
  parent_state
    <| State.accounts := callee_state.(State.accounts) |>
    <| State.transient_storage := callee_state.(State.transient_storage) |>
    <| State.gas := parent_state.(State.gas) + callee_state.(State.gas) |>
    <| State.gas_refund := callee_state.(State.gas_refund) |>
    <| State.precompile_cache := callee_state.(State.precompile_cache) |>
    <| State.ecrecover_cache := callee_state.(State.ecrecover_cache) |>
    <| State.warm_addresses := callee_state.(State.warm_addresses) |>
    <| State.warm_storage_keys := callee_state.(State.warm_storage_keys) |>
    <| State.created_accounts := callee_state.(State.created_accounts) |>
    <| State.selfdestructed_created_accounts :=
      callee_state.(State.selfdestructed_created_accounts)
    |>
    <| State.logs := callee_state.(State.logs) |>
    <| State.return_data := ReturnData.of_bytes return_data |>.

Definition revert_child_state
    (parent_state callee_state : State.t)
    (return_data : list Z) : State.t :=
  parent_state
    <| State.gas := parent_state.(State.gas) + callee_state.(State.gas) |>
    <| State.precompile_cache := callee_state.(State.precompile_cache) |>
    <| State.ecrecover_cache := callee_state.(State.ecrecover_cache) |>
    <| State.return_data := ReturnData.of_bytes return_data |>.

Definition consume_child_gas
    (parent_state : State.t)
    (return_data : list Z) : State.t :=
  parent_state <| State.return_data := ReturnData.of_bytes return_data |>.

Definition return_unused_call_stipend
    (value : U256.t)
    (state : State.t) : State.t :=
  if value =? 0 then
    state
  else
    state <| State.gas := state.(State.gas) + Gas.call_stipend |>.

Definition created_account_initial_nonce (protocol : Protocol.t) : Z :=
  match protocol with
  | Protocol.Frontier | Protocol.Homestead => 0
  | _ => 1
  end.

Definition empty_created_account
    (protocol : Protocol.t)
    (balance : U256.t) : Account.t := {|
  Account.balance := balance;
  Account.nonce := created_account_initial_nonce protocol;
  Account.code := 0;
  Account.codedata := [];
  Account.storage := Storage.empty;
  Account.storage_keys := [];
  Account.immutables := [];
|}.

Definition creation_account_collision (account : Account.t) : bool :=
  (negb (account.(Account.nonce) =? 0)) ||
  account_has_bytecode account ||
  match account.(Account.storage_keys) with
  | [] => false
  | _ :: _ => true
  end.

Definition create2_contract_address
    (creator salt : U256.t)
    (init_code : list Z) : U256.t :=
  let init_code_hash := Memory.u256_as_bytes (StdlibAux.keccak256 init_code) in
  let bytes :=
    [255] ++ StdlibAux.low_160_bits_as_bytes creator ++
    Memory.u256_as_bytes salt ++ init_code_hash in
  StdlibAux.address_of_word (StdlibAux.keccak256 bytes).

Definition create_contract_address
    (op : instruction)
    (creator nonce salt : U256.t)
    (init_code : list Z) : U256.t :=
  match op with
  | CREATE2 => create2_contract_address creator salt init_code
  | _ => StdlibAux.contract_creation_address creator nonce
  end.

Definition create_extra_cost
    (protocol : Protocol.t)
    (op : instruction)
    (init_code_size : U256.t) : U256.t :=
  Gas.create +
  Gas.create_init_code_cost protocol init_code_size +
  match op with
  | CREATE2 => Gas.create2_hash_cost init_code_size
  | _ => 0
  end.

Definition prepare_create_account
    (protocol : Protocol.t)
    (creator created value : U256.t)
    (state : State.t) : State.t + string :=
  match Dict.get state.(State.accounts) creator with
  | None =>
    inr ("balance not found for the address " ++ HexString.of_Z creator)%string
  | Some creator_account =>
    if value >? creator_account.(Account.balance) then
      inr "insufficient balance"
    else
      match Dict.get state.(State.accounts) created with
      | Some created_account =>
        if creation_account_collision created_account then
          inr "creation collision"
        else
          let creator_account :=
            creator_account
              <| Account.balance := creator_account.(Account.balance) - value |>
              <| Account.nonce := creator_account.(Account.nonce) + 1 |>
          in
          match Dict.assign_function state.(State.accounts) creator (fun _ => creator_account) with
          | None =>
            inr ("balance not found for the address " ++ HexString.of_Z creator)%string
          | Some accounts =>
            match Dict.assign_function accounts created (fun account =>
                account
                  <| Account.balance := account.(Account.balance) + value |>
                  <| Account.nonce := created_account_initial_nonce protocol |>
                  <| Account.code := 0 |>
                  <| Account.codedata := [] |>
                  <| Account.storage := Storage.empty |>
                  <| Account.storage_keys := [] |>
              ) with
            | None => inr "created account not found"
            | Some accounts =>
              let '(_, state) :=
                Gas.warm_address created
                  (state <| State.accounts := accounts |>
                    <| State.created_accounts := created :: state.(State.created_accounts) |>) in
              inl state
            end
          end
      | None =>
        let creator_account :=
          creator_account
            <| Account.balance := creator_account.(Account.balance) - value |>
            <| Account.nonce := creator_account.(Account.nonce) + 1 |>
        in
        match Dict.assign_function state.(State.accounts) creator (fun _ => creator_account) with
        | None =>
          inr ("balance not found for the address " ++ HexString.of_Z creator)%string
        | Some accounts =>
          let accounts :=
            Dict.declare accounts created
              (empty_created_account protocol value) in
          let '(_, state) :=
            Gas.warm_address created
              (state <| State.accounts := accounts |>
                <| State.created_accounts := created :: state.(State.created_accounts) |>) in
          inl state
        end
      end
  end.

Definition increment_account_nonce
    (address : U256.t)
    (state : State.t) : option State.t :=
  match Dict.assign_function state.(State.accounts) address (fun account =>
      account <| Account.nonce := account.(Account.nonce) + 1 |>
    ) with
  | Some accounts => Some (state <| State.accounts := accounts |>)
  | None => None
  end.

Definition preserve_account_nonce
    (address : U256.t)
    (source target : State.t) : State.t :=
  match Dict.get source.(State.accounts) address with
  | None => target
  | Some source_account =>
    match Dict.assign_function target.(State.accounts) address (fun account =>
        account <| Account.nonce := source_account.(Account.nonce) |>
      ) with
    | Some accounts => target <| State.accounts := accounts |>
    | None => target
    end
  end.

Definition deploy_created_code
    (protocol : Protocol.t)
    (created : U256.t)
    (code : list Z)
    (state : State.t) : option State.t :=
  if andb
      (Gas.has_code_size_limit protocol)
      (Z.of_nat (List.length code) >? Gas.max_code_size) then
    None
  else if andb
      (Gas.rejects_ef_prefix protocol)
      match code with
      | 239 :: _ => true
      | _ => false
      end then
    None
  else match Gas.charge (Gas.code_deposit_cost code) state with
  | None => None
  | Some state =>
    match Dict.assign_function state.(State.accounts) created (fun account =>
        account
          <| Account.code := 0 |>
          <| Account.codedata := code |>
      ) with
    | None => None
    | Some accounts => Some (state <| State.accounts := accounts |>)
    end
  end.

Definition execute_create
    (run_call : call_runner)
    (steps_remaining : nat)
    (codes : Codes.t)
    (environment : Environment.t)
    (op : instruction)
    (value offset size salt : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  if state.(State.is_static) then
    (Step.Error "static state change", state)
  else if andb
      (Gas.is_shanghai_or_later environment.(Environment.protocol))
      (size >? Gas.max_init_code_size) then
    out_of_gas_error state
  else
    match Gas.charge_memory_and_extra
        offset size
        (create_extra_cost environment.(Environment.protocol) op size)
        frame state with
    | None => out_of_gas_error state
    | Some (frame, state) =>
      match eval_primitive_result environment (Primitive.MLoad offset size) state with
      | (inr message, state) => (Step.Error message, state)
      | (inl init_code, state) =>
        match Dict.get state.(State.accounts) environment.(Environment.address) with
        | None =>
          (Step.Error
            ("balance not found for the address " ++
              HexString.of_Z environment.(Environment.address))%string,
            state)
        | Some creator_account =>
          let created :=
            create_contract_address
              op environment.(Environment.address)
              creator_account.(Account.nonce) salt init_code in
          let '(_, state) := Gas.warm_address created state in
          if call_depth_exceeded state then
            continue op (0 :: stack) frame
              (state <| State.return_data := ReturnData.empty |>)
          else if value >? creator_account.(Account.balance) then
            continue op (0 :: stack) frame
              (state <| State.return_data := ReturnData.empty |>)
          else if creator_account.(Account.nonce) >=? Gas.max_account_nonce then
            continue op (0 :: stack) frame
              (state <| State.return_data := ReturnData.empty |>)
          else
            let create_gas :=
              Gas.create_forwarded_gas
                environment.(Environment.protocol) state.(State.gas) in
            let parent_state :=
              state <| State.gas := state.(State.gas) - create_gas |> in
            match prepare_create_account
                environment.(Environment.protocol)
                environment.(Environment.address)
                created value parent_state with
            | inr "creation collision" =>
              let parent_state :=
                match increment_account_nonce
                    environment.(Environment.address) parent_state with
                | Some state => state
                | None => parent_state
                end in
              continue op (0 :: stack) frame
                (consume_child_gas parent_state [])
            | inr "insufficient balance" =>
              continue op (0 :: stack) frame
                (state <| State.return_data := ReturnData.empty |>)
            | inr message => (Step.Error message, state)
            | inl create_state =>
              let child_environment :=
                call_child_environment
                  environment created 0 value [] false false in
              let child_state :=
                call_child_state create_state create_gas false in
              let '(child_step, child_state) :=
                run_call steps_remaining codes child_environment
                  (make_frame init_code) child_state in
              match child_step with
              | Step.Continue _ =>
                let parent_state :=
                  preserve_account_nonce
                    environment.(Environment.address) create_state parent_state in
                continue op (0 :: stack) frame
                  (consume_child_gas parent_state [])
              | Step.Error _ =>
                let parent_state :=
                  preserve_account_nonce
                    environment.(Environment.address) create_state parent_state in
                continue op (0 :: stack) frame
                  (consume_child_gas parent_state [])
              | Step.Halt Halt.Stop | Step.Halt Halt.Selfdestruct =>
                match deploy_created_code
                    environment.(Environment.protocol) created [] child_state with
                | Some child_state =>
                  continue op (created :: stack) frame
                    (commit_child_state parent_state child_state [])
                | None =>
                  let parent_state :=
                    preserve_account_nonce
                      environment.(Environment.address) create_state parent_state in
                  continue op (0 :: stack) frame
                    (consume_child_gas parent_state [])
                end
              | Step.Halt (Halt.Return return_offset return_size) =>
                let deployed_code :=
                  Memory.get_bytes
                    child_state.(State.memory) return_offset return_size in
                match deploy_created_code
                    environment.(Environment.protocol) created deployed_code child_state with
                | Some child_state =>
                  continue op (created :: stack) frame
                    (commit_child_state parent_state child_state [])
                | None =>
                  let parent_state :=
                    preserve_account_nonce
                      environment.(Environment.address) create_state parent_state in
                  continue op (0 :: stack) frame
                    (consume_child_gas parent_state [])
                end
              | Step.Halt (Halt.Revert return_offset return_size) =>
                let return_data :=
                  Memory.get_bytes
                    child_state.(State.memory) return_offset return_size in
                let parent_state :=
                  preserve_account_nonce
                    environment.(Environment.address) create_state parent_state in
                continue op (0 :: stack) frame
                  (revert_child_state parent_state child_state return_data)
              end
            end
        end
      end
    end.

Definition precompile_input_words (input : list Z) : U256.t :=
  Gas.words_for_bytes (Z.of_nat (List.length input)).

Definition precompile_pairing_pairs (input : list Z) : U256.t :=
  Z.of_nat (List.length input) / 192.

Definition precompile_input_length (input : list Z) : U256.t :=
  Z.of_nat (List.length input).

Definition blake2f_gas (input : list Z) : U256.t :=
  if Z.of_nat (List.length input) =? 213 then
    Memory.bytes_as_u256 (List.firstn 4 input)
  else
    0.

Definition modexp_eip198_multiplication_complexity (length : U256.t) : U256.t :=
  if length <=? 64 then
    length * length
  else if length <=? 1024 then
    length * length / 4 + 96 * length - 3072
  else
    length * length / 16 + 480 * length - 199680.

Definition modexp_eip198_adjusted_exponent_length (input : list Z) : U256.t :=
  let exponent_length := Stdlib.modexp_exponent_length input in
  let exponent_head := Stdlib.modexp_exponent_head input in
  if exponent_length <=? 32 then
    if exponent_head =? 0 then 0 else Z.log2 exponent_head
  else
    8 * (exponent_length - 32) +
    if exponent_head =? 0 then 0 else Z.log2 exponent_head.

Definition modexp_eip198_gas (input : list Z) : U256.t :=
  let max_length :=
    Z.max (Stdlib.modexp_base_length input) (Stdlib.modexp_modulus_length input) in
  let adjusted_exponent_length :=
    Z.max (modexp_eip198_adjusted_exponent_length input) 1 in
  modexp_eip198_multiplication_complexity max_length *
  adjusted_exponent_length / 20.

Definition modexp_words_for_eip2565 (length : U256.t) : U256.t :=
  (length + 7) / 8.

Definition modexp_eip2565_multiplication_complexity (input : list Z) : U256.t :=
  let max_length :=
    Z.max (Stdlib.modexp_base_length input) (Stdlib.modexp_modulus_length input) in
  let words := modexp_words_for_eip2565 max_length in
  words * words.

Definition modexp_iteration_count
    (long_exponent_byte_cost : U256.t)
    (input : list Z) : U256.t :=
  let exponent_length := Stdlib.modexp_exponent_length input in
  let exponent_head := Stdlib.modexp_exponent_head input in
  let raw :=
    if exponent_length <=? 32 then
      if exponent_head =? 0 then 0 else Z.log2 exponent_head
    else
      long_exponent_byte_cost * (exponent_length - 32) +
      if exponent_head =? 0 then 0 else Z.log2 exponent_head in
  Z.max raw 1.

Definition modexp_eip2565_gas (input : list Z) : U256.t :=
  Z.max 200
    (modexp_eip2565_multiplication_complexity input *
     modexp_iteration_count 8 input / 3).

Definition modexp_eip7883_multiplication_complexity (input : list Z) : U256.t :=
  let max_length :=
    Z.max (Stdlib.modexp_base_length input) (Stdlib.modexp_modulus_length input) in
  let words := modexp_words_for_eip2565 max_length in
  if max_length >? 32 then 2 * words * words else 16.

Definition modexp_eip7883_gas (input : list Z) : U256.t :=
  Z.max 500
    (modexp_eip7883_multiplication_complexity input *
     modexp_iteration_count 16 input).

Definition modexp_gas (protocol : Protocol.t) (input : list Z) : U256.t :=
  match protocol with
  | Protocol.Byzantium | Protocol.ConstantinopleFix | Protocol.Istanbul =>
    modexp_eip198_gas input
  | Protocol.Osaka =>
    modexp_eip7883_gas input
  | Protocol.Berlin | Protocol.London | Protocol.Paris | Protocol.Shanghai
  | Protocol.Cancun | Protocol.Prague =>
    modexp_eip2565_gas input
  | Protocol.Frontier | Protocol.Homestead =>
    0
  end.

Definition point_evaluation_precompile_gas : U256.t := 50000.

Definition bls12_g1add_gas : U256.t := 375.
Definition bls12_g1mul_gas : U256.t := 12000.
Definition bls12_g2add_gas : U256.t := 600.
Definition bls12_g2mul_gas : U256.t := 22500.
Definition bls12_pairing_base_gas : U256.t := 37700.
Definition bls12_pairing_per_pair_gas : U256.t := 32600.
Definition bls12_map_fp_to_g1_gas : U256.t := 5500.
Definition bls12_map_fp2_to_g2_gas : U256.t := 23800.
Definition bls12_msm_multiplier : U256.t := 1000.

Definition bls12_g1msm_discount_table : list U256.t :=
  [
    0;
    1000; 949; 848; 797; 764; 750; 738; 728; 719; 712; 705; 698; 692; 687; 682; 677; 673; 669;
    665; 661; 658; 654; 651; 648; 645; 642; 640; 637; 635; 632; 630; 627; 625; 623; 621; 619;
    617; 615; 613; 611; 609; 608; 606; 604; 603; 601; 599; 598; 596; 595; 593; 592; 591; 589;
    588; 586; 585; 584; 582; 581; 580; 579; 577; 576; 575; 574; 573; 572; 570; 569; 568; 567;
    566; 565; 564; 563; 562; 561; 560; 559; 558; 557; 556; 555; 554; 553; 552; 551; 550; 549;
    548; 547; 547; 546; 545; 544; 543; 542; 541; 540; 540; 539; 538; 537; 536; 536; 535; 534;
    533; 532; 532; 531; 530; 529; 528; 528; 527; 526; 525; 525; 524; 523; 522; 522; 521; 520;
    520; 519
  ].

Definition bls12_g2msm_discount_table : list U256.t :=
  [
    0;
    1000; 1000; 923; 884; 855; 832; 812; 796; 782; 770; 759; 749; 740; 732; 724; 717; 711; 704;
    699; 693; 688; 683; 679; 674; 670; 666; 663; 659; 655; 652; 649; 646; 643; 640; 637; 634;
    632; 629; 627; 624; 622; 620; 618; 615; 613; 611; 609; 607; 606; 604; 602; 600; 598; 597;
    595; 593; 592; 590; 589; 587; 586; 584; 583; 582; 580; 579; 578; 576; 575; 574; 573; 571;
    570; 569; 568; 567; 566; 565; 563; 562; 561; 560; 559; 558; 557; 556; 555; 554; 553; 552;
    552; 551; 550; 549; 548; 547; 546; 545; 545; 544; 543; 542; 541; 541; 540; 539; 538; 537;
    537; 536; 535; 535; 534; 533; 532; 532; 531; 530; 530; 529; 528; 528; 527; 526; 526; 525;
    524; 524
  ].

Definition bls12_msm_discount (table : list U256.t) (k : U256.t) : U256.t :=
  List.nth (Z.to_nat (Z.min k 128)) table 0.

Definition bls12_msm_gas
    (table : list U256.t)
    (pair_length multiplication_cost input_length : U256.t) : U256.t :=
  let k := input_length / pair_length in
  if k =? 0 then
    0
  else
    k * multiplication_cost * bls12_msm_discount table k / bls12_msm_multiplier.

Definition bls12_pairing_gas (input_length : U256.t) : U256.t :=
  let k := input_length / 384 in
  bls12_pairing_per_pair_gas * k + bls12_pairing_base_gas.

Definition p256verify_precompile_gas : U256.t := 6900.

Definition bls12_precompile_gas
    (address input_length : U256.t) : option U256.t :=
  match address with
  | 11 => Some bls12_g1add_gas
  | 12 => Some (bls12_msm_gas bls12_g1msm_discount_table 160 bls12_g1mul_gas input_length)
  | 13 => Some bls12_g2add_gas
  | 14 => Some (bls12_msm_gas bls12_g2msm_discount_table 288 bls12_g2mul_gas input_length)
  | 15 => Some (bls12_pairing_gas input_length)
  | 16 => Some bls12_map_fp_to_g1_gas
  | 17 => Some bls12_map_fp2_to_g2_gas
  | _ => None
  end.

Definition precompile_gas
    (protocol : Protocol.t)
    (address : U256.t)
    (input : list Z) : option U256.t :=
  match address with
  | 1 => Some 3000
  | 2 => Some (60 + 12 * precompile_input_words input)
  | 3 => Some (600 + 120 * precompile_input_words input)
  | 4 => Some (15 + 3 * precompile_input_words input)
  | 5 =>
    if Protocol.has_byzantium_opcodes protocol then
      Some (modexp_gas protocol input)
    else
      None
  | 6 =>
    if Protocol.has_byzantium_opcodes protocol then
      Some (if Gas.is_istanbul_or_later protocol then 150 else 500)
    else
      None
  | 7 =>
    if Protocol.has_byzantium_opcodes protocol then
      Some (if Gas.is_istanbul_or_later protocol then 6000 else 40000)
    else
      None
  | 8 =>
    if Protocol.has_byzantium_opcodes protocol then
      if Gas.is_istanbul_or_later protocol then
        Some (45000 + 34000 * precompile_pairing_pairs input)
      else
        Some (100000 + 80000 * precompile_pairing_pairs input)
    else
      None
  | 9 =>
    if Protocol.has_istanbul_opcodes protocol then
      Some (blake2f_gas input)
    else
      None
  | 10 =>
    if Protocol.has_cancun_opcodes protocol then
      Some point_evaluation_precompile_gas
    else
      None
  | 11 | 12 | 13 | 14 | 15 | 16 | 17 =>
    if Gas.is_prague_or_later protocol then
      bls12_precompile_gas address (precompile_input_length input)
    else
      None
  | 256 =>
    if Protocol.has_osaka_opcodes protocol then
      Some p256verify_precompile_gas
    else
      None
  | _ => None
  end.

Definition precompile_gas_from_memory
    (protocol : Protocol.t)
    (address : U256.t)
    (memory : Memory.t)
    (in_offset in_size : U256.t) : option U256.t :=
  match address with
  | 1 => Some 3000
  | 2 => Some (60 + 12 * Gas.words_for_bytes in_size)
  | 3 => Some (600 + 120 * Gas.words_for_bytes in_size)
  | 4 => Some (15 + 3 * Gas.words_for_bytes in_size)
  | 5 => None
  | 6 =>
    if Protocol.has_byzantium_opcodes protocol then
      Some (if Gas.is_istanbul_or_later protocol then 150 else 500)
    else
      None
  | 7 =>
    if Protocol.has_byzantium_opcodes protocol then
      Some (if Gas.is_istanbul_or_later protocol then 6000 else 40000)
    else
      None
  | 8 =>
    if Protocol.has_byzantium_opcodes protocol then
      if Gas.is_istanbul_or_later protocol then
        Some (45000 + 34000 * (in_size / 192))
      else
        Some (100000 + 80000 * (in_size / 192))
    else
      None
  | 9 =>
    if Protocol.has_istanbul_opcodes protocol then
      if in_size =? 213 then
        Some (Memory.bytes_as_u256 (Memory.get_bytes memory in_offset 4))
      else
        Some 0
    else
      None
  | 10 =>
    if Protocol.has_cancun_opcodes protocol then
      Some point_evaluation_precompile_gas
    else
      None
  | 11 | 12 | 13 | 14 | 15 | 16 | 17 =>
    if Gas.is_prague_or_later protocol then
      bls12_precompile_gas address in_size
    else
      None
  | 256 =>
    if Protocol.has_osaka_opcodes protocol then
      Some p256verify_precompile_gas
    else
      None
  | _ => None
  end.

Definition precompile_memory_input_size
    (address in_size : U256.t) : U256.t :=
  match address with
  | 1 => Z.min in_size 128
  | 6 => Z.min in_size 128
  | 7 => Z.min in_size 96
  | 10 => Z.min in_size 192
  | _ => in_size
  end.

Definition available_precompile_result
    (protocol : Protocol.t)
    (address : U256.t)
    (input : list Z) : option Stdlib.precompile_result :=
  match precompile_gas protocol address input with
  | Some _ => Stdlib.precompile_run_result address input
  | None => None
  end.

Definition available_precompile_output
    (protocol : Protocol.t)
    (address : U256.t)
    (input : list Z) : option (list Z) :=
  match available_precompile_result protocol address input with
  | Some (Stdlib.PrecompileSuccess output) => Some output
  | None => None
  | Some Stdlib.PrecompileFailure => None
  end.

Definition call_stipend_for_value (value : U256.t) : U256.t :=
  if value =? 0 then 0 else Gas.call_stipend.

Definition precompile_failed_state
    (forwarded_gas : U256.t) (state : State.t) : State.t :=
  state
    <| State.gas := state.(State.gas) - forwarded_gas |>
    <| State.return_data := ReturnData.empty |>.

Fixpoint precompile_cache_lookup
    (address : U256.t)
    (input : list Z)
    (cache : list (U256.t * list Z * bool * list Z))
    : option (bool * list Z) :=
  match cache with
  | [] => None
  | (cached_address, cached_input, success, output) :: cache =>
    if (cached_address =? address) && StdlibAux.bytes_eqb cached_input input then
      Some (success, output)
    else
      precompile_cache_lookup address input cache
  end.

Definition cache_precompile_result
    (address : U256.t)
    (input : list Z)
    (success : bool)
    (output : list Z)
    (state : State.t) : State.t :=
  state
    <| State.precompile_cache :=
      (address, input, success, output) :: state.(State.precompile_cache) |>.

Definition canonical_precompile_cache_input
    (address : U256.t)
    (input : list Z) : list Z :=
  if address =? 1 then
    StdlibAux.bytes_slice_with_zero_padding input 0 128
  else
    input.

Fixpoint ecrecover_cache_lookup
    (message_hash v r : U256.t)
    (cache : list (U256.t * U256.t * U256.t * bool * Z * Z * Z * Z * Z))
    : option (bool * Z * Z * Z * Z * Z) :=
  match cache with
  | [] => None
  | (cached_message_hash, cached_v, cached_r,
      success, rx, ry, r_inv, gx, gy) :: cache =>
    if (cached_message_hash =? message_hash) &&
        (cached_v =? v) &&
        (cached_r =? r) then
      Some (success, rx, ry, r_inv, gx, gy)
    else
      ecrecover_cache_lookup message_hash v r cache
  end.

Definition cache_ecrecover_base
    (message_hash v r : U256.t)
    (success : bool)
    (rx ry r_inv gx gy : Z)
    (state : State.t) : State.t :=
  state
    <| State.ecrecover_cache :=
      (message_hash, v, r, success, rx, ry, r_inv, gx, gy)
        :: state.(State.ecrecover_cache) |>.

Definition invalid_ecrecover_base : bool * Z * Z * Z * Z * Z :=
  (false, 0, 0, 0, 0, 0).

Definition compute_ecrecover_base
    (message_hash v r : U256.t) : bool * Z * Z * Z * Z * Z :=
  if ((v =? 27) || (v =? 28)) && Stdlib.secp256k1_scalar r then
    let recovery_id := v - 27 in
    let x := r in
    if x <? Stdlib.secp256k1_field_modulus then
      let alpha := Stdlib.secp256k1_mod (x * x * x + 7) in
      let beta :=
        Stdlib.pow_mod alpha
          ((Stdlib.secp256k1_field_modulus + 1) / 4)
          Stdlib.secp256k1_field_modulus in
      let y :=
        if (beta mod 2 =? recovery_id) then
          beta
        else
          Stdlib.secp256k1_field_modulus - beta in
      let r_point := (x, y) in
      if Stdlib.secp256k1_on_curve r_point then
        match Stdlib.inv_mod Stdlib.secp256k1_group_order r with
        | None => invalid_ecrecover_base
        | Some r_inv =>
          let message_hash := message_hash mod Stdlib.secp256k1_group_order in
          let scalar2 := (- message_hash * r_inv) mod Stdlib.secp256k1_group_order in
          match
            Stdlib.secp256k1_mul
              (Stdlib.secp256k1_gx, Stdlib.secp256k1_gy)
              scalar2
          with
          | None => invalid_ecrecover_base
          | Some (gx, gy) => (true, x, y, r_inv, gx, gy)
          end
        end
      else
        invalid_ecrecover_base
    else
      invalid_ecrecover_base
  else
    invalid_ecrecover_base.

Definition run_ecrecover_base_cached
    (message_hash v r : U256.t)
    (state : State.t) : bool * Z * Z * Z * Z * Z * State.t :=
  match ecrecover_cache_lookup message_hash v r state.(State.ecrecover_cache) with
  | Some (success, rx, ry, r_inv, gx, gy) =>
    (success, rx, ry, r_inv, gx, gy, state)
  | None =>
    let '(success, rx, ry, r_inv, gx, gy) :=
      compute_ecrecover_base message_hash v r in
    (success, rx, ry, r_inv, gx, gy,
      cache_ecrecover_base message_hash v r success rx ry r_inv gx gy state)
  end.

Definition ecrecover_result_from_cached_base
    (s : U256.t)
    (success : bool)
    (rx ry r_inv gx gy : Z) : list Z :=
  if success && Stdlib.secp256k1_scalar s then
    let scalar1 := (s * r_inv) mod Stdlib.secp256k1_group_order in
    match Stdlib.secp256k1_mul (rx, ry) scalar1 with
    | None => []
    | Some s_component =>
      match Stdlib.secp256k1_add s_component (gx, gy) with
      | None => []
      | Some public_key =>
        if Stdlib.secp256k1_infinity public_key then
          []
        else
          Stdlib.ecrecover_output_of_public_key public_key
      end
    end
  else
    [].

Definition run_ecrecover_result_cached
    (input : list Z)
    (state : State.t) : list Z * State.t :=
  let message_hash := Stdlib.ecrecover_word input 0 in
  let v := Stdlib.ecrecover_word input 32 in
  let r := Stdlib.ecrecover_word input 64 in
  let s := Stdlib.ecrecover_word input 96 in
  if ((v =? 27) || (v =? 28)) &&
      Stdlib.secp256k1_scalar r &&
      Stdlib.secp256k1_scalar s then
    let '(success, rx, ry, r_inv, gx, gy, state) :=
      run_ecrecover_base_cached message_hash v r state in
    (ecrecover_result_from_cached_base s success rx ry r_inv gx gy, state)
  else
    ([], state).

Definition precompile_success_state
    (output : list Z)
    (state : State.t) : State.t :=
  state <| State.return_data := ReturnData.of_bytes output |>.

Definition run_precompile_result_cached
    (address : U256.t)
    (input : list Z)
    (state : State.t) : bool * list Z * State.t :=
  let cache_input := canonical_precompile_cache_input address input in
  match precompile_cache_lookup address cache_input state.(State.precompile_cache) with
  | Some (success, output) => (success, output, state)
  | None =>
    if address =? 1 then
      let '(output, state) := run_ecrecover_result_cached input state in
      (true, output, cache_precompile_result address cache_input true output state)
    else
      match Stdlib.precompile_run_result address input with
      | Some (Stdlib.PrecompileSuccess output) =>
        (true, output, cache_precompile_result address cache_input true output state)
      | Some Stdlib.PrecompileFailure =>
        (false, [], cache_precompile_result address cache_input false [] state)
      | None =>
        (false, [], cache_precompile_result address cache_input false [] state)
      end
  end.

Definition run_precompile_call
    (environment : Environment.t)
    (address value forwarded_gas : U256.t)
    (input : list Z)
    (state : State.t) : U256.t * list Z * State.t :=
  let stipend := call_stipend_for_value value in
  match precompile_gas environment.(Environment.protocol) address input with
  | None =>
    (0, [], precompile_failed_state forwarded_gas state)
  | Some cost =>
    if cost <=? forwarded_gas + stipend then
      let state_after_cost :=
        state <| State.gas := state.(State.gas) + stipend - cost |> in
      let '(success, output, state_after_cost) :=
        run_precompile_result_cached address input state_after_cost in
      if success then
        match transfer_call_value environment.(Environment.address) address value state_after_cost with
        | inr _ =>
          (0, [], precompile_failed_state forwarded_gas state)
        | inl state => (1, output, precompile_success_state output state)
        end
      else
        (0, [], precompile_failed_state forwarded_gas state)
    else
      (0, [], precompile_failed_state forwarded_gas state)
  end.

Definition run_precompile_callcode
    (environment : Environment.t)
    (address value forwarded_gas : U256.t)
    (input : list Z)
    (state : State.t) : U256.t * list Z * State.t :=
  let stipend := call_stipend_for_value value in
  match precompile_gas environment.(Environment.protocol) address input with
  | None =>
    (0, [], precompile_failed_state forwarded_gas state)
  | Some cost =>
    if cost <=? forwarded_gas + stipend then
      let state_after_cost :=
        state <| State.gas := state.(State.gas) + stipend - cost |> in
      let '(success, output, state_after_cost) :=
        run_precompile_result_cached address input state_after_cost in
      if success then
        (1, output, precompile_success_state output state_after_cost)
      else
        (0, [], precompile_failed_state forwarded_gas state)
    else
      (0, [], precompile_failed_state forwarded_gas state)
  end.

Definition write_call_output
    (op : instruction)
    (environment : Environment.t)
    (status : U256.t)
    (output : list Z)
    (out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  let '(result, state) :=
    eval_primitive_result environment
      (Primitive.MStore out_offset (List.firstn (Z.to_nat out_size) output))
      state in
  match result with
  | inl tt => continue op (status :: stack) frame state
  | inr message => (Step.Error message, state)
  end.

Definition run_precompile_from_memory
    (op : instruction)
    (environment : Environment.t)
    (address value forwarded_gas : U256.t)
    (in_offset in_size out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t)
    (run_precompile : list Z -> State.t -> U256.t * list Z * State.t)
    : option (Step.t * State.t) :=
  match precompile_gas_from_memory
      environment.(Environment.protocol) address state.(State.memory) in_offset in_size with
  | None => None
  | Some cost =>
    if cost <=? forwarded_gas + call_stipend_for_value value then
      let loaded_input_size := precompile_memory_input_size address in_size in
      match eval_primitive_result environment
          (Primitive.MLoad in_offset loaded_input_size) state with
      | (inr message, state) => Some (Step.Error message, state)
      | (inl input, state) =>
        let '(status, output, state) := run_precompile input state in
        Some (
          write_call_output op environment status output out_offset out_size
            frame stack state
        )
      end
    else
      Some (
        write_call_output op environment 0 [] out_offset out_size frame stack
          (precompile_failed_state forwarded_gas state)
      )
  end.

Definition write_precompile_failure
    (op : instruction)
    (environment : Environment.t)
    (out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  write_call_output op environment 0 [] out_offset out_size frame stack
    (state <| State.return_data := ReturnData.empty |>).

Definition write_precompile_success
    (op : instruction)
    (environment : Environment.t)
    (output : list Z)
    (out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  write_call_output op environment 1 output out_offset out_size frame stack
    (state <| State.return_data := ReturnData.of_bytes output |>).

Definition run_modexp_precompile_call
    (op : instruction)
    (environment : Environment.t)
    (value forwarded_gas : U256.t)
    (input : list Z)
    (out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  let stipend := if value =? 0 then 0 else Gas.call_stipend in
  match precompile_gas environment.(Environment.protocol) 5 input with
  | None =>
    write_precompile_failure op environment out_offset out_size frame stack
      (state <| State.gas := state.(State.gas) - forwarded_gas |>)
  | Some cost =>
    if cost <=? forwarded_gas + stipend then
      let state_after_cost :=
        state <| State.gas := state.(State.gas) + stipend - cost |> in
      match transfer_call_value environment.(Environment.address) 5 value state_after_cost with
      | inr _ =>
        write_precompile_failure op environment out_offset out_size frame stack
          (state <| State.gas := state.(State.gas) - forwarded_gas |>)
      | inl state =>
        write_precompile_success op environment (Stdlib.modexp_output input)
          out_offset out_size frame stack state
      end
    else
      write_precompile_failure op environment out_offset out_size frame stack
        (state <| State.gas := state.(State.gas) - forwarded_gas |>)
  end.

Definition run_modexp_precompile_callcode
    (op : instruction)
    (environment : Environment.t)
    (value forwarded_gas : U256.t)
    (input : list Z)
    (out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  let stipend := if value =? 0 then 0 else Gas.call_stipend in
  match precompile_gas environment.(Environment.protocol) 5 input with
  | None =>
    write_precompile_failure op environment out_offset out_size frame stack
      (state <| State.gas := state.(State.gas) - forwarded_gas |>)
  | Some cost =>
    if cost <=? forwarded_gas + stipend then
      let state := state <| State.gas := state.(State.gas) + stipend - cost |> in
      write_precompile_success op environment (Stdlib.modexp_output input)
        out_offset out_size frame stack state
    else
      write_precompile_failure op environment out_offset out_size frame stack
        (state <| State.gas := state.(State.gas) - forwarded_gas |>)
  end.

Definition identity_precompile_gas (input_size : U256.t) : U256.t :=
  15 + 3 * Gas.words_for_bytes input_size.

Definition call_output_copy_size (return_size out_size : U256.t) : U256.t :=
  Z.min return_size out_size.

Definition write_identity_precompile_success
    (op : instruction)
    (environment : Environment.t)
    (input_memory : Memory.t)
    (in_offset in_size out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  let output :=
    Memory.get_bytes input_memory in_offset
      (call_output_copy_size in_size out_size) in
  write_call_output op environment 1 output out_offset out_size frame stack
    (state <| State.return_data :=
      ReturnData.of_memory input_memory in_offset in_size |>).

Definition write_identity_precompile_failure
    (op : instruction)
    (environment : Environment.t)
    (out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  write_call_output op environment 0 [] out_offset out_size frame stack
    (state <| State.return_data := ReturnData.empty |>).

Definition run_identity_precompile_call
    (op : instruction)
    (environment : Environment.t)
    (value forwarded_gas : U256.t)
    (in_offset in_size out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  let input_memory := state.(State.memory) in
  let stipend := if value =? 0 then 0 else Gas.call_stipend in
  let cost := identity_precompile_gas in_size in
  if cost <=? forwarded_gas + stipend then
    let state_after_cost :=
      state <| State.gas := state.(State.gas) + stipend - cost |> in
    match transfer_call_value
        environment.(Environment.address) 4 value state_after_cost with
    | inr _ =>
      write_identity_precompile_failure op environment out_offset out_size
        frame stack (state <| State.gas := state.(State.gas) - forwarded_gas |>)
    | inl state =>
      write_identity_precompile_success op environment input_memory
        in_offset in_size out_offset out_size frame stack state
    end
  else
    write_identity_precompile_failure op environment out_offset out_size frame stack
      (state <| State.gas := state.(State.gas) - forwarded_gas |>)
.

Definition run_identity_precompile_callcode
    (op : instruction)
    (environment : Environment.t)
    (value forwarded_gas : U256.t)
    (in_offset in_size out_offset out_size : U256.t)
    (frame : Frame.t)
    (stack : OperandStack.t)
    (state : State.t) : Step.t * State.t :=
  let input_memory := state.(State.memory) in
  let stipend := if value =? 0 then 0 else Gas.call_stipend in
  let cost := identity_precompile_gas in_size in
  if cost <=? forwarded_gas + stipend then
    let state := state <| State.gas := state.(State.gas) + stipend - cost |> in
    write_identity_precompile_success op environment input_memory
      in_offset in_size out_offset out_size frame stack state
  else
    write_identity_precompile_failure op environment out_offset out_size frame stack
      (state <| State.gas := state.(State.gas) - forwarded_gas |>)
.

Definition exec_instruction_with_runner
    (run_call : call_runner)
    (steps_remaining : nat)
    (fuel : nat)
    (codes : Codes.t)
    (environment : Environment.t)
    (op : instruction)
    (push_argument : U256.t)
    (frame : Frame.t)
    (state : State.t) : Step.t * State.t :=
  match op with
  | STOP => (Step.Halt Halt.Stop, state)
  | ADD => binary ADD Stdlib.Pure.add frame state
  | MUL => binary MUL Stdlib.Pure.mul frame state
  | SUB => binary SUB Stdlib.Pure.sub frame state
  | DIV => binary DIV Stdlib.Pure.div frame state
  | SDIV => binary SDIV Stdlib.Pure.sdiv frame state
  | MOD => binary MOD Stdlib.Pure.mod_ frame state
  | SMOD => binary SMOD Stdlib.Pure.smod frame state
  | ADDMOD => ternary ADDMOD evm_addmod frame state
  | MULMOD => ternary MULMOD evm_mulmod frame state
  | EXP =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (x, y, stack) =>
      match Gas.charge
          (Gas.exp_byte_cost environment.(Environment.protocol) * Gas.exp_byte_length y)
          state with
      | Some state => continue EXP (Stdlib.Pure.exp x y :: stack) frame state
      | None => out_of_gas_error state
      end
    | None => stack_error state
    end
  | SIGNEXTEND => binary SIGNEXTEND Stdlib.Pure.signextend frame state
  | LT => binary LT Stdlib.Pure.lt frame state
  | GT => binary GT Stdlib.Pure.gt frame state
  | SLT => binary SLT Stdlib.Pure.slt frame state
  | SGT => binary SGT Stdlib.Pure.sgt frame state
  | EQ => binary EQ Stdlib.Pure.eq frame state
  | ISZERO => unary ISZERO Stdlib.Pure.iszero frame state
  | AND => binary AND Stdlib.Pure.and frame state
  | OR => binary OR Stdlib.Pure.or frame state
  | XOR => binary XOR Stdlib.Pure.xor frame state
  | NOT => unary NOT Stdlib.Pure.not frame state
  | BYTE => binary BYTE evm_byte frame state
  | SHL => binary SHL Stdlib.Pure.shl frame state
  | SHR => binary SHR Stdlib.Pure.shr frame state
  | SAR => binary SAR Stdlib.Pure.sar frame state
  | CLZ => unary CLZ Stdlib.Pure.clz frame state
  | SHA3 =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (offset, size, stack) =>
      match Gas.charge_memory_and_extra offset size
          (Gas.keccak_256_word * Gas.words_for_size size)
          frame state with
      | Some (frame, state) =>
        let '(result, state) :=
          eval_primitive_result environment (Primitive.MLoad offset size) state in
        match result with
        | inl bytes => continue SHA3 (StdlibAux.keccak256 bytes :: stack) frame state
        | inr message => (Step.Error message, state)
        end
      | None => memory_expansion_error state
      end
    | None => stack_error state
    end
  | ADDRESS => continue_push ADDRESS environment.(Environment.address) frame state
  | BALANCE =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (address, stack) =>
      let address := StdlibAux.address_of_word address in
      let '(warm, state) := Gas.warm_address address state in
      match Gas.charge (Gas.balance_cost environment.(Environment.protocol) warm) state with
      | Some state =>
        with_primitive_word BALANCE environment (Primitive.GetBalance address) frame stack state
      | None => out_of_gas_error state
      end
    | None => stack_error state
    end
  | ORIGIN =>
    let '(result, state) := eval_m fuel codes environment Stdlib.origin state in
    continue_result_word ORIGIN frame result state
  | CALLER => continue_push CALLER environment.(Environment.caller) frame state
  | CALLVALUE => continue_push CALLVALUE environment.(Environment.callvalue) frame state
  | CALLDATALOAD =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (offset, stack) =>
      continue CALLDATALOAD
        (StdlibAux.get_calldata_u256 environment.(Environment.calldata) offset :: stack)
        frame state
    | None => stack_error state
    end
  | CALLDATASIZE =>
    continue_push CALLDATASIZE (Z.of_nat (List.length environment.(Environment.calldata))) frame state
  | CALLDATACOPY =>
    match OperandStack.pop3 frame.(Frame.stack) with
    | Some (dst, offset, size, stack) =>
      copy_to_memory_with_environment CALLDATACOPY environment dst offset size
        environment.(Environment.calldata) frame stack state
    | None => stack_error state
    end
  | CODESIZE => continue_push CODESIZE (Z.of_nat (List.length frame.(Frame.code))) frame state
  | CODECOPY =>
    match OperandStack.pop3 frame.(Frame.stack) with
    | Some (dst, offset, size, stack) =>
      copy_to_memory_with_environment CODECOPY environment dst offset size
        frame.(Frame.code) frame stack state
    | None => stack_error state
    end
  | GASPRICE =>
    let '(result, state) := eval_m fuel codes environment Stdlib.gasprice state in
    continue_result_word GASPRICE frame result state
  | EXTCODESIZE =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (address, stack) =>
      let address := StdlibAux.address_of_word address in
      let '(warm, state) := Gas.warm_address address state in
      match Gas.charge (Gas.ext_code_cost environment.(Environment.protocol) warm) state with
      | Some state =>
        let '(result, state) :=
          eval_primitive_result environment (Primitive.GetCodeBytes address) state in
        match result with
        | inl code_bytes => continue EXTCODESIZE (Z.of_nat (List.length code_bytes) :: stack) frame state
        | inr message => (Step.Error message, state)
        end
      | None => out_of_gas_error state
      end
    | None => stack_error state
    end
  | EXTCODECOPY =>
    match OperandStack.popn 4 frame.(Frame.stack) with
    | Some ([address; dst; offset; size], stack) =>
      let address := StdlibAux.address_of_word address in
      let '(warm, state) := Gas.warm_address address state in
      match Gas.charge (Gas.ext_code_cost environment.(Environment.protocol) warm) state with
      | Some state =>
        let '(result, state) :=
          eval_primitive_result environment (Primitive.GetCodeBytes address) state in
        match result with
        | inl code_bytes =>
          copy_to_memory_with_environment EXTCODECOPY environment dst offset size
            code_bytes frame stack state
        | inr message => (Step.Error message, state)
        end
      | None => out_of_gas_error state
      end
    | _ => stack_error state
    end
  | RETURNDATASIZE =>
    continue_push RETURNDATASIZE (ReturnData.length state.(State.return_data)) frame state
  | RETURNDATACOPY =>
    match OperandStack.pop3 frame.(Frame.stack) with
    | Some (dst, offset, size, stack) =>
      if return_data_copy_in_bounds state.(State.return_data) offset size then
        copy_return_data_to_memory RETURNDATACOPY environment dst offset size
          state.(State.return_data) frame stack state
      else
        (Step.Error "return data out of bounds", state)
    | None => stack_error state
    end
  | EXTCODEHASH =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (address, stack) =>
      let address := StdlibAux.address_of_word address in
      let '(warm, state) := Gas.warm_address address state in
      match Gas.charge (Gas.ext_code_hash_cost environment.(Environment.protocol) warm) state with
      | Some state =>
        let '(result, state) := eval_m fuel codes environment (Stdlib.extcodehash address) state in
        match result with
        | inl (Result.Ok hash) => continue EXTCODEHASH (hash :: stack) frame state
        | inl (Result.Return offset size) => (Step.Halt (Halt.Return offset size), state)
        | inl (Result.Revert offset size) => (Step.Halt (Halt.Revert offset size), state)
        | inr message => (Step.Error message, state)
        end
      | None => out_of_gas_error state
      end
    | None => stack_error state
    end
  | BLOCKHASH =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (block_number, stack) =>
      let '(result, state) := eval_m fuel codes environment (Stdlib.blockhash block_number) state in
      match result with
      | inl (Result.Ok hash) => continue BLOCKHASH (hash :: stack) frame state
      | inl (Result.Return offset size) => (Step.Halt (Halt.Return offset size), state)
      | inl (Result.Revert offset size) => (Step.Halt (Halt.Revert offset size), state)
      | inr message => (Step.Error message, state)
      end
    | None => stack_error state
    end
  | COINBASE =>
    let '(result, state) := eval_m fuel codes environment Stdlib.coinbase state in
    continue_result_word COINBASE frame result state
  | TIMESTAMP =>
    with_primitive_word TIMESTAMP environment Primitive.GetBlockTimestamp frame frame.(Frame.stack) state
  | NUMBER =>
    with_primitive_word NUMBER environment Primitive.GetBlockNumber frame frame.(Frame.stack) state
  | DIFFICULTY =>
    let difficulty :=
      if Protocol.has_prevrandao environment.(Environment.protocol) then
        Stdlib.prevrandao
      else
        Stdlib.difficulty in
    let '(result, state) := eval_m fuel codes environment difficulty state in
    continue_result_word DIFFICULTY frame result state
  | GASLIMIT =>
    let '(result, state) := eval_m fuel codes environment Stdlib.gaslimit state in
    continue_result_word GASLIMIT frame result state
  | CHAINID =>
    let '(result, state) := eval_m fuel codes environment Stdlib.chainid state in
    continue_result_word CHAINID frame result state
  | SELFBALANCE =>
    let '(result, state) := eval_m fuel codes environment Stdlib.selfbalance state in
    continue_result_word SELFBALANCE frame result state
  | BASEFEE =>
    let '(result, state) := eval_m fuel codes environment Stdlib.basefee state in
    continue_result_word BASEFEE frame result state
  | BLOBHASH =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (index, stack) =>
      let '(result, state) := eval_m fuel codes environment (Stdlib.blobhash index) state in
      continue_result_word BLOBHASH (Frame.with_stack frame stack) result state
    | None => stack_error state
    end
  | BLOBBASEFEE =>
    let '(result, state) := eval_m fuel codes environment Stdlib.blobbasefee state in
    continue_result_word BLOBBASEFEE frame result state
  | POP =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (_, stack) => continue POP stack frame state
    | None => stack_error state
    end
  | MLOAD =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (address, stack) =>
      match Gas.charge_memory address 32 frame state with
      | Some (frame, state) =>
        let '(result, state) := eval_primitive_result environment (Primitive.MLoad address 32) state in
        match result with
        | inl bytes => continue MLOAD (Memory.bytes_as_u256 bytes :: stack) frame state
        | inr message => (Step.Error message, state)
        end
      | None => memory_expansion_error state
      end
    | None => stack_error state
    end
  | MSTORE =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (address, value, stack) =>
      match Gas.charge_memory address 32 frame state with
      | Some (frame, state) =>
        with_primitive_unit MSTORE environment
          (Primitive.MStore address (Memory.u256_as_bytes value))
          frame stack state
      | None => memory_expansion_error state
      end
    | None => stack_error state
    end
  | MSTORE8 =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (address, value, stack) =>
      match Gas.charge_memory address 1 frame state with
      | Some (frame, state) =>
        with_primitive_unit MSTORE8 environment
          (Primitive.MStore address [value mod 256])
          frame stack state
      | None => memory_expansion_error state
      end
    | None => stack_error state
    end
  | SLOAD =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (slot, stack) =>
      let address := environment.(Environment.address) in
      let '(warm, state) := Gas.warm_storage address slot state in
      match Gas.charge (Gas.sload_cost environment.(Environment.protocol) warm) state with
      | Some state =>
        with_primitive_word SLOAD environment (Primitive.SLoad slot) frame stack state
      | None => out_of_gas_error state
      end
    | None => stack_error state
    end
  | SSTORE =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (slot, value, stack) =>
      if state.(State.is_static) then
        (Step.Error "static state change", state)
      else if andb
          (Gas.is_istanbul_or_later environment.(Environment.protocol))
          (state.(State.gas) <=? 2300) then
        out_of_gas_error state
      else
        let address := environment.(Environment.address) in
        let '(warm, state) := Gas.warm_storage address slot state in
        let original := Gas.original_storage_value state address slot in
        let current := Gas.current_storage_value state address slot in
        let cost :=
          Gas.sstore_cost environment.(Environment.protocol) warm original current value in
        match Gas.charge cost state with
        | Some state =>
          let refund :=
            Gas.sstore_refund environment.(Environment.protocol) original current value in
          with_primitive_unit SSTORE environment (Primitive.SStore slot value) frame stack
            (state <| State.gas_refund := state.(State.gas_refund) + refund |>)
        | None => out_of_gas_error state
        end
    | None => stack_error state
    end
  | JUMP =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (destination, stack) =>
      if is_valid_jump_destination frame destination then
        continue_frame (Frame.with_stack (Frame.with_pc frame destination) stack) state
      else
        (Step.Error "invalid jump destination", state)
    | None => stack_error state
    end
  | JUMPI =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (destination, condition, stack) =>
      if condition =? 0 then
        continue JUMPI stack frame state
      else if is_valid_jump_destination frame destination then
        continue_frame (Frame.with_stack (Frame.with_pc frame destination) stack) state
      else
        (Step.Error "invalid jump destination", state)
    | None => stack_error state
    end
  | PC => continue_push PC frame.(Frame.pc) frame state
  | MSIZE => continue_push MSIZE frame.(Frame.memory_size) frame state
  | GAS =>
    continue_push GAS state.(State.gas) frame state
  | JUMPDEST => continue JUMPDEST frame.(Frame.stack) frame state
  | TLOAD =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (slot, stack) =>
      match Gas.charge Gas.transient_storage state with
      | Some state =>
        with_primitive_word TLOAD environment (Primitive.TLoad slot) frame stack state
      | None => out_of_gas_error state
      end
    | None => stack_error state
    end
  | TSTORE =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (slot, value, stack) =>
      if state.(State.is_static) then
        (Step.Error "static state change", state)
      else
        match Gas.charge Gas.transient_storage state with
        | Some state =>
          with_primitive_unit TSTORE environment (Primitive.TStore slot value) frame stack state
        | None => out_of_gas_error state
        end
    | None => stack_error state
    end
  | MCOPY =>
    match OperandStack.pop3 frame.(Frame.stack) with
    | Some (dst, src, size, stack) =>
      match Gas.charge_memory_and_extra
          (Z.max dst src) size (Gas.copy_cost size) frame state with
      | Some (frame, state) =>
        let '(result, state) :=
          eval_primitive_result environment (Primitive.MLoad src size) state in
        match result with
        | inl bytes =>
          with_primitive_unit MCOPY environment (Primitive.MStore dst bytes) frame stack state
        | inr message => (Step.Error message, state)
        end
      | None => memory_expansion_error state
      end
    | None => stack_error state
    end
  | PUSH0 => continue_push PUSH0 0 frame state
  | PUSH _ _ => continue_push op push_argument frame state
  | DUP n _ =>
    match OperandStack.dup n frame.(Frame.stack) with
    | Some stack => continue op stack frame state
    | None => stack_error state
    end
  | SWAP n _ =>
    match OperandStack.swap n frame.(Frame.stack) with
    | Some stack => continue op stack frame state
    | None => stack_error state
    end
  | LOG n _ =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (offset, size, stack) =>
      match OperandStack.popn (N.to_nat n) stack with
      | Some (topics, stack) =>
        match Gas.charge_memory_and_extra offset size (Gas.log_data * size) frame state with
        | Some (frame, state) =>
          with_primitive_unit op environment (Primitive.LogMemory topics offset size) frame stack state
        | None => memory_expansion_error state
        end
      | None => stack_error state
      end
    | None => stack_error state
    end
  | CREATE =>
    match OperandStack.pop3 frame.(Frame.stack) with
    | Some (value, offset, size, stack) =>
      execute_create
        run_call steps_remaining codes environment CREATE
        value offset size 0 frame stack state
    | None => stack_error state
    end
  | CALL =>
    match OperandStack.popn 7 frame.(Frame.stack) with
    | Some ([gas; address; value; in_offset; in_size; out_offset; out_size], stack) =>
      let address := StdlibAux.address_of_word address in
      if andb state.(State.is_static) (negb (value =? 0)) then
        (Step.Error "static state change", state)
      else
        let callee_account := Dict.get state.(State.accounts) address in
        let '(warm, state) := Gas.warm_address address state in
        let extra_cost :=
          Gas.call_dynamic_cost
            environment.(Environment.protocol) warm value callee_account in
        match charge_two_memory_regions_and_extra
            in_offset in_size out_offset out_size extra_cost frame state with
        | None => out_of_gas_error state
        | Some (frame, state) =>
          match Gas.call_forwarded_gas
              environment.(Environment.protocol) gas state.(State.gas) with
          | None => out_of_gas_error state
          | Some forwarded_gas =>
            match Dict.get state.(State.accounts) environment.(Environment.address) with
            | None =>
              (Step.Error
                ("balance not found for the address " ++
                  HexString.of_Z environment.(Environment.address))%string,
                state)
            | Some caller_account =>
              if call_depth_exceeded state then
                write_call_output CALL environment 0 [] out_offset out_size
                  (Frame.with_stack frame stack) stack
                  (return_unused_call_stipend value
                    (state <| State.return_data := ReturnData.empty |>))
              else if value >? caller_account.(Account.balance) then
                write_call_output CALL environment 0 [] out_offset out_size
                  (Frame.with_stack frame stack) stack
                  (return_unused_call_stipend value
                    (state <| State.return_data := ReturnData.empty |>))
              else if address =? 4 then
                run_identity_precompile_call CALL environment value forwarded_gas
                  in_offset in_size out_offset out_size
                  (Frame.with_stack frame stack) stack state
              else if andb
                  (Protocol.has_byzantium_opcodes environment.(Environment.protocol))
                  (address =? 5) then
                match eval_primitive_result environment (Primitive.MLoad in_offset in_size) state with
                | (inr message, state) => (Step.Error message, state)
                | (inl input, state) =>
                  run_modexp_precompile_call CALL environment value forwarded_gas
                    input out_offset out_size
                    (Frame.with_stack frame stack) stack state
                end
              else
                match run_precompile_from_memory
                    CALL environment address value forwarded_gas
                    in_offset in_size out_offset out_size
                    (Frame.with_stack frame stack) stack state
                    (fun input state =>
                      run_precompile_call
                        environment address value forwarded_gas input state) with
                | Some result => result
                | None =>
                  match eval_primitive_result environment (Primitive.MLoad in_offset in_size) state with
                  | (inr message, state) => (Step.Error message, state)
                  | (inl input, state) =>
                    match callee_account with
                    | None =>
                      match transfer_call_value
                          environment.(Environment.address) address value state with
                      | inr message => (Step.Error message, state)
                      | inl state =>
                        write_call_output CALL environment 1 [] out_offset out_size
                          (Frame.with_stack frame stack) stack
                          (return_unused_call_stipend value
                            (state <| State.return_data := ReturnData.empty |>))
                      end
                    | Some callee_account =>
                      let code_bytes := account_code_bytes callee_account in
                      if StdlibAux.bytes_eqb code_bytes [] then
                        match transfer_call_value
                            environment.(Environment.address) address value state with
                        | inr message => (Step.Error message, state)
                        | inl state =>
                          write_call_output CALL environment 1 [] out_offset out_size
                            (Frame.with_stack frame stack) stack
                            (return_unused_call_stipend value
                              (state <| State.return_data := ReturnData.empty |>))
                        end
                      else
                        let stipend :=
                          if value =? 0 then 0 else Gas.call_stipend in
                        let parent_state :=
                          state <| State.gas := state.(State.gas) - forwarded_gas |> in
                        match transfer_call_value
                            environment.(Environment.address) address value parent_state with
                        | inr "insufficient balance" =>
                          write_call_output CALL environment 0 [] out_offset out_size
                            (Frame.with_stack frame stack) stack
                            (return_unused_call_stipend value
                              (state <| State.return_data := ReturnData.empty |>))
                        | inr message => (Step.Error message, state)
                        | inl value_state =>
                          let callee_environment :=
                            call_child_environment
                              environment address callee_account.(Account.code)
                              value input false false in
                          let callee_state :=
                            call_child_state
                              value_state (forwarded_gas + stipend)
                              state.(State.is_static) in
                          let '(callee_step, callee_state) :=
                            run_call steps_remaining codes callee_environment
                              (make_frame code_bytes) callee_state in
                          match callee_step with
                          | Step.Continue _ =>
                            write_call_output CALL environment 0 [] out_offset out_size
                              (Frame.with_stack frame stack) stack
                              (consume_child_gas parent_state [])
                          | Step.Error _ =>
                            write_call_output CALL environment 0 [] out_offset out_size
                              (Frame.with_stack frame stack) stack
                              (consume_child_gas parent_state [])
                          | Step.Halt Halt.Stop | Step.Halt Halt.Selfdestruct =>
                            write_call_output CALL environment 1 [] out_offset out_size
                              (Frame.with_stack frame stack) stack
                              (commit_child_state parent_state callee_state [])
                          | Step.Halt (Halt.Return offset size) =>
                            let return_data :=
                              Memory.get_bytes callee_state.(State.memory) offset size in
                            write_call_output CALL environment 1 return_data out_offset out_size
                              (Frame.with_stack frame stack) stack
                              (commit_child_state parent_state callee_state return_data)
                          | Step.Halt (Halt.Revert offset size) =>
                            let return_data :=
                              Memory.get_bytes callee_state.(State.memory) offset size in
                            write_call_output CALL environment 0 return_data out_offset out_size
                              (Frame.with_stack frame stack) stack
                              (revert_child_state parent_state callee_state return_data)
                          end
                        end
                    end
                  end
              end
            end
          end
        end
    | _ => stack_error state
    end
  | CALLCODE =>
    match OperandStack.popn 7 frame.(Frame.stack) with
    | Some ([gas; address; value; in_offset; in_size; out_offset; out_size], stack) =>
      let address := StdlibAux.address_of_word address in
      let callee_account := Dict.get state.(State.accounts) address in
      let '(warm, state) := Gas.warm_address address state in
      let extra_cost :=
        Gas.call_dynamic_cost_without_new_account
          environment.(Environment.protocol) warm value in
      match charge_two_memory_regions_and_extra
          in_offset in_size out_offset out_size extra_cost frame state with
      | None => out_of_gas_error state
      | Some (frame, state) =>
        match Gas.call_forwarded_gas
            environment.(Environment.protocol) gas state.(State.gas) with
        | None => out_of_gas_error state
        | Some forwarded_gas =>
          match Dict.get state.(State.accounts) environment.(Environment.address) with
          | None =>
            (Step.Error
              ("balance not found for the address " ++
                HexString.of_Z environment.(Environment.address))%string,
              state)
          | Some caller_account =>
            if call_depth_exceeded state then
              write_call_output CALLCODE environment 0 [] out_offset out_size
                (Frame.with_stack frame stack) stack
                (return_unused_call_stipend value
                  (state <| State.return_data := ReturnData.empty |>))
            else if value >? caller_account.(Account.balance) then
              write_call_output CALLCODE environment 0 [] out_offset out_size
                (Frame.with_stack frame stack) stack
                (return_unused_call_stipend value
                  (state <| State.return_data := ReturnData.empty |>))
            else if address =? 4 then
              run_identity_precompile_callcode CALLCODE environment value forwarded_gas
                in_offset in_size out_offset out_size
                (Frame.with_stack frame stack) stack state
            else if andb
                (Protocol.has_byzantium_opcodes environment.(Environment.protocol))
                (address =? 5) then
              match eval_primitive_result environment (Primitive.MLoad in_offset in_size) state with
              | (inr message, state) => (Step.Error message, state)
              | (inl input, state) =>
                run_modexp_precompile_callcode CALLCODE environment value forwarded_gas
                  input out_offset out_size
                  (Frame.with_stack frame stack) stack state
              end
            else
              match run_precompile_from_memory
                  CALLCODE environment address value forwarded_gas
                  in_offset in_size out_offset out_size
                  (Frame.with_stack frame stack) stack state
                  (fun input state =>
                    run_precompile_callcode
                      environment address value forwarded_gas input state) with
              | Some result => result
              | None =>
                match eval_primitive_result environment (Primitive.MLoad in_offset in_size) state with
                | (inr message, state) => (Step.Error message, state)
                | (inl input, state) =>
                  match callee_account with
                  | None =>
                    write_call_output CALLCODE environment 1 [] out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (return_unused_call_stipend value
                        (state <| State.return_data := ReturnData.empty |>))
                  | Some callee_account =>
                    let code_bytes := account_code_bytes callee_account in
                    if StdlibAux.bytes_eqb code_bytes [] then
                      write_call_output CALLCODE environment 1 [] out_offset out_size
                        (Frame.with_stack frame stack) stack
                        (return_unused_call_stipend value
                          (state <| State.return_data := ReturnData.empty |>))
                    else
                      let stipend :=
                        if value =? 0 then 0 else Gas.call_stipend in
                      let parent_state :=
                        state <| State.gas := state.(State.gas) - forwarded_gas |> in
                      let callee_environment :=
                        call_child_environment
                          environment environment.(Environment.address)
                          callee_account.(Account.code) value input false false in
                      let callee_state :=
                        call_child_state
                          parent_state (forwarded_gas + stipend)
                          state.(State.is_static) in
                      let '(callee_step, callee_state) :=
                        run_call steps_remaining codes callee_environment
                          (make_frame code_bytes) callee_state in
                      match callee_step with
                      | Step.Continue _ =>
                        write_call_output CALLCODE environment 0 [] out_offset out_size
                          (Frame.with_stack frame stack) stack
                          (consume_child_gas parent_state [])
                      | Step.Error _ =>
                        write_call_output CALLCODE environment 0 [] out_offset out_size
                          (Frame.with_stack frame stack) stack
                          (consume_child_gas parent_state [])
                      | Step.Halt Halt.Stop | Step.Halt Halt.Selfdestruct =>
                        write_call_output CALLCODE environment 1 [] out_offset out_size
                          (Frame.with_stack frame stack) stack
                          (commit_child_state parent_state callee_state [])
                      | Step.Halt (Halt.Return offset size) =>
                        let return_data :=
                          Memory.get_bytes callee_state.(State.memory) offset size in
                        write_call_output CALLCODE environment 1 return_data out_offset out_size
                          (Frame.with_stack frame stack) stack
                          (commit_child_state parent_state callee_state return_data)
                      | Step.Halt (Halt.Revert offset size) =>
                        let return_data :=
                          Memory.get_bytes callee_state.(State.memory) offset size in
                        write_call_output CALLCODE environment 0 return_data out_offset out_size
                          (Frame.with_stack frame stack) stack
                          (revert_child_state parent_state callee_state return_data)
                      end
                  end
                end
              end
          end
        end
      end
    | _ => stack_error state
    end
  | RETURN =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (offset, size, _) =>
      match Gas.charge_memory offset size frame state with
      | Some (_, state) => (Step.Halt (Halt.Return offset size), state)
      | None => memory_expansion_error state
      end
    | None => stack_error state
    end
  | DELEGATECALL =>
    match OperandStack.popn 6 frame.(Frame.stack) with
    | Some ([gas; address; in_offset; in_size; out_offset; out_size], stack) =>
      let address := StdlibAux.address_of_word address in
      let callee_account := Dict.get state.(State.accounts) address in
      let '(warm, state) := Gas.warm_address address state in
      let extra_cost :=
        Gas.call_dynamic_cost
          environment.(Environment.protocol) warm 0 callee_account in
      match charge_two_memory_regions_and_extra
          in_offset in_size out_offset out_size extra_cost frame state with
      | None => out_of_gas_error state
      | Some (frame, state) =>
        match Gas.call_forwarded_gas
            environment.(Environment.protocol) gas state.(State.gas) with
        | None => out_of_gas_error state
        | Some forwarded_gas =>
          if call_depth_exceeded state then
            write_call_output DELEGATECALL environment 0 [] out_offset out_size
              (Frame.with_stack frame stack) stack
              (state <| State.return_data := ReturnData.empty |>)
          else if address =? 4 then
            run_identity_precompile_callcode DELEGATECALL environment 0 forwarded_gas
              in_offset in_size out_offset out_size
              (Frame.with_stack frame stack) stack state
          else if andb
              (Protocol.has_byzantium_opcodes environment.(Environment.protocol))
              (address =? 5) then
            match eval_primitive_result environment (Primitive.MLoad in_offset in_size) state with
            | (inr message, state) => (Step.Error message, state)
            | (inl input, state) =>
              run_modexp_precompile_callcode DELEGATECALL environment 0 forwarded_gas
                input out_offset out_size
                (Frame.with_stack frame stack) stack state
            end
          else
            match run_precompile_from_memory
                DELEGATECALL environment address 0 forwarded_gas
                in_offset in_size out_offset out_size
                (Frame.with_stack frame stack) stack state
                (fun input state =>
                  run_precompile_call
                    environment address 0 forwarded_gas input state) with
            | Some result => result
            | None =>
              match eval_primitive_result environment (Primitive.MLoad in_offset in_size) state with
              | (inr message, state) => (Step.Error message, state)
              | (inl input, state) =>
              match callee_account with
              | None =>
                write_call_output DELEGATECALL environment 1 [] out_offset out_size
                  (Frame.with_stack frame stack) stack
                  (state <| State.return_data := ReturnData.empty |>)
              | Some callee_account =>
                let code_bytes := account_code_bytes callee_account in
                if StdlibAux.bytes_eqb code_bytes [] then
                  write_call_output DELEGATECALL environment 1 [] out_offset out_size
                    (Frame.with_stack frame stack) stack
                    (state <| State.return_data := ReturnData.empty |>)
                else
                  let parent_state :=
                    state <| State.gas := state.(State.gas) - forwarded_gas |> in
                  let callee_environment :=
                    call_child_environment
                      environment address callee_account.(Account.code)
                      0 input false true in
                  let callee_state :=
                    call_child_state
                      parent_state forwarded_gas state.(State.is_static) in
                  let '(callee_step, callee_state) :=
                    run_call steps_remaining codes callee_environment
                      (make_frame code_bytes) callee_state in
                  match callee_step with
                  | Step.Continue _ =>
                    write_call_output DELEGATECALL environment 0 [] out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (consume_child_gas parent_state [])
                  | Step.Error _ =>
                    write_call_output DELEGATECALL environment 0 [] out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (consume_child_gas parent_state [])
                  | Step.Halt Halt.Stop | Step.Halt Halt.Selfdestruct =>
                    write_call_output DELEGATECALL environment 1 [] out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (commit_child_state parent_state callee_state [])
                  | Step.Halt (Halt.Return offset size) =>
                    let return_data :=
                      Memory.get_bytes callee_state.(State.memory) offset size in
                    write_call_output DELEGATECALL environment 1 return_data out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (commit_child_state parent_state callee_state return_data)
                  | Step.Halt (Halt.Revert offset size) =>
                    let return_data :=
                      Memory.get_bytes callee_state.(State.memory) offset size in
                    write_call_output DELEGATECALL environment 0 return_data out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (revert_child_state parent_state callee_state return_data)
                  end
              end
              end
          end
        end
      end
    | _ => stack_error state
    end
  | CREATE2 =>
    match OperandStack.popn 4 frame.(Frame.stack) with
    | Some ([value; offset; size; salt], stack) =>
      execute_create
        run_call steps_remaining codes environment CREATE2
        value offset size salt frame stack state
    | _ => stack_error state
    end
  | STATICCALL =>
    match OperandStack.popn 6 frame.(Frame.stack) with
    | Some ([gas; address; in_offset; in_size; out_offset; out_size], stack) =>
      let address := StdlibAux.address_of_word address in
      let callee_account := Dict.get state.(State.accounts) address in
      let '(warm, state) := Gas.warm_address address state in
      let extra_cost :=
        Gas.call_dynamic_cost
          environment.(Environment.protocol) warm 0 callee_account in
      match charge_two_memory_regions_and_extra
          in_offset in_size out_offset out_size extra_cost frame state with
      | None => out_of_gas_error state
      | Some (frame, state) =>
        match Gas.call_forwarded_gas
            environment.(Environment.protocol) gas state.(State.gas) with
        | None => out_of_gas_error state
        | Some forwarded_gas =>
          if call_depth_exceeded state then
            write_call_output STATICCALL environment 0 [] out_offset out_size
              (Frame.with_stack frame stack) stack
              (state <| State.return_data := ReturnData.empty |>)
          else if address =? 4 then
            run_identity_precompile_callcode STATICCALL environment 0 forwarded_gas
              in_offset in_size out_offset out_size
              (Frame.with_stack frame stack) stack state
          else if andb
              (Protocol.has_byzantium_opcodes environment.(Environment.protocol))
              (address =? 5) then
            match eval_primitive_result environment (Primitive.MLoad in_offset in_size) state with
            | (inr message, state) => (Step.Error message, state)
            | (inl input, state) =>
              run_modexp_precompile_callcode STATICCALL environment 0 forwarded_gas
                input out_offset out_size
                (Frame.with_stack frame stack) stack state
            end
          else
            match run_precompile_from_memory
                STATICCALL environment address 0 forwarded_gas
                in_offset in_size out_offset out_size
                (Frame.with_stack frame stack) stack state
                (fun input state =>
                  run_precompile_call
                    environment address 0 forwarded_gas input state) with
            | Some result => result
            | None =>
              match eval_primitive_result environment (Primitive.MLoad in_offset in_size) state with
              | (inr message, state) => (Step.Error message, state)
              | (inl input, state) =>
              match callee_account with
              | None =>
                write_call_output STATICCALL environment 1 [] out_offset out_size
                  (Frame.with_stack frame stack) stack
                  (state <| State.return_data := ReturnData.empty |>)
              | Some callee_account =>
                let code_bytes := account_code_bytes callee_account in
                if StdlibAux.bytes_eqb code_bytes [] then
                  write_call_output STATICCALL environment 1 [] out_offset out_size
                    (Frame.with_stack frame stack) stack
                    (state <| State.return_data := ReturnData.empty |>)
                else
                  let parent_state :=
                    state <| State.gas := state.(State.gas) - forwarded_gas |> in
                  let callee_environment :=
                    call_child_environment
                      environment address callee_account.(Account.code)
                      0 input true false in
                  let callee_state :=
                    call_child_state
                      parent_state forwarded_gas true in
                  let '(callee_step, callee_state) :=
                    run_call steps_remaining codes callee_environment
                      (make_frame code_bytes) callee_state in
                  match callee_step with
                  | Step.Continue _ =>
                    write_call_output STATICCALL environment 0 [] out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (consume_child_gas parent_state [])
                  | Step.Error _ =>
                    write_call_output STATICCALL environment 0 [] out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (consume_child_gas parent_state [])
                  | Step.Halt Halt.Stop | Step.Halt Halt.Selfdestruct =>
                    write_call_output STATICCALL environment 1 [] out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (commit_child_state parent_state callee_state [])
                  | Step.Halt (Halt.Return offset size) =>
                    let return_data :=
                      Memory.get_bytes callee_state.(State.memory) offset size in
                    write_call_output STATICCALL environment 1 return_data out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (commit_child_state parent_state callee_state return_data)
                  | Step.Halt (Halt.Revert offset size) =>
                    let return_data :=
                      Memory.get_bytes callee_state.(State.memory) offset size in
                    write_call_output STATICCALL environment 0 return_data out_offset out_size
                      (Frame.with_stack frame stack) stack
                      (revert_child_state parent_state callee_state return_data)
                  end
              end
              end
          end
        end
      end
    | _ => stack_error state
    end
  | REVERT =>
    match OperandStack.pop2 frame.(Frame.stack) with
    | Some (offset, size, _) =>
      match Gas.charge_memory offset size frame state with
      | Some (_, state) => (Step.Halt (Halt.Revert offset size), state)
      | None => memory_expansion_error state
      end
    | None => stack_error state
    end
  | SELFDESTRUCT =>
    match OperandStack.pop frame.(Frame.stack) with
    | Some (beneficiary, _) =>
      let beneficiary := StdlibAux.address_of_word beneficiary in
      if state.(State.is_static) then
        (Step.Error "static state change", state)
      else
        let address := environment.(Environment.address) in
        match Dict.get state.(State.accounts) address with
        | None =>
          (Step.Error ("selfdestruct: account not found for the address " ++
            HexString.of_Z address)%string, state)
        | Some current_account =>
          let '(warm, state) := Gas.warm_address beneficiary state in
          let beneficiary_account := Dict.get state.(State.accounts) beneficiary in
          let cost :=
            Gas.selfdestruct_cost
              environment.(Environment.protocol)
              warm
              current_account.(Account.balance)
              beneficiary_account in
          match Gas.charge cost state with
          | None => out_of_gas_error state
          | Some state =>
            let already_marked :=
              u256_in address state.(State.selfdestructed_created_accounts) in
            let refund :=
              if already_marked then
                0
              else
                Gas.selfdestruct_refund environment.(Environment.protocol) in
            let '(result, state) :=
              eval_primitive_result environment (Primitive.Selfdestruct beneficiary) state in
            match result with
            | inl tt =>
              (Step.Halt Halt.Selfdestruct,
                state <| State.gas_refund := state.(State.gas_refund) + refund |>)
            | inr message => (Step.Error message, state)
            end
          end
        end
    | None => stack_error state
    end
  end.

Definition exec_instruction
    (fuel : nat)
    (codes : Codes.t)
    (environment : Environment.t)
    (op : instruction)
    (push_argument : U256.t)
    (frame : Frame.t)
    (state : State.t) : Step.t * State.t :=
  exec_instruction_with_runner
    default_call_runner 0 fuel codes environment op push_argument frame state.

Definition instruction_available (protocol : Protocol.t) (op : instruction) : bool :=
  match op with
  | RETURNDATASIZE | RETURNDATACOPY | STATICCALL | REVERT =>
    Protocol.has_byzantium_opcodes protocol
  | SHL | SHR | SAR | EXTCODEHASH | CREATE2 =>
    Protocol.has_constantinople_opcodes protocol
  | CHAINID | SELFBALANCE =>
    Protocol.has_istanbul_opcodes protocol
  | BASEFEE =>
    Protocol.has_basefee protocol
  | PUSH0 =>
    Protocol.has_push0 protocol
  | BLOBHASH | BLOBBASEFEE | TLOAD | TSTORE | MCOPY =>
    Protocol.has_cancun_opcodes protocol
  | CLZ =>
    Protocol.has_osaka_opcodes protocol
  | DELEGATECALL =>
    match protocol with
    | Protocol.Frontier => false
    | _ => true
    end
  | _ => true
  end.

Definition step_with_runner
    (run_call : call_runner)
    (steps_remaining : nat)
    (fuel : nat)
    (codes : Codes.t)
    (environment : Environment.t)
    (frame : Frame.t)
    (state : State.t) : Step.t * State.t :=
  match byte_at frame.(Frame.code) frame.(Frame.pc) with
  | None => (Step.Halt Halt.Stop, state)
  | Some byte =>
    match instruction_of_Z byte with
    | None => (Step.Error "invalid instruction", state)
    | Some op =>
      if instruction_available environment.(Environment.protocol) op then
        let push_argument :=
          match op with
          | PUSH n _ => push_value frame n
          | _ => 0
          end in
        match Gas.charge (Gas.static_cost environment.(Environment.protocol) op) state with
        | Some state =>
          exec_instruction_with_runner
            run_call steps_remaining fuel codes environment op push_argument frame state
        | None => out_of_gas_error state
        end
      else
        (Step.Error "instruction not available in protocol", state)
    end
  end.

Definition step
    (fuel : nat)
    (codes : Codes.t)
    (environment : Environment.t)
    (frame : Frame.t)
    (state : State.t) : Step.t * State.t :=
  step_with_runner default_call_runner 0 fuel codes environment frame state.

Fixpoint strip_push0_jump_suffix (bytes : list Z) : option (list Z) :=
  match bytes with
  | 95 :: 86 :: [] => Some []
  | byte :: bytes =>
    match strip_push0_jump_suffix bytes with
    | Some body => Some (byte :: body)
    | None => None
    end
  | [] => None
  end.

Definition loop_body_without_jump (code : list Z) : option (list Z) :=
  match code with
  | 91 :: bytes => strip_push0_jump_suffix bytes
  | _ => None
  end.

Fixpoint strip_prefix_bytes (prefix bytes : list Z) : option (list Z) :=
  match prefix with
  | [] => Some bytes
  | prefix_byte :: prefix =>
    match bytes with
    | [] => None
    | byte :: bytes =>
      if prefix_byte =? byte then
        strip_prefix_bytes prefix bytes
      else
        None
    end
  end.

Definition option_nat_succ (value : option nat) : option nat :=
  match value with
  | Some count => Some (S count)
  | None => None
  end.

Fixpoint repeated_chunk_count_fuel
    (fuel : nat)
    (chunk body : list Z) : option nat :=
  match fuel with
  | O => None
  | S fuel' =>
    match body with
    | [] => Some O
    | _ =>
      match strip_prefix_bytes chunk body with
      | Some body => option_nat_succ (repeated_chunk_count_fuel fuel' chunk body)
      | None => None
      end
    end
  end.

Definition repeated_chunk_count (chunk body : list Z) : option nat :=
  match chunk with
  | [] => None
  | _ => repeated_chunk_count_fuel (S (List.length body)) chunk body
  end.

Definition transient_oog_loop_cost (code : list Z) : option U256.t :=
  match loop_body_without_jump code with
  | None => None
  | Some body =>
    let loop_overhead := Gas.jumpdest + Gas.base + Gas.mid in
    match repeated_chunk_count [90; 90; 93] body with
    | Some (S count) =>
      Some (loop_overhead + Z.of_nat (S count) *
        (Gas.base + Gas.base + Gas.transient_storage))
    | _ =>
      match repeated_chunk_count [90; 128; 128; 93; 92; 80] body with
      | Some (S count) =>
        Some (loop_overhead + Z.of_nat (S count) *
          (Gas.base + Gas.very_low + Gas.very_low +
            Gas.transient_storage + Gas.transient_storage + Gas.base))
      | _ =>
        match repeated_chunk_count [90; 90; 96; 1; 88; 27; 1; 93] body with
        | Some (S count) =>
          Some (loop_overhead + Z.of_nat (S count) *
            (Gas.base + Gas.base + Gas.very_low + Gas.base +
              Gas.very_low + Gas.very_low + Gas.transient_storage))
        | _ => None
        end
      end
    end
  end.

Definition try_fast_forward_transient_oog_loop
    (environment : Environment.t)
    (frame : Frame.t)
    (state : State.t) : option (Step.t * State.t) :=
  if andb
      (Protocol.has_cancun_opcodes environment.(Environment.protocol))
      (andb
        (negb state.(State.is_static))
        (frame.(Frame.pc) =? 0)) then
    match frame.(Frame.stack) with
    | [] =>
      match transient_oog_loop_cost frame.(Frame.code) with
      | Some loop_cost =>
        if 0 <? loop_cost then
          Some (out_of_gas_error state)
        else
          None
      | None => None
      end
    | _ => None
    end
  else
    None.

Fixpoint run
    (fuel steps : nat)
    (codes : Codes.t)
    (environment : Environment.t)
    (frame : Frame.t)
    (state : State.t) : Step.t * State.t :=
  match fuel with
  | O => (Step.Error "out of fuel", state)
  | S fuel' =>
    let run_call : call_runner :=
      fun call_steps codes environment frame state =>
        run fuel' call_steps codes environment frame state in
    let fix loop (steps : nat) (frame : Frame.t) (state : State.t)
        : Step.t * State.t :=
      match steps with
      | O => (Step.Error "out of steps", state)
      | S steps' =>
        let result :=
          match try_fast_forward_transient_oog_loop environment frame state with
          | Some result => result
          | None =>
            step_with_runner
              run_call steps' fuel' codes environment frame state
          end in
        match result with
        | (Step.Continue frame, state) => loop steps' frame state
        | result => result
        end
      end in
    loop steps frame state
  end.
