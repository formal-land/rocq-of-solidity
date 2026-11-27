Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.simulations.RocqOfSolidity.
Require Import RocqOfSolidity.Evm.Semantics.

(** A small executable subset of Ethereum state-test fixtures.

    This is intentionally not yet a complete JSON statetest model: post-state
    roots and full transaction validity are outside the current runner. The goal
    here is to make whole-bytecode tests look like Ethereum state tests: an
    allocation, a block environment, a transaction context, execution gas, and
    expected post-execution effects. *)

Module StorageEntry.
  Definition t : Set := U256.t * U256.t.
End StorageEntry.

Module Alloc.
  Record t : Set := {
    address : U256.t;
    balance : U256.t;
    nonce : Z;
    code : list Z;
    storage : list StorageEntry.t;
  }.

  Definition make
      (address balance : U256.t)
      (nonce : Z)
      (code : list Z)
      (storage : list StorageEntry.t) : t := {|
    address := address;
    balance := balance;
    nonce := nonce;
    code := code;
    storage := storage;
  |}.
End Alloc.

Module BlockEnv.
  Record t : Set := {
    chain_id : U256.t;
    coinbase : U256.t;
    gas_limit : U256.t;
    number : U256.t;
    timestamp : U256.t;
    difficulty : U256.t;
    random : U256.t;
    base_fee : U256.t;
    blob_base_fee : U256.t;
    blob_hashes : list U256.t;
  }.

  Definition make_on_chain (chain : U256.t)
      (coinbase gas_limit number timestamp difficulty random base_fee blob_base_fee : U256.t)
      (blob_hashes : list U256.t) : t := {|
    chain_id := chain;
    coinbase := coinbase;
    gas_limit := gas_limit;
    number := number;
    timestamp := timestamp;
    difficulty := difficulty;
    random := random;
    base_fee := base_fee;
    blob_base_fee := blob_base_fee;
    blob_hashes := blob_hashes;
  |}.
  Definition make := make_on_chain 1.
End BlockEnv.

Module Authorization.
  Record t : Set := make {
    chain_id : Z;
    destination : Z;
    nonce : Z;
    parity : Z;
    r : Z;
    s : Z;
  }.

  Definition fits (bits value : Z) : bool := (0 <=? value) && (value <? 2 ^ bits).

  Definition well_formed (a : t) : bool :=
    fits 256 a.(chain_id) && fits 160 a.(destination) && fits 64 a.(nonce) &&
    fits 8 a.(parity) && fits 256 a.(r) && fits 256 a.(s).

  Definition signing_hash (a : t) : Z :=
    let payload := StdlibAux.rlp_integer a.(chain_id) ++
      [148] ++ StdlibAux.low_160_bits_as_bytes a.(destination) ++
      StdlibAux.rlp_integer a.(nonce) in
    let n := Z.of_nat (List.length payload) in
    let prefix := if n <? 56 then [192 + n] else [248; n] in
    StdlibAux.keccak256 (5 :: (prefix ++ payload)).

  Definition recover (a : t) : option Z :=
    if a.(s) <=? Stdlib.secp256k1_group_order / 2 then
      match Stdlib.secp256k1_recover_public_key (signing_hash a)
              (27 + a.(parity)) a.(r) a.(s) with
      | Some key => Some (Memory.bytes_as_u256 (Stdlib.ecrecover_output_of_public_key key))
      | None => None
      end
    else None.
End Authorization.

Module TransactionKind.
  Inductive t : Set :=
  | Legacy
  | AccessList
  | DynamicFee
  | Blob
  | SetCode (authorizations : list Authorization.t).
End TransactionKind.

