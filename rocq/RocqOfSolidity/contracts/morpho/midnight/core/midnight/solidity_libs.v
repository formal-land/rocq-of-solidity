Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.solidity_types.

Module MidnightSolidityLibs.
  Module T := MidnightSolidityTypes.

  Module Uint.
    Definition max (bits : nat) : T.uint256 :=
      2 ^ Z.of_nat bits - 1.

    Definition max128 : T.uint256 :=
      max 128.
  End Uint.

  Module UtilsLib.
    Definition atMostOneNonZero (x y : T.uint256) : bool :=
      (x =? 0) || (y =? 0).

    Definition min (x y : T.uint256) : T.uint256 :=
      if y <? x then y else x.

    Definition zeroFloorSub (x y : T.uint256) : T.uint256 :=
      if x >? y then x - y else 0.

    Definition mulDivDown (x y d : T.uint256) : T.uint256 :=
      x * y / d.

    Definition mulDivUp (x y d : T.uint256) : T.uint256 :=
      (x * y + (d - 1)) / d.

    Definition toUint128 (x : T.uint256) : option T.uint128 :=
      if x <=? Uint.max128 then Some x else None.

    Fixpoint countBitsLoop (fuel : nat) (bit x : T.uint256) : T.uint256 :=
      match fuel with
      | O => 0
      | S fuel' =>
        (if Z.testbit x bit then 1 else 0) + countBitsLoop fuel' (bit + 1) x
      end.

    Definition countBits (x : T.uint128) : T.uint256 :=
      countBitsLoop 128 0 x.

    Fixpoint msbLoop (fuel : nat) (bit bitmap : T.uint256) : T.uint256 :=
      match fuel with
      | O => 0
      | S fuel' =>
        if Z.testbit bitmap bit then bit else msbLoop fuel' (bit - 1) bitmap
      end.

    Definition msb (bitmap : T.uint128) : T.uint256 :=
      msbLoop 128 127 bitmap.

    Definition setBit (bitmap : T.uint128) (bit : T.uint256) : T.uint128 :=
      Z.lor bitmap (2 ^ bit).

    Definition clearBit (bitmap : T.uint128) (bit : T.uint256) : T.uint128 :=
      if Z.testbit bitmap bit then bitmap - 2 ^ bit else bitmap.

    Definition tExchange
        (state : T.State.t) (_baseSlot : T.uint256) (key1 : T.bytes32)
        (key2 : T.address) (value : bool) : bool * T.State.t :=
      let previous := T.State.liquidationLockedOf state key1 key2 in
      (previous, T.State.setLiquidationLocked state key1 key2 value).

    Definition tGet
        (state : T.State.t) (_baseSlot : T.uint256) (key1 : T.bytes32) (key2 : T.address) : bool :=
      T.State.liquidationLockedOf state key1 key2.
  End UtilsLib.

  Module ConstantsLib.
    Definition WAD : T.uint256 := 1000000000000000000.
    Definition ORACLE_PRICE_SCALE : T.uint256 := 1000000000000000000000000000000000000.
    Definition CBP : T.uint256 := 1000000000000.

    Definition MAX_SETTLEMENT_FEE_0_DAYS : T.uint256 := 14000000000000.
    Definition MAX_SETTLEMENT_FEE_1_DAY : T.uint256 := 14000000000000.
    Definition MAX_SETTLEMENT_FEE_7_DAYS : T.uint256 := 98000000000000.
    Definition MAX_SETTLEMENT_FEE_30_DAYS : T.uint256 := 417000000000000.
    Definition MAX_SETTLEMENT_FEE_90_DAYS : T.uint256 := 1250000000000000.
    Definition MAX_SETTLEMENT_FEE_180_DAYS : T.uint256 := 2500000000000000.
    Definition MAX_SETTLEMENT_FEE_360_DAYS : T.uint256 := 5000000000000000.

    Definition MAX_CONTINUOUS_FEE : T.uint32 :=
      10000000000000000 / (365 * 24 * 60 * 60).

    Definition TIME_TO_MAX_LIF : T.uint256 := 15 * 60.
    Definition MAX_COLLATERALS : T.uint256 := 128.
    Definition MAX_COLLATERALS_PER_BORROWER : T.uint256 := 16.
    Definition LIQUIDATION_CURSOR_LOW : T.uint256 := 250000000000000000.
    Definition LIQUIDATION_CURSOR_HIGH : T.uint256 := 500000000000000000.

    (** Abstracted constants; exact keccak values are irrelevant until refinement. *)
    Definition LIQUIDATION_LOCK_SLOT : T.uint256 := 0.
    Definition CALLBACK_SUCCESS : T.bytes32 := 1.

    Definition DEFAULT_TICK_SPACING : T.uint8 := 4.

    Definition LLTV_0 : T.uint256 := 385000000000000000.
    Definition LLTV_1 : T.uint256 := 625000000000000000.
    Definition LLTV_2 : T.uint256 := 770000000000000000.
    Definition LLTV_3 : T.uint256 := 860000000000000000.
    Definition LLTV_4 : T.uint256 := 915000000000000000.
    Definition LLTV_5 : T.uint256 := 945000000000000000.
    Definition LLTV_6 : T.uint256 := 965000000000000000.
    Definition LLTV_7 : T.uint256 := 980000000000000000.
    Definition LLTV_8 : T.uint256 := WAD.

    Definition isLltvAllowed (lltv : T.uint256) : bool :=
      (lltv =? LLTV_0) || (lltv =? LLTV_1) || (lltv =? LLTV_2) ||
      (lltv =? LLTV_3) || (lltv =? LLTV_4) || (lltv =? LLTV_5) ||
      (lltv =? LLTV_6) || (lltv =? LLTV_7) || (lltv =? LLTV_8).

    Definition maxSettlementFee (index : T.uint256) : T.uint256 :=
      if index =? 0 then MAX_SETTLEMENT_FEE_0_DAYS
      else if index =? 1 then MAX_SETTLEMENT_FEE_1_DAY
      else if index =? 2 then MAX_SETTLEMENT_FEE_7_DAYS
      else if index =? 3 then MAX_SETTLEMENT_FEE_30_DAYS
      else if index =? 4 then MAX_SETTLEMENT_FEE_90_DAYS
      else if index =? 5 then MAX_SETTLEMENT_FEE_180_DAYS
      else if index =? 6 then MAX_SETTLEMENT_FEE_360_DAYS
      else 0.

    Definition maxLif (lltv cursor : T.uint256) : T.uint256 :=
      UtilsLib.mulDivDown WAD WAD (WAD - UtilsLib.mulDivDown cursor (WAD - lltv) WAD).
  End ConstantsLib.

  Module TickLib.
    Definition LN_ONE_PLUS_DELTA : Z := 4987541511039073.
    Definition MAX_TICK : T.uint256 := 5820.
    Definition PRICE_ROUNDING_STEP : T.uint256 := 1000000000000.

    Definition divHalfDownUnchecked (x d : T.uint256) : T.uint256 :=
      (x + (d - 1) / 2) / d.

    Definition wExpNonnegative (x : Z) : T.uint256 :=
      let ln2 := 693147180559945309 in
      let offset := 322611214989459870 in
      let q := (x + offset) / ln2 in
      let r := x - q * ln2 in
      let secondTerm := r * r / (2 * ConstantsLib.WAD) in
      let thirdTerm := secondTerm * r / (3 * ConstantsLib.WAD) in
      let expR := ConstantsLib.WAD + r + secondTerm + thirdTerm in
      expR * 2 ^ q.

    Definition wExp (x : Z) : T.uint256 :=
      if x <? 0 then
        ConstantsLib.ORACLE_PRICE_SCALE / wExpNonnegative (- x)
      else
        wExpNonnegative x.

    Definition tickToPrice (tick : T.uint256) : option T.uint256 :=
      if tick <=? MAX_TICK then
        let raw :=
          divHalfDownUnchecked
            ConstantsLib.ORACLE_PRICE_SCALE
            (ConstantsLib.WAD + wExp (LN_ONE_PLUS_DELTA * (MAX_TICK / 2 - tick))) in
        Some (divHalfDownUnchecked raw PRICE_ROUNDING_STEP * PRICE_ROUNDING_STEP)
      else None.

    Fixpoint priceToTickLoop
        (fuel : nat) (price low high : T.uint256) : T.uint256 :=
      match fuel with
      | O => low
      | S fuel' =>
        if low =? high then low
        else
          let mid := (low + high) / 2 in
          match tickToPrice mid with
          | None => high
          | Some midPrice =>
            if midPrice <? price then
              priceToTickLoop fuel' price (mid + 1) high
            else
              priceToTickLoop fuel' price low mid
          end
      end.

    Definition priceToTick (price spacing : T.uint256) : option T.uint256 :=
      if price <=? ConstantsLib.WAD then
        let low := priceToTickLoop 64 price 0 MAX_TICK in
        Some ((low + spacing - 1) / spacing * spacing)
      else None.
  End TickLib.
End MidnightSolidityLibs.
