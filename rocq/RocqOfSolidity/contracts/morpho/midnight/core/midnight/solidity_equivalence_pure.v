Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.simulations.RocqOfSolidity.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.solidity_equivalence_prelude.

Import Stdlib.
Import RunO.

Module MidnightSolidityEquivalencePure.
  Module E := MidnightSolidityEquivalencePrelude.
  Module S := E.S.
  Module L := E.L.
  Module U := E.U.

  Lemma atMostOneNonZero_pure_equiv codes environment state x y :
    {{? codes, environment, Some state |
      S.fun_atMostOneNonZero_5829 x y ⇓
      Result.Ok (E.bool_word (U.atMostOneNonZero x y))
    | Some state ?}}.
  Proof.
    unfold S.fun_atMostOneNonZero_5829, E.bool_word, U.atMostOneNonZero.
    E.run_generated.
    unfold Pure.or, Pure.iszero.
    repeat match goal with
    | |- context[?a =? 0] => destruct (a =? 0) eqn:?; simpl
    end; pe; reflexivity.
  Qed.

  Lemma min_pure_equiv codes environment state x y :
    U256.Valid.t x ->
    U256.Valid.t y ->
    {{? codes, environment, Some state |
      S.fun_min_5841 x y ⇓
      Result.Ok (U.min x y)
    | Some state ?}}.
  Proof.
    intros H_x H_y.
    unfold S.fun_min_5841, U.min.
    E.run_generated.
    unfold Pure.xor, Pure.mul, Pure.lt.
    destruct (y <? x) eqn:H_lt.
    { pe; [f_equal | reflexivity].
      rewrite Z.mul_1_r.
      rewrite Z.mod_small by now apply E.lxor_uint256.
      apply E.lxor_cancel_l.
    }
    { pe; [f_equal | reflexivity].
      rewrite Z.mul_0_r, Z.mod_0_l by lia.
      apply Z.lxor_0_r.
    }
  Qed.

  Lemma zeroFloorSub_pure_equiv codes environment state x y :
    U256.Valid.t x ->
    U256.Valid.t y ->
    {{? codes, environment, Some state |
      S.fun_zeroFloorSub_5852 x y ⇓
      Result.Ok (U.zeroFloorSub x y)
    | Some state ?}}.
  Proof.
    intros H_x H_y.
    unfold S.fun_zeroFloorSub_5852, U.zeroFloorSub.
    E.run_generated.
    unfold Pure.mul, Pure.gt, Pure.sub.
    unfold U256.Valid.t in *.
    destruct (x >? y) eqn:H_gt.
    { pe; [f_equal | reflexivity].
      rewrite Z.mul_1_l.
      rewrite Z.mod_small by lia.
      rewrite Z.mod_small by lia.
      reflexivity.
    }
    { pe; [reflexivity | reflexivity]. }
  Qed.

  Lemma toUint128_success_pure_equiv codes environment state x :
    U256.Valid.t x ->
    x <= L.Uint.max128 ->
    {{? codes, environment, Some state |
      S.fun_toUint128_5922 x ⇓
      Result.Ok x
    | Some state ?}}.
  Proof.
    intros H_x H_max.
    unfold S.fun_toUint128_5922.
    E.run_generated.
    unfold L.Uint.max128, L.Uint.max, U256.Valid.t in *.
    unfold Pure.gt, Pure.iszero.
    destruct (x >? 340282366920938463463374607431768211455) eqn:H_gt.
    { apply Z.gtb_gt in H_gt; lia. }
    E.run_generated.
    unfold Pure.and.
    replace 340282366920938463463374607431768211455 with (Z.ones 128) by reflexivity.
    rewrite Z.land_ones.
    { rewrite Z.mod_small by lia.
      pe; reflexivity.
    }
    { lia. }
  Qed.
End MidnightSolidityEquivalencePure.