Module Transaction.
  Definition AccessListEntry : Set := U256.t * list U256.t.

  Record t : Set := {
    kind : TransactionKind.t;
    caller : U256.t;
    to : U256.t;
    is_create : bool;
    nonce : Z;
    value : U256.t;
    gas_limit : U256.t;
    gas_price : U256.t;
    gas_fee_cap : U256.t;
    priority_fee_cap : U256.t;
    blob_gas_fee_cap : U256.t;
    data : list Z;
    data_size : U256.t;
    access_list : list AccessListEntry;
  }.

  Definition make_kind_with_nonce_fee_caps_access_list
      (kind : TransactionKind.t)
      (nonce : Z)
      (caller to value gas_limit gas_price gas_fee_cap priority_fee_cap
        blob_gas_fee_cap : U256.t)
      (data_size : U256.t)
      (data : list Z)
      (access_list : list AccessListEntry) : t := {|
    kind := kind;
    caller := caller;
    to := to;
    is_create := false;
    nonce := nonce;
    value := value;
    gas_limit := gas_limit;
    gas_price := gas_price;
    gas_fee_cap := gas_fee_cap;
    priority_fee_cap := priority_fee_cap;
    blob_gas_fee_cap := blob_gas_fee_cap;
    data := data;
    data_size := data_size;
    access_list := access_list;
  |}.

  Definition make_with_fee_caps_access_list
      (caller to value gas_limit gas_price gas_fee_cap blob_gas_fee_cap : U256.t)
      (data : list Z)
      (access_list : list AccessListEntry) : t :=
    make_kind_with_nonce_fee_caps_access_list
      TransactionKind.Legacy 0 caller to value gas_limit gas_price gas_fee_cap
      gas_price blob_gas_fee_cap (Z.of_nat (List.length data)) data access_list.

  Definition make_with_fee_cap_access_list
      (caller to value gas_limit gas_price gas_fee_cap : U256.t)
      (data : list Z)
      (access_list : list AccessListEntry) : t :=
    make_with_fee_caps_access_list caller to value gas_limit gas_price gas_fee_cap 0 data access_list.

  Definition make_with_access_list
      (caller to value gas_limit gas_price : U256.t)
      (data : list Z)
      (access_list : list AccessListEntry) : t :=
    make_with_fee_cap_access_list caller to value gas_limit gas_price gas_price data access_list.

  Definition make
      (caller to value gas_limit gas_price : U256.t)
      (data : list Z) : t :=
    make_with_access_list caller to value gas_limit gas_price data [].

  Definition make_create_kind_with_nonce_fee_caps_access_list
      (kind : TransactionKind.t)
      (nonce : Z)
      (caller value gas_limit gas_price gas_fee_cap priority_fee_cap
        blob_gas_fee_cap : U256.t)
      (data_size : U256.t)
      (data : list Z)
      (access_list : list AccessListEntry) : t := {|
    kind := kind;
    caller := caller;
    to := 0;
    is_create := true;
    nonce := nonce;
    value := value;
    gas_limit := gas_limit;
    gas_price := gas_price;
    gas_fee_cap := gas_fee_cap;
    priority_fee_cap := priority_fee_cap;
    blob_gas_fee_cap := blob_gas_fee_cap;
    data := data;
    data_size := data_size;
    access_list := access_list;
  |}.

  Definition make_create_with_fee_caps_access_list
      (caller value gas_limit gas_price gas_fee_cap blob_gas_fee_cap : U256.t)
      (data : list Z)
      (access_list : list AccessListEntry) : t :=
    make_create_kind_with_nonce_fee_caps_access_list
      TransactionKind.Legacy 0 caller value gas_limit gas_price gas_fee_cap
      gas_price blob_gas_fee_cap (Z.of_nat (List.length data)) data access_list.

  Definition make_create_with_fee_cap_access_list
      (caller value gas_limit gas_price gas_fee_cap : U256.t)
      (data : list Z)
      (access_list : list AccessListEntry) : t :=
    make_create_with_fee_caps_access_list caller value gas_limit gas_price gas_fee_cap 0 data access_list.

  Definition make_create_with_access_list
      (caller value gas_limit gas_price : U256.t)
      (data : list Z)
      (access_list : list AccessListEntry) : t :=
    make_create_with_fee_cap_access_list caller value gas_limit gas_price gas_price data access_list.

  Definition make_create
      (caller value gas_limit gas_price : U256.t)
      (data : list Z) : t :=
    make_create_with_access_list caller value gas_limit gas_price data [].
End Transaction.

Fixpoint storage_of_entries (entries : list StorageEntry.t) : Storage.t :=
  match entries with
  | [] => Storage.empty
  | (slot, value) :: entries =>
    Storage.update (storage_of_entries entries) slot value
  end.

Fixpoint storage_keys_of_entries (entries : list StorageEntry.t) : list U256.t :=
  match entries with
  | [] => []
  | (slot, value) :: entries =>
    storage_keys_after_update slot value (storage_keys_of_entries entries)
  end.

Definition account_of_alloc (alloc : Alloc.t) : Account.t := {|
  Account.balance := alloc.(Alloc.balance);
  Account.nonce := alloc.(Alloc.nonce);
  Account.code := 0;
  Account.codedata := alloc.(Alloc.code);
  Account.storage := storage_of_entries alloc.(Alloc.storage);
  Account.storage_keys := storage_keys_of_entries alloc.(Alloc.storage);
  Account.immutables := [];
|}.

Fixpoint accounts_of_allocs (allocs : list Alloc.t) : list (U256.t * Account.t) :=
  match allocs with
  | [] => []
  | alloc :: allocs =>
    (alloc.(Alloc.address), account_of_alloc alloc) :: accounts_of_allocs allocs
  end.

Definition empty_value_transfer_account (balance : U256.t) : Account.t := {|
  Account.balance := balance;
  Account.nonce := 0;
  Account.code := 0;
  Account.codedata := [];
  Account.storage := Storage.empty;
  Account.storage_keys := [];
  Account.immutables := [];
|}.

Definition increment_transaction_sender_nonce
    (accounts : list (U256.t * Account.t))
    (transaction : Transaction.t) :
    option (list (U256.t * Account.t)) :=
  Some (Dict.declare_or_assign_function accounts transaction.(Transaction.caller) (fun current =>
    let account := match current with Some a => a | None => empty_value_transfer_account 0 end in
    account <| Account.nonce := account.(Account.nonce) + 1 |>)).

Definition debit_account
    (accounts : list (U256.t * Account.t))
    (address value : U256.t) :
    option (list (U256.t * Account.t)) :=
  if value =? 0 then
    Some accounts
  else
    match Dict.get accounts address with
    | None => None
    | Some account =>
      if value >? account.(Account.balance) then
        None
      else
        Dict.assign_function accounts address (fun account =>
          account <| Account.balance := account.(Account.balance) - value |>
        )
    end.

Definition credit_account
    (accounts : list (U256.t * Account.t))
    (address value : U256.t) : list (U256.t * Account.t) :=
  if value =? 0 then
    accounts
  else
    Dict.declare_or_assign_function accounts address (fun account =>
      match account with
      | Some account =>
        account <| Account.balance := account.(Account.balance) + value |>
      | None => empty_value_transfer_account value
      end
    ).

Definition transaction_gas_cost (transaction : Transaction.t) : U256.t :=
  transaction.(Transaction.gas_limit) * transaction.(Transaction.gas_price).

