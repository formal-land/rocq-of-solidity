Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.simulations.RocqOfSolidity.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.solidity_equivalence_prelude.

Import Stdlib.
Import RunO.

Module MidnightSolidityEquivalenceViews.
  Module E := MidnightSolidityEquivalencePrelude.
  Module T := E.T.
  Module S := E.S.
  Module M := E.M.

  Record StatefulViewContext
      (model_state : T.State.t) (evm_state : State.t) : Prop := {
    view_state_rel : E.ViewStateRel model_state evm_state;
    market_state_readable :
      forall id : T.bytes32, True;
    position_readable :
      forall (id : T.bytes32) (user : T.address), True;
    transient_lock_readable :
      forall (id : T.bytes32) (user : T.address), True;
  }.

  Definition liquidationLocked_view_obligation : Prop :=
    forall codes environment evm_state model_state id user,
      StatefulViewContext model_state evm_state ->
      {{? codes, environment, Some evm_state |
        S.fun_liquidationLocked_3724 id user ⇓
        Result.Ok (E.bool_word (T.State.liquidationLockedOf model_state id user))
      | Some evm_state ?}}.

  Definition settlementFee_view_obligation : Prop :=
    forall codes environment evm_state model_state id timeToMaturity value,
      StatefulViewContext model_state evm_state ->
      M.settlementFeeCore model_state id timeToMaturity =
        T.Outcome.Ok model_state value ->
      {{? codes, environment, Some evm_state |
        S.fun_settlementFee_3972 id timeToMaturity ⇓
        Result.Ok value
      | Some evm_state ?}}.
End MidnightSolidityEquivalenceViews.
