Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.solidity_types.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.solidity_libs.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.solidity_contract.

Module MidnightFunctionalSpec.
  Module T := MidnightSolidityTypes.
  Module L := MidnightSolidityLibs.
  Module C := MidnightSolidityLibs.ConstantsLib.
  Module U := MidnightSolidityLibs.UtilsLib.
  Module M := MidnightSolidityContract.

  Definition triple_uint128 : Set :=
    T.uint128 * T.uint128 * T.uint128.

  Inductive PublicFunction : Set :=
  | PFConstructor
  | PFMulticall
  | PFSetRoleSetter
  | PFSetFeeSetter
  | PFSetFeeClaimer
  | PFSetTickSpacingSetter
  | PFSetMarketTickSpacing
  | PFSetMarketSettlementFee
  | PFSetDefaultSettlementFee
  | PFSetMarketContinuousFee
  | PFSetDefaultContinuousFee
  | PFClaimSettlementFee
  | PFClaimContinuousFee
  | PFTake
  | PFWithdraw
  | PFRepay
  | PFSupplyCollateral
  | PFWithdrawCollateral
  | PFLiquidate
  | PFSetConsumed
  | PFSetIsAuthorized
  | PFFlashLoan
  | PFTouchMarket
  | PFUpdatePositionView
  | PFUpdatePosition
  | PFUpdatePositionInternal
  | PFHasCredit
  | PFLastLossFactor
  | PFCollateralBitmap
  | PFCollateral
  | PFToId
  | PFToMarket
  | PFCreditOf
  | PFDebtOf
  | PFTotalUnits
  | PFLossFactor
  | PFTickSpacing
  | PFWithdrawable
  | PFSettlementFeeCbps
  | PFContinuousFee
  | PFContinuousFeeCredit
  | PFPendingFee
  | PFLastAccrual
  | PFLiquidationLocked
  | PFIsHealthy
  | PFSettlementFee.

  Inductive Call : Set -> Set :=
  | ConstructorCall : Call unit
  | Multicall : list T.bytes -> Call unit
  | SetRoleSetter : T.address -> Call unit
  | SetFeeSetter : T.address -> Call unit
  | SetFeeClaimer : T.address -> Call unit
  | SetTickSpacingSetter : T.address -> Call unit
  | SetMarketTickSpacing : T.bytes32 -> T.uint256 -> Call unit
  | SetMarketSettlementFee : T.bytes32 -> T.uint256 -> T.uint256 -> Call unit
  | SetDefaultSettlementFee : T.address -> T.uint256 -> T.uint256 -> Call unit
  | SetMarketContinuousFee : T.bytes32 -> T.uint256 -> Call unit
  | SetDefaultContinuousFee : T.address -> T.uint256 -> Call unit
  | ClaimSettlementFee : T.address -> T.uint256 -> T.address -> Call unit
  | ClaimContinuousFee : T.Market.t -> T.uint256 -> T.address -> Call unit
  | Take :
      T.Offer.t -> T.bytes -> T.uint256 -> T.address -> T.address ->
      T.address -> T.bytes -> Call (T.uint256 * T.uint256)
  | Withdraw : T.Market.t -> T.uint256 -> T.address -> T.address -> Call unit
  | Repay : T.Market.t -> T.uint256 -> T.address -> T.address -> T.bytes -> Call unit
  | SupplyCollateral : T.Market.t -> T.uint256 -> T.uint256 -> T.address -> Call unit
  | WithdrawCollateral :
      T.Market.t -> T.uint256 -> T.uint256 -> T.address -> T.address -> Call unit
  | Liquidate :
      T.Market.t -> T.uint256 -> T.uint256 -> T.uint256 -> T.address ->
      bool -> T.address -> T.address -> T.bytes -> Call (T.uint256 * T.uint256)
  | SetConsumed : T.bytes32 -> T.uint256 -> T.address -> Call unit
  | SetIsAuthorized : T.address -> bool -> T.address -> Call unit
  | FlashLoan : list T.address -> list T.uint256 -> T.address -> T.bytes -> Call unit
  | TouchMarket : T.Market.t -> Call T.bytes32
  | UpdatePositionView : T.Market.t -> T.bytes32 -> T.address -> Call triple_uint128
  | UpdatePosition : T.Market.t -> T.address -> Call triple_uint128
  | UpdatePositionInternal : T.Market.t -> T.bytes32 -> T.address -> Call triple_uint128
  | HasCredit : T.bytes32 -> T.address -> Call bool
  | LastLossFactor : T.bytes32 -> T.address -> Call T.uint128
  | CollateralBitmap : T.bytes32 -> T.address -> Call T.uint128
  | Collateral : T.bytes32 -> T.address -> T.uint256 -> Call T.uint128
  | ToId : T.Market.t -> Call T.bytes32
  | ToMarket : T.bytes32 -> Call T.Market.t
  | CreditOf : T.bytes32 -> T.address -> Call T.uint128
  | DebtOf : T.bytes32 -> T.address -> Call T.uint128
  | TotalUnits : T.bytes32 -> Call T.uint128
  | LossFactor : T.bytes32 -> Call T.uint128
  | TickSpacing : T.bytes32 -> Call T.uint8
  | Withdrawable : T.bytes32 -> Call T.uint128
  | SettlementFeeCbps : T.bytes32 -> Call (list T.uint16)
  | ContinuousFee : T.bytes32 -> Call T.uint32
  | ContinuousFeeCredit : T.bytes32 -> Call T.uint128
  | PendingFee : T.bytes32 -> T.address -> Call T.uint128
  | LastAccrual : T.bytes32 -> T.address -> Call T.uint128
  | LiquidationLocked : T.bytes32 -> T.address -> Call bool
  | IsHealthy : T.Market.t -> T.bytes32 -> T.address -> Call bool
  | SettlementFee : T.bytes32 -> T.uint256 -> Call T.uint256.

  Definition public_function {A : Set} (call : Call A) : PublicFunction :=
    match call with
    | ConstructorCall => PFConstructor
    | Multicall _ => PFMulticall
    | SetRoleSetter _ => PFSetRoleSetter
    | SetFeeSetter _ => PFSetFeeSetter
    | SetFeeClaimer _ => PFSetFeeClaimer
    | SetTickSpacingSetter _ => PFSetTickSpacingSetter
    | SetMarketTickSpacing _ _ => PFSetMarketTickSpacing
    | SetMarketSettlementFee _ _ _ => PFSetMarketSettlementFee
    | SetDefaultSettlementFee _ _ _ => PFSetDefaultSettlementFee
    | SetMarketContinuousFee _ _ => PFSetMarketContinuousFee
    | SetDefaultContinuousFee _ _ => PFSetDefaultContinuousFee
    | ClaimSettlementFee _ _ _ => PFClaimSettlementFee
    | ClaimContinuousFee _ _ _ => PFClaimContinuousFee
    | Take _ _ _ _ _ _ _ => PFTake
    | Withdraw _ _ _ _ => PFWithdraw
    | Repay _ _ _ _ _ => PFRepay
    | SupplyCollateral _ _ _ _ => PFSupplyCollateral
    | WithdrawCollateral _ _ _ _ _ => PFWithdrawCollateral
    | Liquidate _ _ _ _ _ _ _ _ _ => PFLiquidate
    | SetConsumed _ _ _ => PFSetConsumed
    | SetIsAuthorized _ _ _ => PFSetIsAuthorized
    | FlashLoan _ _ _ _ => PFFlashLoan
    | TouchMarket _ => PFTouchMarket
    | UpdatePositionView _ _ _ => PFUpdatePositionView
    | UpdatePosition _ _ => PFUpdatePosition
    | UpdatePositionInternal _ _ _ => PFUpdatePositionInternal
    | HasCredit _ _ => PFHasCredit
    | LastLossFactor _ _ => PFLastLossFactor
    | CollateralBitmap _ _ => PFCollateralBitmap
    | Collateral _ _ _ => PFCollateral
    | ToId _ => PFToId
    | ToMarket _ => PFToMarket
    | CreditOf _ _ => PFCreditOf
    | DebtOf _ _ => PFDebtOf
    | TotalUnits _ => PFTotalUnits
    | LossFactor _ => PFLossFactor
    | TickSpacing _ => PFTickSpacing
    | Withdrawable _ => PFWithdrawable
    | SettlementFeeCbps _ => PFSettlementFeeCbps
    | ContinuousFee _ => PFContinuousFee
    | ContinuousFeeCredit _ => PFContinuousFeeCredit
    | PendingFee _ _ => PFPendingFee
    | LastAccrual _ _ => PFLastAccrual
    | LiquidationLocked _ _ => PFLiquidationLocked
    | IsHealthy _ _ _ => PFIsHealthy
    | SettlementFee _ _ => PFSettlementFee
    end.

  Definition ok {A : Set} (state : T.State.t) (value : A) : T.Outcome.t A :=
    T.Outcome.Ok state value.

  Definition revert {A : Set} (error : T.Error.t) : T.Outcome.t A :=
    T.Outcome.Revert error.

  Definition cast128 (value : T.uint256) : T.uint128 :=
    match U.toUint128 value with
    | Some value => value
    | None => value
    end.

  Fixpoint length_z {A : Set} (values : list A) : Z :=
    match values with
    | [] => 0
    | _ :: values' => 1 + length_z values'
    end.

  Fixpoint nth_option {A : Set} (values : list A) (index : nat) : option A :=
    match values, index with
    | [], _ => None
    | value :: _, O => Some value
    | _ :: values', S index' => nth_option values' index'
    end.

  Definition collateralParamAt (market : T.Market.t) (index : T.uint256) :
      option T.CollateralParams.t :=
    nth_option market.(T.Market.collateralParams) (Z.to_nat index).

  Definition isAuthorizedOrSelf
      (state : T.State.t) (ctx : T.Context.t) (onBehalf : T.address) : bool :=
    (onBehalf =? ctx.(T.Context.sender)) ||
    T.State.isAuthorizedOf state onBehalf ctx.(T.Context.sender).

  Definition marketCreated (state : T.State.t) (id : T.bytes32) : bool :=
    (T.State.getMarketState state id).(T.MarketState.tickSpacing) >? 0.

  Definition toIdCore
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (market : T.Market.t) : T.bytes32 :=
    ext.(T.External.toId) market state.(T.State.initialChainId) ctx.(T.Context.self).

  Definition setDefaultSettlementFees
      (state : T.State.t) (market : T.Market.t) (marketState : T.MarketState.t) :
      T.MarketState.t :=
    marketState
      <| T.MarketState.settlementFeeCbp0 :=
        T.State.defaultSettlementFeeCbpOf state market.(T.Market.loanToken) 0 |>
      <| T.MarketState.settlementFeeCbp1 :=
        T.State.defaultSettlementFeeCbpOf state market.(T.Market.loanToken) 1 |>
      <| T.MarketState.settlementFeeCbp2 :=
        T.State.defaultSettlementFeeCbpOf state market.(T.Market.loanToken) 2 |>
      <| T.MarketState.settlementFeeCbp3 :=
        T.State.defaultSettlementFeeCbpOf state market.(T.Market.loanToken) 3 |>
      <| T.MarketState.settlementFeeCbp4 :=
        T.State.defaultSettlementFeeCbpOf state market.(T.Market.loanToken) 4 |>
      <| T.MarketState.settlementFeeCbp5 :=
        T.State.defaultSettlementFeeCbpOf state market.(T.Market.loanToken) 5 |>
      <| T.MarketState.settlementFeeCbp6 :=
        T.State.defaultSettlementFeeCbpOf state market.(T.Market.loanToken) 6 |>.

  Fixpoint collateralParamsAreSortedAndValid
      (params : list T.CollateralParams.t) (previousCollateralToken : T.address) : bool :=
    match params with
    | [] => true
    | collateralParam :: params' =>
      let lltv := collateralParam.(T.CollateralParams.lltv) in
      let lowLif := C.maxLif lltv C.LIQUIDATION_CURSOR_LOW in
      let highLif := C.maxLif lltv C.LIQUIDATION_CURSOR_HIGH in
      (previousCollateralToken <? collateralParam.(T.CollateralParams.token)) &&
      C.isLltvAllowed lltv &&
      ((collateralParam.(T.CollateralParams.maxLif) =? lowLif) ||
       (collateralParam.(T.CollateralParams.maxLif) =? highLif)) &&
      collateralParamsAreSortedAndValid params' collateralParam.(T.CollateralParams.token)
    end.

  Definition touchMarketCore
      (ext : T.External.t) (ctx : T.Context.t)
      (state : T.State.t) (market : T.Market.t) : T.Outcome.t T.bytes32 :=
    let id := toIdCore ext ctx state market in
    if marketCreated state id then
      ok state id
    else if market.(T.Market.maturity) >? ctx.(T.Context.timestamp) + 100 * 365 * 24 * 60 * 60 then
      revert T.Error.MaturityTooFar
    else if length_z market.(T.Market.collateralParams) =? 0 then
      revert T.Error.NoCollateralParams
    else if length_z market.(T.Market.collateralParams) >? C.MAX_COLLATERALS then
      revert T.Error.TooManyCollateralParams
    else if negb (collateralParamsAreSortedAndValid market.(T.Market.collateralParams) 0) then
      revert T.Error.CollateralParamsNotSorted
    else
      let marketState :=
        setDefaultSettlementFees state market
          (T.MarketState.init
            <| T.MarketState.tickSpacing := C.DEFAULT_TICK_SPACING |>
            <| T.MarketState.continuousFee :=
              T.State.defaultContinuousFeeOf state market.(T.Market.loanToken) |>) in
      let _create2Address := ext.(T.External.storeInCode) market state.(T.State.initialChainId) in
      let state := T.State.setMarketState state id marketState in
      let state := T.State.emit (T.Event.MarketCreated market id) state in
      ok state id.

  Definition settlementFeeCore
      (state : T.State.t) (id timeToMaturity : T.uint256) :
      T.Outcome.t T.uint256 :=
    let marketState := T.State.getMarketState state id in
    if marketState.(T.MarketState.tickSpacing) <=? 0 then
      revert T.Error.MarketNotCreated
    else if timeToMaturity >=? 360 * 24 * 60 * 60 then
      ok state (marketState.(T.MarketState.settlementFeeCbp6) * C.CBP)
    else
      let oneDay := 24 * 60 * 60 in
      let '(start, finish, feeLower, feeUpper) :=
        if timeToMaturity <? oneDay then
          (0, oneDay, marketState.(T.MarketState.settlementFeeCbp0) * C.CBP,
            marketState.(T.MarketState.settlementFeeCbp1) * C.CBP)
        else if timeToMaturity <? 7 * oneDay then
          (oneDay, 7 * oneDay, marketState.(T.MarketState.settlementFeeCbp1) * C.CBP,
            marketState.(T.MarketState.settlementFeeCbp2) * C.CBP)
        else if timeToMaturity <? 30 * oneDay then
          (7 * oneDay, 30 * oneDay, marketState.(T.MarketState.settlementFeeCbp2) * C.CBP,
            marketState.(T.MarketState.settlementFeeCbp3) * C.CBP)
        else if timeToMaturity <? 90 * oneDay then
          (30 * oneDay, 90 * oneDay, marketState.(T.MarketState.settlementFeeCbp3) * C.CBP,
            marketState.(T.MarketState.settlementFeeCbp4) * C.CBP)
        else if timeToMaturity <? 180 * oneDay then
          (90 * oneDay, 180 * oneDay, marketState.(T.MarketState.settlementFeeCbp4) * C.CBP,
            marketState.(T.MarketState.settlementFeeCbp5) * C.CBP)
        else
          (180 * oneDay, 360 * oneDay, marketState.(T.MarketState.settlementFeeCbp5) * C.CBP,
            marketState.(T.MarketState.settlementFeeCbp6) * C.CBP) in
      ok state ((feeLower * (finish - timeToMaturity) + feeUpper * (timeToMaturity - start)) /
        (finish - start)).

  Fixpoint isHealthyCollateralLoop
      (fuel : nat) (ext : T.External.t) (market : T.Market.t) (position : T.Position.t)
      (bitmap maxDebt : T.uint256) : T.uint256 :=
    match fuel with
    | O => maxDebt
    | S fuel' =>
      if bitmap =? 0 then maxDebt
      else
        let i := U.msb bitmap in
        match collateralParamAt market i with
        | None => maxDebt
        | Some collateralParam =>
          let price := ext.(T.External.price) collateralParam.(T.CollateralParams.oracle) in
          let collateralValue :=
            U.mulDivDown
              (T.Position.collateralAt position i)
              price
              C.ORACLE_PRICE_SCALE in
          let maxDebt :=
            maxDebt + U.mulDivDown collateralValue collateralParam.(T.CollateralParams.lltv) C.WAD in
          isHealthyCollateralLoop fuel' ext market position (U.clearBit bitmap i) maxDebt
        end
    end.

  Definition isHealthyCore
      (ext : T.External.t) (state : T.State.t) (market : T.Market.t)
      (id : T.bytes32) (borrower : T.address) : bool :=
    let position := T.State.getPosition state id borrower in
    let debt := position.(T.Position.debt) in
    let maxDebt :=
      if debt >? 0 then
        isHealthyCollateralLoop 128 ext market position position.(T.Position.collateralBitmap) 0
      else 0 in
    maxDebt >=? debt.

  Definition updatePositionViewCore
      (ctx : T.Context.t) (state : T.State.t) (market : T.Market.t)
      (id : T.bytes32) (user : T.address) : T.uint128 * T.uint128 * T.uint128 :=
    let position := T.State.getPosition state id user in
    let marketState := T.State.getMarketState state id in
    let credit := position.(T.Position.credit) in
    let lastLossFactor := position.(T.Position.lastLossFactor) in
    let postSlashCredit :=
      if lastLossFactor <? L.Uint.max128 then
        U.mulDivDown
          credit
          (L.Uint.max128 - marketState.(T.MarketState.lossFactor))
          (L.Uint.max128 - lastLossFactor)
      else 0 in
    let pendingFee := position.(T.Position.pendingFee) in
    let postSlashPendingFee :=
      if credit >? 0 then
        pendingFee - U.mulDivUp pendingFee (credit - postSlashCredit) credit
      else 0 in
    let accrualEnd := U.min ctx.(T.Context.timestamp) market.(T.Market.maturity) in
    let lastAccrual := position.(T.Position.lastAccrual) in
    let fee :=
      if lastAccrual <? market.(T.Market.maturity) then
        U.mulDivDown postSlashPendingFee (accrualEnd - lastAccrual)
          (market.(T.Market.maturity) - lastAccrual)
      else 0 in
    (cast128 (postSlashCredit - fee), cast128 (postSlashPendingFee - fee), cast128 fee).

  Definition updatePositionCore
      (ctx : T.Context.t) (state : T.State.t) (market : T.Market.t)
      (id : T.bytes32) (user : T.address) :
      T.Outcome.t (T.uint128 * T.uint128 * T.uint128) :=
    let position := T.State.getPosition state id user in
    let marketState := T.State.getMarketState state id in
    let '(newCredit, newPendingFee, accruedFee) := updatePositionViewCore ctx state market id user in
    let creditDecrease := position.(T.Position.credit) - newCredit in
    let pendingFeeDecrease := position.(T.Position.pendingFee) - newPendingFee in
    let position :=
      position
        <| T.Position.credit := newCredit |>
        <| T.Position.lastLossFactor := marketState.(T.MarketState.lossFactor) |>
        <| T.Position.pendingFee := newPendingFee |>
        <| T.Position.lastAccrual := cast128 ctx.(T.Context.timestamp) |> in
    let marketState :=
      marketState <| T.MarketState.continuousFeeCredit :=
        cast128 (marketState.(T.MarketState.continuousFeeCredit) + accruedFee) |> in
    let state := T.State.setPosition state id user position in
    let state := T.State.setMarketState state id marketState in
    let state := T.State.emit
      (T.Event.UpdatePosition id user creditDecrease pendingFeeDecrease accruedFee) state in
    ok state (newCredit, newPendingFee, accruedFee).

  Definition hasCreditCore (state : T.State.t) (id : T.bytes32) (user : T.address) : bool :=
    (T.State.getPosition state id user).(T.Position.credit) >? 0.

  Fixpoint liquidateCollateralLoop
      (fuel : nat) (ext : T.External.t) (market : T.Market.t) (position : T.Position.t)
      (collateralIndex bitmap maxDebt liquidatedPrice badDebt : T.uint256) :
      T.uint256 * T.uint256 * T.uint256 :=
    match fuel with
    | O => (maxDebt, liquidatedPrice, badDebt)
    | S fuel' =>
      if bitmap =? 0 then (maxDebt, liquidatedPrice, badDebt)
      else
        let i := U.msb bitmap in
        match collateralParamAt market i with
        | None => (maxDebt, liquidatedPrice, badDebt)
        | Some collateralParam =>
          let price := ext.(T.External.price) collateralParam.(T.CollateralParams.oracle) in
          let liquidatedPrice := if i =? collateralIndex then price else liquidatedPrice in
          let collateral := T.Position.collateralAt position i in
          let collateralValueDown :=
            U.mulDivDown collateral price C.ORACLE_PRICE_SCALE in
          let collateralValueUp :=
            U.mulDivUp collateral price C.ORACLE_PRICE_SCALE in
          let maxDebt :=
            maxDebt + U.mulDivDown collateralValueDown collateralParam.(T.CollateralParams.lltv) C.WAD in
          let badDebt :=
            U.zeroFloorSub badDebt
              (U.mulDivUp collateralValueUp C.WAD collateralParam.(T.CollateralParams.maxLif)) in
          liquidateCollateralLoop fuel' ext market position collateralIndex
            (U.clearBit bitmap i) maxDebt liquidatedPrice badDebt
        end
    end.

  Definition applyBadDebt
      (marketState : T.MarketState.t) (position : T.Position.t) (badDebt : T.uint256) :
      T.MarketState.t * T.Position.t :=
    if badDebt <=? 0 then (marketState, position)
    else
      let originalLossFactor := marketState.(T.MarketState.lossFactor) in
      let totalUnits := marketState.(T.MarketState.totalUnits) in
      let newLossFactor :=
        if totalUnits =? 0 then L.Uint.max128
        else L.Uint.max128 -
          U.mulDivDown (L.Uint.max128 - originalLossFactor) (totalUnits - badDebt) totalUnits in
      let continuousFeeCredit :=
        if originalLossFactor <? L.Uint.max128 then
          U.mulDivDown marketState.(T.MarketState.continuousFeeCredit)
            (L.Uint.max128 - newLossFactor) (L.Uint.max128 - originalLossFactor)
        else 0 in
      (marketState
        <| T.MarketState.lossFactor := cast128 newLossFactor |>
        <| T.MarketState.totalUnits := cast128 (totalUnits - badDebt) |>
        <| T.MarketState.continuousFeeCredit := cast128 continuousFeeCredit |>,
       position <| T.Position.debt := cast128 (position.(T.Position.debt) - badDebt) |>).

  Fixpoint transferMany
      (ext : T.External.t) (tokens : list T.address) (assets : list T.uint256)
      (receiver : T.address) : bool :=
    match tokens, assets with
    | [], [] => true
    | token :: tokens', asset :: assets' =>
      ext.(T.External.safeTransfer) token receiver asset &&
      transferMany ext tokens' assets' receiver
    | _, _ => false
    end.

  Fixpoint transferFromMany
      (ext : T.External.t) (tokens : list T.address) (assets : list T.uint256)
      (from to : T.address) : bool :=
    match tokens, assets with
    | [], [] => true
    | token :: tokens', asset :: assets' =>
      ext.(T.External.safeTransferFrom) token from to asset &&
      transferFromMany ext tokens' assets' from to
    | _, _ => false
    end.

  Definition constructor (ctx : T.Context.t) (state : T.State.t) : T.State.t :=
    let state :=
      state
        <| T.State.roleSetter := ctx.(T.Context.sender) |>
        <| T.State.initialChainId := ctx.(T.Context.chainid) |> in
    T.State.emit (T.Event.Constructor ctx.(T.Context.sender) ctx.(T.Context.chainid)) state.

  Fixpoint multicallLoop
      (ext : T.External.t) (ctx : T.Context.t) (calls : list T.bytes) : bool :=
    match calls with
    | [] => true
    | call :: calls' =>
      ext.(T.External.delegatecall) ctx.(T.Context.self) call &&
      multicallLoop ext ctx calls'
    end.

  Definition multicall
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t) (calls : list T.bytes) :
      T.Outcome.t unit :=
    if multicallLoop ext ctx calls then ok state tt else revert T.Error.DelegatecallFailed.

  Definition setRoleSetter
      (ctx : T.Context.t) (state : T.State.t) (newRoleSetter : T.address) :
      T.Outcome.t unit :=
    if ctx.(T.Context.sender) =? state.(T.State.roleSetter) then
      let state := state <| T.State.roleSetter := newRoleSetter |> in
      ok (T.State.emit (T.Event.SetRoleSetter newRoleSetter) state) tt
    else revert T.Error.OnlyRoleSetter.

  Definition setFeeSetter
      (ctx : T.Context.t) (state : T.State.t) (newFeeSetter : T.address) :
      T.Outcome.t unit :=
    if ctx.(T.Context.sender) =? state.(T.State.roleSetter) then
      let state := state <| T.State.feeSetter := newFeeSetter |> in
      ok (T.State.emit (T.Event.SetFeeSetter newFeeSetter) state) tt
    else revert T.Error.OnlyRoleSetter.

  Definition setFeeClaimer
      (ctx : T.Context.t) (state : T.State.t) (newFeeClaimer : T.address) :
      T.Outcome.t unit :=
    if ctx.(T.Context.sender) =? state.(T.State.roleSetter) then
      let state := state <| T.State.feeClaimer := newFeeClaimer |> in
      ok (T.State.emit (T.Event.SetFeeClaimer newFeeClaimer) state) tt
    else revert T.Error.OnlyRoleSetter.

  Definition setTickSpacingSetter
      (ctx : T.Context.t) (state : T.State.t) (newTickSpacingSetter : T.address) :
      T.Outcome.t unit :=
    if ctx.(T.Context.sender) =? state.(T.State.roleSetter) then
      let state := state <| T.State.tickSpacingSetter := newTickSpacingSetter |> in
      ok (T.State.emit (T.Event.SetTickSpacingSetter newTickSpacingSetter) state) tt
    else revert T.Error.OnlyRoleSetter.

  Definition setMarketTickSpacing
      (ctx : T.Context.t) (state : T.State.t) (id newTickSpacing : T.uint256) :
      T.Outcome.t unit :=
    let marketState := T.State.getMarketState state id in
    if negb (ctx.(T.Context.sender) =? state.(T.State.tickSpacingSetter)) then
      revert T.Error.OnlyTickSpacingSetter
    else if marketState.(T.MarketState.tickSpacing) <=? 0 then
      revert T.Error.MarketNotCreated
    else if (newTickSpacing <=? 0) || negb (marketState.(T.MarketState.tickSpacing) mod newTickSpacing =? 0) then
      revert T.Error.InvalidTickSpacing
    else
      let marketState := marketState <| T.MarketState.tickSpacing := newTickSpacing |> in
      let state := T.State.setMarketState state id marketState in
      ok (T.State.emit (T.Event.SetMarketTickSpacing id newTickSpacing) state) tt.

  Definition setMarketSettlementFee
      (ctx : T.Context.t) (state : T.State.t) (id index newSettlementFee : T.uint256) :
      T.Outcome.t unit :=
    let marketState := T.State.getMarketState state id in
    if negb (ctx.(T.Context.sender) =? state.(T.State.feeSetter)) then
      revert T.Error.OnlyFeeSetter
    else if index >? 6 then
      revert T.Error.InvalidFeeIndex
    else if newSettlementFee >? C.maxSettlementFee index then
      revert T.Error.SettlementFeeTooHigh
    else if negb (newSettlementFee mod C.CBP =? 0) then
      revert T.Error.FeeNotMultipleOfFeeCbp
    else if marketState.(T.MarketState.tickSpacing) <=? 0 then
      revert T.Error.MarketNotCreated
    else
      let marketState :=
        T.MarketState.setSettlementFeeCbp marketState index (newSettlementFee / C.CBP) in
      let state := T.State.setMarketState state id marketState in
      ok (T.State.emit (T.Event.SetMarketSettlementFee id index newSettlementFee) state) tt.

  Definition setDefaultSettlementFee
      (ctx : T.Context.t) (state : T.State.t)
      (loanToken : T.address) (index newSettlementFee : T.uint256) :
      T.Outcome.t unit :=
    if negb (ctx.(T.Context.sender) =? state.(T.State.feeSetter)) then
      revert T.Error.OnlyFeeSetter
    else if index >? 6 then
      revert T.Error.InvalidFeeIndex
    else if newSettlementFee >? C.maxSettlementFee index then
      revert T.Error.SettlementFeeTooHigh
    else if negb (newSettlementFee mod C.CBP =? 0) then
      revert T.Error.FeeNotMultipleOfFeeCbp
    else
      let state := T.State.setDefaultSettlementFeeCbp state loanToken index (newSettlementFee / C.CBP) in
      ok (T.State.emit (T.Event.SetDefaultSettlementFee loanToken index newSettlementFee) state) tt.

  Definition setMarketContinuousFee
      (ctx : T.Context.t) (state : T.State.t) (id newContinuousFee : T.uint256) :
      T.Outcome.t unit :=
    let marketState := T.State.getMarketState state id in
    if negb (ctx.(T.Context.sender) =? state.(T.State.feeSetter)) then
      revert T.Error.OnlyFeeSetter
    else if newContinuousFee >? C.MAX_CONTINUOUS_FEE then
      revert T.Error.ContinuousFeeTooHigh
    else if marketState.(T.MarketState.tickSpacing) <=? 0 then
      revert T.Error.MarketNotCreated
    else
      let marketState := marketState <| T.MarketState.continuousFee := newContinuousFee |> in
      let state := T.State.setMarketState state id marketState in
      ok (T.State.emit (T.Event.SetMarketContinuousFee id newContinuousFee) state) tt.

  Definition setDefaultContinuousFee
      (ctx : T.Context.t) (state : T.State.t) (loanToken : T.address)
      (newContinuousFee : T.uint256) : T.Outcome.t unit :=
    if negb (ctx.(T.Context.sender) =? state.(T.State.feeSetter)) then
      revert T.Error.OnlyFeeSetter
    else if newContinuousFee >? C.MAX_CONTINUOUS_FEE then
      revert T.Error.ContinuousFeeTooHigh
    else
      let state := T.State.setDefaultContinuousFee state loanToken newContinuousFee in
      ok (T.State.emit (T.Event.SetDefaultContinuousFee loanToken newContinuousFee) state) tt.

  Definition claimSettlementFee
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (token : T.address) (amount : T.uint256) (receiver : T.address) : T.Outcome.t unit :=
    if negb (ctx.(T.Context.sender) =? state.(T.State.feeClaimer)) then
      revert T.Error.OnlyFeeClaimer
    else if negb (ext.(T.External.safeTransfer) token receiver amount) then
      revert T.Error.ExternalCallFailed
    else
      let claimable := T.State.claimableSettlementFeeOf state token in
      let state := T.State.setClaimableSettlementFee state token (claimable - amount) in
      let state := T.State.emit
        (T.Event.ClaimSettlementFee ctx.(T.Context.sender) token amount receiver) state in
      ok state tt.

  Definition claimContinuousFee
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (market : T.Market.t) (amount : T.uint256) (receiver : T.address) : T.Outcome.t unit :=
    let id := toIdCore ext ctx state market in
    let marketState := T.State.getMarketState state id in
    if negb (ctx.(T.Context.sender) =? state.(T.State.feeClaimer)) then
      revert T.Error.OnlyFeeClaimer
    else if marketState.(T.MarketState.tickSpacing) <=? 0 then
      revert T.Error.MarketNotCreated
    else if negb (ext.(T.External.safeTransfer) market.(T.Market.loanToken) receiver amount) then
      revert T.Error.ExternalCallFailed
    else
      let marketState :=
        marketState
          <| T.MarketState.continuousFeeCredit :=
            cast128 (marketState.(T.MarketState.continuousFeeCredit) - amount) |>
          <| T.MarketState.totalUnits :=
            cast128 (marketState.(T.MarketState.totalUnits) - amount) |>
          <| T.MarketState.withdrawable :=
            cast128 (marketState.(T.MarketState.withdrawable) - amount) |> in
      let state := T.State.setMarketState state id marketState in
      let state := T.State.emit
        (T.Event.ClaimContinuousFee ctx.(T.Context.sender) id amount receiver) state in
      ok state tt.

  Definition takeAssets
      (offer : T.Offer.t) (units offerPrice settlementFee : T.uint256) :
      T.uint256 * T.uint256 :=
    let sellerPrice :=
      if offer.(T.Offer.buy) then offerPrice - settlementFee else offerPrice in
    let buyerPrice := sellerPrice + settlementFee in
    let buyerAssets :=
      if offer.(T.Offer.buy) then U.mulDivDown units buyerPrice C.WAD
      else U.mulDivUp units buyerPrice C.WAD in
    let sellerAssets :=
      if offer.(T.Offer.buy) then U.mulDivDown units sellerPrice C.WAD
      else U.mulDivUp units sellerPrice C.WAD in
    (buyerAssets, sellerAssets).

  Definition takeConsumed
      (state : T.State.t) (offer : T.Offer.t)
      (units buyerAssets sellerAssets : T.uint256) : T.uint256 :=
    T.State.consumedOf state offer.(T.Offer.maker) offer.(T.Offer.group) +
      (if offer.(T.Offer.maxAssets) >? 0 then
         if offer.(T.Offer.buy) then buyerAssets else sellerAssets
       else units).

  Definition takeUsers (offer : T.Offer.t) (taker : T.address) :
      T.address * T.address :=
    if offer.(T.Offer.buy) then (offer.(T.Offer.maker), taker)
    else (taker, offer.(T.Offer.maker)).

  Definition takeDeltas
      (marketState : T.MarketState.t) (timeToMaturity units : T.uint256)
      (buyerPos sellerPos : T.Position.t) :
      T.uint256 * T.uint256 * T.uint256 * T.uint128 * T.uint128 :=
    let buyerCreditIncrease := U.zeroFloorSub units buyerPos.(T.Position.debt) in
    let sellerCreditDecrease := U.min units sellerPos.(T.Position.credit) in
    let sellerDebtIncrease := units - sellerCreditDecrease in
    let buyerPendingFeeIncrease :=
      cast128 (U.mulDivDown buyerCreditIncrease
        (marketState.(T.MarketState.continuousFee) * timeToMaturity) C.WAD) in
    let sellerPendingFeeDecrease :=
      if sellerPos.(T.Position.credit) >? 0 then
        cast128 (U.mulDivUp sellerPos.(T.Position.pendingFee)
          sellerCreditDecrease sellerPos.(T.Position.credit))
      else 0 in
    (buyerCreditIncrease, sellerCreditDecrease, sellerDebtIncrease,
      buyerPendingFeeIncrease, sellerPendingFeeDecrease).

  Definition takeCallbacks
      (ctx : T.Context.t) (offer : T.Offer.t) (taker takerCallback : T.address)
      (receiverIfTakerIsSeller buyer : T.address) :
      T.address * T.address * T.address * T.address :=
    let buyerCallback := if offer.(T.Offer.buy) then offer.(T.Offer.callback) else takerCallback in
    let sellerCallback := if offer.(T.Offer.buy) then takerCallback else offer.(T.Offer.callback) in
    let payer :=
      if negb (buyerCallback =? 0) then buyerCallback
      else if offer.(T.Offer.buy) then buyer else ctx.(T.Context.sender) in
    let receiver :=
      if offer.(T.Offer.buy) then receiverIfTakerIsSeller
      else offer.(T.Offer.receiverIfMakerIsSeller) in
    (buyerCallback, sellerCallback, payer, receiver).

  Definition takeApplyAccounting
      (ctx : T.Context.t) (state : T.State.t) (id units : T.uint256)
      (offer : T.Offer.t) (taker buyer seller : T.address)
      (buyerPos sellerPos : T.Position.t) (marketState : T.MarketState.t)
      (newConsumed buyerAssets sellerAssets buyerCreditIncrease sellerCreditDecrease
        sellerDebtIncrease : T.uint256)
      (buyerPendingFeeIncrease sellerPendingFeeDecrease : T.uint128)
      (receiver payer : T.address) : T.State.t :=
    let buyerPos :=
      buyerPos
        <| T.Position.debt := cast128 (buyerPos.(T.Position.debt) -
          (units - buyerCreditIncrease)) |>
        <| T.Position.pendingFee := cast128
          (buyerPos.(T.Position.pendingFee) + buyerPendingFeeIncrease) |>
        <| T.Position.credit := cast128
          (buyerPos.(T.Position.credit) + buyerCreditIncrease) |> in
    let sellerPos :=
      sellerPos
        <| T.Position.pendingFee := cast128
          (sellerPos.(T.Position.pendingFee) - sellerPendingFeeDecrease) |>
        <| T.Position.credit := cast128
          (sellerPos.(T.Position.credit) - sellerCreditDecrease) |>
        <| T.Position.debt := cast128
          (sellerPos.(T.Position.debt) + sellerDebtIncrease) |> in
    let marketState :=
      marketState <| T.MarketState.totalUnits := cast128
        (marketState.(T.MarketState.totalUnits) + buyerCreditIncrease -
         sellerCreditDecrease) |> in
    let state := T.State.setConsumed state offer.(T.Offer.maker) offer.(T.Offer.group) newConsumed in
    let state := T.State.setPosition state id buyer buyerPos in
    let state := T.State.setPosition state id seller sellerPos in
    let state := T.State.setMarketState state id marketState in
    let state := T.State.setClaimableSettlementFee state offer.(T.Offer.market).(T.Market.loanToken)
      (T.State.claimableSettlementFeeOf state offer.(T.Offer.market).(T.Market.loanToken) +
        buyerAssets - sellerAssets) in
    T.State.emit
      (T.Event.Take ctx.(T.Context.sender) id units taker offer.(T.Offer.maker)
        offer.(T.Offer.buy) offer.(T.Offer.group) buyerAssets sellerAssets newConsumed
        buyerPendingFeeIncrease sellerPendingFeeDecrease buyerCreditIncrease sellerCreditDecrease
        receiver payer) state.

  Definition takeSpec
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (offer : T.Offer.t) (ratifierData : T.bytes) (units : T.uint256)
      (taker receiverIfTakerIsSeller takerCallback : T.address)
      (takerCallbackData : T.bytes) : T.Outcome.t (T.uint256 * T.uint256) :=
    if negb (isAuthorizedOrSelf state ctx taker) then
      revert T.Error.TakerUnauthorized
    else
      match touchMarketCore ext ctx state offer.(T.Offer.market) with
      | T.Outcome.Revert error => revert error
      | T.Outcome.Ok state id =>
        let marketState := T.State.getMarketState state id in
        if negb (marketState.(T.MarketState.lossFactor) <? L.Uint.max128) then
          revert T.Error.MarketLossFactorMaxedOut
        else if negb (U.atMostOneNonZero offer.(T.Offer.maxAssets) offer.(T.Offer.maxUnits)) then
          revert T.Error.MultipleNonZero
        else if negb (offer.(T.Offer.tick) mod marketState.(T.MarketState.tickSpacing) =? 0) then
          revert T.Error.TickNotAccessible
        else if ctx.(T.Context.timestamp) <? offer.(T.Offer.start) then
          revert T.Error.OfferNotStarted
        else if ctx.(T.Context.timestamp) >? offer.(T.Offer.expiry) then
          revert T.Error.OfferExpired
        else if offer.(T.Offer.maker) =? taker then
          revert T.Error.SelfTake
        else if negb (T.State.isAuthorizedOf state offer.(T.Offer.maker) offer.(T.Offer.ratifier)) then
          revert T.Error.RatifierUnauthorized
        else if negb (ext.(T.External.isRatified) offer ratifierData =? C.CALLBACK_SUCCESS) then
          revert T.Error.RatifierFail
        else
          match L.TickLib.tickToPrice offer.(T.Offer.tick) with
          | None => revert T.Error.TickOutOfRange
          | Some offerPrice =>
            let timeToMaturity :=
              U.zeroFloorSub offer.(T.Offer.market).(T.Market.maturity) ctx.(T.Context.timestamp) in
            match settlementFeeCore state id timeToMaturity with
            | T.Outcome.Revert error => revert error
            | T.Outcome.Ok _ settlementFee =>
              let '(buyerAssets, sellerAssets) :=
                takeAssets offer units offerPrice settlementFee in
              let newConsumed := takeConsumed state offer units buyerAssets sellerAssets in
              if (offer.(T.Offer.maxAssets) >? 0) && (newConsumed >? offer.(T.Offer.maxAssets)) then
                revert T.Error.ConsumedAssets
              else if (offer.(T.Offer.maxAssets) <=? 0) && (newConsumed >? offer.(T.Offer.maxUnits)) then
                revert T.Error.ConsumedUnits
              else
                let '(buyer, seller) := takeUsers offer taker in
                let buyerPos := T.State.getPosition state id buyer in
                let sellerPos := T.State.getPosition state id seller in
                let '(buyerCreditIncrease, sellerCreditDecrease, sellerDebtIncrease,
                    buyerPendingFeeIncrease, sellerPendingFeeDecrease) :=
                  takeDeltas marketState timeToMaturity units buyerPos sellerPos in
                if (ctx.(T.Context.timestamp) >? offer.(T.Offer.market).(T.Market.maturity)) &&
                    (sellerDebtIncrease >? 0) then
                  revert T.Error.CannotIncreaseDebtPostMaturity
                else if offer.(T.Offer.reduceOnly) &&
                    negb (if offer.(T.Offer.buy) then buyerCreditIncrease =? 0
                          else sellerDebtIncrease =? 0) then
                  revert T.Error.MakerCreditOrDebtIncreased
                else if negb ((offer.(T.Offer.market).(T.Market.enterGate) =? 0) ||
                    (buyerCreditIncrease =? 0) ||
                    ext.(T.External.canIncreaseCredit) offer.(T.Offer.market).(T.Market.enterGate) buyer) then
                  revert T.Error.BuyerGatedFromIncreasingCredit
                else if negb ((offer.(T.Offer.market).(T.Market.enterGate) =? 0) ||
                    (sellerDebtIncrease =? 0) ||
                    ext.(T.External.canIncreaseDebt) offer.(T.Offer.market).(T.Market.enterGate) seller) then
                  revert T.Error.SellerGatedFromIncreasingDebt
                else
                  let '(buyerCallback, sellerCallback, payer, receiver) :=
                    takeCallbacks ctx offer taker takerCallback receiverIfTakerIsSeller buyer in
                  let state :=
                    takeApplyAccounting ctx state id units offer taker buyer seller buyerPos sellerPos
                      marketState newConsumed buyerAssets sellerAssets buyerCreditIncrease
                      sellerCreditDecrease sellerDebtIncrease buyerPendingFeeIncrease
                      sellerPendingFeeDecrease receiver payer in
                  let '(wasLocked, state) :=
                    U.tExchange state C.LIQUIDATION_LOCK_SLOT id seller true in
                  if (negb (buyerCallback =? 0)) &&
                      negb (ext.(T.External.onBuy) buyerCallback id offer.(T.Offer.market)
                        buyerAssets units buyerPendingFeeIncrease buyer
                        (if offer.(T.Offer.buy) then offer.(T.Offer.callbackData) else takerCallbackData)
                        =? C.CALLBACK_SUCCESS) then
                    revert T.Error.WrongBuyCallbackReturnValue
                  else if negb (ext.(T.External.safeTransferFrom) offer.(T.Offer.market).(T.Market.loanToken)
                      payer ctx.(T.Context.self) (buyerAssets - sellerAssets)) then
                    revert T.Error.ExternalCallFailed
                  else if negb (ext.(T.External.safeTransferFrom) offer.(T.Offer.market).(T.Market.loanToken)
                      payer receiver sellerAssets) then
                    revert T.Error.ExternalCallFailed
                  else if (negb (sellerCallback =? 0)) &&
                      negb (ext.(T.External.onSell) sellerCallback id offer.(T.Offer.market)
                        sellerAssets units sellerPendingFeeDecrease seller receiver
                        (if offer.(T.Offer.buy) then takerCallbackData else offer.(T.Offer.callbackData))
                        =? C.CALLBACK_SUCCESS) then
                    revert T.Error.WrongSellCallbackReturnValue
                  else
                    let state :=
                      if wasLocked then state
                      else T.State.setLiquidationLocked state id seller false in
                    if T.State.liquidationLockedOf state id seller ||
                        isHealthyCore ext state offer.(T.Offer.market) id seller then
                      ok state (buyerAssets, sellerAssets)
                    else revert T.Error.SellerIsLiquidatable
            end
          end
      end.

  Definition take := takeSpec.

  Definition withdraw
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (market : T.Market.t) (units : T.uint256) (onBehalf receiver : T.address) :
      T.Outcome.t unit :=
    if negb (isAuthorizedOrSelf state ctx onBehalf) then
      revert T.Error.Unauthorized
    else
      match touchMarketCore ext ctx state market with
      | T.Outcome.Revert error => revert error
      | T.Outcome.Ok state id =>
        match updatePositionCore ctx state market id onBehalf with
        | T.Outcome.Revert error => revert error
        | T.Outcome.Ok state _ =>
          let position := T.State.getPosition state id onBehalf in
          let marketState := T.State.getMarketState state id in
          let pendingFeeDecrease :=
            if position.(T.Position.credit) >? 0 then
              cast128 (U.mulDivUp position.(T.Position.pendingFee) units position.(T.Position.credit))
            else 0 in
          let position :=
            position
              <| T.Position.pendingFee := cast128
                (position.(T.Position.pendingFee) - pendingFeeDecrease) |>
              <| T.Position.credit := cast128 (position.(T.Position.credit) - units) |> in
          let marketState :=
            marketState
              <| T.MarketState.withdrawable := cast128 (marketState.(T.MarketState.withdrawable) - units) |>
              <| T.MarketState.totalUnits := cast128 (marketState.(T.MarketState.totalUnits) - units) |> in
          let state := T.State.setPosition state id onBehalf position in
          let state := T.State.setMarketState state id marketState in
          let state := T.State.emit
            (T.Event.Withdraw ctx.(T.Context.sender) id units onBehalf receiver pendingFeeDecrease) state in
          if ext.(T.External.safeTransfer) market.(T.Market.loanToken) receiver units then
            ok state tt
          else revert T.Error.ExternalCallFailed
        end
      end.

  Definition repay
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (market : T.Market.t) (units : T.uint256) (onBehalf callback : T.address)
      (data : T.bytes) : T.Outcome.t unit :=
    if negb (isAuthorizedOrSelf state ctx onBehalf) then
      revert T.Error.Unauthorized
    else
      match touchMarketCore ext ctx state market with
      | T.Outcome.Revert error => revert error
      | T.Outcome.Ok state id =>
        let position := T.State.getPosition state id onBehalf in
        let marketState := T.State.getMarketState state id in
        let position := position <| T.Position.debt := cast128 (position.(T.Position.debt) - units) |> in
        let marketState :=
          marketState <| T.MarketState.withdrawable :=
            cast128 (marketState.(T.MarketState.withdrawable) + units) |> in
        let payer := if callback =? 0 then ctx.(T.Context.sender) else callback in
        let state := T.State.setPosition state id onBehalf position in
        let state := T.State.setMarketState state id marketState in
        let state := T.State.emit (T.Event.Repay ctx.(T.Context.sender) id units onBehalf payer) state in
        if (negb (callback =? 0)) &&
            negb (ext.(T.External.onRepay) callback id market units onBehalf data =? C.CALLBACK_SUCCESS) then
          revert T.Error.WrongRepayCallbackReturnValue
        else if ext.(T.External.safeTransferFrom) market.(T.Market.loanToken) payer ctx.(T.Context.self) units then
          ok state tt
        else revert T.Error.ExternalCallFailed
      end.

  Definition supplyCollateral
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (market : T.Market.t) (collateralIndex assets : T.uint256) (onBehalf : T.address) :
      T.Outcome.t unit :=
    if negb (isAuthorizedOrSelf state ctx onBehalf) then
      revert T.Error.Unauthorized
    else
      match collateralParamAt market collateralIndex with
      | None => revert T.Error.TooManyCollateralParams
      | Some collateralParam =>
        match touchMarketCore ext ctx state market with
        | T.Outcome.Revert error => revert error
        | T.Outcome.Ok state id =>
          let position := T.State.getPosition state id onBehalf in
          let oldCollateral := T.Position.collateralAt position collateralIndex in
          let position := T.Position.setCollateralAt position collateralIndex (cast128 (oldCollateral + assets)) in
          let position :=
            if (oldCollateral =? 0) && (assets >? 0) then
              position <| T.Position.collateralBitmap :=
                U.setBit position.(T.Position.collateralBitmap) collateralIndex |>
            else position in
          if U.countBits position.(T.Position.collateralBitmap) >? C.MAX_COLLATERALS_PER_BORROWER then
            revert T.Error.TooManyActivatedCollaterals
          else
            let state := T.State.setPosition state id onBehalf position in
            let state := T.State.emit
              (T.Event.SupplyCollateral ctx.(T.Context.sender) id
                collateralParam.(T.CollateralParams.token) assets onBehalf) state in
            if ext.(T.External.safeTransferFrom)
                collateralParam.(T.CollateralParams.token) ctx.(T.Context.sender) ctx.(T.Context.self) assets then
              ok state tt
            else revert T.Error.ExternalCallFailed
        end
      end.

  Definition withdrawCollateral
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (market : T.Market.t) (collateralIndex assets : T.uint256)
      (onBehalf receiver : T.address) : T.Outcome.t unit :=
    if negb (isAuthorizedOrSelf state ctx onBehalf) then
      revert T.Error.Unauthorized
    else
      match collateralParamAt market collateralIndex with
      | None => revert T.Error.TooManyCollateralParams
      | Some collateralParam =>
        match touchMarketCore ext ctx state market with
        | T.Outcome.Revert error => revert error
        | T.Outcome.Ok state id =>
          let position := T.State.getPosition state id onBehalf in
          let newCollateral := T.Position.collateralAt position collateralIndex - assets in
          let position := T.Position.setCollateralAt position collateralIndex (cast128 newCollateral) in
          let position :=
            if (newCollateral =? 0) && (assets >? 0) then
              position <| T.Position.collateralBitmap :=
                U.clearBit position.(T.Position.collateralBitmap) collateralIndex |>
            else position in
          let state := T.State.setPosition state id onBehalf position in
          if negb (isHealthyCore ext state market id onBehalf) then
            revert T.Error.UnhealthyBorrower
          else
            let state := T.State.emit
              (T.Event.WithdrawCollateral ctx.(T.Context.sender) id
                collateralParam.(T.CollateralParams.token) assets onBehalf receiver) state in
            if ext.(T.External.safeTransfer) collateralParam.(T.CollateralParams.token) receiver assets then
              ok state tt
            else revert T.Error.ExternalCallFailed
        end
      end.

  Definition liquidate
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (market : T.Market.t) (collateralIndex seizedAssets repaidUnits : T.uint256)
      (borrower : T.address) (postMaturityMode : bool) (receiver callback : T.address)
      (data : T.bytes) : T.Outcome.t (T.uint256 * T.uint256) :=
    match collateralParamAt market collateralIndex with
    | None => revert T.Error.TooManyCollateralParams
    | Some liquidatedCollateralParam =>
      match touchMarketCore ext ctx state market with
      | T.Outcome.Revert error => revert error
      | T.Outcome.Ok state id =>
        let marketState := T.State.getMarketState state id in
        let position := T.State.getPosition state id borrower in
        if negb (U.atMostOneNonZero repaidUnits seizedAssets) then
          revert T.Error.InconsistentInput
        else if position.(T.Position.debt) <=? 0 then
          revert T.Error.NotBorrower
        else if negb ((market.(T.Market.liquidatorGate) =? 0) ||
            ext.(T.External.canLiquidate) market.(T.Market.liquidatorGate) ctx.(T.Context.sender)) then
          revert T.Error.LiquidatorGatedFromLiquidating
        else
          let '(maxDebt, liquidatedCollatPrice, badDebt) :=
            liquidateCollateralLoop 128 ext market position collateralIndex
              position.(T.Position.collateralBitmap) 0 0 position.(T.Position.debt) in
          if T.State.liquidationLockedOf state id borrower ||
              negb (if postMaturityMode then ctx.(T.Context.timestamp) >? market.(T.Market.maturity)
                    else position.(T.Position.debt) >? maxDebt) then
            revert T.Error.NotLiquidatable
          else
            let '(marketState, position) := applyBadDebt marketState position badDebt in
            let '(seizedAssets, repaidUnits, position, marketState) :=
              if (repaidUnits >? 0) || (seizedAssets >? 0) then
                let maxLif := liquidatedCollateralParam.(T.CollateralParams.maxLif) in
                let lif :=
                  if postMaturityMode then
                    U.min maxLif
                      (C.WAD + (maxLif - C.WAD) *
                        (ctx.(T.Context.timestamp) - market.(T.Market.maturity)) / C.TIME_TO_MAX_LIF)
                  else maxLif in
                let repaidUnits :=
                  if seizedAssets >? 0 then
                    U.mulDivUp
                      (U.mulDivUp seizedAssets liquidatedCollatPrice C.ORACLE_PRICE_SCALE)
                      C.WAD lif
                  else repaidUnits in
                let seizedAssets :=
                  if seizedAssets >? 0 then seizedAssets
                  else U.mulDivDown
                    (U.mulDivDown repaidUnits lif C.WAD) C.ORACLE_PRICE_SCALE liquidatedCollatPrice in
                let newCollateral :=
                  T.Position.collateralAt position collateralIndex - cast128 seizedAssets in
                let position := T.Position.setCollateralAt position collateralIndex (cast128 newCollateral) in
                let position :=
                  if (newCollateral =? 0) && (seizedAssets >? 0) then
                    position <| T.Position.collateralBitmap :=
                      U.clearBit position.(T.Position.collateralBitmap) collateralIndex |>
                  else position in
                let marketState :=
                  marketState <| T.MarketState.withdrawable :=
                    cast128 (marketState.(T.MarketState.withdrawable) + repaidUnits) |> in
                let position :=
                  position <| T.Position.debt := cast128 (position.(T.Position.debt) - repaidUnits) |> in
                (seizedAssets, repaidUnits, position, marketState)
              else (seizedAssets, repaidUnits, position, marketState) in
            let payer := if callback =? 0 then ctx.(T.Context.sender) else callback in
            let state := T.State.setPosition state id borrower position in
            let state := T.State.setMarketState state id marketState in
            let state := T.State.emit
              (T.Event.Liquidate ctx.(T.Context.sender) id
                liquidatedCollateralParam.(T.CollateralParams.token) seizedAssets repaidUnits borrower
                postMaturityMode receiver payer badDebt marketState.(T.MarketState.lossFactor)
                marketState.(T.MarketState.continuousFeeCredit)) state in
            if negb (ext.(T.External.safeTransfer)
                liquidatedCollateralParam.(T.CollateralParams.token) receiver seizedAssets) then
              revert T.Error.ExternalCallFailed
            else if (negb (callback =? 0)) &&
                negb (ext.(T.External.onLiquidate) callback ctx.(T.Context.sender) id market collateralIndex
                  seizedAssets repaidUnits borrower receiver data badDebt =? C.CALLBACK_SUCCESS) then
              revert T.Error.WrongLiquidateCallbackReturnValue
            else if ext.(T.External.safeTransferFrom) market.(T.Market.loanToken)
                payer ctx.(T.Context.self) repaidUnits then
              ok state (seizedAssets, repaidUnits)
            else revert T.Error.ExternalCallFailed
      end
    end.

  Definition setConsumed
      (ctx : T.Context.t) (state : T.State.t) (group amount : T.uint256) (onBehalf : T.address) :
      T.Outcome.t unit :=
    if negb (isAuthorizedOrSelf state ctx onBehalf) then
      revert T.Error.Unauthorized
    else if amount <? T.State.consumedOf state onBehalf group then
      revert T.Error.AlreadyConsumed
    else
      let state := T.State.setConsumed state onBehalf group amount in
      ok (T.State.emit (T.Event.SetConsumed ctx.(T.Context.sender) group amount onBehalf) state) tt.

  Definition setIsAuthorized
      (ctx : T.Context.t) (state : T.State.t)
      (authorized : T.address) (newIsAuthorized : bool) (onBehalf : T.address) :
      T.Outcome.t unit :=
    if negb (isAuthorizedOrSelf state ctx onBehalf) then
      revert T.Error.Unauthorized
    else
      let state := T.State.setIsAuthorized state onBehalf authorized newIsAuthorized in
      ok (T.State.emit
        (T.Event.SetIsAuthorized ctx.(T.Context.sender) authorized newIsAuthorized onBehalf) state) tt.

  Definition flashLoan
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (tokens : list T.address) (assets : list T.uint256) (callback : T.address) (data : T.bytes) :
      T.Outcome.t unit :=
    if negb (length_z tokens =? length_z assets) then
      revert T.Error.InconsistentInput
    else
      let state := T.State.emit (T.Event.FlashLoan ctx.(T.Context.sender) tokens assets callback) state in
      if negb (transferMany ext tokens assets callback) then
        revert T.Error.ExternalCallFailed
      else if negb (ext.(T.External.onFlashLoan) callback ctx.(T.Context.sender) tokens assets data
          =? C.CALLBACK_SUCCESS) then
        revert T.Error.WrongFlashLoanCallbackReturnValue
      else if transferFromMany ext tokens assets callback ctx.(T.Context.self) then
        ok state tt
      else revert T.Error.ExternalCallFailed.

  Definition touchMarket
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t) (market : T.Market.t) :
      T.Outcome.t T.bytes32 :=
    touchMarketCore ext ctx state market.

  Definition updatePositionView
      (ctx : T.Context.t) (state : T.State.t) (market : T.Market.t)
      (id : T.bytes32) (user : T.address) : T.uint128 * T.uint128 * T.uint128 :=
    updatePositionViewCore ctx state market id user.

  Definition updatePosition
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t)
      (market : T.Market.t) (user : T.address) :
      T.Outcome.t (T.uint128 * T.uint128 * T.uint128) :=
    let id := toIdCore ext ctx state market in
    if negb (marketCreated state id) then
      revert T.Error.MarketNotCreated
    else
      updatePositionCore ctx state market id user.

  Definition _updatePosition
      (ctx : T.Context.t) (state : T.State.t) (market : T.Market.t)
      (id : T.bytes32) (user : T.address) :
      T.Outcome.t (T.uint128 * T.uint128 * T.uint128) :=
    updatePositionCore ctx state market id user.

  Definition hasCredit (state : T.State.t) (id : T.bytes32) (user : T.address) : bool :=
    hasCreditCore state id user.

  Definition lastLossFactor (state : T.State.t) (id : T.bytes32) (user : T.address) : T.uint128 :=
    (T.State.getPosition state id user).(T.Position.lastLossFactor).

  Definition collateralBitmap (state : T.State.t) (id : T.bytes32) (user : T.address) : T.uint128 :=
    (T.State.getPosition state id user).(T.Position.collateralBitmap).

  Definition collateral
      (state : T.State.t) (id : T.bytes32) (user : T.address) (index : T.uint256) : T.uint128 :=
    T.Position.collateralAt (T.State.getPosition state id user) index.

  Definition toId
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t) (market : T.Market.t) :
      T.bytes32 :=
    toIdCore ext ctx state market.

  Definition toMarket (ext : T.External.t) (state : T.State.t) (id : T.bytes32) :
      T.Outcome.t T.Market.t :=
    if negb (marketCreated state id) then
      revert T.Error.MarketNotCreated
    else
      match ext.(T.External.toMarket) id with
      | Some market => ok state market
      | None => revert T.Error.ExternalCallFailed
      end.

  Definition creditOf (state : T.State.t) (id : T.bytes32) (user : T.address) : T.uint128 :=
    (T.State.getPosition state id user).(T.Position.credit).

  Definition debtOf (state : T.State.t) (id : T.bytes32) (user : T.address) : T.uint128 :=
    (T.State.getPosition state id user).(T.Position.debt).

  Definition totalUnits (state : T.State.t) (id : T.bytes32) : T.uint128 :=
    (T.State.getMarketState state id).(T.MarketState.totalUnits).

  Definition lossFactor (state : T.State.t) (id : T.bytes32) : T.uint128 :=
    (T.State.getMarketState state id).(T.MarketState.lossFactor).

  Definition tickSpacing (state : T.State.t) (id : T.bytes32) : T.uint8 :=
    (T.State.getMarketState state id).(T.MarketState.tickSpacing).

  Definition withdrawable (state : T.State.t) (id : T.bytes32) : T.uint128 :=
    (T.State.getMarketState state id).(T.MarketState.withdrawable).

  Definition settlementFeeCbps (state : T.State.t) (id : T.bytes32) : list T.uint16 :=
    let marketState := T.State.getMarketState state id in
    [
      marketState.(T.MarketState.settlementFeeCbp0);
      marketState.(T.MarketState.settlementFeeCbp1);
      marketState.(T.MarketState.settlementFeeCbp2);
      marketState.(T.MarketState.settlementFeeCbp3);
      marketState.(T.MarketState.settlementFeeCbp4);
      marketState.(T.MarketState.settlementFeeCbp5);
      marketState.(T.MarketState.settlementFeeCbp6)
    ].

  Definition continuousFee (state : T.State.t) (id : T.bytes32) : T.uint32 :=
    (T.State.getMarketState state id).(T.MarketState.continuousFee).

  Definition continuousFeeCredit (state : T.State.t) (id : T.bytes32) : T.uint128 :=
    (T.State.getMarketState state id).(T.MarketState.continuousFeeCredit).

  Definition pendingFee (state : T.State.t) (id : T.bytes32) (user : T.address) : T.uint128 :=
    (T.State.getPosition state id user).(T.Position.pendingFee).

  Definition lastAccrual (state : T.State.t) (id : T.bytes32) (user : T.address) : T.uint128 :=
    (T.State.getPosition state id user).(T.Position.lastAccrual).

  Definition liquidationLocked (state : T.State.t) (id : T.bytes32) (user : T.address) : bool :=
    U.tGet state C.LIQUIDATION_LOCK_SLOT id user.

  Definition isHealthy
      (ext : T.External.t) (state : T.State.t) (market : T.Market.t)
      (id : T.bytes32) (borrower : T.address) : bool :=
    isHealthyCore ext state market id borrower.

  Definition settlementFee
      (state : T.State.t) (id : T.bytes32) (timeToMaturity : T.uint256) :
      T.Outcome.t T.uint256 :=
    settlementFeeCore state id timeToMaturity.

  Definition eval {A : Set}
      (ext : T.External.t) (ctx : T.Context.t) (state : T.State.t) (call : Call A) :
      T.Outcome.t A :=
    match call with
    | ConstructorCall => ok (constructor ctx state) tt
    | Multicall calls => multicall ext ctx state calls
    | SetRoleSetter newRoleSetter => setRoleSetter ctx state newRoleSetter
    | SetFeeSetter newFeeSetter => setFeeSetter ctx state newFeeSetter
    | SetFeeClaimer newFeeClaimer => setFeeClaimer ctx state newFeeClaimer
    | SetTickSpacingSetter newTickSpacingSetter =>
        setTickSpacingSetter ctx state newTickSpacingSetter
    | SetMarketTickSpacing id newTickSpacing =>
        setMarketTickSpacing ctx state id newTickSpacing
    | SetMarketSettlementFee id index newSettlementFee =>
        setMarketSettlementFee ctx state id index newSettlementFee
    | SetDefaultSettlementFee loanToken index newSettlementFee =>
        setDefaultSettlementFee ctx state loanToken index newSettlementFee
    | SetMarketContinuousFee id newContinuousFee =>
        setMarketContinuousFee ctx state id newContinuousFee
    | SetDefaultContinuousFee loanToken newContinuousFee =>
        setDefaultContinuousFee ctx state loanToken newContinuousFee
    | ClaimSettlementFee token amount receiver =>
        claimSettlementFee ext ctx state token amount receiver
    | ClaimContinuousFee market amount receiver =>
        claimContinuousFee ext ctx state market amount receiver
    | Take offer ratifierData units taker receiverIfTakerIsSeller takerCallback takerCallbackData =>
        take ext ctx state offer ratifierData units taker receiverIfTakerIsSeller
          takerCallback takerCallbackData
    | Withdraw market units onBehalf receiver =>
        withdraw ext ctx state market units onBehalf receiver
    | Repay market units onBehalf callback data =>
        repay ext ctx state market units onBehalf callback data
    | SupplyCollateral market collateralIndex assets onBehalf =>
        supplyCollateral ext ctx state market collateralIndex assets onBehalf
    | WithdrawCollateral market collateralIndex assets onBehalf receiver =>
        withdrawCollateral ext ctx state market collateralIndex assets onBehalf receiver
    | Liquidate market collateralIndex seizedAssets repaidUnits borrower postMaturityMode
          receiver callback data =>
        liquidate ext ctx state market collateralIndex seizedAssets repaidUnits borrower
          postMaturityMode receiver callback data
    | SetConsumed group amount onBehalf =>
        setConsumed ctx state group amount onBehalf
    | SetIsAuthorized authorized newIsAuthorized onBehalf =>
        setIsAuthorized ctx state authorized newIsAuthorized onBehalf
    | FlashLoan tokens assets callback data =>
        flashLoan ext ctx state tokens assets callback data
    | TouchMarket market => touchMarket ext ctx state market
    | UpdatePositionView market id user =>
        ok state (updatePositionView ctx state market id user)
    | UpdatePosition market user => updatePosition ext ctx state market user
    | UpdatePositionInternal market id user =>
        _updatePosition ctx state market id user
    | HasCredit id user => ok state (hasCredit state id user)
    | LastLossFactor id user => ok state (lastLossFactor state id user)
    | CollateralBitmap id user => ok state (collateralBitmap state id user)
    | Collateral id user index => ok state (collateral state id user index)
    | ToId market => ok state (toId ext ctx state market)
    | ToMarket id => toMarket ext state id
    | CreditOf id user => ok state (creditOf state id user)
    | DebtOf id user => ok state (debtOf state id user)
    | TotalUnits id => ok state (totalUnits state id)
    | LossFactor id => ok state (lossFactor state id)
    | TickSpacing id => ok state (tickSpacing state id)
    | Withdrawable id => ok state (withdrawable state id)
    | SettlementFeeCbps id => ok state (settlementFeeCbps state id)
    | ContinuousFee id => ok state (continuousFee state id)
    | ContinuousFeeCredit id => ok state (continuousFeeCredit state id)
    | PendingFee id user => ok state (pendingFee state id user)
    | LastAccrual id user => ok state (lastAccrual state id user)
    | LiquidationLocked id user => ok state (liquidationLocked state id user)
    | IsHealthy market id borrower => ok state (isHealthy ext state market id borrower)
    | SettlementFee id timeToMaturity => settlementFee state id timeToMaturity
    end.
End MidnightFunctionalSpec.