Definition transaction_fee_cap_cost (transaction : Transaction.t) : U256.t :=
  transaction.(Transaction.gas_limit) * transaction.(Transaction.gas_fee_cap).

Definition blob_gas_per_blob : U256.t := 131072.

Definition credit_transaction_account (protocol : Protocol.t)
    (accounts : list (U256.t * Account.t))
    (address value : U256.t) : list (U256.t * Account.t) :=
  match protocol, value with
  | (Protocol.Frontier | Protocol.Homestead), 0 =>
    match Dict.get accounts address with
    | None => (address, empty_value_transfer_account 0) :: accounts
    | Some _ => accounts
    end
  | _, _ => credit_account accounts address value
  end.

Definition transfer_transaction_value (protocol : Protocol.t)
    (accounts : list (U256.t * Account.t))
    (transaction : Transaction.t) :
    option (list (U256.t * Account.t)) :=
  let value := transaction.(Transaction.value) in
  match debit_account accounts transaction.(Transaction.caller) value with
  | None => None
  | Some accounts =>
    Some (credit_transaction_account protocol accounts transaction.(Transaction.to) value)
  end.

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

Fixpoint code_at (allocs : list Alloc.t) (address : U256.t) : list Z :=
  match allocs with
  | [] => []
  | alloc :: allocs =>
    if address =? alloc.(Alloc.address) then
      alloc.(Alloc.code)
    else
      code_at allocs address
  end.

Fixpoint alloc_at (allocs : list Alloc.t) (address : U256.t) : option Alloc.t :=
  match allocs with
  | [] => None
  | alloc :: allocs =>
    if address =? alloc.(Alloc.address) then
      Some alloc
    else
      alloc_at allocs address
  end.

Definition alloc_has_storage (alloc : Alloc.t) : bool :=
  match storage_keys_of_entries alloc.(Alloc.storage) with
  | [] => false
  | _ :: _ => true
  end.

Definition alloc_has_code (alloc : Alloc.t) : bool :=
  negb (StdlibAux.bytes_eqb alloc.(Alloc.code) []).

Definition creation_alloc_collision
    (protocol : Protocol.t)
    (alloc : Alloc.t) : bool :=
  (negb (alloc.(Alloc.nonce) =? 0)) ||
  alloc_has_code alloc ||
  alloc_has_storage alloc.

Definition account_has_code (account : Account.t) : bool :=
  negb
    (andb
      (account.(Account.code) =? 0)
      (StdlibAux.bytes_eqb account.(Account.codedata) [])).

Definition account_has_storage (account : Account.t) : bool :=
  match account.(Account.storage_keys) with
  | [] => false
  | _ :: _ => true
  end.

Definition creation_account_collision
    (protocol : Protocol.t)
    (account : Account.t) : bool :=
  (negb (account.(Account.nonce) =? 0)) ||
  account_has_code account ||
  account_has_storage account.

Record t : Set := {
  name : string;
  protocol : Protocol.t;
  codes : Codes.t;
  pre : list Alloc.t;
  block : BlockEnv.t;
  transaction : Transaction.t;
  steps : nat;
}.

Definition transaction_blob_gas (fixture : t) : U256.t :=
  blob_gas_per_blob * Z.of_nat (List.length fixture.(block).(BlockEnv.blob_hashes)).

Definition transaction_blob_fee_cap_cost (fixture : t) : U256.t :=
  transaction_blob_gas fixture *
    fixture.(transaction).(Transaction.blob_gas_fee_cap).

Definition transaction_blob_fee_cost (fixture : t) : U256.t :=
  transaction_blob_gas fixture * fixture.(block).(BlockEnv.blob_base_fee).

Definition max_sender_nonce : Z := Gas.max_account_nonce.

Definition blob_hash_version (hash : U256.t) : U256.t :=
  hash / 2 ^ 248.

Fixpoint blob_hashes_have_valid_version (hashes : list U256.t) : bool :=
  match hashes with
  | [] => true
  | hash :: hashes =>
    (blob_hash_version hash =? 1) && blob_hashes_have_valid_version hashes
  end.

Definition max_blob_count (protocol : Protocol.t) : nat :=
  match protocol with
  | Protocol.Prague => 9%nat
  | _ => 6%nat
  end.

Definition sender_nonce (fixture : t) : U256.t :=
  match Dict.get
      (accounts_of_allocs fixture.(pre))
      fixture.(transaction).(Transaction.caller) with
  | Some account => account.(Account.nonce)
  | None => 0
  end.

Definition created_address (fixture : t) : U256.t :=
  StdlibAux.contract_creation_address
    fixture.(transaction).(Transaction.caller)
    (sender_nonce fixture).

Definition transaction_execution_address (fixture : t) : U256.t :=
  if fixture.(transaction).(Transaction.is_create) then
    created_address fixture
  else
    fixture.(transaction).(Transaction.to).

Definition transaction_execution_calldata (fixture : t) : list Z :=
  if fixture.(transaction).(Transaction.is_create) then
    []
  else
    fixture.(transaction).(Transaction.data).

Definition prepare_created_account
    (fixture : t)
    (accounts : list (U256.t * Account.t)) :
    option (list (U256.t * Account.t)) :=
  let transaction := fixture.(transaction) in
  let address := created_address fixture in
  match alloc_at fixture.(pre) address with
  | Some alloc =>
    if creation_alloc_collision fixture.(protocol) alloc then
      None
    else
      match debit_account accounts transaction.(Transaction.caller) transaction.(Transaction.value) with
      | None => None
      | Some accounts =>
        Dict.assign_function accounts address (fun account =>
          account
            <| Account.balance :=
              account.(Account.balance) + transaction.(Transaction.value) |>
            <| Account.nonce := created_account_initial_nonce fixture.(protocol) |>
            <| Account.code := 0 |>
            <| Account.codedata := [] |>
            <| Account.storage := Storage.empty |>
            <| Account.storage_keys := [] |>
        )
      end
  | None =>
    match debit_account accounts transaction.(Transaction.caller) transaction.(Transaction.value) with
    | None => None
    | Some accounts =>
      Some (Dict.declare accounts address
        (empty_created_account fixture.(protocol) transaction.(Transaction.value)))
    end
  end.

