Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.simulations.RocqOfSolidity.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.shallow.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.solidity_types.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.solidity_libs.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.solidity_contract.

Import Stdlib.
Import RunO.

Module MidnightSolidityEquivalencePrelude.
  Module T := MidnightSolidityTypes.
  Module L := MidnightSolidityLibs.
  Module C := MidnightSolidityLibs.ConstantsLib.
  Module U := MidnightSolidityLibs.UtilsLib.
  Module M := MidnightSolidityContract.
  Module S := Midnight_3973.Midnight_3973_deployed.

  Definition bool_word (value : bool) : U256.t :=
    if value then 1 else 0.

  Definition uint128_valid (value : U256.t) : Prop :=
    0 <= value <= L.Uint.max128.

  Definition uint256_nonoverflow_sum (x y : U256.t) : Prop :=
    0 <= x + y < 2 ^ 256.

  Definition uint256_nonoverflow_product (x y : U256.t) : Prop :=
    0 <= x * y < 2 ^ 256.

  Record ViewStateRel (model_state : T.State.t) (evm_state : State.t) : Prop := {
    market_state_slot :
      forall id : T.bytes32, True;
    position_slot :
      forall (id : T.bytes32) (user : T.address), True;
    transient_lock_slot :
      forall (id : T.bytes32) (user : T.address),
        T.State.liquidationLockedOf model_state id user = true \/
        T.State.liquidationLockedOf model_state id user = false;
  }.

  Ltac run_generated :=
    repeat (lu || cu || c || l || s || p).

  Lemma log2_lt_256_of_uint256 value :
    U256.Valid.t value ->
    Z.log2 value < 256.
  Proof.
    unfold U256.Valid.t; intros H_value.
    destruct (value =? 0) eqn:H_zero.
    { apply Z.eqb_eq in H_zero.
      subst value.
      rewrite Z.log2_nonpos by lia.
      lia.
    }
    { apply Z.eqb_neq in H_zero.
      apply Z.log2_lt_pow2; lia.
    }
  Qed.

  Lemma lxor_uint256 x y :
    U256.Valid.t x ->
    U256.Valid.t y ->
    0 <= Z.lxor x y < 2 ^ 256.
  Proof.
    intros H_x H_y.
    split.
    { apply Z.lxor_nonneg.
      unfold U256.Valid.t in *; lia.
    }
    { destruct (Z.lxor x y =? 0) eqn:H_zero.
      { apply Z.eqb_eq in H_zero; lia. }
      apply Z.eqb_neq in H_zero.
      apply Z.log2_lt_pow2.
      { pose proof (Z.lxor_nonneg x y).
        unfold U256.Valid.t in *; lia.
      }
      eapply Z.le_lt_trans.
      { apply Z.log2_lxor; unfold U256.Valid.t in *; lia. }
      apply Z.max_lub_lt; now apply log2_lt_256_of_uint256.
    }
  Qed.

  Lemma lxor_cancel_l x y :
    Z.lxor x (Z.lxor x y) = y.
  Proof.
    apply Z.bits_inj; intros bit.
    repeat rewrite Z.lxor_spec.
    destruct (Z.testbit x bit), (Z.testbit y bit); reflexivity.
  Qed.
End MidnightSolidityEquivalencePrelude.
