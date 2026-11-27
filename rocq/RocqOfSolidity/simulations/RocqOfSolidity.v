Require Import RocqOfSolidity.RocqOfSolidity.
From RocqOfSolidity Require UInt64 Vec8 Vec16.
Require RocqOfSolidity.RocqEvm.Crypto.BLAKE2b.
Require RocqOfSolidity.RocqEvm.Crypto.Keccak.
Require RocqOfSolidity.RocqEvm.Crypto.RIPEMD160.
Require RocqOfSolidity.RocqEvm.Crypto.SHA256.
Require RocqOfSolidity.RocqEvm.Crypto.KZG.
Require RocqOfSolidity.RocqEvm.Crypto.P256.
Require Import Coq.ZArith.Znumtheory.
From Bignums Require Import BigN.BigN.

(** We should probably use an existing library for the [Dict.t] definition. We have mainly two kinds
    of keys in our code:
    - [string] for variable/function names
    - [U256.t] for addresses coming from the code
*)
Module Dict.
  Definition t (K V : Set) : Set :=
    list (K * V).

  Module Valid.
    Definition t {K V : Set} (P_K : K -> Prop) (P_V : V -> Prop) (dict : Dict.t K V) : Prop :=
      List.Forall (fun '(k, v) => P_K k /\ P_V v) dict.
  End Valid.

  Module Eq.
    Class C (A : Set) : Set :=
      eqb : A -> A -> bool.

    Global Instance IZ : C Z :=
      Z.eqb.

    Global Instance IString : C string :=
      String.eqb.

    Global Instance ITuple2 {A B : Set} `{C A} `{C B} : C (A * B) :=
      fun '(a1, b1) '(a2, b2) =>
        andb (eqb a1 a2) (eqb b1 b2).
  End Eq.

  Fixpoint get {K V : Set} `{Eq.C K} (dict : t K V) (key : K) : option V :=
    match dict with
    | [] => None
    | (current_key, current_value) :: dict =>
      if Eq.eqb key current_key then
        Some current_value
      else
        get dict key
    end.

  Lemma get_is_valid {K V : Set} `{Eq.C K} P_K P_V (dict : t K V) (key : K)
      (H_dict : Valid.t P_K P_V dict) :
    match get dict key with
    | None => True
    | Some value => P_V value
    end.
  Proof.
    induction dict as [|(current_key, current_value) dict IH]; cbn; trivial.
    sauto q: on.
  Qed.

  Lemma get_map_commut {K V1 V2 : Set} `{Eq.C K}
      (dict : t K V1) (key : K) (f : V1 -> V2) :
    match get dict key with
    | None => None
    | Some value => Some (f value)
    end =
    get (List.map (fun '(k, v) => (k, f v)) dict) key.
  Proof.
    induction dict as [|(current_key, current_value) dict IH]; cbn; trivial.
    hauto q: on.
  Qed.

  Definition declare {K V : Set} (dict : t K V) (key : K) (value : V) : t K V :=
    (key, value) :: dict.

  Fixpoint assign_function {K V : Set} `{Eq.C K}
      (dict : t K V) (key : K) (f : V -> V) :
      option (t K V) :=
    match dict with
    | [] => None
    | ((current_key, current_value) as entry) :: dict =>
      if Eq.eqb current_key key then
        Some ((current_key, f current_value) :: dict)
      else
        match assign_function dict key f with
        | None => None
        | Some dict => Some (entry :: dict)
        end
    end.

  Definition assign {K V : Set} `{Eq.C K} (dict : t K V) (key : K) (value : V) :
      option (t K V) :=
    assign_function dict key (fun _ => value).

  Fixpoint declare_or_assign_function {K V : Set} `{Eq.C K}
      (dict : t K V) (key : K) (f : option V -> V) :
      t K V :=
    match dict with
    | [] => [(key, f None)]
    | ((current_key, current_value) as entry) :: dict =>
      if Eq.eqb current_key key then
        (key, f (Some current_value)) :: dict
      else
        entry :: declare_or_assign_function dict key f
    end.

  Definition declare_or_assign {K V : Set} `{Eq.C K}
      (dict : t K V) (key : K) (value : V) :
      t K V :=
    declare_or_assign_function dict key (fun _ => value).

  Lemma declare_or_assign_is_valid {K V : Set} `{Eq.C K} P_K P_V
      (dict : t K V) (key : K) (value : V)
      (H_dict : Valid.t P_K P_V dict)
      (H_key : P_K key)
      (H_value : P_V value) :
    Valid.t P_K P_V (declare_or_assign dict key value).
  Proof.
    induction dict as [|(current_key, current_value) dict IH]; cbn; sauto q: on.
  Qed.

  Lemma declare_or_assign_map_commut {K V1 V2 : Set} `{Eq.C K}
      (dict : t K V1) (key : K) (value : V1) (f : V1 -> V2) :
    List.map (fun '(k, v) => (k, f v)) (declare_or_assign dict key value) =
    declare_or_assign (List.map (fun '(k, v) => (k, f v)) dict) key (f value).
  Proof.
    induction dict as [|(current_key, current_value) dict IH]; cbn; trivial.
    hauto q: on.
  Qed.
End Dict.

(** Some additional list primitives *)
Module List.
  Fixpoint update_nth {A : Set} (l : list A) (index : nat) (x : A) : option (list A) :=
    match index, l with
    | O, h :: t => Some (x :: t)
    | S index', h :: t => 
        match update_nth t index' x with
        | Some l' => Some (h :: l')
        | None => None
        end
    | _, [] => None
    end.

  (** Like [firstn] but we guarantee to always return [n] values, filling up with [default] if the
      list is empty. *)
  Fixpoint firstn_or_default {A : Set} (n : nat) (default : A) (l : list A) : list A :=
    match n with
    | O => []
    | S n' =>
      match l with
      | [] => default :: firstn_or_default n' default []
      | x :: xs => x :: firstn_or_default n' default xs
      end
    end.
End List.

Module Locals.
  Definition t : Set :=
    list (string * U256.t).
End Locals.

Module Stack.
  Definition t : Set :=
    list Locals.t.

  Definition open_scope (stack : t) : t :=
    [] :: stack.

  Definition close_scope (stack : t) : t + string :=
    match stack with
    | [] => inr "cannot close the last scope as there are none left"
    | _ :: stack => inl stack
    end.

  Fixpoint get_var (stack : t) (name : string) : U256.t + string :=
    match stack with
    | [] => inr ("variable '" ++ name ++ "' not found")%string
    | locals :: stack =>
      match Dict.get locals name with
      | None => get_var stack name
      | Some value => inl value
      end
    end.

  Definition declare_var (stack : t) (name : string) (value : U256.t) : t + string :=
    match stack with
    | [] => inr "no scope to declare the variable"
    | locals :: stack => inl (Dict.declare locals name value :: stack)
    end.

  Fixpoint declare_vars_aux (stack : t) (names : list string) (values : list U256.t) :
      option (t + string) :=
    match names, values with
    | [], [] => Some (inl stack)
    | name :: names, value :: values =>
      match declare_var stack name value with
      | inl stack => declare_vars_aux stack names values
      | inr error => Some (inr error)
      end
    | _, _ => None
    end.

  Definition declare_vars (stack : t) (names : list string) (values : list U256.t) : t + string :=
    match declare_vars_aux stack names values with
    | Some result => result
    | None =>
      inr (
        "declare: names and values have different lengths for names: " ++
        String.concat ", " names
      )%string
    end.

  Fixpoint assign_var (stack : t) (name : string) (value : U256.t) : t + string :=
    match stack with
    | [] => inr ("variable '" ++ name ++ "' not found")%string
    | locals :: stack =>
      match Dict.assign locals name value with
      | None =>
        match assign_var stack name value with
        | inl stack => inl (locals :: stack)
        | inr error => inr error
        end
      | Some locals => inl (locals :: stack)
      end
    end.

  Fixpoint assign_vars_aux (stack : t) (names : list string) (values : list U256.t) :
      option (t + string) :=
    match names, values with
    | [], [] => Some (inl stack)
    | name :: names, value :: values =>
      match assign_var stack name value with
      | inl stack => assign_vars_aux stack names values
      | inr error => Some (inr error)
      end
    | _, _ => None
    end.

  Definition assign_vars (stack : t) (names : list string) (values : list U256.t) : t + string :=
    match assign_vars_aux stack names values with
    | Some result => result
    | None =>
      inr (
        "assign: names and values have different lengths for names: " ++
        String.concat ", " names
      )%string
    end.
End Stack.

Module Memory.
  (** We define the memory as a function instead of an explicit list as there can be holes in it. It
      goes from addresses in [U256.t] to bytes represented as [Z]. *)
  Definition t : Set :=
    U256.t -> Z.

  Inductive byte_tree : Set :=
  | Empty
  | Leaf (address : U256.t) (byte : Z)
  | Node (split : U256.t) (left_tree right_tree : byte_tree).

  Definition empty : t :=
    fun _ => 0.

  Fixpoint byte_tree_of_bytes_fuel
      (fuel : nat)
      (start : U256.t)
      (bytes : list Z) : byte_tree :=
    match fuel with
    | O => Empty
    | S fuel' =>
      match bytes with
      | [] => Empty
      | byte :: [] => Leaf start byte
      | _ =>
        let left_size := Nat.div2 (List.length bytes) in
        let split := start + Z.of_nat left_size in
        Node split
          (byte_tree_of_bytes_fuel fuel' start (List.firstn left_size bytes))
          (byte_tree_of_bytes_fuel fuel' split (List.skipn left_size bytes))
      end
    end.

  Definition byte_tree_of_bytes (start : U256.t) (bytes : list Z) : byte_tree :=
    byte_tree_of_bytes_fuel (List.length bytes) start bytes.

  Fixpoint byte_tree_lookup (tree : byte_tree) (address : U256.t) : option Z :=
    match tree with
    | Empty => None
    | Leaf current byte =>
      if address =? current then Some byte else None
    | Node split left_tree right_tree =>
      if address <? split then
        byte_tree_lookup left_tree address
      else
        byte_tree_lookup right_tree address
    end.

  (* Increment the binary address directly. Converting every unary list index
     to Z makes reading the deployed runtime code quadratic in its size. *)
  Fixpoint read_bytes (memory : t) (address : U256.t) (n : nat) (acc : list Z) : list Z :=
    match n with
    | O => List.rev_append acc []
    | S k => read_bytes memory (address + 1) k (memory address :: acc)
    end.

  Definition get_bytes (memory : t) (start length : U256.t) : list Z :=
    read_bytes memory start (Z.to_nat length) [].

  Definition update_bytes (memory : Memory.t) (start : U256.t) (bytes : list Z) : Memory.t :=
    let tree := byte_tree_of_bytes start bytes in
    fun address =>
      match byte_tree_lookup tree address with
      | Some byte => byte
      | None =>
        memory address
      end.

  Definition u256_as_bytes (value : U256.t) : list Z :=
    List.map
      (fun (i : nat) => Z.shiftr value (8 * (31 - Z.of_nat i)) mod 256)
      (List.seq 0 32).

  Definition z_as_bytes (length value : U256.t) : list Z :=
    if length <=? 0 then
      []
    else
      let n := Z.to_nat length in
      List.map
        (fun (i : nat) =>
          Z.shiftr value (8 * Z.of_nat ((n - S i)%nat)) mod 256
        )
        (List.seq 0 n).

  Fixpoint bytes_as_u256_aux (acc : Z) (bytes : list Z) : U256.t :=
    match bytes with
    | [] => acc
    | byte :: bytes =>
      bytes_as_u256_aux
        (acc * 256 + byte)
        bytes
    end.

  Definition bytes_as_u256 (bytes : list Z) : U256.t :=
    bytes_as_u256_aux 0 bytes.

  Lemma bytes_as_u256_bounds (bytes : list Z)
      (H_bytes : List.Forall (fun byte => 0 <= byte < 256) bytes) :
    0 <= bytes_as_u256 bytes < 2 ^ (8 * Z.of_nat (List.length bytes)).
  Proof.
  Admitted.

  Definition bytes_as_bytes (bytes : list Z) : list Nibble.byte :=
    List.map
      (fun (byte : Z) => Nibble.byte_of_N (Z.to_N byte))
      bytes.

  Fixpoint hex_string_as_bytes (hex_string : string) : list Z :=
    match hex_string with
    | "" => []
    | String.String a "" => [] (* this case is unexpected *)
    | String.String a (String.String b rest) =>
      match HexString.ascii_to_digit a, HexString.ascii_to_digit b with
      | Some a, Some b =>
        let byte := 16 * Z.of_N a + Z.of_N b in
        byte :: hex_string_as_bytes rest
      | _, _ => [] (* this case is unexpected *)
      end
    end.
End Memory.

Module ReturnData.
  Inductive t : Set :=
  | Bytes (bytes : list Z)
  | MemorySlice (memory : Memory.t) (offset length : U256.t).

  Definition empty : t := Bytes [].

  Definition of_bytes (bytes : list Z) : t := Bytes bytes.

  Definition of_memory (memory : Memory.t) (offset length : U256.t) : t :=
    MemorySlice memory offset length.

  Definition length (return_data : t) : U256.t :=
    match return_data with
    | Bytes bytes => Z.of_nat (List.length bytes)
    | MemorySlice _ _ length => length
    end.

  Definition get_bytes
      (return_data : t) (offset size : U256.t) : list Z :=
    match return_data with
    | Bytes bytes =>
      List.map
        (fun (i : nat) =>
          let index : nat := (Z.to_nat offset + i)%nat in
          List.nth_default 0 bytes index
        )
        (List.seq 0 (Z.to_nat size))
    | MemorySlice memory start _ =>
      Memory.get_bytes memory (start + offset) size
    end.

  Definition to_list (return_data : t) : list Z :=
    get_bytes return_data 0 (length return_data).
End ReturnData.

Module Log.
  Record t : Set := {
    topics : list U256.t;
    payload_memory : Memory.t;
    payload_offset : U256.t;
    payload_size : U256.t;
  }.

  Definition of_memory
      (topics : list U256.t)
      (memory : Memory.t)
      (offset size : U256.t) : t := {|
    topics := topics;
    payload_memory := memory;
    payload_offset := offset;
    payload_size := size;
  |}.

  Definition of_bytes (topics : list U256.t) (payload : list Z) : t :=
    of_memory topics (Memory.update_bytes Memory.empty 0 payload) 0 (Z.of_nat (List.length payload)).

  Definition materialize (log : t) : list U256.t * list Z :=
    (
      log.(topics),
      Memory.get_bytes log.(payload_memory) log.(payload_offset) log.(payload_size)
    ).
End Log.

Module Storage.
  (** Each slot in the storage is a word. This is different from [Memory.t] where it is only
      bytes. *)
  Definition t : Set :=
    U256.t -> U256.t.

  Definition empty : t :=
    fun _ => 0.

  Definition update (storage : Storage.t) (address value : U256.t) : Storage.t :=
    fun current_address =>
      if address =? current_address then
        value
      else
        storage current_address.
End Storage.

Definition transient_key (address slot : U256.t) : U256.t :=
  address * 2 ^ 256 + slot.

Fixpoint u256_in (value : U256.t) (values : list U256.t) : bool :=
  match values with
  | [] => false
  | current :: values =>
    if value =? current then
      true
    else
      u256_in value values
  end.

Definition u256_remove (value : U256.t) (values : list U256.t) : list U256.t :=
  List.filter (fun current => negb (current =? value)) values.

Definition storage_keys_after_update
    (slot value : U256.t)
    (keys : list U256.t) : list U256.t :=
  if value =? 0 then
    u256_remove slot keys
  else if u256_in slot keys then
    keys
  else
    slot :: keys.

Fixpoint bytes_after_dot (bytes : list Z) : option (list Z) :=
  match bytes with
  | [] => None
  | byte :: bytes =>
    if byte =? 46 then
      Some bytes
    else
      bytes_after_dot bytes
  end.

Definition symbolic_code_word_bytes (name : U256.t) : list Z :=
  let bytes := Memory.u256_as_bytes name in
  match bytes_after_dot bytes with
  | Some suffix => List.firstn_or_default 32 0 suffix
  | None => bytes
  end.

Fixpoint bytes_start_with (prefix bytes : list Z) : bool :=
  match prefix with
  | [] => true
  | prefix_byte :: prefix =>
    match bytes with
    | [] => false
    | byte :: bytes =>
      if prefix_byte =? byte then
        bytes_start_with prefix bytes
      else
        false
    end
  end.

Fixpoint bytes_contain (needle bytes : list Z) : bool :=
  match bytes with
  | [] => match needle with [] => true | _ => false end
  | _ :: bytes' as bytes =>
    if bytes_start_with needle bytes then
      true
    else
      bytes_contain needle bytes'
  end.

Definition is_deployed_code_name (name : U256.t) : bool :=
  bytes_contain [95; 100; 101; 112; 108; 111; 121; 101; 100] (Memory.u256_as_bytes name).

Definition current_deployed_code_bytes (code : U256.t) : list Z :=
  Memory.u256_as_bytes code ++ List.repeat 0 480.

Module CallStack.
  (** The list of functions that were called with their corresponding parameters. This is for
      debugging purpose only, and does not exist in the semantics of Yul. *)
  Definition t : Set :=
    list (string * list (string * U256.t)).
End CallStack.

Module Account.
  Record t : Set := {
    balance : U256.t;
    nonce: Z;
    code : U256.t;
    (** When calling a constructor the parameters are concatenated to the code. We represent them
        here. *)
    codedata : list Z;
    storage : Storage.t;
    storage_keys : list U256.t;
    immutables : Dict.t U256.t U256.t;
  }.
End Account.

Module State.
  (** The state contains the various kinds of memory that we use in a smart contract. *)
  Record t : Set := {
    stack : Stack.t;
    memory : Memory.t;
    return_data : ReturnData.t;
    transient_storage : Storage.t;
    gas : U256.t;
    gas_refund : Z;
    call_depth : nat;
    precompile_cache : list (U256.t * list Z * bool * list Z);
    ecrecover_cache : list (U256.t * U256.t * U256.t * bool * Z * Z * Z * Z * Z);
    warm_addresses : list U256.t;
    warm_storage_keys : list (U256.t * U256.t);
    original_accounts : list (U256.t * Account.t);
    is_static : bool;
    block_number : U256.t;
    block_timestamp : U256.t;
    created_accounts : list U256.t;
    selfdestructed_created_accounts : list U256.t;
    accounts : list (U256.t * Account.t);
    logs : list Log.t;
    (** This is only for debugging *)
    call_stack : CallStack.t;
  }.

  Definition init : State.t :=
    {|
      State.stack := [];
      State.memory := Memory.empty;
      State.return_data := ReturnData.empty;
      State.transient_storage := Memory.empty;
      State.gas := 1000000000;
      State.gas_refund := 0;
      State.call_depth := 0%nat;
      State.precompile_cache := [];
      State.ecrecover_cache := [];
      State.warm_addresses := [];
      State.warm_storage_keys := [];
      State.original_accounts := [];
      State.is_static := false;
      State.block_number := 0;
      State.block_timestamp := 0;
      State.created_accounts := [];
      State.selfdestructed_created_accounts := [];
      State.accounts := [];
      State.logs := [];
      State.call_stack := [];
    |}.
End State.

Definition max_call_depth : nat := 1024%nat.

Definition call_depth_exceeded (state : State.t) : bool :=
  Nat.leb max_call_depth state.(State.call_depth).

(** Compute a selector from the signature of an entrypoint *)
Definition get_selector (entrypoint_name : string) : U256.t :=
  let hash : list Nibble.byte := RocqEvm.Crypto.Keccak.keccak_256_of_string entrypoint_name in
  let hash : list Z := (List.map (fun byte => Z.of_N (Nibble.N_of_byte byte))) hash in
  Memory.bytes_as_u256 (List.firstn 4 hash).

Goal get_selector "transfer()" = 0x8a4068dd.
Proof. reflexivity. Qed.

Module StdlibAux.
  Definition get_signed_value (value : U256.t) : Z :=
    ((value + (2 ^ 255)) mod (2 ^ 256)) - (2 ^ 255).

  Goal List.map get_signed_value [0; 10; (2 ^ 256) - 3] = [0; 10; -3].
  Proof. reflexivity. Qed.

  Definition keccak256 (bytes : list U256.t) : U256.t :=
    let bytes := Memory.bytes_as_bytes bytes in
    let hash : list Nibble.byte := RocqEvm.Crypto.Keccak.keccak_256 bytes in
    let hash : list Z := List.map (fun byte => Z.of_N (Nibble.N_of_byte byte)) hash in
    Memory.bytes_as_u256 hash.

  Fixpoint drop_leading_zeroes (bytes : list Z) : list Z :=
    match bytes with
    | [] => []
    | 0 :: bytes => drop_leading_zeroes bytes
    | _ => bytes
    end.

  Definition rlp_integer (value : U256.t) : list Z :=
    let bytes := drop_leading_zeroes (Memory.u256_as_bytes value) in
    match bytes with
    | [] => [128]
    | [byte] =>
      if byte <? 128 then
        [byte]
      else
        [129; byte]
    | _ => [128 + Z.of_nat (List.length bytes)] ++ bytes
    end.

  Definition low_160_bits_as_bytes (value : U256.t) : list Z :=
    List.skipn 12 (Memory.u256_as_bytes value).

  Definition address_of_word (value : U256.t) : U256.t :=
    Z.land ((2 ^ 160) - 1) value.

  Definition contract_creation_address (creator nonce : U256.t) : U256.t :=
    let payload :=
      [148] ++ low_160_bits_as_bytes creator ++ rlp_integer nonce in
    let encoded := [192 + Z.of_nat (List.length payload)] ++ payload in
    address_of_word (keccak256 encoded).

  Definition crypto_bytes_as_z (bytes : list Nibble.byte) : list Z :=
    List.map (fun byte => Z.of_N (Nibble.N_of_byte byte)) bytes.

  Fixpoint bytes_eqb (bytes1 bytes2 : list Z) : bool :=
    match bytes1, bytes2 with
    | [], [] => true
    | byte1 :: bytes1, byte2 :: bytes2 =>
      andb (byte1 =? byte2) (bytes_eqb bytes1 bytes2)
    | _, _ => false
    end.

  Definition bytes_slice_with_zero_padding
      (bytes : list Z) (offset size : U256.t) : list Z :=
    if size <=? 0 then
      []
    else if offset >=? Z.of_nat (List.length bytes) then
      List.firstn_or_default (Z.to_nat size) 0 []
    else
      List.firstn_or_default
        (Z.to_nat size)
        0
        (List.skipn (Z.to_nat offset) bytes).

  Definition get_calldata_u256 (calldata : list Z) (index : U256.t) : U256.t :=
    let bytes := bytes_slice_with_zero_padding calldata index 32 in
    Memory.bytes_as_u256 bytes.

  Lemma get_calldata_u256_is_valid (calldata : list Z) (index : U256.t)
      (H_calldata : List.Forall (fun byte => 0 <= byte < 256) calldata) :
    U256.Valid.t (get_calldata_u256 calldata index).
  Proof.
  Admitted.
End StdlibAux.

Module Stdlib.
  (** The pure functions from the stdlib. *)
  Module Pure.
    Definition add (x y : U256.t) : U256.t :=
      (x + y) mod (2 ^ 256).

    Definition sub (x y : U256.t) : U256.t :=
      (x - y) mod (2 ^ 256).

    Definition mul (x y : U256.t) : U256.t :=
      (x * y) mod (2 ^ 256).

    Definition div (x y : U256.t) : U256.t :=
      if y =? 0 then
        0
      else
        x / y.

    Definition sdiv (x y : U256.t) : U256.t :=
      if y =? 0 then
        0
      else
        let x := StdlibAux.get_signed_value x in
        let y := StdlibAux.get_signed_value y in
        let result := Z.quot x y in
        result mod (2 ^ 256).

    Definition mod_ (x y : U256.t) : U256.t :=
      if y =? 0 then
        0
      else
        x mod y.

    Definition smod (a b : Z) : U256.t :=
      let a := StdlibAux.get_signed_value a in
      let b := StdlibAux.get_signed_value b in
      if b =? 0 then
        0
      else
        (Z.rem a b) mod (2 ^ 256).

    Goal List.map (fun '(x, y) => smod x y)
      [(10, 3); (10, 0); (10, 10); (2^256 -8, 2^256 -3); (7, 5); (7, 2^256 -5)] =
      [1; 0; 0; 2^256 -2; 2; 2].
    Proof. vm_compute. reflexivity. Qed.

    Fixpoint exp_mod_aux (fuel : nat) (base exponent acc : U256.t) : U256.t :=
      match fuel with
      | O => acc
      | S fuel' =>
        if exponent =? 0 then
          acc
        else
          let acc :=
            if Z.odd exponent then
              (acc * base) mod (2 ^ 256)
            else
              acc in
          exp_mod_aux fuel' ((base * base) mod (2 ^ 256)) (Z.shiftr exponent 1) acc
      end.

    Definition exp (x y : U256.t) : U256.t :=
      exp_mod_aux 256%nat (x mod (2 ^ 256)) y 1.

    Fixpoint pow_mod_aux (fuel : nat) (modulus base exponent acc : Z) : Z :=
      match fuel with
      | O => acc
      | S fuel' =>
        if exponent =? 0 then
          acc
        else
          let acc :=
            if Z.odd exponent then
              (acc * base) mod modulus
            else
              acc in
          pow_mod_aux fuel' modulus
            ((base * base) mod modulus)
            (Z.shiftr exponent 1)
            acc
      end.

    Definition pow_mod (base exponent modulus : Z) : Z :=
      if modulus =? 0 then
        0
      else
        pow_mod_aux
          (if exponent <=? 0 then 0%nat else Z.to_nat (Z.log2 exponent + 1))
          modulus
          (base mod modulus)
          exponent
          (1 mod modulus).

    Fixpoint bytes_as_z_mod_aux (modulus acc : Z) (bytes : list Z) : Z :=
      match bytes with
      | [] => acc
      | byte :: bytes =>
        bytes_as_z_mod_aux modulus ((acc * 256 + byte) mod modulus) bytes
      end.

    Definition bytes_as_z_mod (modulus : Z) (bytes : list Z) : Z :=
      if modulus =? 0 then
        0
      else
        bytes_as_z_mod_aux modulus 0 bytes.

    Fixpoint pow_mod_table_aux
        (fuel : nat) (modulus base current : Z) : list Z :=
      match fuel with
      | O => []
      | S fuel' =>
        current :: pow_mod_table_aux fuel' modulus base ((current * base) mod modulus)
      end.

    Definition pow_mod_table (modulus base : Z) : list Z :=
      pow_mod_table_aux 16%nat modulus base (1 mod modulus).

    Fixpoint pow_mod_square_aux (fuel : nat) (modulus acc : Z) : Z :=
      match fuel with
      | O => acc
      | S fuel' =>
        pow_mod_square_aux fuel' modulus ((acc * acc) mod modulus)
      end.

    Definition pow_mod_nibble
        (table : list Z) (modulus acc : Z) (started : bool) (nibble : Z)
        : Z * bool :=
      if started then
        let acc := pow_mod_square_aux 4%nat modulus acc in
        if nibble =? 0 then
          (acc, true)
        else
          ((acc * List.nth_default 0 table (Z.to_nat nibble)) mod modulus, true)
      else if nibble =? 0 then
        (acc, false)
      else
        (List.nth_default 0 table (Z.to_nat nibble), true).

    Definition pow_mod_byte
        (table : list Z) (modulus acc : Z) (started : bool) (byte : Z)
        : Z * bool :=
      let byte := byte mod 256 in
      let high_nibble := Z.shiftr byte 4 in
      let low_nibble := byte mod 16 in
      let '(acc, started) :=
        pow_mod_nibble table modulus acc started high_nibble in
      pow_mod_nibble table modulus acc started low_nibble.

    Fixpoint pow_mod_bytes_aux
        (table : list Z) (modulus acc : Z) (started : bool) (exponent : list Z) : Z :=
      match exponent with
      | [] => acc
      | byte :: exponent =>
        let '(acc, started) :=
          pow_mod_byte table modulus acc started byte in
        pow_mod_bytes_aux table modulus acc started exponent
      end.

    Definition pow_mod_bytes (base exponent : list Z) (modulus : Z) : Z :=
      if modulus =? 0 then
        0
      else
        let base := bytes_as_z_mod modulus base in
        let table := pow_mod_table modulus base in
        pow_mod_bytes_aux table modulus (1 mod modulus) false exponent.

    Definition bigN_of_byte (byte : Z) : BigN.t :=
      BigN.of_N (Z.to_N (byte mod 256)).

    Definition bigN_256 : BigN.t :=
      BigN.of_N 256%N.

    Fixpoint bytes_as_bigN_aux (acc : BigN.t) (bytes : list Z) : BigN.t :=
      match bytes with
      | [] => acc
      | byte :: bytes =>
        bytes_as_bigN_aux
          (BigN.add (BigN.mul acc bigN_256) (bigN_of_byte byte))
          bytes
      end.

    Definition bytes_as_bigN (bytes : list Z) : BigN.t :=
      bytes_as_bigN_aux BigN.zero bytes.

    Fixpoint bytes_as_bigN_mod_aux
        (modulus acc : BigN.t) (bytes : list Z) : BigN.t :=
      match bytes with
      | [] => acc
      | byte :: bytes =>
        bytes_as_bigN_mod_aux modulus
          (BigN.modulo
            (BigN.add (BigN.mul acc bigN_256) (bigN_of_byte byte))
            modulus)
          bytes
      end.

    Definition bytes_as_bigN_mod (modulus : BigN.t) (bytes : list Z) : BigN.t :=
      if BigN.eqb modulus BigN.zero then
        BigN.zero
      else
        bytes_as_bigN_mod_aux modulus BigN.zero bytes.

    Fixpoint pow_mod_bigN_table_aux
        (fuel : nat) (modulus base current : BigN.t) : list BigN.t :=
      match fuel with
      | O => []
      | S fuel' =>
        current ::
        pow_mod_bigN_table_aux fuel' modulus base
          (BigN.modulo (BigN.mul current base) modulus)
      end.

    Definition pow_mod_bigN_table (modulus base : BigN.t) : list BigN.t :=
      pow_mod_bigN_table_aux 16%nat modulus base (BigN.modulo BigN.one modulus).

    Fixpoint pow_mod_bigN_square_aux
        (fuel : nat) (modulus acc : BigN.t) : BigN.t :=
      match fuel with
      | O => acc
      | S fuel' =>
        pow_mod_bigN_square_aux fuel' modulus
          (BigN.modulo (BigN.square acc) modulus)
      end.

    Definition pow_mod_bigN_nibble
        (table : list BigN.t) (modulus acc : BigN.t)
        (started : bool) (nibble : Z) : BigN.t * bool :=
      if started then
        let acc := pow_mod_bigN_square_aux 4%nat modulus acc in
        if nibble =? 0 then
          (acc, true)
        else
          (BigN.modulo
            (BigN.mul acc (List.nth_default BigN.zero table (Z.to_nat nibble)))
            modulus, true)
      else if nibble =? 0 then
        (acc, false)
      else
        (List.nth_default BigN.zero table (Z.to_nat nibble), true).

    Definition pow_mod_bigN_byte
        (table : list BigN.t) (modulus acc : BigN.t)
        (started : bool) (byte : Z) : BigN.t * bool :=
      let byte := byte mod 256 in
      let high_nibble := Z.shiftr byte 4 in
      let low_nibble := byte mod 16 in
      let '(acc, started) :=
        pow_mod_bigN_nibble table modulus acc started high_nibble in
      pow_mod_bigN_nibble table modulus acc started low_nibble.

    Fixpoint pow_mod_bigN_bytes_aux
        (table : list BigN.t) (modulus acc : BigN.t)
        (started : bool) (exponent : list Z) : BigN.t :=
      match exponent with
      | [] => acc
      | byte :: exponent =>
        let '(acc, started) :=
          pow_mod_bigN_byte table modulus acc started byte in
        pow_mod_bigN_bytes_aux table modulus acc started exponent
      end.

    Definition pow_mod_bigN_bytes
        (base exponent : list Z) (modulus : BigN.t) : BigN.t :=
      if BigN.eqb modulus BigN.zero then
        BigN.zero
      else
        let base := bytes_as_bigN_mod modulus base in
        let table := pow_mod_bigN_table modulus base in
        pow_mod_bigN_bytes_aux table modulus (BigN.modulo BigN.one modulus) false exponent.

    Definition pow_mod_bytes_bigN (base exponent : list Z) (modulus : Z) : Z :=
      if modulus =? 0 then
        0
      else
        BigN.to_Z
          (pow_mod_bigN_bytes base exponent (BigN.of_N (Z.to_N modulus))).

    Definition bytes_as_uint64_le (bytes : list Z) : UInt64.t :=
      UInt64.uint64_of_Z_mod
        (Memory.bytes_as_u256 (List.rev (List.firstn_or_default 8 0 bytes))).

    Definition bytes_as_uint64_be (bytes : list Z) : UInt64.t :=
      UInt64.uint64_of_Z_mod
        (Memory.bytes_as_u256 bytes).

    Definition uint64_le_bytes_as_z (value : UInt64.t) : list Z :=
      let '(b0, b1, b2, b3, b4, b5, b6, b7) :=
        UInt64.uint64_to_le_bytes value in
      StdlibAux.crypto_bytes_as_z [b0; b1; b2; b3; b4; b5; b6; b7].

    Definition blake2f_uint64_at (input : list Z) (offset : U256.t) : UInt64.t :=
      bytes_as_uint64_le (StdlibAux.bytes_slice_with_zero_padding input offset 8).

    Definition blake2f_h (input : list Z) : Vec8.t UInt64.t :=
      Vec8.Vec8
        (blake2f_uint64_at input 4)
        (blake2f_uint64_at input 12)
        (blake2f_uint64_at input 20)
        (blake2f_uint64_at input 28)
        (blake2f_uint64_at input 36)
        (blake2f_uint64_at input 44)
        (blake2f_uint64_at input 52)
        (blake2f_uint64_at input 60).

    Definition blake2f_m (input : list Z) : Vec16.t UInt64.t :=
      Vec16.Vec16
        (blake2f_uint64_at input 68)
        (blake2f_uint64_at input 76)
        (blake2f_uint64_at input 84)
        (blake2f_uint64_at input 92)
        (blake2f_uint64_at input 100)
        (blake2f_uint64_at input 108)
        (blake2f_uint64_at input 116)
        (blake2f_uint64_at input 124)
        (blake2f_uint64_at input 132)
        (blake2f_uint64_at input 140)
        (blake2f_uint64_at input 148)
        (blake2f_uint64_at input 156)
        (blake2f_uint64_at input 164)
        (blake2f_uint64_at input 172)
        (blake2f_uint64_at input 180)
        (blake2f_uint64_at input 188).

    Definition blake2f_rounds (input : list Z) : UInt64.t :=
      bytes_as_uint64_be
        (StdlibAux.bytes_slice_with_zero_padding input 0 4).

    Definition blake2f_output_with_final
        (input : list Z) (final : bool) : list Z :=
      let output :=
        RocqEvm.Crypto.BLAKE2b.F
          (blake2f_h input)
          (blake2f_m input)
          (blake2f_uint64_at input 196)
          (blake2f_uint64_at input 204)
          final
          (blake2f_rounds input) in
      List.concat (List.map uint64_le_bytes_as_z (Vec8.to_list output)).

    Definition blake2f_output (input : list Z) : option (list Z) :=
      if Z.of_nat (List.length input) =? 213 then
        match List.nth_error input 212 with
        | Some 0 => Some (blake2f_output_with_final input false)
        | Some 1 => Some (blake2f_output_with_final input true)
        | _ => None
        end
      else
        None.

    Definition not (x : U256.t) : U256.t :=
      2^256 - x - 1.

    Definition lt (x y : U256.t) : U256.t :=
      if x <? y then
        1
      else
        0.

    Definition gt (x y : U256.t) : U256.t :=
      if x >? y then
        1
      else
        0.

    (* Signed version of [lt] *)
    Definition slt (x y : U256.t) : U256.t :=
      let x := (x + 2 ^ 255) mod (2 ^ 256) in
      let y := (y + 2 ^ 255) mod (2 ^ 256) in
      lt x y.

    Definition sgt (x y : U256.t) : U256.t :=
      let x := (x + 2 ^ 255) mod (2 ^ 256) in
      let y := (y + 2 ^ 255) mod (2 ^ 256) in
      gt x y.

    Definition eq (x y : U256.t) : U256.t :=
      if x =? y then
        1
      else
        0.

    Definition iszero (x : U256.t) : U256.t :=
      if x =? 0 then
        1
      else
        0.

    Definition and (x y : U256.t) : U256.t :=
      Z.land x y.

    Definition or (x y : U256.t) : U256.t :=
      Z.lor x y.

    Definition xor (x y : U256.t) : U256.t :=
      Z.lxor x y.

    Definition byte (n x : U256.t) : U256.t :=
      (x / (256 ^ (31 - n))) mod 256.

    Definition shl (x y : U256.t) : U256.t :=
      if x >=? 256 then
        0
      else
        (y * (2 ^ x)) mod (2 ^ 256).

    Definition shr (x y : U256.t) : U256.t :=
      if x >=? 256 then
        0
      else
        y / (2 ^ x).

    Definition sar (shift : U256.t) (value : U256.t) : U256.t :=
      let signed_value := StdlibAux.get_signed_value value in
      if shift >=? 256 then
        if signed_value <? 0 then
          2 ^ 256 - 1
        else
          0
      else
        let shifted_value := Z.shiftr signed_value shift in
        shifted_value mod (2 ^ 256).

    Definition test_sar :=
      let test_cases := [
        (* Test case 1: shift right by 0 *)
        (0, 123456789, 123456789);
        (* Test case 2: shift right by 1 *)
        (1, 123456789, 61728394);
        (* Test case 3: shift right by 8 *)
        (8, 123456789, 482253);
        (* Test case 4: shift right by 16 *)
        (16, 123456789, 1883);
        (* Test case 5: shift right by 31 *)
        (31, 123456789, 0);
        (* Test case 6: shift right by 0 for a negative number *)
        (0, -123456789 mod (2 ^ 256), -123456789 mod (2 ^ 256));
        (* Test case 7: shift right by 1 for a negative number *)
        (1, -123456789 mod (2 ^ 256), -61728395 mod (2 ^ 256));
        (* Test case 8: shift right by 8 for a negative number *)
        (8, -123456789 mod (2 ^ 256), -482254 mod (2 ^ 256));
        (* Test case 9: shift right by 16 for a negative number *)
        (16, -123456789 mod (2 ^ 256), -1884 mod (2 ^ 256));
        (* Test case 10: shift right by 31 for a negative number *)
        (31, -123456789 mod (2 ^ 256), -1 mod (2 ^ 256))
      ] in
      List.forallb (fun '(shift, value, expected) =>
        let result := Stdlib.Pure.sar shift value in
        result =? expected
      ) test_cases.

    Goal test_sar = true.
    Proof. reflexivity. Qed.

    Definition addmod (x y m : U256.t) : U256.t :=
      (x + y) mod m.

    Definition mulmod (x y m : U256.t) : U256.t :=
      (x * y) mod m.

    Definition signextend (i x : Z) : U256.t :=
      if i >=? 31 then
        x
      else
        let size := 8 * (i + 1) in
        let byte := (x / 2 ^ (8 * i)) mod 256 in
        let sign_bit := byte / 128 in
        let extend_bit (bit size : Z) : Z :=
          if bit =? 1 then
            (2 ^ 256) - (2 ^ size)
          else
            0 in
        (x mod (2 ^ size)) + extend_bit sign_bit size.

    Fixpoint clz_aux (remaining : nat) (x : U256.t) : U256.t :=
      match remaining with
      | O => 0
      | S remaining' =>
        if x <? 2 ^ Z.of_nat remaining' then
          1 + clz_aux remaining' x
        else
          0
      end.

    Definition clz (x : U256.t) : U256.t :=
      clz_aux 256%nat x.
  End Pure.

  Definition stop : M.t unit :=
    LowM.Pure (Result.Return 0 0).

  Definition add (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.add x y).

  Definition sub (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.sub x y).

  Definition mul (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.mul x y).

  Definition div (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.div x y).

  Definition sdiv (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.sdiv x y).

  Definition mod_ (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.mod_ x y).

  Definition smod (a b : Z) : M.t U256.t :=
    M.pure (Pure.smod a b).

  Definition exp (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.exp x y).

  Definition not (x : U256.t) : M.t U256.t :=
    M.pure (Pure.not x).

  Definition lt (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.lt x y).

  Definition gt (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.gt x y).

  (* Signed version of [lt] *)
  Definition slt (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.slt x y).

  Definition sgt (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.sgt x y).

  Definition eq (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.eq x y).

  Definition iszero (x : U256.t) : M.t U256.t :=
    M.pure (Pure.iszero x).

  Definition and (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.and x y).

  Definition or (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.or x y).

  Definition xor (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.xor x y).

  Definition byte (n x : U256.t) : M.t U256.t :=
    M.pure (Pure.byte n x).

  Definition shl (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.shl x y).

  Definition shr (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.shr x y).

  Definition sar (x y : U256.t) : M.t U256.t :=
    M.pure (Pure.sar x y).

  Definition addmod (x y m : U256.t) : M.t U256.t :=
    M.pure (Pure.addmod x y m).

  Definition mulmod (x y m : U256.t) : M.t U256.t :=
    M.pure (Pure.mulmod x y m).

  Definition signextend (i x : Z) : M.t U256.t :=
    M.pure (Pure.signextend i x).

  Definition clz (x : U256.t) : M.t U256.t :=
    M.pure (Pure.clz x).

  Definition keccak256 (p n : U256.t) : M.t U256.t :=
    let* bytes := LowM.Primitive (Primitive.MLoad p n) M.pure in
    M.pure (StdlibAux.keccak256 bytes).

  Definition pc : M.t U256.t :=
    LowM.Impossible "pc".

  Definition pop (x : U256.t) : M.t unit :=
    M.pure tt.

  Definition mload (address : U256.t) : M.t U256.t :=
    let* bytes := LowM.Primitive (Primitive.MLoad address 32) M.pure in
    M.pure (Memory.bytes_as_u256 bytes).

  Definition mstore (address value : U256.t) : M.t unit :=
    let bytes := Memory.u256_as_bytes value in
    LowM.Primitive (Primitive.MStore address bytes) M.pure.

  Definition mstore8 (address value : U256.t) : M.t unit :=
    let bytes := [value mod 256] in
    LowM.Primitive (Primitive.MStore address bytes) M.pure.

  Definition sload (address : U256.t) : M.t U256.t :=
    LowM.Primitive (Primitive.SLoad address) M.pure.

  Definition sstore (address value : U256.t) : M.t unit :=
    LowM.Primitive (Primitive.SStore address value) M.pure.

  Definition tload (address : U256.t) : M.t U256.t :=
    LowM.Primitive (Primitive.TLoad address) M.pure.

  Definition tstore (address value : U256.t) : M.t unit :=
    LowM.Primitive (Primitive.TStore address value) M.pure.

  Definition msize : M.t U256.t :=
    LowM.Impossible "msize".

  Definition gas : M.t U256.t :=
    LowM.Primitive Primitive.GetGas M.pure.

  Definition address : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    M.pure environment.(Environment.address).

  Definition balance (a : U256.t) : M.t U256.t :=
    LowM.Primitive (Primitive.GetBalance a) M.pure.

  Definition selfbalance : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    let* balance := balance environment.(Environment.address) in
    M.pure balance.

  Definition caller : M.t U256.t :=
    LowM.Primitive Primitive.GetEnvironment (fun env => M.pure env.(Environment.caller)).

  Definition callvalue : M.t U256.t :=
    LowM.Primitive Primitive.GetEnvironment (fun env => M.pure env.(Environment.callvalue)).

  Definition calldataload (p : U256.t) : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    let calldata := environment.(Environment.calldata) in
    M.pure (StdlibAux.get_calldata_u256 calldata p).

  Definition calldatasize : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    M.pure (Z.of_nat (List.length environment.(Environment.calldata))).

  Definition calldatacopy (t f s : U256.t) : M.t unit :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    let calldata := environment.(Environment.calldata) in
    let bytes : list Z :=
      List.map
        (fun (i : nat) =>
          let address : nat := (Z.to_nat f + i)%nat in
          List.nth_default 0 calldata address
        )
        (List.seq 0 (Z.to_nat s)) in
    LowM.Primitive (Primitive.MStore t bytes) M.pure.

  Definition codesize : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    if is_deployed_code_name environment.(Environment.code_name) then
      M.pure 48
    else
      let address := environment.(Environment.address) in
      let* codedata := LowM.Primitive (Primitive.GetCodedata address) M.pure in
      M.pure (32 + Z.of_nat (List.length codedata)).

  (** There are two kinds of code copy that we handle: either to copy actual code, or
      to copy the constructor's parameters that are stored just after the code of the
      constructor. *)
  Definition codecopy (t f s : U256.t) : M.t unit :=
    (* code case *)
    if f mod (2^256) =? 0 then
      if s =? 32 then
        let raw_name : U256.t := f / (2^256) in
        let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
        let name :=
          if raw_name =? 0 then
            environment.(Environment.code_name)
          else
            raw_name in
        let bytes := symbolic_code_word_bytes name in
        LowM.Primitive (Primitive.MStore t bytes) M.pure
      else
        LowM.Impossible "codecopy: s must be 32 for the code case"
    (* codedata case *)
    else if f mod (2^256) =? 32 then
      let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
      let* codedata :=
        LowM.Primitive (Primitive.GetCodedata environment.(Environment.address)) M.pure in
      if s =? Z.of_nat (List.length codedata) then
        LowM.Primitive (Primitive.MStore t codedata) M.pure
      else
        LowM.Impossible "codecopy: s must be the length of the codedata for the codedata case"
    else
      LowM.Impossible "codecopy: f mod (2^256) must be 0 or 32".

  Definition extcodesize (a : U256.t) : M.t U256.t :=
    let* code_bytes := LowM.Primitive (Primitive.GetCodeBytes a) M.pure in
    M.pure (Z.of_nat (List.length code_bytes)).

  Definition extcodecopy (a t f s : U256.t) : M.t unit :=
    let* code_bytes := LowM.Primitive (Primitive.GetCodeBytes a) M.pure in
    let bytes := StdlibAux.bytes_slice_with_zero_padding code_bytes f s in
    LowM.Primitive (Primitive.MStore t bytes) M.pure.

  Definition returndatasize : M.t U256.t :=
    let* return_data := LowM.Primitive Primitive.RLoad M.pure in
    M.pure (Z.of_nat (List.length return_data)).

  Definition returndatacopy (t f s : U256.t) : M.t unit :=
    let* return_data := LowM.Primitive Primitive.RLoad M.pure in
    let bytes : list Z :=
      List.map
        (fun (i : nat) =>
          let index : nat := (Z.to_nat f + i)%nat in
          List.nth_default 0 return_data index
        )
        (List.seq 0 (Z.to_nat s)) in
    LowM.Primitive (Primitive.MStore t bytes) M.pure.

  Definition mcopy (t f s : U256.t) : M.t unit :=
    let* bytes := LowM.Primitive (Primitive.MLoad f s) M.pure in
    LowM.Primitive (Primitive.MStore t bytes) M.pure.

  Definition extcodehash (a : U256.t) : M.t U256.t :=
    let* account_exists := LowM.Primitive (Primitive.AccountExists a) M.pure in
    if account_exists then
      let* code_bytes := LowM.Primitive (Primitive.GetCodeBytes a) M.pure in
      M.pure (StdlibAux.keccak256 code_bytes)
    else if andb (1 <=? a) (a <=? 8) then
      M.pure (StdlibAux.keccak256 [])
    else
      M.pure 0.

  Definition pad_left (n : nat) (bytes : list Z) : list Z :=
    List.repeat 0 n ++ bytes.

  Fixpoint pow_mod_aux
      (fuel : nat)
      (base exponent modulus acc : Z) : Z :=
    match fuel with
    | O => acc mod modulus
    | S fuel' =>
      if exponent =? 0 then
        acc mod modulus
      else
        let acc :=
          if Z.odd exponent then
            (acc * base) mod modulus
          else
            acc in
        let base := (base * base) mod modulus in
        pow_mod_aux fuel' base (Z.shiftr exponent 1) modulus acc
    end.

  Definition pow_mod (base exponent modulus : Z) : Z :=
    if modulus <=? 0 then
      0
    else
      pow_mod_aux 512%nat (base mod modulus) exponent modulus 1.

  Definition inv_mod (modulus x : Z) : option Z :=
    let '(u, _v, d) := extgcd (x mod modulus) modulus in
    if d =? 1 then Some (u mod modulus) else None.

  Definition secp256k1_field_modulus : Z :=
    115792089237316195423570985008687907853269984665640564039457584007908834671663.

  Definition secp256k1_group_order : Z :=
    115792089237316195423570985008687907852837564279074904382605163141518161494337.

  Definition secp256k1_gx : Z :=
    55066263022277343669578718895168534326250603453777594175500187360389116729240.

  Definition secp256k1_gy : Z :=
    32670510020758816978083085130507043184471273380659243275938904335757337482424.

  Definition secp256k1_point : Set := Z * Z.

  Definition secp256k1_infinity (point : secp256k1_point) : bool :=
    let '(x, y) := point in
    (x =? 0) && (y =? 0).

  Definition secp256k1_field (x : Z) : bool :=
    (0 <=? x) && (x <? secp256k1_field_modulus).

  Definition secp256k1_scalar (x : Z) : bool :=
    (0 <? x) && (x <? secp256k1_group_order).

  Definition secp256k1_mod (x : Z) : Z :=
    x mod secp256k1_field_modulus.

  Definition secp256k1_on_curve (point : secp256k1_point) : bool :=
    let '(x, y) := point in
    if secp256k1_infinity point then
      true
    else
      secp256k1_field x && secp256k1_field y &&
      ((y * y - (x * x * x + 7)) mod secp256k1_field_modulus =? 0).

  Definition secp256k1_neg (point : secp256k1_point) : secp256k1_point :=
    let '(x, y) := point in
    if secp256k1_infinity point then
      point
    else
      (x, secp256k1_mod (- y)).

  Definition secp256k1_add_valid
      (point1 point2 : secp256k1_point) : option secp256k1_point :=
    let '(x1, y1) := point1 in
    let '(x2, y2) := point2 in
    if secp256k1_infinity point1 then
      Some point2
    else if secp256k1_infinity point2 then
      Some point1
    else if x1 =? x2 then
      if ((y1 + y2) mod secp256k1_field_modulus =? 0) then
        Some (0, 0)
      else
        match inv_mod secp256k1_field_modulus (2 * y1) with
        | None => None
        | Some denominator_inv =>
          let slope := secp256k1_mod (3 * x1 * x1 * denominator_inv) in
          let x3 := secp256k1_mod (slope * slope - x1 - x2) in
          let y3 := secp256k1_mod (slope * (x1 - x3) - y1) in
          Some (x3, y3)
        end
    else
      match inv_mod secp256k1_field_modulus (x2 - x1) with
      | None => None
      | Some denominator_inv =>
        let slope := secp256k1_mod ((y2 - y1) * denominator_inv) in
        let x3 := secp256k1_mod (slope * slope - x1 - x2) in
        let y3 := secp256k1_mod (slope * (x1 - x3) - y1) in
        Some (x3, y3)
      end.

  Definition secp256k1_add
      (point1 point2 : secp256k1_point) : option secp256k1_point :=
    if secp256k1_on_curve point1 && secp256k1_on_curve point2 then
      secp256k1_add_valid point1 point2
    else
      None.

  Definition secp256k1_jacobian_point : Set := Z * Z * Z.

  Definition secp256k1_jacobian_infinity
      (point : secp256k1_jacobian_point) : bool :=
    let '(_x, _y, z) := point in
    z =? 0.

  Definition secp256k1_jacobian_infinity_point : secp256k1_jacobian_point :=
    (0, 1, 0).

  Definition secp256k1_affine_to_jacobian
      (point : secp256k1_point) : secp256k1_jacobian_point :=
    let '(x, y) := point in
    if secp256k1_infinity point then
      secp256k1_jacobian_infinity_point
    else
      (x, y, 1).

  Definition secp256k1_jacobian_double
      (point : secp256k1_jacobian_point) : secp256k1_jacobian_point :=
    let '(x, y, z) := point in
    if secp256k1_jacobian_infinity point || (y =? 0) then
      secp256k1_jacobian_infinity_point
    else
      let yy := secp256k1_mod (y * y) in
      let yyyy := secp256k1_mod (yy * yy) in
      let s := secp256k1_mod (4 * x * yy) in
      let m := secp256k1_mod (3 * x * x) in
      let x3 := secp256k1_mod (m * m - 2 * s) in
      let y3 := secp256k1_mod (m * (s - x3) - 8 * yyyy) in
      let z3 := secp256k1_mod (2 * y * z) in
      (x3, y3, z3).

  Definition secp256k1_jacobian_add
      (point1 point2 : secp256k1_jacobian_point) : secp256k1_jacobian_point :=
    if secp256k1_jacobian_infinity point1 then
      point2
    else if secp256k1_jacobian_infinity point2 then
      point1
    else
      let '(x1, y1, z1) := point1 in
      let '(x2, y2, z2) := point2 in
      let z1z1 := secp256k1_mod (z1 * z1) in
      let z2z2 := secp256k1_mod (z2 * z2) in
      let u1 := secp256k1_mod (x1 * z2z2) in
      let u2 := secp256k1_mod (x2 * z1z1) in
      let s1 := secp256k1_mod (y1 * z2 * z2z2) in
      let s2 := secp256k1_mod (y2 * z1 * z1z1) in
      if u1 =? u2 then
        if s1 =? s2 then
          secp256k1_jacobian_double point1
        else
          secp256k1_jacobian_infinity_point
      else
        let h := secp256k1_mod (u2 - u1) in
        let i := secp256k1_mod ((2 * h) * (2 * h)) in
        let j := secp256k1_mod (h * i) in
        let r := secp256k1_mod (2 * (s2 - s1)) in
        let v := secp256k1_mod (u1 * i) in
        let x3 := secp256k1_mod (r * r - j - 2 * v) in
        let y3 := secp256k1_mod (r * (v - x3) - 2 * s1 * j) in
        let z3 :=
          secp256k1_mod (((z1 + z2) * (z1 + z2) - z1z1 - z2z2) * h) in
        (x3, y3, z3).

  Definition secp256k1_jacobian_add_affine
      (point1 : secp256k1_jacobian_point)
      (point2 : secp256k1_point) : secp256k1_jacobian_point :=
    if secp256k1_jacobian_infinity point1 then
      secp256k1_affine_to_jacobian point2
    else if secp256k1_infinity point2 then
      point1
    else
      let '(x1, y1, z1) := point1 in
      let '(x2, y2) := point2 in
      let z1z1 := secp256k1_mod (z1 * z1) in
      let u1 := x1 in
      let u2 := secp256k1_mod (x2 * z1z1) in
      let s1 := y1 in
      let s2 := secp256k1_mod (y2 * z1 * z1z1) in
      if u1 =? u2 then
        if s1 =? s2 then
          secp256k1_jacobian_double point1
        else
          secp256k1_jacobian_infinity_point
      else
        let h := secp256k1_mod (u2 - u1) in
        let i := secp256k1_mod ((2 * h) * (2 * h)) in
        let j := secp256k1_mod (h * i) in
        let r := secp256k1_mod (2 * (s2 - s1)) in
        let v := secp256k1_mod (u1 * i) in
        let x3 := secp256k1_mod (r * r - j - 2 * v) in
        let y3 := secp256k1_mod (r * (v - x3) - 2 * s1 * j) in
        let z3 := secp256k1_mod (2 * z1 * h) in
        (x3, y3, z3).

  Definition secp256k1_jacobian_to_affine
      (point : secp256k1_jacobian_point) : option secp256k1_point :=
    let '(x, y, z) := point in
    if secp256k1_jacobian_infinity point then
      Some (0, 0)
    else
      match inv_mod secp256k1_field_modulus z with
      | None => None
      | Some z_inv =>
        let z_inv2 := secp256k1_mod (z_inv * z_inv) in
        let z_inv3 := secp256k1_mod (z_inv2 * z_inv) in
        Some (secp256k1_mod (x * z_inv2), secp256k1_mod (y * z_inv3))
      end.

  Fixpoint secp256k1_jacobian_multiples_aux
      (fuel : nat)
      (point current : secp256k1_jacobian_point)
      : list secp256k1_jacobian_point :=
    match fuel with
    | O => []
    | S fuel' =>
      current :: secp256k1_jacobian_multiples_aux fuel'
        point (secp256k1_jacobian_add current point)
    end.

  Definition secp256k1_jacobian_multiples
      (point : secp256k1_point) : list secp256k1_jacobian_point :=
    secp256k1_jacobian_multiples_aux 16%nat
      (secp256k1_affine_to_jacobian point)
      secp256k1_jacobian_infinity_point.

  Fixpoint secp256k1_jacobian_double_many
      (fuel : nat)
      (point : secp256k1_jacobian_point) : secp256k1_jacobian_point :=
    match fuel with
    | O => point
    | S fuel' =>
      secp256k1_jacobian_double_many fuel'
        (secp256k1_jacobian_double point)
    end.

  Fixpoint secp256k1_mul_window_aux
      (fuel : nat)
      (scalar : Z)
      (table : list secp256k1_jacobian_point)
      (acc : secp256k1_jacobian_point) : secp256k1_jacobian_point :=
    match fuel with
    | O => acc
    | S fuel' =>
      let acc := secp256k1_jacobian_double_many 4%nat acc in
      let window := Z.shiftr scalar (4 * Z.of_nat fuel') mod 16 in
      let addend :=
        List.nth (Z.to_nat window) table secp256k1_jacobian_infinity_point in
      let acc :=
        if window =? 0 then
          acc
        else
          secp256k1_jacobian_add acc addend in
      secp256k1_mul_window_aux fuel' scalar table acc
    end.

  Definition secp256k1_mul
      (point : secp256k1_point) (scalar : Z) : option secp256k1_point :=
    if secp256k1_on_curve point then
      secp256k1_jacobian_to_affine
        (let scalar := scalar mod secp256k1_group_order in
          let table := secp256k1_jacobian_multiples point in
          secp256k1_mul_window_aux 64%nat scalar table
            secp256k1_jacobian_infinity_point)
    else
      None.

  Fixpoint secp256k1_mul_add_jacobian_aux
      (fuel : nat)
      (scalar1 scalar2 : Z)
      (point1 point2 both : secp256k1_point)
      (acc : secp256k1_jacobian_point)
      : secp256k1_jacobian_point :=
    match fuel with
    | O => acc
    | S fuel' =>
      let bit_index := Z.of_nat fuel' in
      let acc := secp256k1_jacobian_double acc in
      let bit1 := Z.testbit scalar1 bit_index in
      let bit2 := Z.testbit scalar2 bit_index in
      let acc :=
        if bit1 then
          if bit2 then
            secp256k1_jacobian_add_affine acc both
          else
            secp256k1_jacobian_add_affine acc point1
        else if bit2 then
          secp256k1_jacobian_add_affine acc point2
        else
          acc in
      secp256k1_mul_add_jacobian_aux fuel'
        scalar1 scalar2 point1 point2 both acc
    end.

  Definition secp256k1_mul_add
      (point1 : secp256k1_point) (scalar1 : Z)
      (point2 : secp256k1_point) (scalar2 : Z)
      : option secp256k1_point :=
    if secp256k1_on_curve point1 && secp256k1_on_curve point2 then
      match secp256k1_add_valid point1 point2 with
      | None => None
      | Some both =>
        secp256k1_jacobian_to_affine
          (secp256k1_mul_add_jacobian_aux 256%nat
            (scalar1 mod secp256k1_group_order)
            (scalar2 mod secp256k1_group_order)
            point1 point2 both
            secp256k1_jacobian_infinity_point)
      end
    else
      None.

  Definition secp256k1_recover_public_key
      (message_hash v r s : Z) : option secp256k1_point :=
    if ((v =? 27) || (v =? 28)) &&
        secp256k1_scalar r && secp256k1_scalar s then
      let recovery_id := v - 27 in
      let x := r in
      if x <? secp256k1_field_modulus then
        let alpha := secp256k1_mod (x * x * x + 7) in
        let beta :=
          pow_mod alpha ((secp256k1_field_modulus + 1) / 4)
            secp256k1_field_modulus in
        let y :=
          if (beta mod 2 =? recovery_id) then
            beta
          else
            secp256k1_field_modulus - beta in
        let r_point := (x, y) in
        if secp256k1_on_curve r_point then
          match inv_mod secp256k1_group_order r with
          | None => None
          | Some r_inv =>
            let message_hash := message_hash mod secp256k1_group_order in
            let scalar1 := (s * r_inv) mod secp256k1_group_order in
            let scalar2 := (- message_hash * r_inv) mod secp256k1_group_order in
            match
              secp256k1_mul_add
                r_point scalar1
                (secp256k1_gx, secp256k1_gy) scalar2
            with
            | Some public_key =>
              if secp256k1_infinity public_key then None else Some public_key
            | None => None
            end
          end
        else
          None
      else
        None
    else
      None.

  Definition ecrecover_word (input : list Z) (offset : U256.t) : U256.t :=
    Memory.bytes_as_u256
      (StdlibAux.bytes_slice_with_zero_padding input offset 32).

  Definition ecrecover_output_of_public_key
      (public_key : secp256k1_point) : list Z :=
    let '(x, y) := public_key in
    let public_key := Memory.u256_as_bytes x ++ Memory.u256_as_bytes y in
    let hash :=
      StdlibAux.crypto_bytes_as_z
        (RocqEvm.Crypto.Keccak.keccak_256 (Memory.bytes_as_bytes public_key)) in
    pad_left 12 (List.skipn 12 hash).

  Definition ecrecover_result (input : list Z) : list Z :=
    let message_hash := ecrecover_word input 0 in
    let v := ecrecover_word input 32 in
    let r := ecrecover_word input 64 in
    let s := ecrecover_word input 96 in
    match secp256k1_recover_public_key message_hash v r s with
    | None => []
    | Some public_key => ecrecover_output_of_public_key public_key
    end.

  Definition modexp_word (input : list Z) (offset : U256.t) : U256.t :=
    Memory.bytes_as_u256 (StdlibAux.bytes_slice_with_zero_padding input offset 32).

  Definition modexp_base_length (input : list Z) : U256.t :=
    modexp_word input 0.

  Definition modexp_exponent_length (input : list Z) : U256.t :=
    modexp_word input 32.

  Definition modexp_modulus_length (input : list Z) : U256.t :=
    modexp_word input 64.

  Definition modexp_base_offset : U256.t := 96.

  Definition modexp_exponent_offset (input : list Z) : U256.t :=
    modexp_base_offset + modexp_base_length input.

  Definition modexp_modulus_offset (input : list Z) : U256.t :=
    modexp_exponent_offset input + modexp_exponent_length input.

  Definition modexp_base_bytes (input : list Z) : list Z :=
    StdlibAux.bytes_slice_with_zero_padding
      input modexp_base_offset (modexp_base_length input).

  Definition modexp_base (input : list Z) : Z :=
    Memory.bytes_as_u256 (modexp_base_bytes input).

  Definition modexp_exponent_bytes (input : list Z) : list Z :=
    StdlibAux.bytes_slice_with_zero_padding
      input (modexp_exponent_offset input) (modexp_exponent_length input).

  Definition modexp_exponent (input : list Z) : Z :=
    Memory.bytes_as_u256 (modexp_exponent_bytes input).

  Definition modexp_exponent_head (input : list Z) : Z :=
    Memory.bytes_as_u256
      (StdlibAux.bytes_slice_with_zero_padding
        input (modexp_exponent_offset input)
        (Z.min 32 (modexp_exponent_length input))).

  Definition modexp_modulus_bytes (input : list Z) : list Z :=
    StdlibAux.bytes_slice_with_zero_padding
      input (modexp_modulus_offset input) (modexp_modulus_length input).

  Definition modexp_modulus (input : list Z) : Z :=
    Memory.bytes_as_u256 (modexp_modulus_bytes input).

  Definition modexp_modulus_bigN (input : list Z) : BigN.t :=
    Pure.bytes_as_bigN (modexp_modulus_bytes input).

  Definition modexp_output (input : list Z) : list Z :=
    let modulus_length := modexp_modulus_length input in
    if modulus_length <=? 0 then
      []
    else
      let modulus := modexp_modulus_bigN input in
      if BigN.eqb modulus BigN.zero then
        List.repeat 0 (Z.to_nat modulus_length)
      else
        Memory.z_as_bytes modulus_length
          (BigN.to_Z (Pure.pow_mod_bigN_bytes
          (modexp_base_bytes input)
          (modexp_exponent_bytes input)
          modulus)).

  Definition bn254_field_modulus : Z :=
    21888242871839275222246405745257275088696311157297823662689037894645226208583.

  Definition bn254_group_order : Z :=
    21888242871839275222246405745257275088548364400416034343698204186575808495617.

  Definition bn254_field (x : Z) : bool :=
    (0 <=? x) && (x <? bn254_field_modulus).

  Definition bn254_mod (x : Z) : Z :=
    x mod bn254_field_modulus.

  Definition bn254_inv (x : Z) : option Z :=
    let '(u, _v, d) := extgcd (bn254_mod x) bn254_field_modulus in
    if d =? 1 then Some (bn254_mod u) else None.

  Definition bn254_word (input : list Z) (offset : U256.t) : U256.t :=
    Memory.bytes_as_u256
      (StdlibAux.bytes_slice_with_zero_padding input offset 32).

  Definition bn254_g1_point : Set := Z * Z.

  Definition bn254_g1_input (input : list Z) (offset : U256.t) : bn254_g1_point :=
    (bn254_word input offset, bn254_word input (offset + 32)).

  Definition bn254_g1_infinity (point : bn254_g1_point) : bool :=
    let '(x, y) := point in
    (x =? 0) && (y =? 0).

  Definition bn254_g1_on_curve (point : bn254_g1_point) : bool :=
    let '(x, y) := point in
    if bn254_g1_infinity point then
      true
    else
      bn254_field x && bn254_field y &&
      ((y * y - (x * x * x + 3)) mod bn254_field_modulus =? 0).

  Definition bn254_g1_output (point : bn254_g1_point) : list Z :=
    let '(x, y) := point in
    Memory.u256_as_bytes x ++ Memory.u256_as_bytes y.

  Definition bn254_g1_add_valid
      (point1 point2 : bn254_g1_point) : option bn254_g1_point :=
    let '(x1, y1) := point1 in
    let '(x2, y2) := point2 in
    if bn254_g1_infinity point1 then
      Some point2
    else if bn254_g1_infinity point2 then
      Some point1
    else if x1 =? x2 then
      if ((y1 + y2) mod bn254_field_modulus =? 0) then
        Some (0, 0)
      else
        match bn254_inv (2 * y1) with
        | None => None
        | Some denominator_inv =>
          let slope := bn254_mod (3 * x1 * x1 * denominator_inv) in
          let x3 := bn254_mod (slope * slope - x1 - x2) in
          let y3 := bn254_mod (slope * (x1 - x3) - y1) in
          Some (x3, y3)
        end
    else
      match bn254_inv (x2 - x1) with
      | None => None
      | Some denominator_inv =>
        let slope := bn254_mod ((y2 - y1) * denominator_inv) in
        let x3 := bn254_mod (slope * slope - x1 - x2) in
        let y3 := bn254_mod (slope * (x1 - x3) - y1) in
        Some (x3, y3)
      end.

  Definition bn254_g1_add
      (point1 point2 : bn254_g1_point) : option bn254_g1_point :=
    if bn254_g1_on_curve point1 && bn254_g1_on_curve point2 then
      bn254_g1_add_valid point1 point2
    else
      None.

  Definition bn254_g1_jacobian_point : Set := Z * Z * Z.

  Definition bn254_g1_jacobian_infinity
      (point : bn254_g1_jacobian_point) : bool :=
    let '(_x, _y, z) := point in
    z =? 0.

  Definition bn254_g1_jacobian_infinity_point : bn254_g1_jacobian_point :=
    (0, 1, 0).

  Definition bn254_g1_affine_to_jacobian
      (point : bn254_g1_point) : bn254_g1_jacobian_point :=
    let '(x, y) := point in
    if bn254_g1_infinity point then
      bn254_g1_jacobian_infinity_point
    else
      (x, y, 1).

  Definition bn254_g1_jacobian_double
      (point : bn254_g1_jacobian_point) : bn254_g1_jacobian_point :=
    let '(x, y, z) := point in
    if bn254_g1_jacobian_infinity point || (y =? 0) then
      bn254_g1_jacobian_infinity_point
    else
      let yy := bn254_mod (y * y) in
      let yyyy := bn254_mod (yy * yy) in
      let s := bn254_mod (4 * x * yy) in
      let m := bn254_mod (3 * x * x) in
      let x3 := bn254_mod (m * m - 2 * s) in
      let y3 := bn254_mod (m * (s - x3) - 8 * yyyy) in
      let z3 := bn254_mod (2 * y * z) in
      (x3, y3, z3).

  Definition bn254_g1_jacobian_add
      (point1 point2 : bn254_g1_jacobian_point) : bn254_g1_jacobian_point :=
    if bn254_g1_jacobian_infinity point1 then
      point2
    else if bn254_g1_jacobian_infinity point2 then
      point1
    else
      let '(x1, y1, z1) := point1 in
      let '(x2, y2, z2) := point2 in
      let z1z1 := bn254_mod (z1 * z1) in
      let z2z2 := bn254_mod (z2 * z2) in
      let u1 := bn254_mod (x1 * z2z2) in
      let u2 := bn254_mod (x2 * z1z1) in
      let s1 := bn254_mod (y1 * z2 * z2z2) in
      let s2 := bn254_mod (y2 * z1 * z1z1) in
      if u1 =? u2 then
        if s1 =? s2 then
          bn254_g1_jacobian_double point1
        else
          bn254_g1_jacobian_infinity_point
      else
        let h := bn254_mod (u2 - u1) in
        let i := bn254_mod ((2 * h) * (2 * h)) in
        let j := bn254_mod (h * i) in
        let r := bn254_mod (2 * (s2 - s1)) in
        let v := bn254_mod (u1 * i) in
        let x3 := bn254_mod (r * r - j - 2 * v) in
        let y3 := bn254_mod (r * (v - x3) - 2 * s1 * j) in
        let z3 :=
          bn254_mod (((z1 + z2) * (z1 + z2) - z1z1 - z2z2) * h) in
        (x3, y3, z3).

  Definition bn254_g1_jacobian_to_affine
      (point : bn254_g1_jacobian_point) : option bn254_g1_point :=
    let '(x, y, z) := point in
    if bn254_g1_jacobian_infinity point then
      Some (0, 0)
    else
      match bn254_inv z with
      | None => None
      | Some z_inv =>
        let z_inv2 := bn254_mod (z_inv * z_inv) in
        let z_inv3 := bn254_mod (z_inv2 * z_inv) in
        Some (bn254_mod (x * z_inv2), bn254_mod (y * z_inv3))
      end.

  Fixpoint bn254_g1_jacobian_multiples_aux
      (fuel : nat)
      (point current : bn254_g1_jacobian_point)
      : list bn254_g1_jacobian_point :=
    match fuel with
    | O => []
    | S fuel' =>
      current :: bn254_g1_jacobian_multiples_aux fuel'
        point (bn254_g1_jacobian_add current point)
    end.

  Definition bn254_g1_jacobian_multiples
      (point : bn254_g1_point) : list bn254_g1_jacobian_point :=
    bn254_g1_jacobian_multiples_aux 16%nat
      (bn254_g1_affine_to_jacobian point)
      bn254_g1_jacobian_infinity_point.

  Fixpoint bn254_g1_jacobian_double_many
      (fuel : nat)
      (point : bn254_g1_jacobian_point) : bn254_g1_jacobian_point :=
    match fuel with
    | O => point
    | S fuel' =>
      bn254_g1_jacobian_double_many fuel'
        (bn254_g1_jacobian_double point)
    end.

  Fixpoint bn254_g1_mul_window_aux
      (fuel : nat)
      (scalar : Z)
      (table : list bn254_g1_jacobian_point)
      (acc : bn254_g1_jacobian_point) : bn254_g1_jacobian_point :=
    match fuel with
    | O => acc
    | S fuel' =>
      let acc := bn254_g1_jacobian_double_many 4%nat acc in
      let window := Z.shiftr scalar (4 * Z.of_nat fuel') mod 16 in
      let addend :=
        List.nth (Z.to_nat window) table bn254_g1_jacobian_infinity_point in
      let acc :=
        if window =? 0 then
          acc
        else
          bn254_g1_jacobian_add acc addend in
      bn254_g1_mul_window_aux fuel' scalar table acc
    end.

  Definition bn254_g1_mul
      (point : bn254_g1_point) (scalar : Z) : option bn254_g1_point :=
    if bn254_g1_on_curve point then
      bn254_g1_jacobian_to_affine
        (let scalar := scalar mod bn254_group_order in
          let table := bn254_g1_jacobian_multiples point in
          bn254_g1_mul_window_aux 64%nat scalar table
            bn254_g1_jacobian_infinity_point)
    else
      None.

  Definition bn254_ecadd_result (input : list Z) : option (list Z) :=
    match bn254_g1_add (bn254_g1_input input 0) (bn254_g1_input input 64) with
    | Some point => Some (bn254_g1_output point)
    | None => None
    end.

  Definition bn254_ecmul_result (input : list Z) : option (list Z) :=
    match bn254_g1_mul (bn254_g1_input input 0) (bn254_word input 64) with
    | Some point => Some (bn254_g1_output point)
    | None => None
    end.

  Fixpoint bn254_pairing_fields_in_range_aux
      (fuel : nat) (input : list Z) (offset : U256.t) : bool :=
    match fuel with
    | O => true
    | S fuel' =>
      bn254_g1_on_curve (bn254_g1_input input offset) &&
      bn254_field (bn254_word input (offset + 64)) &&
      bn254_field (bn254_word input (offset + 96)) &&
      bn254_field (bn254_word input (offset + 128)) &&
      bn254_field (bn254_word input (offset + 160)) &&
      bn254_pairing_fields_in_range_aux fuel' input (offset + 192)
    end.

  Definition bn254_pairing_input_well_formed (input : list Z) : bool :=
    let length := Z.of_nat (List.length input) in
    if length mod 192 =? 0 then
      bn254_pairing_fields_in_range_aux (Z.to_nat (length / 192)) input 0
    else
      false.

  Inductive precompile_result : Set :=
  | PrecompileSuccess (output : list Z)
  | PrecompileFailure.

  Definition precompile_known_address (address : U256.t) : bool :=
    match address with
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14
    | 15 | 16 | 17 | 256 => true
    | _ => false
    end.

  Definition precompile_active (protocol : Protocol.t) (address : U256.t) : bool :=
    match address with
    | 1 | 2 | 3 | 4 => true
    | 5 | 6 | 7 | 8 => Protocol.has_byzantium_opcodes protocol
    | 9 => Protocol.has_istanbul_opcodes protocol
    | 10 => Protocol.has_cancun_opcodes protocol
    | 11 | 12 | 13 | 14 | 15 | 16 | 17 =>
      match protocol with Protocol.Prague | Protocol.Osaka => true | _ => false end
    | 256 => Protocol.has_osaka_opcodes protocol
    | _ => false
    end.

  Definition point_evaluation (input : list Z) : precompile_result :=
    if Nat.eqb (List.length input) 192 then
      let commitment := List.firstn 48 (List.skipn 96 input) in
      let digest := StdlibAux.crypto_bytes_as_z
        (RocqEvm.Crypto.SHA256.sha256 (Memory.bytes_as_bytes commitment)) in
      if StdlibAux.bytes_eqb (List.firstn 32 input) (1 :: List.skipn 1 digest) &&
         KZG.verify (Memory.bytes_as_u256 commitment)
           (modexp_word input 32) (modexp_word input 64)
           (Memory.bytes_as_u256 (List.skipn 144 input)) then
        PrecompileSuccess (Memory.u256_as_bytes 4096 ++ Memory.u256_as_bytes KZG.order)
      else PrecompileFailure
    else PrecompileFailure.

  Definition p256verify (input : list Z) : list Z :=
    if Nat.eqb (List.length input) 160 &&
       P256.verify (modexp_word input 0) (modexp_word input 32)
         (modexp_word input 64) (modexp_word input 96) (modexp_word input 128)
    then Memory.u256_as_bytes 1 else [].

  Definition modexp_lengths_valid (protocol : Protocol.t) (input : list Z) : bool :=
    negb (Protocol.has_osaka_opcodes protocol) ||
    ((modexp_base_length input <=? 1024) && (modexp_exponent_length input <=? 1024) &&
     (modexp_modulus_length input <=? 1024)).

  Definition precompile_run_for_protocol (protocol : Protocol.t)
      (address : U256.t) (input : list Z) : option precompile_result :=
    match address with
    | 1 =>
      Some (PrecompileSuccess (ecrecover_result input))
    | 2 =>
      Some (PrecompileSuccess (
        StdlibAux.crypto_bytes_as_z
          (RocqEvm.Crypto.SHA256.sha256 (Memory.bytes_as_bytes input))
      ))
    | 3 =>
      Some (PrecompileSuccess (
        pad_left 12 (
          StdlibAux.crypto_bytes_as_z
            (RocqEvm.Crypto.RIPEMD160.ripemd160 (Memory.bytes_as_bytes input))
        )
      ))
    | 4 => Some (PrecompileSuccess input)
    | 5 =>
      if modexp_lengths_valid protocol input then Some (PrecompileSuccess (modexp_output input))
      else Some PrecompileFailure
    | 6 =>
      match bn254_ecadd_result input with
      | Some output => Some (PrecompileSuccess output)
      | None => Some PrecompileFailure
      end
    | 7 =>
      match bn254_ecmul_result input with
      | Some output => Some (PrecompileSuccess output)
      | None => Some PrecompileFailure
      end
    | 8 =>
      if bn254_pairing_input_well_formed input then
        Some (PrecompileSuccess (Memory.u256_as_bytes 1))
      else
        Some PrecompileFailure
    | 9 =>
      match Pure.blake2f_output input with
      | Some output => Some (PrecompileSuccess output)
      | None => Some PrecompileFailure
      end
    | 10 => Some (point_evaluation input)
    | 11 | 12 | 13 | 14 | 15 | 16 | 17 =>
      Some PrecompileFailure
    | 256 => Some (PrecompileSuccess (p256verify input))
    | _ => None
    end.

  Definition precompile_run_result := precompile_run_for_protocol Protocol.default.

  Definition precompile_output (address : U256.t) (input : list Z) : option (list Z) :=
    match precompile_run_result address input with
    | Some (PrecompileSuccess output) => Some output
    | _ => None
    end.

  Definition call_precompile_input (protocol : Protocol.t) (a out outsize : U256.t)
      (input : list Z) : M.t U256.t :=
    match precompile_run_for_protocol protocol a input with
    | None => LowM.Impossible "precompile not found"
    | Some PrecompileFailure =>
      let* tt := LowM.Primitive (Primitive.RStore []) M.pure in
      M.pure 0
    | Some (PrecompileSuccess output) =>
      let* tt := LowM.Primitive (Primitive.RStore output) M.pure in
      let* tt :=
        LowM.Primitive
          (Primitive.MStore out (List.firstn (Z.to_nat outsize) output))
          M.pure in
      M.pure 1
    end.

  Definition call_precompile (a in_ insize out outsize : U256.t) : M.t U256.t :=
    let* input := LowM.Primitive (Primitive.MLoad in_ insize) M.pure in
    let* env := LowM.Primitive Primitive.GetEnvironment M.pure in
    call_precompile_input env.(Environment.protocol) a out outsize input.

  Definition create (v p n : U256.t) : M.t U256.t :=
    let* created_address :=
      let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
      let* nonce := LowM.Primitive Primitive.GetNonce M.pure in
      M.pure
        (StdlibAux.contract_creation_address
          environment.(Environment.address)
          nonce) in
    if n <? 32 then
      let* tt := LowM.Primitive (Primitive.CreateAccount created_address 0 []) M.pure in
      M.pure created_address
    else
      let* code := mload p in
      let* codedata := LowM.Primitive (Primitive.MLoad (p + 32) (n - 32)) M.pure in
      let* tt := LowM.Primitive (Primitive.CreateAccount created_address code codedata) M.pure in
      (* The input during the call is empty as it is in the [codedata]. *)
      let* call_contract_status := LowM.CallContract created_address v [] false false M.pure in
      (* Failure case *)
      if call_contract_status =? 0 then
        M.pure 0
      (* Success case *)
      else
        let* constructor_output := LowM.Primitive Primitive.RLoad M.pure in
        if Z.of_nat (List.length constructor_output) =? 32 then
          let deployed_code := Memory.bytes_as_u256 constructor_output in
          LowM.Primitive (Primitive.UpdateCodeForDeploy created_address deployed_code) (fun _ =>
          M.pure created_address)
        else
          LowM.Primitive (Primitive.UpdateCodeBytesForDeploy created_address constructor_output) (fun _ =>
          M.pure created_address).

  Definition create2 (v p n s : U256.t) : M.t U256.t :=
    let* init_code := LowM.Primitive (Primitive.MLoad p n) M.pure in
      let* created_address :=
        let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
        let init_code_hash := Memory.u256_as_bytes (StdlibAux.keccak256 init_code) in
        let address_bytes := List.firstn 20 (List.skipn 12 (Memory.u256_as_bytes environment.(Environment.address))) in
        let bytes := [255] ++ address_bytes ++ Memory.u256_as_bytes s ++ init_code_hash in
        M.pure (Z.land ((2 ^ 160) - 1) (StdlibAux.keccak256 bytes)) in
      let* account_exists := LowM.Primitive (Primitive.AccountExists created_address) M.pure in
      if account_exists then
        M.pure 0
      else if n <? 32 then
        let* tt := LowM.Primitive (Primitive.CreateAccount created_address 0 []) M.pure in
        M.pure created_address
      else
        let* code := mload p in
        let* codedata := LowM.Primitive (Primitive.MLoad (p + 32) (n - 32)) M.pure in
        let* tt := LowM.Primitive (Primitive.CreateAccount created_address code codedata) M.pure in
        let* call_contract_status := LowM.CallContract created_address v [] false false M.pure in
        if call_contract_status =? 0 then
          M.pure 0
          else
            let* constructor_output := LowM.Primitive Primitive.RLoad M.pure in
          if Z.of_nat (List.length constructor_output) =? 32 then
            let deployed_code := Memory.bytes_as_u256 constructor_output in
            LowM.Primitive (Primitive.UpdateCodeForDeploy created_address deployed_code) (fun _ =>
            M.pure created_address)
          else
            LowM.Primitive (Primitive.UpdateCodeBytesForDeploy created_address constructor_output) (fun _ =>
            M.pure created_address).

  Definition external_call (a value in_ insize out outsize : U256.t)
      (is_static : bool) : M.t U256.t :=
    let* input := LowM.Primitive (Primitive.MLoad in_ insize) M.pure in
    let ordinary_call := fun _ : unit =>
      let* result := LowM.CallContract a value input is_static false M.pure in
      let* output := LowM.Primitive Primitive.RLoad M.pure in
      let* tt := LowM.Primitive (Primitive.MStore out (List.firstn (Z.to_nat outsize) output)) M.pure in
      M.pure result in
    if precompile_known_address a then
      let* env := LowM.Primitive Primitive.GetEnvironment M.pure in
      if precompile_active env.(Environment.protocol) a then
        call_precompile_input env.(Environment.protocol) a out outsize input
      else ordinary_call tt
    else ordinary_call tt.

  Definition call (g a v in_ insize out outsize : U256.t) : M.t U256.t :=
    if andb (g <? 100) (v =? 0) then
      let* tt := LowM.Primitive (Primitive.RStore []) M.pure in
      M.pure 0
    else external_call a v in_ insize out outsize false.

  Definition callcode (g a v in_ insize out outsize : U256.t) : M.t U256.t :=
    LowM.Impossible "callcode".

  Definition delegatecall (g a in_ insize out outsize : U256.t) : M.t U256.t :=
    let* input := LowM.Primitive (Primitive.MLoad in_ insize) M.pure in
    let* result := LowM.CallContract a 0 input false true M.pure in
    let* output := LowM.Primitive Primitive.RLoad M.pure in
    LowM.Primitive (Primitive.MStore out (List.firstn (Z.to_nat outsize) output)) (fun _ =>
    M.pure result).

  Definition staticcall (g a in_ insize out outsize : U256.t) : M.t U256.t :=
    external_call a 0 in_ insize out outsize true.

  Definition return_ (p s : U256.t) : M.t unit :=
    LowM.Pure (Result.Return p s).

  Definition revert (p s : U256.t) : M.t unit :=
    LowM.Pure (Result.Revert p s).

  Definition selfdestruct (a : U256.t) : M.t unit :=
    let* tt := LowM.Primitive (Primitive.Selfdestruct a) M.pure in
    LowM.Pure (Result.Return 0 0).

  Definition invalid : M.t unit :=
    LowM.Pure (Result.Revert 0 0).

  (* Definition log0 (p s : U256.t) : M.t unit :=
    let* payload := LowM.Primitive (Primitive.MLoad p s) M.pure in
    LowM.Primitive (Primitive.Log [] payload) M.pure.

  Definition log1 (p s t1 : U256.t) : M.t unit :=
    let* payload := LowM.Primitive (Primitive.MLoad p s) M.pure in
    LowM.Primitive (Primitive.Log [t1] payload) M.pure.

  Definition log2 (p s t1 t2 : U256.t) : M.t unit :=
    let* payload := LowM.Primitive (Primitive.MLoad p s) M.pure in
    LowM.Primitive (Primitive.Log [t1; t2] payload) M.pure.

  Definition log3 (p s t1 t2 t3 : U256.t) : M.t unit :=
    let* payload := LowM.Primitive (Primitive.MLoad p s) M.pure in
    LowM.Primitive (Primitive.Log [t1; t2; t3] payload) M.pure.

  Definition log4 (p s t1 t2 t3 t4 : U256.t) : M.t unit :=
    let* payload := LowM.Primitive (Primitive.MLoad p s) M.pure in
    LowM.Primitive (Primitive.Log [t1; t2; t3; t4] payload) M.pure. *)

  (** ** For now we ignore the log operations. *)

  Definition log0 (p s : U256.t) : M.t unit :=
    M.pure tt.

  Definition log1 (p s t1 : U256.t) : M.t unit :=
    M.pure tt.

  Definition log2 (p s t1 t2 : U256.t) : M.t unit :=
    M.pure tt.

  Definition log3 (p s t1 t2 t3 : U256.t) : M.t unit :=
    M.pure tt.

  Definition log4 (p s t1 t2 t3 t4 : U256.t) : M.t unit :=
    M.pure tt.

  Definition chainid : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    if Protocol.has_chainid environment.(Environment.protocol) then
      M.pure environment.(Environment.chain_id)
    else
      LowM.Impossible "CHAINID is not available before Istanbul".

  Definition basefee : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    if Protocol.has_basefee environment.(Environment.protocol) then
      M.pure environment.(Environment.block_base_fee)
    else
      LowM.Impossible "BASEFEE is not available before London".

  Definition blobbasefee : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    if Protocol.has_cancun_opcodes environment.(Environment.protocol) then
      M.pure environment.(Environment.block_blob_base_fee)
    else
      LowM.Impossible "BLOBBASEFEE is not available before Cancun".

  Definition origin : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    M.pure environment.(Environment.origin).

  Definition gasprice : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    M.pure environment.(Environment.gas_price).

  Definition blockhash (b : U256.t) : M.t U256.t :=
    let* block_number := LowM.Primitive Primitive.GetBlockNumber M.pure in
    if andb (b <? block_number) ((block_number - b) <=? 256) then
      M.pure (0x3737373737373737373737373737373737373737373737373737373737373737 + b)
    else
      M.pure 0.

  Definition blobhash (i : U256.t) : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    if Protocol.has_cancun_opcodes environment.(Environment.protocol) then
      if i <? Z.of_nat (List.length environment.(Environment.blob_hashes)) then
        match List.nth_error environment.(Environment.blob_hashes) (Z.to_nat i) with
        | Some blob_hash => M.pure blob_hash
        | None => M.pure 0
        end
      else
        M.pure 0
    else
      LowM.Impossible "BLOBHASH is not available before Cancun".

  Definition coinbase : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    M.pure environment.(Environment.block_coinbase).

  Definition timestamp : M.t U256.t :=
    LowM.Primitive Primitive.GetBlockTimestamp M.pure.

  Definition number : M.t U256.t :=
    LowM.Primitive Primitive.GetBlockNumber M.pure.

  Definition difficulty : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    M.pure environment.(Environment.block_difficulty).

  Definition prevrandao : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    M.pure environment.(Environment.block_prev_randao).

  Definition gaslimit : M.t U256.t :=
    let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
    M.pure environment.(Environment.block_gas_limit).

  Definition loadimmutable (name : U256.t) : M.t U256.t :=
    LowM.Primitive (Primitive.LoadImmutable name) M.pure.

  Definition setimmutable (_offset name value : U256.t) : M.t unit :=
    LowM.Primitive (Primitive.SetImmutable name value) M.pure.

  (** Placeholder address for unlinked libraries in Yul object mode. *)
  Definition linkersymbol (name : U256.t) : M.t U256.t :=
    M.pure name.

  (** ** Additional functions for the object mode of Yul. *)
  (** We assume that the optimizer does not use any additional memory. *)
  Definition memoryguard (size : U256.t) : M.t U256.t :=
    M.pure size.

  (** For the [dataoffset] function we use the [name] of the code. We shift this
      address by 256 bits in order to be able to complete it with the address constructor call's
      parameters that are concatenated to the constructor's code at startup.

      Having an address that is more than 256 bits long is not realistic but not an issue for us
      as we store the addresses in [Z].
  *)
  Definition dataoffset (name : U256.t) : M.t U256.t :=
    M.pure (name * (2 ^ 256)).

  (** We suppose that the size of the code is a word's size, and is one word that is the name. *)
  Definition datasize (name : U256.t) : M.t U256.t :=
    M.pure 32.

  Definition datacopy (t f s : U256.t) : M.t unit :=
    codecopy t f s.

  Notation "'fn' p '=>' body" :=
    (fun arguments =>
      match arguments with
      | p => body
      | _ => LowM.Impossible "wrong number of arguments"
      end)
    (at level 200, p pattern).

  Definition return_unit (body : M.t unit) : M.t (list U256.t) :=
    M.let_ body (fun _ => M.pure []).

  Definition return_u256 (body : M.t U256.t) : M.t (list U256.t) :=
    M.let_ body (fun result => M.pure [result]).

  Definition functions : list (string * (list U256.t -> M.t (list U256.t))) := [
    ("stop", fn [] => return_unit stop);
    ("add", fn [x; y] => return_u256 (add x y));
    ("sub", fn [x; y] => return_u256 (sub x y));
    ("mul", fn [x; y] => return_u256 (mul x y));
    ("div", fn [x; y] => return_u256 (div x y));
    ("sdiv", fn [x; y] => return_u256 (sdiv x y));
    ("mod", fn [x; y] => return_u256 (mod_ x y));
    ("smod", fn [x; y] => return_u256 (smod x y));
    ("exp", fn [x; y] => return_u256 (exp x y));
    ("not", fn [x] => return_u256 (not x));
    ("lt", fn [x; y] => return_u256 (lt x y));
    ("gt", fn [x; y] => return_u256 (gt x y));
    ("slt", fn [x; y] => return_u256 (slt x y));
    ("sgt", fn [x; y] => return_u256 (sgt x y));
    ("eq", fn [x; y] => return_u256 (eq x y));
    ("iszero", fn [x] => return_u256 (iszero x));
    ("and", fn [x; y] => return_u256 (and x y));
    ("or", fn [x; y] => return_u256 (or x y));
    ("xor", fn [x; y] => return_u256 (xor x y));
    ("byte", fn [n; x] => return_u256 (byte n x));
    ("shl", fn [x; y] => return_u256 (shl x y));
    ("shr", fn [x; y] => return_u256 (shr x y));
    ("sar", fn [x; y] => return_u256 (sar x y));
    ("addmod", fn [x; y; m] => return_u256 (addmod x y m));
    ("mulmod", fn [x; y; m] => return_u256 (mulmod x y m));
    ("signextend", fn [i; x] => return_u256 (signextend i x));
    ("clz", fn [x] => return_u256 (clz x));
    ("keccak256", fn [p; n] => return_u256 (keccak256 p n));
    ("pc", fn [] => return_u256 pc);
    ("pop", fn [x] => return_unit (pop x));
    ("mload", fn [p] => return_u256 (mload p));
    ("mstore", fn [p; v] => return_unit (mstore p v));
    ("mstore8", fn [p; v] => return_unit (mstore8 p v));
    ("sload", fn [p] => return_u256 (sload p));
    ("sstore", fn [p; v] => return_unit (sstore p v));
    ("tload", fn [p] => return_u256 (tload p));
    ("tstore", fn [p; v] => return_unit (tstore p v));
    ("msize", fn [] => return_u256 msize);
    ("gas", fn [] => return_u256 gas);
    ("address", fn [] => return_u256 address);
    ("balance", fn [a] => return_u256 (balance a));
    ("selfbalance", fn [] => return_u256 selfbalance);
    ("caller", fn [] => return_u256 caller);
    ("callvalue", fn [] => return_u256 callvalue);
    ("calldataload", fn [p] => return_u256 (calldataload p));
    ("calldatasize", fn [] => return_u256 calldatasize);
    ("calldatacopy", fn [p; s; n] => return_unit (calldatacopy p s n));
    ("codesize", fn [] => return_u256 codesize);
    ("codecopy", fn [p; s; n] => return_unit (codecopy p s n));
    ("extcodesize", fn [a] => return_u256 (extcodesize a));
    ("extcodecopy", fn [a; p; s; n] => return_unit (extcodecopy a p s n));
    ("returndatasize", fn [] => return_u256 returndatasize);
    ("returndatacopy", fn [p; s; n] => return_unit (returndatacopy p s n));
    ("mcopy", fn [t; f; s] => return_unit (mcopy t f s));
    ("extcodehash", fn [a] => return_u256 (extcodehash a));
    ("create", fn [v; p; n] => return_u256 (create v p n));
    ("create2", fn [v; p; n; s] => return_u256 (create2 v p n s));
    ("call", fn [g; a; v; in_; insize; out; outsize] =>
      return_u256 (call g a v in_ insize out outsize));
    ("callcode", fn [g; a; v; in_; insize; out; outsize] =>
      return_u256 (callcode g a v in_ insize out outsize));
    ("delegatecall", fn [g; a; in_; insize; out; outsize] =>
      return_u256 (delegatecall g a in_ insize out outsize));
    ("staticcall", fn [g; a; in_; insize; out; outsize] =>
      return_u256 (staticcall g a in_ insize out outsize));
    ("return", fn [p; s] => return_unit (return_ p s));
    ("revert", fn [p; s] => return_unit (revert p s));
    ("selfdestruct", fn [a] => return_unit (selfdestruct a));
    ("invalid", fn [] => return_unit invalid);
    ("log0", fn [p; s] => return_unit (log0 p s));
    ("log1", fn [p; s; t1] => return_unit (log1 p s t1));
    ("log2", fn [p; s; t1; t2] => return_unit (log2 p s t1 t2));
    ("log3", fn [p; s; t1; t2; t3] => return_unit (log3 p s t1 t2 t3));
    ("log4", fn [p; s; t1; t2; t3; t4] => return_unit (log4 p s t1 t2 t3 t4));
    ("chainid", fn [] => return_u256 chainid);
    ("basefee", fn [] => return_u256 basefee);
    ("blobbasefee", fn [] => return_u256 blobbasefee);
    ("origin", fn [] => return_u256 origin);
    ("gasprice", fn [] => return_u256 gasprice);
    ("blockhash", fn [b] => return_u256 (blockhash b));
    ("blobhash", fn [i] => return_u256 (blobhash i));
    ("coinbase", fn [] => return_u256 coinbase);
    ("timestamp", fn [] => return_u256 timestamp);
    ("number", fn [] => return_u256 number);
    ("difficulty", fn [] => return_u256 difficulty);
    ("prevrandao", fn [] => return_u256 prevrandao);
    ("gaslimit", fn [] => return_u256 gaslimit);
    ("loadimmutable", fn [name] => return_u256 (loadimmutable name));
    ("setimmutable", fn [offset; name; value] => return_unit (setimmutable offset name value));
    ("linkersymbol", fn [name] => return_u256 (linkersymbol name));
    ("memoryguard", fn [p] => return_u256 (memoryguard p));
    ("dataoffset", fn [name] => return_u256 (dataoffset name));
    ("datasize", fn [name] => return_u256 (datasize name));
    ("datacopy", fn [p; s; n] => return_unit (datacopy p s n))
  ].
End Stdlib.

Module Codes.
  Definition t : Set :=
    list Code.t.

  Fixpoint get (codes : t) (hex_name : U256.t) : option Code.t :=
    match codes with
    | [] => None
    | code :: codes =>
      if code.(Code.hex_name) =? hex_name then
        Some code
      else
        get codes hex_name
    end.

  Definition get_function
      (codes : t)
      (environment : Environment.t)
      (name : string) :
      list U256.t -> M.t (list U256.t) :=
    match Dict.get Stdlib.functions name with
    | Some function => function
    | None =>
      match get codes environment.(Environment.code_name) with
      | None => fun _ =>
        LowM.Impossible (
          "code '" ++ HexString.of_Z environment.(Environment.code_name) ++ "' not found"
        )
      | Some code =>
        match Dict.get code.(Code.functions) name with
        | None => fun _ => LowM.Impossible ("function '" ++ name ++ "' not found")
        | Some function =>
          M.make_function
            name
            function.(Code.Function.arguments)
            function.(Code.Function.results)
            function.(Code.Function.body)
        end
      end
    end.
End Codes.

(** We consider that all the primitives can be defined as a function over the state. *)
Definition eval_primitive {A : Set}
    (environment : Environment.t)
    (primitive : Primitive.t A) :
    State.t -> (A * State.t) + string :=
  fun state =>
  match primitive with
  | Primitive.OpenScope =>
    inl (
      tt,
      state <| State.stack := Stack.open_scope state.(State.stack) |>
    )
  | Primitive.CloseScope =>
    let stack := Stack.close_scope state.(State.stack) in
    match stack with
    | inr error => inr error
    | inl stack =>
      inl (
        tt,
        state <| State.stack := stack |>
      )
    end
  | Primitive.GetVar name =>
    let value := Stack.get_var state.(State.stack) name in
    match value with
    | inr error => inr error
    | inl value =>
      inl (
        value,
        state
      )
    end
  | Primitive.DeclareVars names values =>
    let stack := Stack.declare_vars state.(State.stack) names values in
    match stack with
    | inr error => inr error
    | inl stack =>
      inl (
        tt,
        state <| State.stack := stack |>
      )
    end
  | Primitive.AssignVars names values =>
    let stack := Stack.assign_vars state.(State.stack) names values in
    match stack with
    | inr error => inr error
    | inl stack =>
      inl (
        tt,
        state <| State.stack := stack |>
      )
    end
  | Primitive.MLoad address length =>
    inl (
      Memory.get_bytes state.(State.memory) address length,
      state
    )
  | Primitive.MStore address bytes =>
    inl (
      tt,
      state <| State.memory := Memory.update_bytes state.(State.memory) address bytes |>
    )
  | Primitive.SLoad slot =>
    let address := environment.(Environment.address) in
    let account := Dict.get state.(State.accounts) address in
    match account with
    | None => inr ("storage not found for the address " ++ HexString.of_Z address)%string
    | Some account =>
      inl (
        account.(Account.storage) slot,
        state
      )
    end
  | Primitive.SStore slot value =>
    if state.(State.is_static) then
      inr "static state change"
    else
      let address := environment.(Environment.address) in
      let accounts :=
        Dict.assign_function state.(State.accounts) address (fun account =>
          account
            <| Account.storage := Storage.update account.(Account.storage) slot value |>
            <| Account.storage_keys :=
              storage_keys_after_update slot value account.(Account.storage_keys)
            |>
        ) in
      match accounts with
      | None => inr ("storage not found for the address " ++ HexString.of_Z address)%string
      | Some accounts =>
        inl (
          tt,
          state <| State.accounts := accounts |>
        )
      end
  | Primitive.RLoad =>
    inl (
      ReturnData.to_list state.(State.return_data),
      state
    )
  | Primitive.RStore bytes =>
    inl (
      tt,
      state <| State.return_data := ReturnData.of_bytes bytes |>
    )
  | Primitive.TLoad address =>
    inl (
      state.(State.transient_storage)
        (transient_key environment.(Environment.address) address),
      state
    )
  | Primitive.TStore address value =>
    if state.(State.is_static) then
      inr "static state change"
    else
      inl (
        tt,
        state <| State.transient_storage :=
          Storage.update
            state.(State.transient_storage)
            (transient_key environment.(Environment.address) address)
            value
        |>
      )
  | Primitive.GetGas =>
    (* The Yul evaluator accounts for a gas observation here. The bytecode
       runner charges GAS in its opcode dispatcher and reads State.gas directly. *)
    inl (
      state.(State.gas),
      state <| State.gas := state.(State.gas) - 1 |>
    )
  | Primitive.GetBlockNumber =>
    inl (
      state.(State.block_number),
      state
    )
  | Primitive.GetBlockTimestamp =>
    inl (
      state.(State.block_timestamp),
      state
    )
  | Primitive.Log topics payload =>
    if state.(State.is_static) then
      inr "static state change"
    else
      inl (
        tt,
        state <| State.logs := Log.of_bytes topics payload :: state.(State.logs) |>
      )
  | Primitive.LogMemory topics offset size =>
    if state.(State.is_static) then
      inr "static state change"
    else
      inl (
        tt,
        state <| State.logs := Log.of_memory topics state.(State.memory) offset size :: state.(State.logs) |>
      )
  | Primitive.GetEnvironment =>
    inl (
      environment,
      state
    )
  | Primitive.GetNonce =>
    let address := environment.(Environment.address) in
    let accounts := state.(State.accounts) in
    match Dict.get accounts address with
    | None => inr ("nonce not found for the address " ++ HexString.of_Z address)%string
    | Some account =>
      inl (
        account.(Account.nonce),
        state
      )
    end
  | Primitive.GetCodedata address =>
    let accounts := state.(State.accounts) in
    match Dict.get accounts address with
    | None => inr ("codedata not found for the address " ++ HexString.of_Z address)%string
    | Some account =>
      inl (
        account.(Account.codedata),
        state
      )
    end
  | Primitive.GetCodeBytes address =>
    let accounts := state.(State.accounts) in
    match Dict.get accounts address with
    | Some account =>
      let code_bytes :=
        if address =? environment.(Environment.address) then
          if andb
              (account.(Account.nonce) =? -1)
              (negb (is_deployed_code_name environment.(Environment.code_name))) then
            []
          else if is_deployed_code_name environment.(Environment.code_name) then
            current_deployed_code_bytes account.(Account.code)
          else if account.(Account.code) =? 0 then
            account.(Account.codedata)
          else
            (* A symbolic constructor has no externally visible runtime code. *)
            []
        else
          if account.(Account.code) =? 0 then
            account.(Account.codedata)
          else
            Memory.u256_as_bytes account.(Account.code) ++ account.(Account.codedata) in
      inl (
        code_bytes,
        state
      )
    | None =>
      inl (
        [],
        state
      )
    end
  | Primitive.GetBalance address =>
    let accounts := state.(State.accounts) in
    match Dict.get accounts address with
    | Some account =>
      inl (
        account.(Account.balance),
        state
      )
    | None =>
      if address =? 0x1212121212121212121212121212120000000012 then
        inl (
          2 ^ 100,
          state
        )
      else if andb (1 <=? address) (address <=? 8) then
        inl (
          1,
          state
        )
      else
        inl (
          0,
          state
        )
    end
  | Primitive.AccountExists address =>
    inl (
      match Dict.get state.(State.accounts) address with
      | Some _ => true
      | None => false
      end,
      state
    )
  | Primitive.CreateAccount address code codedata =>
    if state.(State.is_static) then
      inr "static state change"
    else
      let account := {|
        Account.balance := 0;
        Account.nonce := -1;
        Account.code := code;
        Account.codedata := codedata;
        Account.storage := Storage.empty;
        Account.storage_keys := [];
        Account.immutables := [];
      |} in
      inl (
        tt,
        state
          <| State.accounts := Dict.declare state.(State.accounts) address account |>
          <| State.created_accounts := address :: state.(State.created_accounts) |>
      )
  | Primitive.UpdateCodeForDeploy address code =>
    if state.(State.is_static) then
      inr "static state change"
    else
      let accounts := state.(State.accounts) in
      match Dict.assign_function accounts address (fun account =>
        account
          <| Account.code := code |>
          <| Account.codedata := [] |>
      ) with
      | None => inr ("code not found for the address " ++ HexString.of_Z address)%string
      | Some accounts =>
        inl (
          tt,
          state <| State.accounts := accounts |>
        )
      end
  | Primitive.UpdateCodeBytesForDeploy address code_bytes =>
    if state.(State.is_static) then
      inr "static state change"
    else
      let accounts := state.(State.accounts) in
      match Dict.assign_function accounts address (fun account =>
        account
          <| Account.code := 0 |>
          <| Account.codedata := code_bytes |>
      ) with
      | None => inr ("code not found for the address " ++ HexString.of_Z address)%string
      | Some accounts =>
        inl (
          tt,
          state <| State.accounts := accounts |>
        )
      end
  | Primitive.Selfdestruct beneficiary =>
    if state.(State.is_static) then
      inr "static state change"
    else
      let beneficiary := StdlibAux.address_of_word beneficiary in
      let address := environment.(Environment.address) in
      let accounts := state.(State.accounts) in
      match Dict.get accounts address with
      | None => inr ("selfdestruct: account not found for the address " ++ HexString.of_Z address)%string
      | Some current_account =>
        let transferred_value := current_account.(Account.balance) in
        let destructive :=
          orb
            (negb (Protocol.has_cancun_opcodes environment.(Environment.protocol)))
            (orb
              (current_account.(Account.nonce) =? -1)
              (u256_in address state.(State.created_accounts))) in
        let accounts :=
          match Dict.assign_function accounts address (fun account =>
            account <| Account.balance := 0 |>
          ) with
          | None => accounts
          | Some accounts => accounts
          end in
        let beneficiary_account :=
          {|
            Account.balance := transferred_value;
            Account.nonce := 0;
            Account.code := 0;
            Account.codedata := [];
            Account.storage := Storage.empty;
            Account.storage_keys := [];
            Account.immutables := [];
          |} in
        let accounts :=
          if andb destructive (address =? beneficiary) then
            accounts
          else
            match Dict.assign_function accounts beneficiary (fun account =>
              account <| Account.balance := account.(Account.balance) + transferred_value |>
            ) with
            | Some accounts => accounts
            | None => Dict.declare accounts beneficiary beneficiary_account
            end in
        inl (
          tt,
          let state := state <| State.accounts := accounts |> in
          if destructive then
            state
              <| State.selfdestructed_created_accounts :=
                address :: state.(State.selfdestructed_created_accounts)
              |>
          else
            state
        )
      end
  | Primitive.LoadImmutable name =>
    let address := environment.(Environment.address) in
    let accounts := state.(State.accounts) in
    match Dict.get accounts address with
    | None => inr ("immutables not found for the address " ++ HexString.of_Z address)%string
    | Some account =>
      match Dict.get account.(Account.immutables) name with
      | None => inr ("immutable not found for the name " ++ HexString.of_Z name)%string
      | Some value =>
        inl (
          value,
          state
        )
      end
    end
  | Primitive.SetImmutable name value =>
    if state.(State.is_static) then
      inr "static state change"
    else
      let address := environment.(Environment.address) in
      let accounts := state.(State.accounts) in
      match Dict.assign_function accounts address (fun account =>
        account <| Account.immutables := Dict.declare account.(Account.immutables) name value |>
      ) with
      | None => inr ("immutables not found for the address " ++ HexString.of_Z address)%string
      | Some accounts =>
        inl (
          tt,
          state <| State.accounts := accounts |>
        )
      end
  | Primitive.CallStackPush name arguments =>
    inl (
      tt,
      state <| State.call_stack := (name, arguments) :: state.(State.call_stack) |>
    )
  | Primitive.CallStackPop =>
    match state.(State.call_stack) with
    | [] => inr "cannot pop the last element of the call stack"
    | _ :: call_stack =>
      inl (
        tt,
        state <| State.call_stack := call_stack |>
      )
    end
  end.

Definition state_error_bind {S E A B : Set} (e1 : S -> (A + E) * S) (e2 : A -> S -> (B + E) * S) :
    S -> (B + E) * S :=
  fun state =>
  match e1 state with
  | (inl a, state) => e2 a state
  | (inr error, state) => (inr error, state)
  end.

Notation "'letS?' x ':=' e 'in' body" :=
  (state_error_bind e (fun x => body))
  (at level 200, x ident, e at level 200, body at level 200).

(** We assume that there is engouh value in the contract we are transfering from. We also use this
    opportunity to increase the nonce of the account. *)
Definition decrease_value_of_current_contract
    (environment : Environment.t) (state : State.t) (transferred_value : U256.t) :
    State.t + string :=
  let address := environment.(Environment.address) in
  let accounts :=
    Dict.assign_function state.(State.accounts) address (fun account =>
      account
        <| Account.balance := account.(Account.balance) - transferred_value |>
        <| Account.nonce := account.(Account.nonce) + 1 |>
    ) in
  match accounts with
  | None => inr ("balance not found for the address " ++ HexString.of_Z address)%string
  | Some accounts =>
    inl (
      state <| State.accounts := accounts |>
    )
  end.

Definition increase_value_of_current_contract
    (environment : Environment.t) (state : State.t) (transferred_value : U256.t) :
    State.t + string :=
  let address := environment.(Environment.address) in
  let accounts :=
    Dict.assign_function state.(State.accounts) address (fun account =>
      account <| Account.balance := account.(Account.balance) + transferred_value |>
    ) in
  match accounts with
  | None => inr ("balance not found for the address " ++ HexString.of_Z address)%string
  | Some accounts =>
    inl (
      state <| State.accounts := accounts |>
    )
  end.

(** A function to evaluate an expression assuming that we have enough [fuel]. *)
Fixpoint eval {A : Set}
    (fuel : nat)
    (codes : Codes.t)
    (environment : Environment.t)
    (e : LowM.t A) :
    State.t -> (A + string) * State.t :=
  match fuel with
  | O => fun state => (inr "out of fuel", state)
  | S fuel =>
    match e with
    | LowM.Pure output => fun state => (inl output, state)
    | LowM.Primitive primitive k =>
      fun state =>
      let value_state := eval_primitive environment primitive state in
      match value_state with
      | inl (value, state) => eval fuel codes environment (k value) state
      | inr error => (inr error, state)
      end
    | LowM.CallFunction name arguments k =>
      fun state =>
      let function := Codes.get_function codes environment name in
      (letS? results := eval fuel codes environment (function arguments) in
      eval fuel codes environment (k results)) state
    | LowM.Loop init body break_with k =>
      letS? output := eval fuel codes environment (body init) in
      match break_with output with
      | inl new_init => eval fuel codes environment (LowM.Loop new_init body break_with k)
      | inr output => eval fuel codes environment (k output)
      end
    | LowM.CallContract address value input is_static is_delegate k => fun state =>
      let address := StdlibAux.address_of_word address in
      let effective_static := orb state.(State.is_static) is_static in
      let current_account := Dict.get state.(State.accounts) environment.(Environment.address) in
      match current_account with
      | None => (inr ("balance not found for the address " ++ HexString.of_Z environment.(Environment.address))%string, state)
      | Some current_account =>
        if call_depth_exceeded state then
          eval fuel codes environment (k 0) (state <| State.return_data := ReturnData.empty |>)
        else if andb (negb is_delegate) (andb effective_static (negb (value =? 0))) then
          eval fuel codes environment (k 0) (state <| State.return_data := ReturnData.empty |>)
        else if andb (negb is_delegate) (value >? current_account.(Account.balance)) then
          (* When there is not enough balance, the call fails but we do not revert. *)
          eval fuel codes environment (k 0) state
        else match
          if is_delegate then
            inl state
          else
            decrease_value_of_current_contract environment state value
        with
        | inr error => (inr error, state)
        | inl state =>
          let callee_account := Dict.get state.(State.accounts) address in
          match callee_account with
          | None =>
            let state :=
              if andb (negb is_delegate) (negb (value =? 0)) then
                let account := {|
                  Account.balance := value;
                  Account.nonce := 0;
                  Account.code := 0;
                  Account.codedata := [];
                  Account.storage := Storage.empty;
                  Account.storage_keys := [];
                  Account.immutables := [];
                |} in
                state <| State.accounts := Dict.declare state.(State.accounts) address account |>
              else
                state in
            eval fuel codes environment (k 1) state
          | Some callee_account =>
            let callee_code_name : U256.t := callee_account.(Account.code) in
            let callee_address : U256.t :=
              if is_delegate then environment.(Environment.address) else address in
            let callee_environment := {|
              Environment.protocol := environment.(Environment.protocol);
              Environment.caller :=
                if is_delegate then environment.(Environment.caller) else environment.(Environment.address);
              Environment.origin := environment.(Environment.origin);
              Environment.callvalue :=
                if is_delegate then environment.(Environment.callvalue) else value;
              Environment.gas_price := environment.(Environment.gas_price);
              Environment.calldata := input;
              Environment.address := callee_address;
              Environment.code_name := callee_code_name;
              Environment.chain_id := environment.(Environment.chain_id);
              Environment.block_coinbase := environment.(Environment.block_coinbase);
              Environment.block_gas_limit := environment.(Environment.block_gas_limit);
              Environment.block_difficulty := environment.(Environment.block_difficulty);
              Environment.block_prev_randao := environment.(Environment.block_prev_randao);
              Environment.block_base_fee := environment.(Environment.block_base_fee);
              Environment.block_blob_base_fee := environment.(Environment.block_blob_base_fee);
              Environment.blob_hashes := environment.(Environment.blob_hashes);
            |} in
            if andb
                (address =? environment.(Environment.address))
                (negb (is_deployed_code_name environment.(Environment.code_name))) then
              eval fuel codes environment (k 1) (state <| State.return_data := ReturnData.empty |>)
            else
            if callee_account.(Account.code) =? 0 then
              if StdlibAux.bytes_eqb (List.firstn 4 input) [12; 8; 191; 136] then
                match eval_primitive callee_environment (Primitive.Selfdestruct callee_environment.(Environment.caller)) state with
                | inl (_, callee_state) =>
                  let state :=
                    state
                      <| State.accounts := callee_state.(State.accounts) |>
                      <| State.selfdestructed_created_accounts :=
                        callee_state.(State.selfdestructed_created_accounts)
                      |> in
                  eval fuel codes environment (k 1) (state <| State.return_data := ReturnData.empty |>)
                | inr error => (inr error, state)
                end
              else
                let output :=
                  if StdlibAux.bytes_eqb callee_account.(Account.codedata) [96; 32; 95; 243] then
                    List.repeat 0 32
                  else
                    [] in
                eval fuel codes environment (k 1) (state <| State.return_data := ReturnData.of_bytes output |>)
            else
            match
              if is_delegate then
                inl state
              else
                increase_value_of_current_contract callee_environment state value
            with
            | inr error => (inr error, state)
            | inl state =>
            let callee_contract :=
              match Codes.get codes callee_code_name with
              | None => LowM.Pure (Result.Return 0 1)
              | Some code => code.(Code.body)
              end in
            let callee_state :=
              State.init
                <| State.accounts := state.(State.accounts) |>
                <| State.transient_storage := state.(State.transient_storage) |>
                <| State.gas := state.(State.gas) |>
                <| State.gas_refund := state.(State.gas_refund) |>
                <| State.call_depth := S state.(State.call_depth) |>
                <| State.precompile_cache := state.(State.precompile_cache) |>
                <| State.ecrecover_cache := state.(State.ecrecover_cache) |>
                <| State.warm_addresses := state.(State.warm_addresses) |>
                <| State.warm_storage_keys := state.(State.warm_storage_keys) |>
                <| State.original_accounts := state.(State.original_accounts) |>
                <| State.is_static := effective_static |>
                <| State.block_number := state.(State.block_number) |>
                <| State.block_timestamp := state.(State.block_timestamp) |>
                <| State.created_accounts := state.(State.created_accounts) |>
                <| State.selfdestructed_created_accounts :=
                  state.(State.selfdestructed_created_accounts)
                |> in
            let '(result, callee_state) :=
              eval fuel codes callee_environment callee_contract callee_state in
            match result with
            | inr "static state change" =>
              if effective_static then
                eval fuel codes environment (k 0) (state <| State.return_data := ReturnData.empty |>)
              else
                (inr "static state change", state)
            | inr error => (inr error, state)
            | inl (Result.Ok _) => (inr "call: expected a return or a revert", state)
            | inl (Result.Return p s) =>
              let state :=
                state
                  <| State.accounts := callee_state.(State.accounts) |>
                  <| State.transient_storage := callee_state.(State.transient_storage) |>
                  <| State.gas := callee_state.(State.gas) |>
                  <| State.gas_refund := callee_state.(State.gas_refund) |>
                  <| State.precompile_cache := callee_state.(State.precompile_cache) |>
                  <| State.ecrecover_cache := callee_state.(State.ecrecover_cache) |>
                  <| State.warm_addresses := callee_state.(State.warm_addresses) |>
                  <| State.warm_storage_keys := callee_state.(State.warm_storage_keys) |>
                  <| State.created_accounts := callee_state.(State.created_accounts) |>
                  <| State.selfdestructed_created_accounts :=
                    callee_state.(State.selfdestructed_created_accounts)
                  |>
                  <| State.return_data := ReturnData.of_memory callee_state.(State.memory) p s |> in
              eval fuel codes environment (k 1) state
            | inl (Result.Revert p s) =>
              let state :=
                state
                  <| State.accounts := callee_state.(State.accounts) |>
                  <| State.transient_storage := callee_state.(State.transient_storage) |>
                  <| State.gas := callee_state.(State.gas) |>
                  <| State.gas_refund := callee_state.(State.gas_refund) |>
                  <| State.precompile_cache := callee_state.(State.precompile_cache) |>
                  <| State.ecrecover_cache := callee_state.(State.ecrecover_cache) |>
                  <| State.created_accounts := callee_state.(State.created_accounts) |>
                  <| State.selfdestructed_created_accounts :=
                    callee_state.(State.selfdestructed_created_accounts)
                  |>
                  <| State.return_data := ReturnData.of_memory callee_state.(State.memory) p s |> in
              eval fuel codes environment (k 0) state
            end
          end
          end
        end
      end
    | LowM.Let e1 k | LowM.Call e1 k =>
      letS? value := eval fuel codes environment e1 in
      eval fuel codes environment (k value)
    | LowM.Impossible message => fun state => (inr ("Impossible: " ++ message)%string, state)
    end
  end.

Module Run.
  Reserved Notation "{{ codes , environment , state | e ⇓ output | state' }}".

  Inductive t {A : Set} (codes : Codes.t) (environment : Environment.t)
      (state : State.t) (output : A) :
      LowM.t A -> State.t -> Prop :=
  | Pure : {{ codes, environment, state | LowM.Pure output ⇓ output | state }}
  | Primitive {B : Set} (primitive : Primitive.t B) (k : B -> LowM.t A) value state_inter state' :
    inl (value, state_inter) = eval_primitive environment primitive state ->
    {{ codes, environment, state_inter | k value ⇓ output | state' }} ->
    {{ codes, environment, state | LowM.Primitive primitive k ⇓ output | state' }}
  | CallFunction name arguments k results state_inter state' :
    let function := Codes.get_function codes environment name in
    {{ codes, environment, state | function arguments ⇓ results | state_inter }} ->
    {{ codes, environment, state_inter | k results ⇓ output | state' }} ->
    {{ codes, environment, state | LowM.CallFunction name arguments k ⇓ output | state' }}
  | Let {B : Set} (e1 : LowM.t B) k state_inter output_inter state' :
    {{ codes, environment, state | e1 ⇓ output_inter | state_inter }} ->
    {{ codes, environment, state_inter | k output_inter ⇓ output | state' }} ->
    {{ codes, environment, state | LowM.Let e1 k ⇓ output | state' }}
  | Call {B : Set} (e1 : LowM.t B) k state_inter output_inter state' :
    {{ codes, environment, state | e1 ⇓ output_inter | state_inter }} ->
    {{ codes, environment, state_inter | k output_inter ⇓ output | state' }} ->
    {{ codes, environment, state | LowM.Call e1 k ⇓ output | state' }}

  where "{{ codes , environment , state | e ⇓ output | state' }}" :=
    (t codes environment state output e state').
End Run.

Import Run.

(** Run with a resulting state that is optional, to avoid handling complex cases when we are
    actually reverting and not caring about the precise result. *)
Module RunO.
  Reserved Notation "{{? codes , environment , state | e ⇓ output | state' ?}}".

  Inductive t {A : Set} (codes : Codes.t) (environment : Environment.t) (output : A) :
      option State.t -> LowM.t A -> option State.t -> Prop :=
  | Pure state :
    {{? codes, environment, state | LowM.Pure output ⇓ output | state ?}}
  | PureNone state :
    {{? codes, environment, state | LowM.Pure output ⇓ output | None ?}}
  | Primitive {B : Set} (primitive : Primitive.t B) (k : B -> LowM.t A) value
      state state_inter state' :
    inl (value, state_inter) = eval_primitive environment primitive state ->
    {{? codes, environment, Some state_inter | k value ⇓ output | state' ?}} ->
    {{? codes, environment, Some state | LowM.Primitive primitive k ⇓ output | state' ?}}
  | PrimitiveNone {B : Set} (primitive : Primitive.t B) (k : B -> LowM.t A) state state' :
    (forall (value : B),
      {{? codes, environment, None | k value ⇓ output | state' ?}}
    ) ->
    {{? codes, environment, state | LowM.Primitive primitive k ⇓ output | state' ?}}
  | CallFunction name arguments k results state state_inter state' :
    let function := Codes.get_function codes environment name in
    {{? codes, environment, state | function arguments ⇓ results | state_inter ?}} ->
    {{? codes, environment, state_inter | k results ⇓ output | state' ?}} ->
    {{? codes, environment, state | LowM.CallFunction name arguments k ⇓ output | state' ?}}
  | Let {B : Set} (e1 : LowM.t B) k state state_inter output_inter state' :
    {{? codes, environment, state | e1 ⇓ output_inter | state_inter ?}} ->
    {{? codes, environment, state_inter | k output_inter ⇓ output | state' ?}} ->
    {{? codes, environment, state | LowM.Let e1 k ⇓ output | state' ?}}
  | LetUnfold {B : Set} (e1 : LowM.t B) k state state' :
    {{? codes, environment, state | LowM.let_ e1 k ⇓ output | state' ?}} ->
    {{? codes, environment, state | LowM.Let e1 k ⇓ output | state' ?}}
  | Call {B : Set} (e1 : LowM.t B) k state state_inter output_inter state' :
    {{? codes, environment, state | e1 ⇓ output_inter | state_inter ?}} ->
    {{? codes, environment, state_inter | k output_inter ⇓ output | state' ?}} ->
    {{? codes, environment, state | LowM.Call e1 k ⇓ output | state' ?}}
  | CallUnfold {B : Set} (e1 : LowM.t B) k state state' :
    {{? codes, environment, state | LowM.let_ e1 k ⇓ output | state' ?}} ->
    {{? codes, environment, state | LowM.Call e1 k ⇓ output | state' ?}}
  | LoopOngoing {In Out : Set}
      (init next_init : In)
      (body : In -> LowM.t Out)
      (break_with : Out -> In + Out)
      (k : Out -> LowM.t A)
      (output_inter : Out)
      (state state_inter state' : option State.t) :
    {{? codes, environment, state |
      body init ⇓ output_inter
    | state_inter ?}} ->
    break_with output_inter = inl next_init ->
    {{? codes, environment, state_inter |
      LowM.Loop next_init body break_with k ⇓ output
    | state' ?}} ->
    {{? codes, environment, state |
      LowM.Loop init body break_with k ⇓ output
    | state' ?}}
  | LoopTerminating {In Out : Set}
      (init : In)
      (body : In -> LowM.t Out)
      (break_with : Out -> In + Out)
      (k : Out -> LowM.t A)
      (output_inter output_inter' : Out)
      (state state_inter state' : option State.t) :
    {{? codes, environment, state |
      body init ⇓ output_inter
    | state_inter ?}} ->
    break_with output_inter = inr output_inter' ->
    {{? codes, environment, state_inter |
      k output_inter' ⇓ output
    | state' ?}} ->
    {{? codes, environment, state |
      LowM.Loop init body break_with k ⇓ output
    | state' ?}}

  where "{{? codes , environment , state | e ⇓ output | state' ?}}" :=
    (t codes environment output state e state').

  Lemma If codes environment {A : Set} (condition : bool) (e1 e2 : LowM.t A)
      state output1 output2 state'1 state'2 :
    {{? codes, environment, state | e1 ⇓ output1 | state'1 ?}} ->
    {{? codes, environment, state | e2 ⇓ output2 | state'2 ?}} ->
    {{? codes, environment, state |
      if condition then e1 else e2 ⇓
      if condition then output1 else output2
    | if condition then state'1 else state'2 ?}}.
  Proof.
    now destruct condition.
  Qed.

  Lemma LoopStep codes environment {In Out : Set}
      (init : In)
      (body : In -> LowM.t Out)
      (break_with : Out -> In + Out)
      (k : Out -> LowM.t Out)
      (output output_inter : Out)
      state state_inter state'
      (H_body : {{? codes, environment, state | body init ⇓ output_inter | state_inter ?}})
      (H_break_with :
        match break_with output_inter with
        | inr output_inter' =>
          {{? codes, environment, state_inter |
            k output_inter' ⇓ output
          | state' ?}}
        | inl next_init =>
          {{? codes, environment, state_inter |
            LowM.Loop next_init body break_with k ⇓ output
          | state' ?}}
        end
      ) :
    {{? codes, environment, state |
      LowM.Loop init body break_with k ⇓ output
    | state' ?}}.
  Proof.
    destruct break_with as [next_init|output_inter'] eqn:?.
    { eapply LoopOngoing;
        try apply H_body;
        try apply H_break_with;
        assumption.
    }
    { eapply LoopTerminating;
        try apply H_body;
        try apply H_break_with;
        assumption.
    }
  Qed.

  (** As a simplification, to start a proof. Here we assume we only do one step of the loop
      execution. *)
  Lemma LoopOneStepUnsafe codes environment {In Out : Set}
      (init : In)
      (body : In -> LowM.t Out)
      (break_with : Out -> In + Out)
      (k : Out -> LowM.t Out)
      output output_inter state state_inter state'
      default_output
      (H_body : {{? codes, environment, state | body init ⇓ output_inter | state_inter ?}})
      (H_k : {{? codes, environment, state_inter | k default_output ⇓ output | state' ?}}) :
    {{? codes, environment, state |
      LowM.Loop init body break_with k ⇓ output
    | state' ?}}.
  Admitted.

  Lemma PureEq codes environment {A : Set} (output output' : A) state state' :
    output = output' ->
    state = state' ->
    {{? codes, environment, state | LowM.Pure output ⇓ output' | state' ?}}.
  Proof.
    intros -> ->.
    now constructor.
  Qed.

  (** Apply the [simpl] tactic on the expressions of the reduction relation, the finale state, but
      not the initial state. *)
  Ltac simpl_goal :=
    match goal with
    | |- {{? _, _, _ | ?expr1 ⇓ ?expr2 | ?state_end ?}} =>
      let expr1' := eval simpl in expr1 in
      change expr1 with expr1';
      let expr2' := eval simpl in expr2 in
      change expr2 with expr2';
      let state_end' := eval simpl in state_end in
      change state_end with state_end'
    end.

  (** ** Very short shortcuts for commonly used tactics. *)
  Ltac p := apply RunO.Pure.
  Ltac pn := apply RunO.PureNone.
  Ltac pe := apply RunO.PureEq.
  Ltac pr := eapply RunO.Primitive; [reflexivity |].
  Ltac prn := eapply RunO.PrimitiveNone.
  Ltac l := eapply RunO.Let.
  Ltac lu := apply RunO.LetUnfold.
  Ltac c := eapply RunO.Call.
  Ltac cu := apply RunO.CallUnfold.
  Ltac s := fold @LowM.let_; simpl_goal.
End RunO.

Import RunO.

Module RunP.
  Reserved Notation "{{{ codes , environment , state | e ⇓ P_output_state' }}}".

  Inductive t {A : Set} (codes : Codes.t) (environment : Environment.t)
      (state : State.t) (P_output_state' : A -> State.t -> Prop) :
      LowM.t A -> Prop :=
  | Pure (output : A) :
    P_output_state' output state ->
    {{{ codes, environment, state | LowM.Pure output ⇓ P_output_state' }}}
  | Primitive {B : Set} (primitive : Primitive.t B) (k : B -> LowM.t A) value state_inter :
    inl (value, state_inter) = eval_primitive environment primitive state ->
    {{{ codes, environment, state_inter | k value ⇓ P_output_state' }}} ->
    {{{ codes, environment, state | LowM.Primitive primitive k ⇓ P_output_state' }}}
  | CallFunction name arguments k P_results_state_inter :
    let function := Codes.get_function codes environment name in
    {{{ codes, environment, state | function arguments ⇓ P_results_state_inter }}} ->
    (forall results state_inter,
      P_results_state_inter results state_inter ->
      {{{ codes, environment, state_inter | k results ⇓ P_output_state' }}}
    ) ->
    {{{ codes, environment, state | LowM.CallFunction name arguments k ⇓ P_output_state' }}}
  | Let {B : Set} (e1 : LowM.t B) k P_output_state_inter :
    {{{ codes, environment, state | e1 ⇓ P_output_state_inter }}} ->
    (forall output_inter state_inter,
      P_output_state_inter output_inter state_inter ->
      {{{ codes, environment, state_inter | k output_inter ⇓ P_output_state' }}}
     ) ->
    {{{ codes, environment, state | LowM.Let e1 k ⇓ P_output_state' }}}
  | Call {B : Set} (e1 : LowM.t B) k P_output_state_inter :
    {{{ codes, environment, state | e1 ⇓ P_output_state_inter }}} ->
    (forall output_inter state_inter,
      P_output_state_inter output_inter state_inter ->
      {{{ codes, environment, state_inter | k output_inter ⇓ P_output_state' }}}
     ) ->
    {{{ codes, environment, state | LowM.Call e1 k ⇓ P_output_state' }}}

  where "{{{ codes , environment , state | e ⇓ P_output_state' }}}" :=
    (t codes environment state P_output_state' e).

  Ltac apply_pure :=
    now eapply RunP.Pure with (P_output_state' := fun output state' => output = _ /\ state' = _).
End RunP.

Import RunP.

(** The [eval] function follows the semantics given by [Run.t]. *)
(* Fixpoint eval_is_run {A : Set}
    (fuel : nat)
    (environment : Environment.t)
    (state : State.t)
    (e : LowM.t A)
    (output : A)
    (state' : State.t) :
  eval fuel environment state e = (inl output, state') ->
  {{ environment, state | e ⇓ output | state' }}.
Proof.
  destruct fuel as [|fuel]; [discriminate|].
  destruct e; cbn; intros H_eval.
  { (* Pure *)
    inversion H_eval; constructor.
  }
  { (* Primitive *)
    destruct primitive;
      cbn in H_eval;
      constructor;
      eapply eval_is_run;
      eassumption.
  }
  { (* DeclareFunction *)
    constructor.
    eapply eval_is_run.
    eassumption.
  }
  { (* CallFunction *)
    destruct eval as [[results | message] locals_inter] eqn:H_eval_inter in H_eval.
    { econstructor;
        eapply eval_is_run;
        eassumption.
    }
    { discriminate. }
  }
  { (* Let *)
    destruct eval as [[results | message] locals_inter] eqn:H_eval_inter in H_eval.
    { econstructor;
        eapply eval_is_run;
        eassumption.
    }
    { discriminate. }
  }
  { (* Impossible *)
    discriminate.
  }
Qed. *)

Definition clear_account_code (accounts : list (U256.t * Account.t)) (address : U256.t) :
    list (U256.t * Account.t) :=
  List.filter (fun '(current_address, _) => negb (current_address =? address)) accounts.

Definition normalize_created_account_nonce (entry : U256.t * Account.t) : U256.t * Account.t :=
  let '(address, account) := entry in
  (
    address,
    if account.(Account.nonce) =? -1 then
      account <| Account.nonce := 1 |>
    else
      account
  ).

Definition finalize_selfdestructs (state : State.t) : State.t :=
  let accounts :=
    List.fold_left clear_account_code
      state.(State.selfdestructed_created_accounts)
      state.(State.accounts) in
  state
    <| State.accounts := List.map normalize_created_account_nonce accounts |>
    <| State.created_accounts := [] |>
    <| State.selfdestructed_created_accounts := [] |>.

Definition eval_with_revert
    (fuel : nat)
    (codes : Codes.t)
    (environment : Environment.t)
    (e : M.t BlockUnit.t)
    (state : State.t) :
    (Result.t BlockUnit.t + string) * State.t :=
  match increase_value_of_current_contract environment state environment.(Environment.callvalue) with
  | inr error => (inr error, state)
  | inl state =>
  let '(output, state') := eval fuel codes environment e state in
  match output with
  | inl (Result.Revert _ _) => (output, state' <| State.accounts := state.(State.accounts) |>)
  | _ => (output, finalize_selfdestructs state')
  end
  end.

Module Compare.
  (** [None] if not a stack primitive, [Some None] for a stack primitive with error,
      and [Some (Some result)] otherwise. *)
  Definition eval_stack_primitive {A : Set} (primitive : Primitive.t A) :
      option (Stack.t -> option (A * Stack.t)) :=
    match primitive with
    | Primitive.OpenScope => Some (fun stack => Some (tt, Stack.open_scope stack))
    | Primitive.CloseScope =>
      Some (fun stack => match Stack.close_scope stack with
      | inr _ => None
      | inl stack => Some (tt, stack)
      end)
    | Primitive.GetVar name =>
      Some (fun stack => match Stack.get_var stack name with
      | inr _ => None
      | inl value => Some (value, stack)
      end)
    | Primitive.DeclareVars names values =>
      Some (fun stack => match Stack.declare_vars stack names values with
      | inr _ => None
      | inl stack => Some (tt, stack)
      end)
    | Primitive.AssignVars names values =>
      Some (fun stack => match Stack.assign_vars stack names values with
      | inr _ => None
      | inl stack => Some (tt, stack)
      end)
    | _ => None
    end.

  Ltac break_eval_primitive_matches :=
    repeat match goal with
    | |- context[Dict.get ?dict ?key] => destruct (Dict.get dict key) eqn:?
    | |- context[Dict.assign_function ?dict ?key ?f] =>
      destruct (Dict.assign_function dict key f) eqn:?
    | |- context[Stack.close_scope ?stack] => destruct (Stack.close_scope stack) eqn:?
    | |- context[Stack.get_var ?stack ?name] => destruct (Stack.get_var stack name) eqn:?
    | |- context[Stack.declare_vars ?stack ?names ?values] =>
      destruct (Stack.declare_vars stack names values) eqn:?
    | |- context[Stack.assign_vars ?stack ?names ?values] =>
      destruct (Stack.assign_vars stack names values) eqn:?
    | |- context[State.is_static ?state] => destruct (State.is_static state) eqn:?
    end.

  Lemma eval_stack_primitive_none_eq {A : Set} (primitive : Primitive.t A) :
    eval_stack_primitive primitive = None ->
    forall (environment : Environment.t) (state : State.t),
    match eval_primitive environment primitive state with
    | inl (_, state') => state'.(State.stack) = state.(State.stack)
    | inr _ => True
    end.
  Admitted.

  Lemma eval_stack_primitive_some_eq {A : Set} (primitive : Primitive.t A) :
    match eval_stack_primitive primitive with
    | Some eval_stack =>
      forall (environment : Environment.t) (state : State.t),
      match eval_primitive environment primitive state, eval_stack state.(State.stack) with
      | inl (value, state'), Some (value', stack') =>
          value = value' /\ state' = state <| State.stack := stack' |>
      | inr _, None => True
      | _, _ => False
      end
    | None => True
    end.
  Admitted.

  Definition map_on_output_state_of_eval_primitive {A : Set}
      (f : State.t -> State.t) (output : (A * State.t) + string) :
      (A * State.t) + string :=
    match output with
    | inl (value, state) => inl (value, f state)
    | inr _ => output
    end.

  Lemma eval_stack_primitive_none_does_not_use_stack {A : Set} (primitive : Primitive.t A) :
    eval_stack_primitive primitive = None ->
    forall (environment : Environment.t) (state : State.t) (stack : Stack.t),
    eval_primitive environment primitive (state <| State.stack := stack |>) =
    map_on_output_state_of_eval_primitive
      (fun state => state <| State.stack := stack |>)
      (eval_primitive environment primitive state).
  Admitted.

  Lemma eval_stack_primitive_some_only_use_stack {A : Set} (primitive : Primitive.t A) :
    eval_stack_primitive primitive <> None ->
    forall (environment : Environment.t) (state state' : State.t),
    eval_primitive environment primitive (state' <| State.stack := state.(State.stack) |>) =
    map_on_output_state_of_eval_primitive
      (fun state => state' <| State.stack := state.(State.stack) |>)
      (eval_primitive environment primitive state).
  Admitted.

  Module Liftable.
    Class C (A A' : Set) := {
      lift : A' -> A;
      IsInjection : forall (a1 a2: A'), lift a1 = lift a2 -> a1 = a2;
    }.

    #[refine]
    Global Instance I_BlockUnit : C BlockUnit.t BlockUnit.t := {
      lift := fun v => v;
    }.
    Proof.
      sfirstorder.
    Defined.

    #[refine]
    Global Instance I_Unit : C BlockUnit.t unit := {
      lift := fun _ => BlockUnit.Tt;
    }.
    Proof.
      sauto lq: on.
    Defined.

    #[refine]
    Global Instance I_Tuple0 : C (list U256.t) unit := {
      lift := fun _ => [];
    }.
    Proof.
      sauto lq: on.
    Defined.

    #[refine]
    Global Instance I_Tuple1 : C (list U256.t) U256.t := {
      lift := fun v1 =>  [v1];
    }.
    Proof.
      hauto lq: on.
    Defined.

    #[refine]
    Global Instance I_Tuple2 : C (list U256.t) (U256.t * U256.t) := {
      lift := fun '(v1, v2) => [v1; v2];
    }.
    Proof.
      hauto lq: on.
    Defined.

    #[refine]
    Global Instance I_Tuple3 : C (list U256.t) (U256.t * U256.t * U256.t) := {
      lift := fun '(v1, v2, v3) => [v1; v2; v3];
    }.
    Proof.
      hauto lq: on.
    Defined.

    #[refine]
    Global Instance I_Tuple4 : C (list U256.t) (U256.t * U256.t * U256.t * U256.t) := {
      lift := fun '(v1, v2, v3, v4) => [v1; v2; v3; v4];
    }.
    Proof.
      hauto lq: on.
    Defined.

    #[refine]
    Global Instance I_Tuple5 : C (list U256.t) (U256.t * U256.t * U256.t * U256.t * U256.t) := {
      lift := fun '(v1, v2, v3, v4, v5) => [v1; v2; v3; v4; v5];
    }.
    Proof.
      hauto lq: on.
    Defined.
  End Liftable.

  Lemma result_map_injection {A A' : Set} `{Liftable.C A A'}
      (output1 output2 : Result.t A') :
    Result.map Liftable.lift output1 = Result.map Liftable.lift output2 ->
    output1 = output2.
  Proof.
    destruct H, output1, output2; cbn; hauto q: on.
  Qed.

  Definition is_function_name_pure (name : string) : bool :=
    match name with
    | "add"
    | "sub"
    | "mul"
    | "div"
    | "sdiv"
    | "mod"
    | "smod"
    | "exp"
    | "not"
    | "lt"
    | "gt"
    | "slt"
    | "sgt"
    | "eq"
    | "iszero"
    | "and"
    | "or"
    | "xor"
    | "byte"
    | "shl"
    | "shr"
    | "sar"
    | "addmod"
    | "mulmod"
    | "signextend" => true
    | _ => false
    end.

  (** We use this predicate to construct a proof that a program without stack is equivalent to the
      original version putting local variables on a stack of scopes.
      We do not yet have a proof that this predicate is correct. This is a work that we will need
      to do, but we first need to introduce concepts to reason at the meta-level of the language,
      introducing concepts like simulations between computations. *)
  Inductive t
      (codes : Codes.t) (environment : Environment.t) (stack : Stack.t) :
      forall {A A' : Set} `{Liftable.C A A'},
      Stack.t -> M.t A -> M.t A' -> Prop :=
  | Pure {A A' : Set} `{Liftable.C A A'}
      (output : Result.t A) (output' : Result.t A') :
    output = Result.map Liftable.lift output' ->
    t codes environment stack stack
      (LowM.Pure output) (LowM.Pure output')
  | PrimitiveNonStack {A A' : Set} `{Liftable.C A A'} {B : Set}
      (primitive : Primitive.t B) (k1 : B -> M.t A) (k2 : B -> M.t A') stack' :
    eval_stack_primitive primitive = None ->
    (forall value,
      t codes environment stack stack'
        (k1 value) (k2 value)
    ) ->
    t codes environment stack stack'
      (LowM.Primitive primitive k1) (LowM.Primitive primitive k2)
  | PrimitiveStack {A A' : Set} `{Liftable.C A A'} {B : Set}
      (primitive : Primitive.t B) (value : B) (k1 : B -> M.t A) (e2 : M.t A')
      eval_stack stack_inter stack' :
    eval_stack_primitive primitive = Some eval_stack ->
    eval_stack stack = Some (value, stack_inter) ->
    t codes environment stack_inter stack' (k1 value) e2 ->
    t codes environment stack stack' (LowM.Primitive primitive k1) e2
  | CallFunction {A A' : Set} `{Liftable.C A A'} {B : Set} `{Liftable.C (list U256.t) B}
      name arguments
      (k1 : Result.t (list U256.t) -> M.t A) (e2 : M.t B) (k2 : Result.t B -> M.t A') stack' :
    let f1 : list U256.t -> M.t (list U256.t) :=
      Codes.get_function codes environment name in
    t codes environment stack stack (f1 arguments) e2 ->
    (forall (value : Result.t B),
      t codes environment stack stack'
        (k1 (Result.map Liftable.lift value)) (k2 value)
    ) ->
    t codes environment stack stack'
      (LowM.CallFunction name arguments k1)
      (LowM.Call e2 k2)
  | LetUnfold {A A' : Set} `{Liftable.C A A'} {B B' : Set}
      (e1 : M.t B) (k1 : Result.t B -> M.t A) (e2 : M.t B') (k2 : Result.t B' -> M.t A') stack' :
    t codes environment stack stack'
      (LowM.let_ e1 k1)
      (LowM.let_ e2 k2) ->
    t codes environment stack stack'
      (LowM.Let e1 k1)
      (LowM.Let e2 k2)
  | Let {A A' : Set} `{Liftable.C A A'} {B B' : Set} `{Liftable.C B B'}
      (e1 : M.t B) (k1 : Result.t B -> M.t A) (e2 : M.t B') (k2 : Result.t B' -> M.t A')
      stack_inter stack' :
    t codes environment stack stack_inter
      e1 e2 ->
    (forall (value : Result.t B'),
      t codes environment stack_inter stack'
        (k1 (Result.map Liftable.lift value)) (k2 value)
    ) ->
    t codes environment stack stack'
      (LowM.Let e1 k1)
      (LowM.Let e2 k2)
  | ReturnUnit (body : M.t unit) :
    t codes environment stack stack
      (Stdlib.return_unit body)
      body
  | ReturnU256 (body : M.t U256.t) :
    t codes environment stack stack
      (Stdlib.return_u256 body)
      body.

  (** This is a beginning of proof for the comparison predicate above. We will need more
      preliminary work like defining what it means for a computation to simulate another one, how
      to reason on potentially non-terminating terms, clearly separating the stack operations in
      the semantics, ... *)
  Module WorkInProgressVerifytheComparePredicate.
  (*
  Module ImpliesOriginalEval.
    Definition t {A A' : Set} `{Liftable.C A A'}
        (codes : Codes.t) (environment : Environment.t) (stack stack' : Stack.t)
        (body_with_stack : M.t A) (body : M.t A') : Prop :=
      forall (fuel : nat) (state state' : State.t) (output : Result.t A'),
      eval fuel codes environment body state = (inl output, state') ->
      exists fuel_with_stack,
      eval fuel_with_stack codes environment body_with_stack (state <| State.stack := stack |>) =
        (inl (Result.map Liftable.lift output), (state' <| State.stack := stack' |>)).
  End ImpliesOriginalEval.

  Module DoesNotUseStack.
    Definition t {A' : Set}
        (codes : Codes.t) (environment : Environment.t) (body : M.t A') : Prop :=
      forall (fuel : nat) (state : State.t) (stack : Stack.t),
      eval fuel codes environment body (state <| State.stack := stack |>) =
      let '(result, state') := eval fuel codes environment body state in
      (result, state' <| State.stack := stack |>).
  End DoesNotUseStack.

  Module Def.
    Record t {A A' : Set} `{Liftable.C A A'}
        (codes : Codes.t) (environment : Environment.t) (stack stack' : Stack.t)
        (body_with_stack : M.t A) (body : M.t A') : Prop := {
      implies_original_eval :
        ImpliesOriginalEval.t codes environment stack stack' body_with_stack body;
      does_not_use_stack :
        DoesNotUseStack.t codes environment body;
    }.
  End Def.

  Lemma pure {A A' : Set} `{Liftable.C A A'}
      (codes : Codes.t) (environment : Environment.t) (stack : Stack.t)
      (output : Result.t A) (output' : Result.t A')
      (H_output : output = Result.map Liftable.lift output') :
    Def.t codes environment stack stack
      (LowM.Pure output) (LowM.Pure output').
  Proof.
    constructor.
    { unfold ImpliesOriginalEval.t; intros.
      exists fuel.
      destruct fuel; best.
    }
    { unfold DoesNotUseStack.t; intros.
      destruct fuel; best.
    }
  Qed.

  Lemma primitive_no_stack {A A' : Set} `{Liftable.C A A'}
      (codes : Codes.t) (environment : Environment.t) (stack : Stack.t)
      {B : Set} (primitive : Primitive.t B) k1 k2 stack'
      (H_primitive : eval_stack_primitive primitive = None)
      (H_k : forall value,
        Def.t codes environment stack stack'
          (k1 value) (k2 value)
      ) :
    Def.t codes environment stack stack'
      (LowM.Primitive primitive k1) (LowM.Primitive primitive k2).
  Proof.
    constructor.
    { unfold ImpliesOriginalEval.t; intros * H_eval.
      destruct fuel as [|fuel]; simpl in *; [congruence|].
      match goal with
      | H : _ |- _ => pose proof (eval_stack_primitive_none_eq _ H environment state)
      end.
      destruct eval_primitive eqn:?; [|congruence].
      Tactics.destruct_pairs.
      match goal with
      | value : B |- _ => destruct (H_k value)
      end.
      unfold ImpliesOriginalEval.t in implies_original_eval.
      epose proof (H_eval_k := implies_original_eval _ _ _ _ H_eval).
      destruct H_eval_k as [fuel_with_stack ?].
      exists (S fuel_with_stack).
      simpl.
      best.
      Unshelve.
      best.
    }
    { unfold DoesNotUseStack.t; intros.
      destruct fuel; simpl; [reflexivity|].
      rewrite eval_stack_primitive_none_does_not_use_stack by assumption.
      destruct eval_primitive; simpl; [|reflexivity].
      Tactics.destruct_pairs.
      match goal with
      | value : B |- _ => destruct (H_k value)
      end.
      apply does_not_use_stack.
    }
  Qed.

  Lemma primitive_stack {A A' : Set} `{Liftable.C A A'}
      (codes : Codes.t) (environment : Environment.t) (stack : Stack.t)
      {B : Set}
      (primitive : Primitive.t B) (value : B) (k1 : B -> M.t A) (e2 : M.t A')
      eval_stack stack_inter stack'
      (H_eval_stack : eval_stack_primitive primitive = Some eval_stack)
      (H_stack : eval_stack stack = Some (value, stack_inter))
      (H_k : Def.t codes environment stack_inter stack' (k1 value) e2) :
    Def.t codes environment stack stack' (LowM.Primitive primitive k1) e2.
  Proof.
    constructor.
    { unfold ImpliesOriginalEval.t; intros * H_state H_state' H_eval.
      epose proof (H_eval_eq := eval_stack_primitive_some_eq primitive).
      pose proof (H_eval_primitive_only_stack :=
        eval_stack_primitive_some_only_use_stack primitive ltac:(congruence) environment).
      destruct eval_stack_primitive; [|congruence].
      injection H_eval_stack; intros H_eval_stack_eq;
        rewrite H_eval_stack_eq in *; clear H_eval_stack_eq.
      pose proof (H_eval_eq environment state); clear H_eval_eq.
      rewrite H_state in *.
      rewrite H_stack in *.
      destruct eval_primitive eqn:?; [|easy].
      Tactics.destruct_pairs.
      subst.
      destruct H_k.
      unfold ImpliesOriginalEval.t, DoesNotUseStack.t in *.
      epose proof (H_k_instance :=
        implies_original_eval fuel (state<|State.stack:= stack_inter|>) state' output
        _ ltac:(reflexivity)).
  Admitted.

  Definition def {A A' : Set} `{Liftable.C A A'}
      (codes : Codes.t) (environment : Environment.t) (stack stack' : Stack.t)
      (body_with_stack : M.t A) (body : M.t A') : Prop :=
    forall (fuel : nat) (state state' : State.t) (output : Result.t A'),
    eval fuel codes environment body_with_stack (state <| State.stack := stack |>) =
      (inl (Result.map Liftable.lift output), state') ->
    state'.(State.stack) = stack' /\
    eval fuel codes environment body state =
      (inl output, state' <| State.stack := state.(State.stack) |>).

  Lemma pure {A A' : Set} `{Liftable.C A A'}
      (codes : Codes.t) (environment : Environment.t) (stack : Stack.t)
      (output : Result.t A) (output' : Result.t A')
      (H_output : output = Result.map Liftable.lift output') :
    def codes environment stack stack
      (LowM.Pure output) (LowM.Pure output').
  Proof.
    unfold def; intros.
    destruct fuel; simpl in *; best using result_map_injection.
  Qed.

  Definition def {A A' : Set} `{Liftable.C A A'}
      (codes : Codes.t) (environment : Environment.t) (stack stack' : Stack.t)
      (body_with_stack : M.t A) (body : M.t A') : Prop :=
    forall (state : State.t),
    exists (state' : State.t) (output : Result.t A'),
    {{ codes, environment, state <| State.stack := stack |> |
      body_with_stack ⇓
      Result.map Liftable.lift output
    | state' <| State.stack := stack' |> }}.

  Fixpoint def_implies {A A' : Set} `{Liftable.C A A'}
      (codes : Codes.t) (environment : Environment.t) (stack stack' : Stack.t)
      (body_with_stack : M.t A) (body : M.t A')
      (H_compare : t codes environment stack stack' body_with_stack body) :
    def codes environment stack stack' body_with_stack body.
  Proof.
    destruct H_compare;
      unfold def; intros; repeat eexists.
    { subst.
      apply Run.Pure.
    }
    { eapply Run.Primitive.

    }
  Qed.
  *)
  End WorkInProgressVerifytheComparePredicate.

  Module Tactic.
    Ltac stack_primitives :=
      repeat (eapply Compare.PrimitiveStack; [reflexivity|reflexivity|]).

    Ltac make_intro :=
      intros []; repeat (eapply Compare.PrimitiveStack; [reflexivity|reflexivity|]);
        try now apply Compare.Pure.


    Ltac expression helper :=
      repeat (
        (* Literal *)
        (now apply Compare.Pure) ||
        (* Variable *)
        Compare.Tactic.stack_primitives ||
        (* Impure function call *)
        (eapply Compare.CallFunction; [
          apply Compare.ReturnUnit ||
          apply Compare.ReturnU256 ||
          helper |
          Compare.Tactic.make_intro
        ])
      ).

    (* Ltac open_if :=
      unfold M.if_, M.if_unit; simpl;
        match goal with
        | |- Compare.t _ _ _ _ (if ?cond then _ else _) _ =>
          destruct cond; [now apply Compare.Pure|]
        end. *)

    Ltac open_switch_case :=
      match goal with
      | |- Compare.t _ _ _ _ ?left ?right =>
        let left' := eval hnf in left in
        change left with left';
        let right' := eval hnf in right in
        change right with right'
      end;
      match goal with
      | |- Compare.t _ _ _ _ (if ?cond then _ else _) _ =>
        destruct cond
      end.
  End Tactic.
End Compare.

Definition update_current_code_for_deploy (hex_name : Z) : M.t BlockUnit.t :=
  let* environment := LowM.Primitive Primitive.GetEnvironment M.pure in
  let address := environment.(Environment.address) in
  let* tt := LowM.Primitive (Primitive.UpdateCodeForDeploy address hex_name) M.pure in
  M.pure BlockUnit.Tt.

(** We design the testing primitives so that, in case of error, we can see what was wrong. *)
Module Test.
  (** Supposed to be equal to [inl]. *)
  Definition is_return (result : Result.t BlockUnit.t + string) (state : State.t) :
      list Z + (Result.t BlockUnit.t + string) :=
    match result with
    | inl (Result.Return start length) =>
      let output := Memory.get_bytes state.(State.memory) start length in
      inl output
    | _ => inr result
    end.

  Module Status.
    Inductive t : Set :=
    | Success
    | Failure
    | OutOfGas.
  End Status.

  (** Supposed to be equal to [inl]. *)
  Definition extract_output
      (result : Result.t BlockUnit.t + string)
      (state : State.t)
      (status : Status.t) :
      list Z + (Result.t BlockUnit.t + string) :=
    match status with
    | Status.Success =>
      match result with
      | inl (Result.Return start length) =>
        let output := Memory.get_bytes state.(State.memory) start length in
        inl output
      | _ => inr result
      end
    | Status.Failure =>
      match result with
      | inl (Result.Revert start length) =>
        let output := Memory.get_bytes state.(State.memory) start length in
        inl output
      | inr "out of fuel" => inl []
      | _ => inr result
      end
    | Status.OutOfGas =>
      (* We rely on the fact that most tests that end with an "out of gas" error also make
         an "out of fuel" error, even if these two measures of the execution steps are different. *)
      match result with
      | inr "out of fuel" => inl []
      | _ => inr result
      end
    end.
End Test.

Definition declared_vars (state : State.t) : list (list (string * U256.t)) :=
  state.(State.stack).

Definition wrap_state_with_revert {A : Set} (state : State.t) (output : Result.t A) :
    option State.t :=
  match output with
  | Result.Revert _ _ => None
  | _ => Some state
  end.

(** Useful to write some simulation. We should give it an explicit value. *)
Parameter keccak256_tuple2 : U256.t -> U256.t -> U256.t.