Definition transaction_upfront_cost (fixture : t) : U256.t :=
  let transaction := fixture.(transaction) in
  transaction_fee_cap_cost transaction +
  transaction_blob_fee_cap_cost fixture +
  transaction.(Transaction.value).

Definition purchase_transaction_gas
    (accounts : list (U256.t * Account.t))
    (fixture : t) :
    option (list (U256.t * Account.t)) :=
  let transaction := fixture.(transaction) in
  debit_account accounts
    transaction.(Transaction.caller)
    (transaction_gas_cost transaction).

Definition purchase_blob_gas
    (accounts : list (U256.t * Account.t))
    (fixture : t) :
    option (list (U256.t * Account.t)) :=
  debit_account accounts
    fixture.(transaction).(Transaction.caller)
    (transaction_blob_fee_cost fixture).

Definition authorization_cost (transaction : Transaction.t) : Z :=
  match transaction.(Transaction.kind) with
  | TransactionKind.SetCode authorizations => 25000 * Z.of_nat (List.length authorizations)
  | _ => 0
  end.

Definition state_with_accounts
    (fixture : t)
    (accounts : list (U256.t * Account.t)) : State.t :=
  let original_accounts := accounts_of_allocs fixture.(pre) in
  let transaction := fixture.(transaction) in
  State.init
    <| State.accounts := accounts |>
    <| State.original_accounts := original_accounts |>
    <| State.gas :=
      Z.max 0 (Gas.execution_gas
        fixture.(protocol)
        transaction.(Transaction.is_create)
        transaction.(Transaction.gas_limit)
        transaction.(Transaction.data)
        transaction.(Transaction.access_list) - authorization_cost transaction)
    |>
    <| State.warm_addresses :=
      Gas.initial_warm_addresses
        fixture.(protocol)
        transaction.(Transaction.caller)
        (transaction_execution_address fixture)
        fixture.(block).(BlockEnv.coinbase)
        transaction.(Transaction.access_list)
    |>
    <| State.warm_storage_keys :=
      Gas.initial_warm_storage_keys
        fixture.(protocol)
        transaction.(Transaction.access_list)
    |>
    <| State.block_number := fixture.(block).(BlockEnv.number) |>
    <| State.block_timestamp := fixture.(block).(BlockEnv.timestamp) |>.

Definition environment (fixture : t) : Environment.t := {|
  Environment.protocol := fixture.(protocol);
  Environment.caller := fixture.(transaction).(Transaction.caller);
  Environment.origin := fixture.(transaction).(Transaction.caller);
  Environment.callvalue := fixture.(transaction).(Transaction.value);
  Environment.gas_price := fixture.(transaction).(Transaction.gas_price);
  Environment.calldata := transaction_execution_calldata fixture;
  Environment.address := transaction_execution_address fixture;
  Environment.code_name := 0;
  Environment.chain_id := fixture.(block).(BlockEnv.chain_id);
  Environment.block_coinbase := fixture.(block).(BlockEnv.coinbase);
  Environment.block_gas_limit := fixture.(block).(BlockEnv.gas_limit);
  Environment.block_difficulty := fixture.(block).(BlockEnv.difficulty);
  Environment.block_prev_randao := fixture.(block).(BlockEnv.random);
  Environment.block_base_fee := fixture.(block).(BlockEnv.base_fee);
  Environment.block_blob_base_fee := fixture.(block).(BlockEnv.blob_base_fee);
  Environment.blob_hashes := fixture.(block).(BlockEnv.blob_hashes);
|}.

Definition pre_transaction_state (fixture : t) : State.t :=
  state_with_accounts fixture (accounts_of_allocs fixture.(pre)).

Definition transaction_has_enough_gas (fixture : t) : bool :=
  let transaction := fixture.(transaction) in
  let minimum :=
    Gas.minimum_transaction_gas_limit
      fixture.(protocol)
      transaction.(Transaction.is_create)
      transaction.(Transaction.data)
      transaction.(Transaction.access_list) in
  let minimum := match transaction.(Transaction.kind) with
    | TransactionKind.SetCode _ =>
      Z.max minimum (Gas.intrinsic_transaction_cost fixture.(protocol)
        transaction.(Transaction.is_create) transaction.(Transaction.data)
        transaction.(Transaction.access_list) + authorization_cost transaction)
    | _ => minimum
    end in
  (minimum <=? transaction.(Transaction.gas_limit)) &&
  (transaction.(Transaction.gas_limit) <=? fixture.(block).(BlockEnv.gas_limit)).

Definition transaction_gas_price_covers_base_fee (fixture : t) : bool :=
  if Gas.is_london_or_later fixture.(protocol) then
    fixture.(block).(BlockEnv.base_fee) <=?
      fixture.(transaction).(Transaction.gas_price)
  else
    true.

