Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.contracts.morpho.midnight.core.midnight.functional_spec.

Module MidnightFunctionalEquivalence.
  Module F := MidnightFunctionalSpec.
  Module T := F.T.
  Module L := F.L.
  Module C := F.C.
  Module U := F.U.
  Module M := F.M.

  Lemma cast128_matches_generated value :
    F.cast128 value = M.cast128 value.
  Proof. reflexivity. Qed.

  Lemma length_z_matches_generated {A : Set} (values : list A) :
    F.length_z values = M.length_z values.
  Proof.
    induction values as [| value values IH]; simpl; [reflexivity |].
    rewrite IH.
    reflexivity.
  Qed.

  Lemma nth_option_matches_generated {A : Set} (values : list A) index :
    F.nth_option values index = M.nth_option values index.
  Proof.
    revert index.
    induction values as [| value values IH]; intros [| index]; simpl; try reflexivity.
  Qed.

  Lemma collateralParamAt_matches_generated market index :
    F.collateralParamAt market index = M.collateralParamAt market index.
  Proof.
    unfold F.collateralParamAt, M.collateralParamAt.
    rewrite nth_option_matches_generated.
    reflexivity.
  Qed.

  Lemma isAuthorizedOrSelf_matches_generated state ctx onBehalf :
    F.isAuthorizedOrSelf state ctx onBehalf =
    M.isAuthorizedOrSelf state ctx onBehalf.
  Proof. reflexivity. Qed.

  Lemma marketCreated_matches_generated state id :
    F.marketCreated state id = M.marketCreated state id.
  Proof. reflexivity. Qed.

  Lemma toIdCore_matches_generated ext ctx state market :
    F.toIdCore ext ctx state market = M.toIdCore ext ctx state market.
  Proof. reflexivity. Qed.

  Lemma setDefaultSettlementFees_matches_generated state market marketState :
    F.setDefaultSettlementFees state market marketState =
    M.setDefaultSettlementFees state market marketState.
  Proof. reflexivity. Qed.

  Lemma collateralParamsAreSortedAndValid_matches_generated params previousCollateralToken :
    F.collateralParamsAreSortedAndValid params previousCollateralToken =
    M.collateralParamsAreSortedAndValid params previousCollateralToken.
  Proof.
    revert previousCollateralToken.
    induction params as [| collateralParam params IH]; intros previousCollateralToken; simpl.
    - reflexivity.
    - rewrite IH.
      reflexivity.
  Qed.

  Lemma touchMarketCore_matches_generated ext ctx state market :
    F.touchMarketCore ext ctx state market =
    M.touchMarketCore ext ctx state market.
  Proof.
    unfold F.touchMarketCore, M.touchMarketCore.
    rewrite toIdCore_matches_generated.
    rewrite marketCreated_matches_generated.
    repeat rewrite length_z_matches_generated.
    rewrite collateralParamsAreSortedAndValid_matches_generated.
    rewrite setDefaultSettlementFees_matches_generated.
    reflexivity.
  Qed.

  Lemma settlementFeeCore_matches_generated state id timeToMaturity :
    F.settlementFeeCore state id timeToMaturity =
    M.settlementFeeCore state id timeToMaturity.
  Proof. reflexivity. Qed.

  Lemma isHealthyCollateralLoop_matches_generated
      fuel ext market position bitmap maxDebt :
    F.isHealthyCollateralLoop fuel ext market position bitmap maxDebt =
    M.isHealthyCollateralLoop fuel ext market position bitmap maxDebt.
  Proof.
    revert bitmap maxDebt.
    induction fuel as [| fuel IH]; intros bitmap maxDebt; simpl.
    - reflexivity.
    - destruct (bitmap =? 0); [reflexivity |].
      rewrite collateralParamAt_matches_generated.
      destruct (M.collateralParamAt market (U.msb bitmap)); [rewrite IH |]; reflexivity.
  Qed.

  Lemma isHealthyCore_matches_generated ext state market id borrower :
    F.isHealthyCore ext state market id borrower =
    M.isHealthyCore ext state market id borrower.
  Proof.
    unfold F.isHealthyCore, M.isHealthyCore.
    rewrite isHealthyCollateralLoop_matches_generated.
    reflexivity.
  Qed.

  Lemma updatePositionViewCore_matches_generated ctx state market id user :
    F.updatePositionViewCore ctx state market id user =
    M.updatePositionViewCore ctx state market id user.
  Proof.
    unfold F.updatePositionViewCore, M.updatePositionViewCore.
    repeat rewrite cast128_matches_generated.
    reflexivity.
  Qed.

  Lemma updatePositionCore_matches_generated ctx state market id user :
    F.updatePositionCore ctx state market id user =
    M.updatePositionCore ctx state market id user.
  Proof.
    unfold F.updatePositionCore, M.updatePositionCore.
    rewrite updatePositionViewCore_matches_generated.
    repeat rewrite cast128_matches_generated.
    reflexivity.
  Qed.

  Lemma hasCreditCore_matches_generated state id user :
    F.hasCreditCore state id user = M.hasCreditCore state id user.
  Proof. reflexivity. Qed.

  Lemma liquidateCollateralLoop_matches_generated
      fuel ext market position collateralIndex bitmap maxDebt liquidatedPrice badDebt :
    F.liquidateCollateralLoop fuel ext market position collateralIndex bitmap
      maxDebt liquidatedPrice badDebt =
    M.liquidateCollateralLoop fuel ext market position collateralIndex bitmap
      maxDebt liquidatedPrice badDebt.
  Proof.
    revert bitmap maxDebt liquidatedPrice badDebt.
    induction fuel as [| fuel IH]; intros bitmap maxDebt liquidatedPrice badDebt; simpl.
    - reflexivity.
    - destruct (bitmap =? 0); [reflexivity |].
      rewrite collateralParamAt_matches_generated.
      destruct (M.collateralParamAt market (U.msb bitmap)); [rewrite IH |]; reflexivity.
  Qed.

  Lemma applyBadDebt_matches_generated marketState position badDebt :
    F.applyBadDebt marketState position badDebt =
    M.applyBadDebt marketState position badDebt.
  Proof.
    unfold F.applyBadDebt, M.applyBadDebt.
    repeat rewrite cast128_matches_generated.
    reflexivity.
  Qed.

  Lemma transferMany_matches_generated ext tokens assets receiver :
    F.transferMany ext tokens assets receiver =
    M.transferMany ext tokens assets receiver.
  Proof.
    revert assets.
    induction tokens as [| token tokens IH]; intros [| asset assets]; simpl; try reflexivity.
  Qed.

  Lemma transferFromMany_matches_generated ext tokens assets from to :
    F.transferFromMany ext tokens assets from to =
    M.transferFromMany ext tokens assets from to.
  Proof.
    revert assets.
    induction tokens as [| token tokens IH]; intros [| asset assets]; simpl; try reflexivity.
  Qed.

  Lemma constructor_matches_generated ctx state :
    F.constructor ctx state = M.constructor ctx state.
  Proof. reflexivity. Qed.

  Lemma multicallLoop_matches_generated ext ctx calls :
    F.multicallLoop ext ctx calls = M.multicallLoop ext ctx calls.
  Proof.
    induction calls as [| call calls IH]; simpl; [reflexivity |].
    rewrite IH.
    reflexivity.
  Qed.

  Lemma multicall_matches_generated ext ctx state calls :
    F.multicall ext ctx state calls = M.multicall ext ctx state calls.
  Proof.
    unfold F.multicall, M.multicall.
    rewrite multicallLoop_matches_generated.
    reflexivity.
  Qed.

  Lemma setRoleSetter_matches_generated ctx state newRoleSetter :
    F.setRoleSetter ctx state newRoleSetter =
    M.setRoleSetter ctx state newRoleSetter.
  Proof. reflexivity. Qed.

  Lemma setFeeSetter_matches_generated ctx state newFeeSetter :
    F.setFeeSetter ctx state newFeeSetter =
    M.setFeeSetter ctx state newFeeSetter.
  Proof. reflexivity. Qed.

  Lemma setFeeClaimer_matches_generated ctx state newFeeClaimer :
    F.setFeeClaimer ctx state newFeeClaimer =
    M.setFeeClaimer ctx state newFeeClaimer.
  Proof. reflexivity. Qed.

  Lemma setTickSpacingSetter_matches_generated ctx state newTickSpacingSetter :
    F.setTickSpacingSetter ctx state newTickSpacingSetter =
    M.setTickSpacingSetter ctx state newTickSpacingSetter.
  Proof. reflexivity. Qed.

  Lemma setMarketTickSpacing_matches_generated ctx state id newTickSpacing :
    F.setMarketTickSpacing ctx state id newTickSpacing =
    M.setMarketTickSpacing ctx state id newTickSpacing.
  Proof. reflexivity. Qed.

  Lemma setMarketSettlementFee_matches_generated ctx state id index newSettlementFee :
    F.setMarketSettlementFee ctx state id index newSettlementFee =
    M.setMarketSettlementFee ctx state id index newSettlementFee.
  Proof. reflexivity. Qed.

  Lemma setDefaultSettlementFee_matches_generated ctx state loanToken index newSettlementFee :
    F.setDefaultSettlementFee ctx state loanToken index newSettlementFee =
    M.setDefaultSettlementFee ctx state loanToken index newSettlementFee.
  Proof. reflexivity. Qed.

  Lemma setMarketContinuousFee_matches_generated ctx state id newContinuousFee :
    F.setMarketContinuousFee ctx state id newContinuousFee =
    M.setMarketContinuousFee ctx state id newContinuousFee.
  Proof. reflexivity. Qed.

  Lemma setDefaultContinuousFee_matches_generated ctx state loanToken newContinuousFee :
    F.setDefaultContinuousFee ctx state loanToken newContinuousFee =
    M.setDefaultContinuousFee ctx state loanToken newContinuousFee.
  Proof. reflexivity. Qed.

  Lemma claimSettlementFee_matches_generated ext ctx state token amount receiver :
    F.claimSettlementFee ext ctx state token amount receiver =
    M.claimSettlementFee ext ctx state token amount receiver.
  Proof. reflexivity. Qed.

  Lemma claimContinuousFee_matches_generated ext ctx state market amount receiver :
    F.claimContinuousFee ext ctx state market amount receiver =
    M.claimContinuousFee ext ctx state market amount receiver.
  Proof.
    unfold F.claimContinuousFee, M.claimContinuousFee.
    rewrite toIdCore_matches_generated.
    repeat rewrite cast128_matches_generated.
    reflexivity.
  Qed.

  Lemma takeAssets_matches_generated offer units offerPrice settlementFee :
    F.takeAssets offer units offerPrice settlementFee =
    let sellerPrice :=
      if offer.(T.Offer.buy) then offerPrice - settlementFee else offerPrice in
    let buyerPrice := sellerPrice + settlementFee in
    let buyerAssets :=
      if offer.(T.Offer.buy) then M.U.mulDivDown units buyerPrice M.C.WAD
      else M.U.mulDivUp units buyerPrice M.C.WAD in
    let sellerAssets :=
      if offer.(T.Offer.buy) then M.U.mulDivDown units sellerPrice M.C.WAD
      else M.U.mulDivUp units sellerPrice M.C.WAD in
    (buyerAssets, sellerAssets).
  Proof. reflexivity. Qed.

  Lemma takeConsumed_matches_generated state offer units buyerAssets sellerAssets :
    F.takeConsumed state offer units buyerAssets sellerAssets =
    T.State.consumedOf state offer.(T.Offer.maker) offer.(T.Offer.group) +
      (if offer.(T.Offer.maxAssets) >? 0 then
         if offer.(T.Offer.buy) then buyerAssets else sellerAssets
       else units).
  Proof. reflexivity. Qed.

  Lemma takeUsers_matches_generated offer taker :
    F.takeUsers offer taker =
    if offer.(T.Offer.buy) then (offer.(T.Offer.maker), taker)
    else (taker, offer.(T.Offer.maker)).
  Proof. reflexivity. Qed.

  Lemma takeDeltas_matches_generated marketState timeToMaturity units buyerPos sellerPos :
    F.takeDeltas marketState timeToMaturity units buyerPos sellerPos =
    let buyerCreditIncrease := M.U.zeroFloorSub units buyerPos.(T.Position.debt) in
    let sellerCreditDecrease := M.U.min units sellerPos.(T.Position.credit) in
    let sellerDebtIncrease := units - sellerCreditDecrease in
    let buyerPendingFeeIncrease :=
      M.cast128 (M.U.mulDivDown buyerCreditIncrease
        (marketState.(T.MarketState.continuousFee) * timeToMaturity) M.C.WAD) in
    let sellerPendingFeeDecrease :=
      if sellerPos.(T.Position.credit) >? 0 then
        M.cast128 (M.U.mulDivUp sellerPos.(T.Position.pendingFee)
          sellerCreditDecrease sellerPos.(T.Position.credit))
      else 0 in
    (buyerCreditIncrease, sellerCreditDecrease, sellerDebtIncrease,
      buyerPendingFeeIncrease, sellerPendingFeeDecrease).
  Proof.
    unfold F.takeDeltas.
    repeat rewrite cast128_matches_generated.
    reflexivity.
  Qed.

  Lemma takeCallbacks_matches_generated
      ctx offer taker takerCallback receiverIfTakerIsSeller buyer :
    F.takeCallbacks ctx offer taker takerCallback receiverIfTakerIsSeller buyer =
    let buyerCallback := if offer.(T.Offer.buy) then offer.(T.Offer.callback) else takerCallback in
    let sellerCallback := if offer.(T.Offer.buy) then takerCallback else offer.(T.Offer.callback) in
    let payer :=
      if negb (buyerCallback =? 0) then buyerCallback
      else if offer.(T.Offer.buy) then buyer else ctx.(T.Context.sender) in
    let receiver :=
      if offer.(T.Offer.buy) then receiverIfTakerIsSeller
      else offer.(T.Offer.receiverIfMakerIsSeller) in
    (buyerCallback, sellerCallback, payer, receiver).
  Proof. reflexivity. Qed.

  Lemma takeApplyAccounting_matches_generated
      ctx state id units offer taker buyer seller buyerPos sellerPos marketState
      newConsumed buyerAssets sellerAssets buyerCreditIncrease sellerCreditDecrease
      sellerDebtIncrease buyerPendingFeeIncrease sellerPendingFeeDecrease receiver payer :
    F.takeApplyAccounting ctx state id units offer taker buyer seller buyerPos sellerPos
      marketState newConsumed buyerAssets sellerAssets buyerCreditIncrease sellerCreditDecrease
      sellerDebtIncrease buyerPendingFeeIncrease sellerPendingFeeDecrease receiver payer =
    let buyerPos :=
      buyerPos
        <| T.Position.debt := M.cast128 (buyerPos.(T.Position.debt) -
          (units - buyerCreditIncrease)) |>
        <| T.Position.pendingFee := M.cast128
          (buyerPos.(T.Position.pendingFee) + buyerPendingFeeIncrease) |>
        <| T.Position.credit := M.cast128
          (buyerPos.(T.Position.credit) + buyerCreditIncrease) |> in
    let sellerPos :=
      sellerPos
        <| T.Position.pendingFee := M.cast128
          (sellerPos.(T.Position.pendingFee) - sellerPendingFeeDecrease) |>
        <| T.Position.credit := M.cast128
          (sellerPos.(T.Position.credit) - sellerCreditDecrease) |>
        <| T.Position.debt := M.cast128
          (sellerPos.(T.Position.debt) + sellerDebtIncrease) |> in
    let marketState :=
      marketState <| T.MarketState.totalUnits := M.cast128
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
  Proof.
    unfold F.takeApplyAccounting.
    repeat rewrite cast128_matches_generated.
    reflexivity.
  Qed.

  Lemma take_matches_generated ext ctx state offer ratifierData units taker
      receiverIfTakerIsSeller takerCallback takerCallbackData :
    F.take ext ctx state offer ratifierData units taker receiverIfTakerIsSeller
      takerCallback takerCallbackData =
    M.take ext ctx state offer ratifierData units taker receiverIfTakerIsSeller
      takerCallback takerCallbackData.
  Proof.
    unfold F.take, F.takeSpec, M.take, F.isAuthorizedOrSelf.
    rewrite touchMarketCore_matches_generated.
    destruct ((taker =? ctx.(T.Context.sender)) ||
      T.State.isAuthorizedOf state taker ctx.(T.Context.sender));
      cbn [negb]; [| reflexivity].
    destruct (M.touchMarketCore ext ctx state offer.(T.Offer.market))
      as [state_after_touch id | error]; [| reflexivity].
    destruct ((T.State.getMarketState state_after_touch id).(T.MarketState.lossFactor) <? L.Uint.max128);
      cbn [negb]; [| reflexivity].
    destruct (U.atMostOneNonZero offer.(T.Offer.maxAssets) offer.(T.Offer.maxUnits));
      cbn [negb]; [| reflexivity].
    destruct (offer.(T.Offer.tick) mod
      (T.State.getMarketState state_after_touch id).(T.MarketState.tickSpacing) =? 0);
      cbn [negb]; [| reflexivity].
    destruct (ctx.(T.Context.timestamp) <? offer.(T.Offer.start)); [reflexivity |].
    destruct (ctx.(T.Context.timestamp) >? offer.(T.Offer.expiry)); [reflexivity |].
    destruct (offer.(T.Offer.maker) =? taker); [reflexivity |].
    destruct (T.State.isAuthorizedOf state_after_touch offer.(T.Offer.maker) offer.(T.Offer.ratifier));
      cbn [negb]; [| reflexivity].
    destruct (ext.(T.External.isRatified) offer ratifierData =? C.CALLBACK_SUCCESS);
      cbn [negb]; [| reflexivity].
    destruct (L.TickLib.tickToPrice offer.(T.Offer.tick)) as [offerPrice |]; [| reflexivity].
    rewrite settlementFeeCore_matches_generated.
    destruct (M.settlementFeeCore state_after_touch id
      (U.zeroFloorSub offer.(T.Offer.market).(T.Market.maturity) ctx.(T.Context.timestamp)))
      as [state_after_fee settlementFee | error];
      [| reflexivity].
    unfold F.takeAssets, F.takeConsumed, F.takeUsers, F.takeDeltas,
      F.takeCallbacks, F.takeApplyAccounting.
    repeat rewrite cast128_matches_generated.
    match goal with
    | |- context [if ?condition then F.revert T.Error.ConsumedAssets else _] =>
        destruct condition; [reflexivity |]
    end.
    match goal with
    | |- context [if ?condition then F.revert T.Error.ConsumedUnits else _] =>
        destruct condition; [reflexivity |]
    end.
    destruct offer.(T.Offer.buy); cbn [negb].
    all: repeat rewrite cast128_matches_generated.
    all: repeat match goal with
    | |- context [F.cast128 ?value] => rewrite (cast128_matches_generated value)
    end.
    all: match goal with
    | |- context [if ?condition then F.revert T.Error.CannotIncreaseDebtPostMaturity else _] =>
        destruct condition; [reflexivity |]
    end.
    all: match goal with
    | |- context [if ?condition then F.revert T.Error.MakerCreditOrDebtIncreased else _] =>
        destruct condition; [reflexivity |]
    end.
    all: match goal with
    | |- context [if ?condition then F.revert T.Error.BuyerGatedFromIncreasingCredit else _] =>
        destruct condition; [reflexivity |]
    end.
    all: match goal with
    | |- context [if ?condition then F.revert T.Error.SellerGatedFromIncreasingDebt else _] =>
        destruct condition; [reflexivity |]
    end.
    all: match goal with
    | |- context [if ?condition then F.revert T.Error.WrongBuyCallbackReturnValue else _] =>
        destruct condition; [reflexivity |]
    end.
    all: match goal with
    | |- context [if ?condition then F.revert T.Error.ExternalCallFailed else _] =>
        destruct condition; [reflexivity |]
    end.
    all: match goal with
    | |- context [if ?condition then F.revert T.Error.ExternalCallFailed else _] =>
        destruct condition; [reflexivity |]
    end.
    all: repeat rewrite cast128_matches_generated.
    all: repeat match goal with
    | |- context [F.cast128 ?value] => rewrite (cast128_matches_generated value)
    end.
    all: match goal with
    | |- context [if ?condition then F.revert T.Error.WrongSellCallbackReturnValue else _] =>
        destruct condition; [reflexivity |]
    end.
    all: repeat match goal with
    | |- context [F.cast128 ?value] => rewrite (cast128_matches_generated value)
    end.
    all: match goal with
    | |- context [M.U.tExchange ?state ?slot ?id ?user ?value] =>
        destruct (M.U.tExchange state slot id user value) as [wasLocked state_after_lock]
    | |- context [F.U.tExchange ?state ?slot ?id ?user ?value] =>
        destruct (F.U.tExchange state slot id user value) as [wasLocked state_after_lock]
    end.
    all: repeat match goal with
    | |- context [F.isHealthyCore ?ext ?state ?market ?id ?user] =>
        rewrite (isHealthyCore_matches_generated ext state market id user)
    end.
    all: match goal with
    | |- context [if ?condition then _ else F.revert T.Error.SellerIsLiquidatable] =>
        destruct condition; reflexivity
    | |- context [if ?condition then _ else M.revert T.Error.SellerIsLiquidatable] =>
        destruct condition; reflexivity
    | |- context [if ?condition then _ else T.Outcome.Revert T.Error.SellerIsLiquidatable] =>
        destruct condition; reflexivity
    end.
  Qed.

  Lemma withdraw_matches_generated ext ctx state market units onBehalf receiver :
    F.withdraw ext ctx state market units onBehalf receiver =
    M.withdraw ext ctx state market units onBehalf receiver.
  Proof.
    unfold F.withdraw, M.withdraw.
    try rewrite isAuthorizedOrSelf_matches_generated.
    try rewrite touchMarketCore_matches_generated.
    try rewrite updatePositionCore_matches_generated.
    repeat rewrite cast128_matches_generated.
    reflexivity.
  Qed.

  Lemma repay_matches_generated ext ctx state market units onBehalf callback data :
    F.repay ext ctx state market units onBehalf callback data =
    M.repay ext ctx state market units onBehalf callback data.
  Proof.
    unfold F.repay, M.repay.
    try rewrite isAuthorizedOrSelf_matches_generated.
    try rewrite touchMarketCore_matches_generated.
    repeat rewrite cast128_matches_generated.
    reflexivity.
  Qed.

  Lemma supplyCollateral_matches_generated ext ctx state market collateralIndex assets onBehalf :
    F.supplyCollateral ext ctx state market collateralIndex assets onBehalf =
    M.supplyCollateral ext ctx state market collateralIndex assets onBehalf.
  Proof.
    unfold F.supplyCollateral, M.supplyCollateral.
    try rewrite isAuthorizedOrSelf_matches_generated.
    try rewrite collateralParamAt_matches_generated.
    try rewrite touchMarketCore_matches_generated.
    repeat rewrite cast128_matches_generated.
    reflexivity.
  Qed.

  Lemma withdrawCollateral_matches_generated
      ext ctx state market collateralIndex assets onBehalf receiver :
    F.withdrawCollateral ext ctx state market collateralIndex assets onBehalf receiver =
    M.withdrawCollateral ext ctx state market collateralIndex assets onBehalf receiver.
  Proof.
    unfold F.withdrawCollateral, M.withdrawCollateral.
    rewrite isAuthorizedOrSelf_matches_generated.
    destruct (M.isAuthorizedOrSelf state ctx onBehalf); cbn [negb]; [| reflexivity].
    rewrite collateralParamAt_matches_generated.
    destruct (M.collateralParamAt market collateralIndex); [| reflexivity].
    rewrite touchMarketCore_matches_generated.
    destruct (M.touchMarketCore ext ctx state market); [| reflexivity].
    repeat rewrite cast128_matches_generated.
    rewrite isHealthyCore_matches_generated.
    match goal with
    | |- context [M.isHealthyCore ?ext ?state ?market ?id ?user] =>
        destruct (M.isHealthyCore ext state market id user)
    end;
    cbn [negb]; reflexivity.
  Qed.

  Lemma liquidate_matches_generated ext ctx state market collateralIndex seizedAssets repaidUnits
      borrower postMaturityMode receiver callback data :
    F.liquidate ext ctx state market collateralIndex seizedAssets repaidUnits borrower
      postMaturityMode receiver callback data =
    M.liquidate ext ctx state market collateralIndex seizedAssets repaidUnits borrower
      postMaturityMode receiver callback data.
  Proof.
    unfold F.liquidate, M.liquidate.
    rewrite collateralParamAt_matches_generated.
    destruct (M.collateralParamAt market collateralIndex); [| reflexivity].
    rewrite touchMarketCore_matches_generated.
    destruct (M.touchMarketCore ext ctx state market); [| reflexivity].
    destruct (U.atMostOneNonZero repaidUnits seizedAssets); cbn [negb]; [| reflexivity].
    match goal with
    | |- context [?debt <=? 0] => destruct (debt <=? 0)
    end; [reflexivity |].
    match goal with
    | |- context [M.liquidateCollateralLoop ?fuel ?ext ?market ?position ?collateralIndex
          ?bitmap ?maxDebt ?liquidatedPrice ?badDebt] =>
        rewrite (liquidateCollateralLoop_matches_generated fuel ext market position
          collateralIndex bitmap maxDebt liquidatedPrice badDebt)
    end.
    try match goal with
    | |- context [F.applyBadDebt ?marketState ?position ?badDebt] =>
        rewrite (applyBadDebt_matches_generated marketState position badDebt)
    end.
    repeat rewrite cast128_matches_generated.
    repeat match goal with
    | |- context [if ?condition then _ else _] => destruct condition; cbn [negb]
    end;
    reflexivity.
  Qed.

  Lemma setConsumed_matches_generated ctx state group amount onBehalf :
    F.setConsumed ctx state group amount onBehalf =
    M.setConsumed ctx state group amount onBehalf.
  Proof.
    unfold F.setConsumed, M.setConsumed.
    rewrite isAuthorizedOrSelf_matches_generated.
    reflexivity.
  Qed.

  Lemma setIsAuthorized_matches_generated ctx state authorized newIsAuthorized onBehalf :
    F.setIsAuthorized ctx state authorized newIsAuthorized onBehalf =
    M.setIsAuthorized ctx state authorized newIsAuthorized onBehalf.
  Proof.
    unfold F.setIsAuthorized, M.setIsAuthorized.
    rewrite isAuthorizedOrSelf_matches_generated.
    reflexivity.
  Qed.

  Lemma flashLoan_matches_generated ext ctx state tokens assets callback data :
    F.flashLoan ext ctx state tokens assets callback data =
    M.flashLoan ext ctx state tokens assets callback data.
  Proof.
    unfold F.flashLoan, M.flashLoan.
    repeat rewrite length_z_matches_generated.
    rewrite transferMany_matches_generated.
    rewrite transferFromMany_matches_generated.
    reflexivity.
  Qed.

  Lemma touchMarket_matches_generated ext ctx state market :
    F.touchMarket ext ctx state market = M.touchMarket ext ctx state market.
  Proof.
    unfold F.touchMarket, M.touchMarket.
    apply touchMarketCore_matches_generated.
  Qed.

  Lemma updatePositionView_matches_generated ctx state market id user :
    F.updatePositionView ctx state market id user =
    M.updatePositionView ctx state market id user.
  Proof.
    unfold F.updatePositionView, M.updatePositionView.
    apply updatePositionViewCore_matches_generated.
  Qed.

  Lemma updatePosition_matches_generated ext ctx state market user :
    F.updatePosition ext ctx state market user =
    M.updatePosition ext ctx state market user.
  Proof.
    unfold F.updatePosition, M.updatePosition.
    rewrite toIdCore_matches_generated.
    rewrite marketCreated_matches_generated.
    rewrite updatePositionCore_matches_generated.
    reflexivity.
  Qed.

  Lemma _updatePosition_matches_generated ctx state market id user :
    F._updatePosition ctx state market id user =
    M._updatePosition ctx state market id user.
  Proof.
    unfold F._updatePosition, M._updatePosition.
    apply updatePositionCore_matches_generated.
  Qed.

  Lemma hasCredit_matches_generated state id user :
    F.hasCredit state id user = M.hasCredit state id user.
  Proof.
    unfold F.hasCredit, M.hasCredit.
    apply hasCreditCore_matches_generated.
  Qed.

  Lemma lastLossFactor_matches_generated state id user :
    F.lastLossFactor state id user = M.lastLossFactor state id user.
  Proof. reflexivity. Qed.

  Lemma collateralBitmap_matches_generated state id user :
    F.collateralBitmap state id user = M.collateralBitmap state id user.
  Proof. reflexivity. Qed.

  Lemma collateral_matches_generated state id user index :
    F.collateral state id user index = M.collateral state id user index.
  Proof. reflexivity. Qed.

  Lemma toId_matches_generated ext ctx state market :
    F.toId ext ctx state market = M.toId ext ctx state market.
  Proof.
    unfold F.toId, M.toId.
    apply toIdCore_matches_generated.
  Qed.

  Lemma toMarket_matches_generated ext state id :
    F.toMarket ext state id = M.toMarket ext state id.
  Proof.
    unfold F.toMarket, M.toMarket.
    rewrite marketCreated_matches_generated.
    reflexivity.
  Qed.

  Lemma creditOf_matches_generated state id user :
    F.creditOf state id user = M.creditOf state id user.
  Proof. reflexivity. Qed.

  Lemma debtOf_matches_generated state id user :
    F.debtOf state id user = M.debtOf state id user.
  Proof. reflexivity. Qed.

  Lemma totalUnits_matches_generated state id :
    F.totalUnits state id = M.totalUnits state id.
  Proof. reflexivity. Qed.

  Lemma lossFactor_matches_generated state id :
    F.lossFactor state id = M.lossFactor state id.
  Proof. reflexivity. Qed.

  Lemma tickSpacing_matches_generated state id :
    F.tickSpacing state id = M.tickSpacing state id.
  Proof. reflexivity. Qed.

  Lemma withdrawable_matches_generated state id :
    F.withdrawable state id = M.withdrawable state id.
  Proof. reflexivity. Qed.

  Lemma settlementFeeCbps_matches_generated state id :
    F.settlementFeeCbps state id = M.settlementFeeCbps state id.
  Proof. reflexivity. Qed.

  Lemma continuousFee_matches_generated state id :
    F.continuousFee state id = M.continuousFee state id.
  Proof. reflexivity. Qed.

  Lemma continuousFeeCredit_matches_generated state id :
    F.continuousFeeCredit state id = M.continuousFeeCredit state id.
  Proof. reflexivity. Qed.

  Lemma pendingFee_matches_generated state id user :
    F.pendingFee state id user = M.pendingFee state id user.
  Proof. reflexivity. Qed.

  Lemma lastAccrual_matches_generated state id user :
    F.lastAccrual state id user = M.lastAccrual state id user.
  Proof. reflexivity. Qed.

  Lemma liquidationLocked_matches_generated state id user :
    F.liquidationLocked state id user = M.liquidationLocked state id user.
  Proof. reflexivity. Qed.

  Lemma isHealthy_matches_generated ext state market id borrower :
    F.isHealthy ext state market id borrower =
    M.isHealthy ext state market id borrower.
  Proof.
    unfold F.isHealthy, M.isHealthy.
    apply isHealthyCore_matches_generated.
  Qed.

  Lemma settlementFee_matches_generated state id timeToMaturity :
    F.settlementFee state id timeToMaturity =
    M.settlementFee state id timeToMaturity.
  Proof.
    unfold F.settlementFee, M.settlementFee.
    apply settlementFeeCore_matches_generated.
  Qed.

  Theorem eval_is_total_for_public_call
      {A : Set} (ext : T.External.t) (ctx : T.Context.t)
      (state : T.State.t) (call : F.Call A) :
    exists output, F.eval ext ctx state call = output.
  Proof.
    exists (F.eval ext ctx state call).
    reflexivity.
  Qed.

  Theorem eval_public_function_is_stable
      {A : Set} (call : F.Call A) :
    F.public_function call = F.public_function call.
  Proof.
    reflexivity.
  Qed.

  Lemma eval_constructor ext ctx state :
    F.eval ext ctx state F.ConstructorCall =
    T.Outcome.Ok (M.constructor ctx state) tt.
  Proof.
    cbn [F.eval].
    rewrite constructor_matches_generated.
    reflexivity.
  Qed.

  Lemma eval_multicall ext ctx state calls :
    F.eval ext ctx state (F.Multicall calls) =
    M.multicall ext ctx state calls.
  Proof.
    cbn [F.eval].
    apply multicall_matches_generated.
  Qed.

  Lemma eval_setRoleSetter ext ctx state newRoleSetter :
    F.eval ext ctx state (F.SetRoleSetter newRoleSetter) =
    M.setRoleSetter ctx state newRoleSetter.
  Proof. cbn [F.eval]; apply setRoleSetter_matches_generated. Qed.

  Lemma eval_setFeeSetter ext ctx state newFeeSetter :
    F.eval ext ctx state (F.SetFeeSetter newFeeSetter) =
    M.setFeeSetter ctx state newFeeSetter.
  Proof. cbn [F.eval]; apply setFeeSetter_matches_generated. Qed.

  Lemma eval_setFeeClaimer ext ctx state newFeeClaimer :
    F.eval ext ctx state (F.SetFeeClaimer newFeeClaimer) =
    M.setFeeClaimer ctx state newFeeClaimer.
  Proof. cbn [F.eval]; apply setFeeClaimer_matches_generated. Qed.

  Lemma eval_setTickSpacingSetter ext ctx state newTickSpacingSetter :
    F.eval ext ctx state (F.SetTickSpacingSetter newTickSpacingSetter) =
    M.setTickSpacingSetter ctx state newTickSpacingSetter.
  Proof. cbn [F.eval]; apply setTickSpacingSetter_matches_generated. Qed.

  Lemma eval_setMarketTickSpacing ext ctx state id newTickSpacing :
    F.eval ext ctx state (F.SetMarketTickSpacing id newTickSpacing) =
    M.setMarketTickSpacing ctx state id newTickSpacing.
  Proof. cbn [F.eval]; apply setMarketTickSpacing_matches_generated. Qed.

  Lemma eval_setMarketSettlementFee ext ctx state id index newSettlementFee :
    F.eval ext ctx state (F.SetMarketSettlementFee id index newSettlementFee) =
    M.setMarketSettlementFee ctx state id index newSettlementFee.
  Proof. cbn [F.eval]; apply setMarketSettlementFee_matches_generated. Qed.

  Lemma eval_setDefaultSettlementFee ext ctx state loanToken index newSettlementFee :
    F.eval ext ctx state (F.SetDefaultSettlementFee loanToken index newSettlementFee) =
    M.setDefaultSettlementFee ctx state loanToken index newSettlementFee.
  Proof. cbn [F.eval]; apply setDefaultSettlementFee_matches_generated. Qed.

  Lemma eval_setMarketContinuousFee ext ctx state id newContinuousFee :
    F.eval ext ctx state (F.SetMarketContinuousFee id newContinuousFee) =
    M.setMarketContinuousFee ctx state id newContinuousFee.
  Proof. cbn [F.eval]; apply setMarketContinuousFee_matches_generated. Qed.

  Lemma eval_setDefaultContinuousFee ext ctx state loanToken newContinuousFee :
    F.eval ext ctx state (F.SetDefaultContinuousFee loanToken newContinuousFee) =
    M.setDefaultContinuousFee ctx state loanToken newContinuousFee.
  Proof. cbn [F.eval]; apply setDefaultContinuousFee_matches_generated. Qed.

  Lemma eval_claimSettlementFee ext ctx state token amount receiver :
    F.eval ext ctx state (F.ClaimSettlementFee token amount receiver) =
    M.claimSettlementFee ext ctx state token amount receiver.
  Proof. cbn [F.eval]; apply claimSettlementFee_matches_generated. Qed.

  Lemma eval_claimContinuousFee ext ctx state market amount receiver :
    F.eval ext ctx state (F.ClaimContinuousFee market amount receiver) =
    M.claimContinuousFee ext ctx state market amount receiver.
  Proof. cbn [F.eval]; apply claimContinuousFee_matches_generated. Qed.

  Lemma eval_take ext ctx state offer ratifierData units taker
      receiverIfTakerIsSeller takerCallback takerCallbackData :
    F.eval ext ctx state
      (F.Take offer ratifierData units taker receiverIfTakerIsSeller
        takerCallback takerCallbackData) =
    M.take ext ctx state offer ratifierData units taker receiverIfTakerIsSeller
      takerCallback takerCallbackData.
  Proof. cbn [F.eval]; apply take_matches_generated. Qed.

  Lemma eval_withdraw ext ctx state market units onBehalf receiver :
    F.eval ext ctx state (F.Withdraw market units onBehalf receiver) =
    M.withdraw ext ctx state market units onBehalf receiver.
  Proof. cbn [F.eval]; apply withdraw_matches_generated. Qed.

  Lemma eval_repay ext ctx state market units onBehalf callback data :
    F.eval ext ctx state (F.Repay market units onBehalf callback data) =
    M.repay ext ctx state market units onBehalf callback data.
  Proof. cbn [F.eval]; apply repay_matches_generated. Qed.

  Lemma eval_supplyCollateral ext ctx state market collateralIndex assets onBehalf :
    F.eval ext ctx state (F.SupplyCollateral market collateralIndex assets onBehalf) =
    M.supplyCollateral ext ctx state market collateralIndex assets onBehalf.
  Proof. cbn [F.eval]; apply supplyCollateral_matches_generated. Qed.

  Lemma eval_withdrawCollateral ext ctx state market collateralIndex assets onBehalf receiver :
    F.eval ext ctx state
      (F.WithdrawCollateral market collateralIndex assets onBehalf receiver) =
    M.withdrawCollateral ext ctx state market collateralIndex assets onBehalf receiver.
  Proof. cbn [F.eval]; apply withdrawCollateral_matches_generated. Qed.

  Lemma eval_liquidate ext ctx state market collateralIndex seizedAssets repaidUnits
      borrower postMaturityMode receiver callback data :
    F.eval ext ctx state
      (F.Liquidate market collateralIndex seizedAssets repaidUnits borrower
        postMaturityMode receiver callback data) =
    M.liquidate ext ctx state market collateralIndex seizedAssets repaidUnits borrower
      postMaturityMode receiver callback data.
  Proof. cbn [F.eval]; apply liquidate_matches_generated. Qed.

  Lemma eval_setConsumed ext ctx state group amount onBehalf :
    F.eval ext ctx state (F.SetConsumed group amount onBehalf) =
    M.setConsumed ctx state group amount onBehalf.
  Proof. cbn [F.eval]; apply setConsumed_matches_generated. Qed.

  Lemma eval_setIsAuthorized ext ctx state authorized newIsAuthorized onBehalf :
    F.eval ext ctx state (F.SetIsAuthorized authorized newIsAuthorized onBehalf) =
    M.setIsAuthorized ctx state authorized newIsAuthorized onBehalf.
  Proof. cbn [F.eval]; apply setIsAuthorized_matches_generated. Qed.

  Lemma eval_flashLoan ext ctx state tokens assets callback data :
    F.eval ext ctx state (F.FlashLoan tokens assets callback data) =
    M.flashLoan ext ctx state tokens assets callback data.
  Proof. cbn [F.eval]; apply flashLoan_matches_generated. Qed.

  Lemma eval_touchMarket ext ctx state market :
    F.eval ext ctx state (F.TouchMarket market) =
    M.touchMarket ext ctx state market.
  Proof. cbn [F.eval]; apply touchMarket_matches_generated. Qed.

  Lemma eval_updatePositionView ext ctx state market id user :
    F.eval ext ctx state (F.UpdatePositionView market id user) =
    T.Outcome.Ok state (M.updatePositionView ctx state market id user).
  Proof.
    cbn [F.eval].
    rewrite updatePositionView_matches_generated.
    reflexivity.
  Qed.

  Lemma eval_updatePosition ext ctx state market user :
    F.eval ext ctx state (F.UpdatePosition market user) =
    M.updatePosition ext ctx state market user.
  Proof. cbn [F.eval]; apply updatePosition_matches_generated. Qed.

  Lemma eval_updatePositionInternal ext ctx state market id user :
    F.eval ext ctx state (F.UpdatePositionInternal market id user) =
    M._updatePosition ctx state market id user.
  Proof. cbn [F.eval]; apply _updatePosition_matches_generated. Qed.

  Lemma eval_hasCredit ext ctx state id user :
    F.eval ext ctx state (F.HasCredit id user) =
    T.Outcome.Ok state (M.hasCredit state id user).
  Proof.
    cbn [F.eval].
    rewrite hasCredit_matches_generated.
    reflexivity.
  Qed.

  Lemma eval_lastLossFactor ext ctx state id user :
    F.eval ext ctx state (F.LastLossFactor id user) =
    T.Outcome.Ok state (M.lastLossFactor state id user).
  Proof. cbn [F.eval]; rewrite lastLossFactor_matches_generated; reflexivity. Qed.

  Lemma eval_collateralBitmap ext ctx state id user :
    F.eval ext ctx state (F.CollateralBitmap id user) =
    T.Outcome.Ok state (M.collateralBitmap state id user).
  Proof. cbn [F.eval]; rewrite collateralBitmap_matches_generated; reflexivity. Qed.

  Lemma eval_collateral ext ctx state id user index :
    F.eval ext ctx state (F.Collateral id user index) =
    T.Outcome.Ok state (M.collateral state id user index).
  Proof. cbn [F.eval]; rewrite collateral_matches_generated; reflexivity. Qed.

  Lemma eval_toId ext ctx state market :
    F.eval ext ctx state (F.ToId market) =
    T.Outcome.Ok state (M.toId ext ctx state market).
  Proof. cbn [F.eval]; rewrite toId_matches_generated; reflexivity. Qed.

  Lemma eval_toMarket ext ctx state id :
    F.eval ext ctx state (F.ToMarket id) =
    M.toMarket ext state id.
  Proof. cbn [F.eval]; apply toMarket_matches_generated. Qed.

  Lemma eval_creditOf ext ctx state id user :
    F.eval ext ctx state (F.CreditOf id user) =
    T.Outcome.Ok state (M.creditOf state id user).
  Proof. cbn [F.eval]; rewrite creditOf_matches_generated; reflexivity. Qed.

  Lemma eval_debtOf ext ctx state id user :
    F.eval ext ctx state (F.DebtOf id user) =
    T.Outcome.Ok state (M.debtOf state id user).
  Proof. cbn [F.eval]; rewrite debtOf_matches_generated; reflexivity. Qed.

  Lemma eval_totalUnits ext ctx state id :
    F.eval ext ctx state (F.TotalUnits id) =
    T.Outcome.Ok state (M.totalUnits state id).
  Proof. cbn [F.eval]; rewrite totalUnits_matches_generated; reflexivity. Qed.

  Lemma eval_lossFactor ext ctx state id :
    F.eval ext ctx state (F.LossFactor id) =
    T.Outcome.Ok state (M.lossFactor state id).
  Proof. cbn [F.eval]; rewrite lossFactor_matches_generated; reflexivity. Qed.

  Lemma eval_tickSpacing ext ctx state id :
    F.eval ext ctx state (F.TickSpacing id) =
    T.Outcome.Ok state (M.tickSpacing state id).
  Proof. cbn [F.eval]; rewrite tickSpacing_matches_generated; reflexivity. Qed.

  Lemma eval_withdrawable ext ctx state id :
    F.eval ext ctx state (F.Withdrawable id) =
    T.Outcome.Ok state (M.withdrawable state id).
  Proof. cbn [F.eval]; rewrite withdrawable_matches_generated; reflexivity. Qed.

  Lemma eval_settlementFeeCbps ext ctx state id :
    F.eval ext ctx state (F.SettlementFeeCbps id) =
    T.Outcome.Ok state (M.settlementFeeCbps state id).
  Proof. cbn [F.eval]; rewrite settlementFeeCbps_matches_generated; reflexivity. Qed.

  Lemma eval_continuousFee ext ctx state id :
    F.eval ext ctx state (F.ContinuousFee id) =
    T.Outcome.Ok state (M.continuousFee state id).
  Proof. cbn [F.eval]; rewrite continuousFee_matches_generated; reflexivity. Qed.

  Lemma eval_continuousFeeCredit ext ctx state id :
    F.eval ext ctx state (F.ContinuousFeeCredit id) =
    T.Outcome.Ok state (M.continuousFeeCredit state id).
  Proof. cbn [F.eval]; rewrite continuousFeeCredit_matches_generated; reflexivity. Qed.

  Lemma eval_pendingFee ext ctx state id user :
    F.eval ext ctx state (F.PendingFee id user) =
    T.Outcome.Ok state (M.pendingFee state id user).
  Proof. cbn [F.eval]; rewrite pendingFee_matches_generated; reflexivity. Qed.

  Lemma eval_lastAccrual ext ctx state id user :
    F.eval ext ctx state (F.LastAccrual id user) =
    T.Outcome.Ok state (M.lastAccrual state id user).
  Proof. cbn [F.eval]; rewrite lastAccrual_matches_generated; reflexivity. Qed.

  Lemma eval_liquidationLocked ext ctx state id user :
    F.eval ext ctx state (F.LiquidationLocked id user) =
    T.Outcome.Ok state (M.liquidationLocked state id user).
  Proof. cbn [F.eval]; rewrite liquidationLocked_matches_generated; reflexivity. Qed.

  Lemma eval_isHealthy ext ctx state market id borrower :
    F.eval ext ctx state (F.IsHealthy market id borrower) =
    T.Outcome.Ok state (M.isHealthy ext state market id borrower).
  Proof. cbn [F.eval]; rewrite isHealthy_matches_generated; reflexivity. Qed.

  Lemma eval_settlementFee ext ctx state id timeToMaturity :
    F.eval ext ctx state (F.SettlementFee id timeToMaturity) =
    M.settlementFee state id timeToMaturity.
  Proof. cbn [F.eval]; apply settlementFee_matches_generated. Qed.
End MidnightFunctionalEquivalence.