Definition transaction_kind_supported (fixture : t) : bool :=
  match fixture.(transaction).(Transaction.kind) with
  | TransactionKind.Legacy => true
  | TransactionKind.AccessList => Gas.is_berlin_or_later fixture.(protocol)
  | TransactionKind.SetCode _ => Gas.is_prague_or_later fixture.(protocol)
  | TransactionKind.DynamicFee => Gas.is_london_or_later fixture.(protocol)
  | TransactionKind.Blob => Protocol.has_cancun_opcodes fixture.(protocol)
  end.

Definition transaction_sender_has_no_code (fixture : t) : bool :=
  if Gas.is_london_or_later fixture.(protocol) then
    let pre_state := pre_transaction_state fixture in
    match Dict.get
        pre_state.(State.accounts)
        fixture.(transaction).(Transaction.caller) with
    | Some sender => negb (account_has_code sender) ||
        match delegation_target fixture.(protocol) sender with Some _ => true | None => false end
    | None => true
    end
  else
    true.

Definition transaction_sender_nonce_not_max (fixture : t) : bool :=
  sender_nonce fixture <? max_sender_nonce.

Definition transaction_nonce_matches_sender (fixture : t) : bool :=
  sender_nonce fixture =? fixture.(transaction).(Transaction.nonce).

Definition transaction_priority_fee_valid (fixture : t) : bool :=
  match fixture.(transaction).(Transaction.kind) with
  | TransactionKind.DynamicFee | TransactionKind.Blob | TransactionKind.SetCode _ =>
    fixture.(transaction).(Transaction.priority_fee_cap) <=?
      fixture.(transaction).(Transaction.gas_fee_cap)
  | _ => true
  end.

Definition transaction_init_code_size_valid (fixture : t) : bool :=
  if andb
      fixture.(transaction).(Transaction.is_create)
      (Gas.is_shanghai_or_later fixture.(protocol)) then
    fixture.(transaction).(Transaction.data_size) <=? Gas.max_init_code_size
  else
    true.

Definition transaction_blob_not_creation (fixture : t) : bool :=
  match fixture.(transaction).(Transaction.kind) with
  | TransactionKind.Blob => negb fixture.(transaction).(Transaction.is_create)
  | _ => true
  end.

Definition transaction_blob_has_hashes (fixture : t) : bool :=
  match fixture.(transaction).(Transaction.kind) with
  | TransactionKind.Blob =>
    match fixture.(block).(BlockEnv.blob_hashes) with
    | [] => false
    | _ :: _ => true
    end
  | _ => true
  end.

Definition transaction_blob_count_valid (fixture : t) : bool :=
  match fixture.(transaction).(Transaction.kind) with
  | TransactionKind.Blob =>
    Nat.leb
      (List.length fixture.(block).(BlockEnv.blob_hashes))
      (max_blob_count fixture.(protocol))
  | _ => true
  end.

Definition transaction_blob_hash_versions_valid (fixture : t) : bool :=
  match fixture.(transaction).(Transaction.kind) with
  | TransactionKind.Blob =>
    blob_hashes_have_valid_version fixture.(block).(BlockEnv.blob_hashes)
  | _ => true
  end.

Definition transaction_blob_fee_cap_covers_base_fee (fixture : t) : bool :=
  match fixture.(transaction).(Transaction.kind) with
  | TransactionKind.Blob =>
    fixture.(block).(BlockEnv.blob_base_fee) <=?
      fixture.(transaction).(Transaction.blob_gas_fee_cap)
  | _ => true
  end.

Definition transaction_has_enough_balance (fixture : t) : bool :=
  let pre_state := pre_transaction_state fixture in
  let transaction := fixture.(transaction) in
  match Dict.get pre_state.(State.accounts) transaction.(Transaction.caller) with
  | None => transaction_upfront_cost fixture =? 0
  | Some sender =>
    transaction_upfront_cost fixture <=? sender.(Account.balance)
  end.

Definition transaction_sender_exists (fixture : t) : bool :=
  let pre_state := pre_transaction_state fixture in
  match Dict.get
      pre_state.(State.accounts)
      fixture.(transaction).(Transaction.caller) with
  | Some _ => true
  | None => false
  end.

Definition state_after_sender_nonce (fixture : t) : option State.t :=
  let pre_state := pre_transaction_state fixture in
  match increment_transaction_sender_nonce
      pre_state.(State.accounts)
      fixture.(transaction) with
  | None => None
  | Some accounts => Some (pre_state <| State.accounts := accounts |>)
  end.

Definition apply_authorization (fixture : t) (state : State.t) (a : Authorization.t) : State.t :=
  if ((a.(Authorization.chain_id) =? 0) ||
      (a.(Authorization.chain_id) =? fixture.(block).(BlockEnv.chain_id))) &&
      (a.(Authorization.nonce) <? max_sender_nonce) then
    match Authorization.recover a with
    | None => state
    | Some signer =>
      let '(_, state) := Gas.warm_address signer state in
      let account := match Dict.get state.(State.accounts) signer with
                     | None => empty_call_account 0 | Some acct => acct end in
      let can_delegate := negb (account_has_code account) ||
        match delegation_target fixture.(protocol) account with Some _ => true | None => false end in
      if can_delegate && (account.(Account.nonce) =? a.(Authorization.nonce)) then
        let target := a.(Authorization.destination) in
        let code := if target =? 0 then [] else
          [239; 1; 0] ++ StdlibAux.low_160_bits_as_bytes target in
        let updated := account <| Account.nonce := account.(Account.nonce) + 1 |>
          <| Account.code := 0 |> <| Account.codedata := code |> in
        state <| State.accounts := Dict.declare_or_assign state.(State.accounts) signer updated |>
          <| State.gas_refund := state.(State.gas_refund) +
              (if Gas.account_empty account then 0 else 12500) |>
      else state
    end
  else state.

Definition prepare_delegations (fixture : t) (state : State.t) : State.t :=
  if Gas.is_prague_or_later fixture.(protocol) then
    let tx := fixture.(transaction) in
    let state := match tx.(Transaction.kind) with
      | TransactionKind.SetCode entries => List.fold_left (apply_authorization fixture) entries state
      | _ => state end in
    if tx.(Transaction.is_create) then state else
    match Dict.get state.(State.accounts) tx.(Transaction.to) with
    | Some account =>
      match delegation_target fixture.(protocol) account with
      | Some target => snd (Gas.warm_address target state)
      | None => state end
    | None => state end
  else state.

Definition authorization_list_error (tx : Transaction.t) : option string :=
  match tx.(Transaction.kind) with
  | TransactionKind.SetCode entries =>
    if tx.(Transaction.is_create) then Some "invalid transaction: set-code transaction cannot create contract"
    else match entries with
    | [] => Some "invalid transaction: empty authorization list"
    | _ => if List.forallb Authorization.well_formed entries then None
           else Some "invalid transaction: malformed authorization tuple"
    end
  | _ => None end.

Definition state_after_gas_purchase (fixture : t) : option State.t :=
  match state_after_sender_nonce fixture with
  | None => None
  | Some nonce_state =>
    match purchase_transaction_gas
        nonce_state.(State.accounts)
        fixture with
    | None => None
    | Some accounts =>
      match purchase_blob_gas accounts fixture with
      | None => None
      | Some accounts => Some (prepare_delegations fixture (nonce_state <| State.accounts := accounts |>))
      end
    end
  end.

Definition state_after_value_transfer (fixture : t) : option State.t :=
  match state_after_gas_purchase fixture with
  | None => None
  | Some gas_state =>
    let accounts :=
      if fixture.(transaction).(Transaction.is_create) then
        prepare_created_account fixture gas_state.(State.accounts)
      else
        transfer_transaction_value fixture.(protocol)
          gas_state.(State.accounts)
          fixture.(transaction) in
    match accounts with
    | None => None
    | Some accounts =>
      let state := gas_state <| State.accounts := accounts |> in
      Some (
        if fixture.(transaction).(Transaction.is_create) then
          state
            <| State.created_accounts :=
              created_address fixture :: state.(State.created_accounts) |>
        else
          state
      )
    end
  end.

Definition state (fixture : t) : State.t :=
  match state_after_value_transfer fixture with
  | Some state => state
  | None => pre_transaction_state fixture
  end.

Definition frame (fixture : t) : Frame.t :=
  make_frame (
    if fixture.(transaction).(Transaction.is_create) then
      fixture.(transaction).(Transaction.data)
    else
      code_at fixture.(pre) fixture.(transaction).(Transaction.to)
  ).

Definition call_frame (fixture : t) (state : State.t) : Frame.t :=
  if Gas.is_prague_or_later fixture.(protocol) then
    match Dict.get state.(State.accounts) fixture.(transaction).(Transaction.to) with
    | Some account => make_frame (account_code_bytes (executable_account fixture.(protocol) state account))
    | None => make_frame []
    end
  else frame fixture.

Definition rollback_persistent_state (before after : State.t) : State.t :=
  after
    <| State.accounts := before.(State.accounts) |>
    <| State.transient_storage := before.(State.transient_storage) |>
    <| State.gas_refund := before.(State.gas_refund) |>
    <| State.created_accounts := before.(State.created_accounts) |>
    <| State.selfdestructed_created_accounts :=
      before.(State.selfdestructed_created_accounts)
    |>
    <| State.logs := before.(State.logs) |>.

Definition positive_gas_refund (state : State.t) : U256.t :=
  Z.max 0 state.(State.gas_refund).

Definition transaction_refund_quotient (fixture : t) : U256.t :=
  if Gas.is_london_or_later fixture.(protocol) then 5 else 2.

Definition transaction_refund_gas (fixture : t) (state : State.t) : U256.t :=
  let transaction := fixture.(transaction) in
  let gas_used_before_refund :=
    transaction.(Transaction.gas_limit) - state.(State.gas) in
  Z.min
    (positive_gas_refund state)
    (gas_used_before_refund / transaction_refund_quotient fixture).

Definition apply_calldata_floor_gas
    (fixture : t)
    (remaining_gas : U256.t) : U256.t :=
  if Gas.is_prague_or_later fixture.(protocol) then
    let gas_limit := fixture.(transaction).(Transaction.gas_limit) in
    let floor_gas :=
      Gas.calldata_floor_cost fixture.(transaction).(Transaction.data) in
    let maximum_remaining :=
      if gas_limit <=? floor_gas then 0 else gas_limit - floor_gas in
    Z.min remaining_gas maximum_remaining
  else
    remaining_gas.

Definition remaining_transaction_gas (fixture : t) (state : State.t) : U256.t :=
  apply_calldata_floor_gas fixture
    (state.(State.gas) + transaction_refund_gas fixture state).

Definition coinbase_gas_price (fixture : t) : U256.t :=
  let gas_price := fixture.(transaction).(Transaction.gas_price) in
  if Gas.is_london_or_later fixture.(protocol) then
    let base_fee := fixture.(block).(BlockEnv.base_fee) in
    if gas_price <=? base_fee then 0 else gas_price - base_fee
  else
    gas_price.

Definition finalize_transaction_with_remaining_gas
    (fixture : t)
    (remaining_gas : U256.t)
    (state : State.t) : State.t :=
  let transaction := fixture.(transaction) in
  let gas_used := transaction.(Transaction.gas_limit) - remaining_gas in
  let sender_refund := remaining_gas * transaction.(Transaction.gas_price) in
  let coinbase_reward := gas_used * coinbase_gas_price fixture in
  state
    <| State.accounts :=
      credit_transaction_account fixture.(protocol)
        (credit_transaction_account fixture.(protocol)
          state.(State.accounts)
          transaction.(Transaction.caller)
          sender_refund)
        fixture.(block).(BlockEnv.coinbase)
        coinbase_reward
    |>
    <| State.gas := remaining_gas |>
    <| State.gas_refund := 0 |>.

Definition finalize_successful_transaction
    (fixture : t)
    (state : State.t) : State.t :=
  finalize_selfdestructs (finalize_transaction_with_remaining_gas fixture
    (remaining_transaction_gas fixture state)
    state).

Definition finalize_exceptional_transaction
    (fixture : t)
    (state : State.t) : State.t :=
  let consumed := state <| State.gas := 0 |> in
  finalize_transaction_with_remaining_gas fixture (remaining_transaction_gas fixture consumed) consumed.

Definition deploy_created_code
    (fixture : t)
    (code : list Z)
    (state : State.t) : option State.t :=
  Semantics.deploy_created_code fixture.(protocol) (created_address fixture) code state.

Definition rollback_top_level_exception
    (fixture : t)
    (before : State.t)
    (result : Step.t * State.t) : Step.t * State.t :=
  match result with
  | (Step.Error message, after) =>
    (Step.Error message,
      finalize_exceptional_transaction fixture
        (rollback_persistent_state before after))
  | (Step.Halt (Halt.Revert offset size), after) =>
    (Step.Halt (Halt.Revert offset size),
      finalize_successful_transaction fixture
        (rollback_persistent_state before after))
  | (step, after) =>
    (step, finalize_successful_transaction fixture after)
  end.

Definition rollback_top_level_contract_creation
    (fixture : t)
    (before : State.t)
    (result : Step.t * State.t) : Step.t * State.t :=
  match result with
  | (Step.Error message, after) =>
    (Step.Error message,
      finalize_exceptional_transaction fixture
        (rollback_persistent_state before after))
  | (Step.Halt (Halt.Revert offset size), after) =>
    (Step.Halt (Halt.Revert offset size),
      finalize_successful_transaction fixture
        (rollback_persistent_state before after))
  | (Step.Halt (Halt.Return offset size), after) =>
    match deposit_returned_code fixture.(protocol) (created_address fixture) offset size after with
    | Some (deposited_size, after) =>
      (Step.Halt (Halt.Return offset deposited_size),
        finalize_successful_transaction fixture after)
    | None =>
      (Step.Error "out of gas: code deposit",
        finalize_exceptional_transaction fixture
          (rollback_persistent_state before after))
    end
  | (step, after) =>
    (step, finalize_successful_transaction fixture after)
  end.

Definition run_top_level_precompile
    (fixture : t)
    (rollback_base before : State.t) : Step.t * State.t :=
  let transaction := fixture.(transaction) in
  let input := transaction.(Transaction.data) in
  match precompile_gas fixture.(protocol) transaction.(Transaction.to) input with
  | None =>
    rollback_top_level_exception fixture rollback_base
      (Step.Error "precompile not available", before)
  | Some cost =>
    if cost <=? before.(State.gas) then
      match Stdlib.precompile_run_for_protocol fixture.(protocol) transaction.(Transaction.to) input with
      | Some (Stdlib.PrecompileSuccess output) =>
        (
          Step.Halt Halt.Stop,
          finalize_successful_transaction fixture
            (before
              <| State.gas := before.(State.gas) - cost |>
              <| State.return_data := ReturnData.of_bytes output |>)
        )
      | Some Stdlib.PrecompileFailure =>
        rollback_top_level_exception fixture rollback_base
          (Step.Error "precompile failure",
            before
              <| State.gas := before.(State.gas) - cost |>
              <| State.return_data := ReturnData.empty |>)
      | None =>
        rollback_top_level_exception fixture rollback_base
          (Step.Error "precompile not found", before)
      end
    else
      rollback_top_level_exception fixture rollback_base
        (Step.Error "out of gas: precompile",
          before <| State.gas := 0 |>)
  end.

Definition transaction_targets_available_precompile (fixture : t) : bool :=
  if fixture.(transaction).(Transaction.is_create) then
    false
  else
    match precompile_gas
        fixture.(protocol)
        fixture.(transaction).(Transaction.to)
        fixture.(transaction).(Transaction.data) with
    | Some _ => true
    | None => false
    end.

Definition run (fixture : t) : Step.t * State.t :=
  if negb (transaction_sender_exists fixture) && (0 <? transaction_upfront_cost fixture) then
    (Step.Error "invalid transaction: sender account not found",
      pre_transaction_state fixture)
  else if negb (transaction_kind_supported fixture) then
    (Step.Error "invalid transaction: transaction type not supported by protocol",
      pre_transaction_state fixture)
  else match authorization_list_error fixture.(transaction) with
  | Some error =>
    (Step.Error error, pre_transaction_state fixture)
  | None => if negb (transaction_sender_has_no_code fixture) then
    (Step.Error "invalid transaction: sender account has code",
      pre_transaction_state fixture)
  else if negb (transaction_sender_nonce_not_max fixture) then
    (Step.Error "invalid transaction: sender nonce too high",
      pre_transaction_state fixture)
  else if negb (transaction_nonce_matches_sender fixture) then
    (Step.Error "invalid transaction: sender nonce mismatch",
      pre_transaction_state fixture)
  else if negb (transaction_priority_fee_valid fixture) then
    (Step.Error "invalid transaction: priority fee exceeds fee cap",
      pre_transaction_state fixture)
  else if negb (transaction_blob_not_creation fixture) then
    (Step.Error "invalid transaction: blob transaction cannot create contract",
      pre_transaction_state fixture)
  else if negb (transaction_blob_has_hashes fixture) then
    (Step.Error "invalid transaction: blob transaction has no blobs",
      pre_transaction_state fixture)
  else if negb (transaction_blob_count_valid fixture) then
    (Step.Error "invalid transaction: blob transaction has too many blobs",
      pre_transaction_state fixture)
  else if negb (transaction_blob_hash_versions_valid fixture) then
    (Step.Error "invalid transaction: invalid blob hash version",
      pre_transaction_state fixture)
  else if negb (transaction_blob_fee_cap_covers_base_fee fixture) then
    (Step.Error "invalid transaction: blob fee cap below blob base fee",
      pre_transaction_state fixture)
  else if negb (transaction_init_code_size_valid fixture) then
    (Step.Error "invalid transaction: init code size exceeds maximum",
      pre_transaction_state fixture)
  else if Protocol.has_osaka_opcodes fixture.(protocol) &&
          (fixture.(transaction).(Transaction.gas_limit) >? 2 ^ 24) then
    (Step.Error "invalid transaction: gas limit exceeds protocol cap", pre_transaction_state fixture)
  else if negb (transaction_has_enough_gas fixture) then
    (Step.Error "invalid transaction: gas limit below transaction minimum",
      pre_transaction_state fixture)
  else if negb (transaction_gas_price_covers_base_fee fixture) then
    (Step.Error "invalid transaction: gas price below block base fee",
      pre_transaction_state fixture)
  else if negb (transaction_has_enough_balance fixture) then
    (Step.Error "invalid transaction: insufficient sender balance",
      pre_transaction_state fixture)
  else match state_after_gas_purchase fixture with
  | None =>
    (Step.Error "invalid transaction: gas purchase failed",
      pre_transaction_state fixture)
  | Some rollback_base =>
    if fixture.(transaction).(Transaction.is_create) then
      match prepare_created_account fixture rollback_base.(State.accounts) with
      | None =>
        (Step.Error "contract creation collision",
          finalize_exceptional_transaction fixture rollback_base)
      | Some accounts =>
        let before :=
          rollback_base
            <| State.accounts := accounts |>
            <| State.created_accounts :=
              created_address fixture :: rollback_base.(State.created_accounts) |> in
	        let result :=
	          Semantics.run_with_gas
	            fixture.(steps)
	            fixture.(codes)
	            (environment fixture)
	            (frame fixture)
            before in
        rollback_top_level_contract_creation fixture rollback_base result
      end
    else
      match transfer_transaction_value fixture.(protocol)
          rollback_base.(State.accounts)
          fixture.(transaction) with
      | None =>
        (Step.Error "invalid transaction: insufficient sender balance",
          pre_transaction_state fixture)
      | Some accounts =>
        let before := rollback_base <| State.accounts := accounts |> in
        if transaction_targets_available_precompile fixture then
          run_top_level_precompile fixture rollback_base before
        else
	        let result :=
	          Semantics.run_with_gas
	            fixture.(steps)
	            fixture.(codes)
	            (environment fixture)
	            (call_frame fixture before)
            before in
        rollback_top_level_exception fixture rollback_base result
      end
  end
  end.

Definition state_after (result : Step.t * State.t) : State.t :=
  match result with
  | (_, state) => state
  end.

Definition account_in_state (state : State.t) (address : U256.t) : option Account.t :=
  Dict.get state.(State.accounts) address.

Definition account_fields_in_state
    (state : State.t)
    (address : U256.t) : option (U256.t * Z * list Z) :=
  match account_in_state state address with
  | Some account =>
    Some (account.(Account.balance), account.(Account.nonce), account.(Account.codedata))
  | None => None
  end.

Definition storage_in_state
    (state : State.t)
    (address slot : U256.t) : option U256.t :=
  match account_in_state state address with
  | Some account => Some (account.(Account.storage) slot)
  | None => None
  end.

Definition account_after (result : Step.t * State.t) (address : U256.t) : option Account.t :=
  account_in_state (state_after result) address.

Definition account_fields_after
    (result : Step.t * State.t)
    (address : U256.t) : option (U256.t * Z * list Z) :=
  account_fields_in_state (state_after result) address.

Definition storage_after
    (result : Step.t * State.t)
    (address slot : U256.t) : option U256.t :=
  storage_in_state (state_after result) address slot.

Definition balance_after (result : Step.t * State.t) (address : U256.t) : option U256.t :=
  match account_after result address with
  | Some account => Some account.(Account.balance)
  | None => None
  end.

Definition logs_after (result : Step.t * State.t) : list (list U256.t * list Z) :=
  List.map Log.materialize (state_after result).(State.logs).

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

Definition return_data_after (result : Step.t * State.t) : option (list Z) :=
  match result with
  | (Step.Halt (Halt.Return offset size), state) =>
    Some (Memory.get_bytes state.(State.memory) offset size)
  | _ => None
  end.

Definition revert_data_after (result : Step.t * State.t) : option (list Z) :=
  match result with
  | (Step.Halt (Halt.Revert offset size), state) =>
    Some (Memory.get_bytes state.(State.memory) offset size)
  | _ => None
  end.
