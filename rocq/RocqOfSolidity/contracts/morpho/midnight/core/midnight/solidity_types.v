Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.simulations.RocqOfSolidity.

Module MidnightSolidityTypes.
  Definition uint256 : Set := U256.t.
  Definition uint128 : Set := U256.t.
  Definition uint32 : Set := U256.t.
  Definition uint16 : Set := U256.t.
  Definition uint8 : Set := U256.t.
  Definition bytes32 : Set := U256.t.
  Definition address : Set := Address.t.
  Definition bytes : Set := list U256.t.

  Fixpoint repeat_uint (n : nat) (value : uint256) : list uint256 :=
    match n with
    | O => []
    | S n' => value :: repeat_uint n' value
    end.

  Fixpoint nth_uint (default : uint256) (values : list uint256) (index : nat) : uint256 :=
    match values, index with
    | [], _ => default
    | value :: _, O => value
    | _ :: values', S index' => nth_uint default values' index'
    end.

  Fixpoint update_nth_uint
      (default : uint256) (values : list uint256) (index : nat) (value : uint256) :
      list uint256 :=
    match values, index with
    | [], O => [value]
    | [], S index' => default :: update_nth_uint default [] index' value
    | _ :: values', O => value :: values'
    | head :: values', S index' => head :: update_nth_uint default values' index' value
    end.

  Module CollateralParams.
    Record t : Set := {
      token : address;
      lltv : uint256;
      maxLif : uint256;
      oracle : address;
    }.
  End CollateralParams.

  Module Market.
    Record t : Set := {
      loanToken : address;
      collateralParams : list CollateralParams.t;
      maturity : uint256;
      rcfThreshold : uint256;
      enterGate : address;
      liquidatorGate : address;
    }.
  End Market.

  Module Offer.
    Record t : Set := {
      market : Market.t;
      buy : bool;
      maker : address;
      start : uint256;
      expiry : uint256;
      tick : uint256;
      group : bytes32;
      callback : address;
      callbackData : bytes;
      receiverIfMakerIsSeller : address;
      ratifier : address;
      reduceOnly : bool;
      maxUnits : uint256;
      maxAssets : uint256;
    }.
  End Offer.

  Module MarketState.
    Record t : Set := {
      totalUnits : uint128;
      lossFactor : uint128;
      withdrawable : uint128;
      continuousFeeCredit : uint128;
      settlementFeeCbp0 : uint16;
      settlementFeeCbp1 : uint16;
      settlementFeeCbp2 : uint16;
      settlementFeeCbp3 : uint16;
      settlementFeeCbp4 : uint16;
      settlementFeeCbp5 : uint16;
      settlementFeeCbp6 : uint16;
      continuousFee : uint32;
      tickSpacing : uint8;
    }.

    Definition init : t := {|
      totalUnits := 0;
      lossFactor := 0;
      withdrawable := 0;
      continuousFeeCredit := 0;
      settlementFeeCbp0 := 0;
      settlementFeeCbp1 := 0;
      settlementFeeCbp2 := 0;
      settlementFeeCbp3 := 0;
      settlementFeeCbp4 := 0;
      settlementFeeCbp5 := 0;
      settlementFeeCbp6 := 0;
      continuousFee := 0;
      tickSpacing := 0;
    |}.

    Definition settlementFeeCbpAt (state : t) (index : uint256) : uint16 :=
      if index =? 0 then state.(settlementFeeCbp0)
      else if index =? 1 then state.(settlementFeeCbp1)
      else if index =? 2 then state.(settlementFeeCbp2)
      else if index =? 3 then state.(settlementFeeCbp3)
      else if index =? 4 then state.(settlementFeeCbp4)
      else if index =? 5 then state.(settlementFeeCbp5)
      else if index =? 6 then state.(settlementFeeCbp6)
      else 0.

    Definition setSettlementFeeCbp (state : t) (index value : uint256) : t :=
      if index =? 0 then state <| settlementFeeCbp0 := value |>
      else if index =? 1 then state <| settlementFeeCbp1 := value |>
      else if index =? 2 then state <| settlementFeeCbp2 := value |>
      else if index =? 3 then state <| settlementFeeCbp3 := value |>
      else if index =? 4 then state <| settlementFeeCbp4 := value |>
      else if index =? 5 then state <| settlementFeeCbp5 := value |>
      else if index =? 6 then state <| settlementFeeCbp6 := value |>
      else state.
  End MarketState.

  Module Position.
    Record t : Set := {
      credit : uint128;
      pendingFee : uint128;
      lastLossFactor : uint128;
      lastAccrual : uint128;
      debt : uint128;
      collateralBitmap : uint128;
      collateral : list uint128;
    }.

    Definition init : t := {|
      credit := 0;
      pendingFee := 0;
      lastLossFactor := 0;
      lastAccrual := 0;
      debt := 0;
      collateralBitmap := 0;
      collateral := repeat_uint 128 0;
    |}.

    Definition collateralAt (position : t) (index : uint256) : uint128 :=
      nth_uint 0 position.(collateral) (Z.to_nat index).

    Definition setCollateralAt (position : t) (index value : uint256) : t :=
      position <| collateral := update_nth_uint 0 position.(collateral) (Z.to_nat index) value |>.
  End Position.

  Module Error.
    Inductive t : Set :=
    | AlreadyConsumed
    | BuyerGatedFromIncreasingCredit
    | CannotIncreaseDebtPostMaturity
    | CollateralParamsNotSorted
    | ConsumedAssets
    | ConsumedUnits
    | ContinuousFeeTooHigh
    | FeeNotMultipleOfFeeCbp
    | InconsistentInput
    | WrongBuyCallbackReturnValue
    | WrongSellCallbackReturnValue
    | WrongRepayCallbackReturnValue
    | WrongLiquidateCallbackReturnValue
    | WrongFlashLoanCallbackReturnValue
    | InvalidFeeIndex
    | InvalidMaxLif
    | InvalidTickSpacing
    | LiquidatorGatedFromLiquidating
    | LltvNotAllowed
    | MakerCreditOrDebtIncreased
    | MaturityTooFar
    | MultipleNonZero
    | NoCollateralParams
    | NotBorrower
    | NotLiquidatable
    | MarketLossFactorMaxedOut
    | MarketNotCreated
    | OfferExpired
    | OfferNotStarted
    | OnlyFeeClaimer
    | OnlyFeeSetter
    | OnlyRoleSetter
    | OnlyTickSpacingSetter
    | RatifierFail
    | RatifierUnauthorized
    | RecoveryCloseFactorConditionsViolated
    | SelfTake
    | SellerGatedFromIncreasingDebt
    | SellerIsLiquidatable
    | TakerUnauthorized
    | TickNotAccessible
    | TooManyActivatedCollaterals
    | TooManyCollateralParams
    | SettlementFeeTooHigh
    | Unauthorized
    | UnhealthyBorrower
    | CastOverflow
    | PriceGreaterThanOne
    | TickOutOfRange
    | ExternalCallFailed
    | DelegatecallFailed.
  End Error.

  Module Event.
    Inductive t : Set :=
    | Constructor (roleSetter : address) (initialChainId : uint256)
    | SetRoleSetter (roleSetter : address)
    | SetFeeSetter (feeSetter : address)
    | SetTickSpacingSetter (tickSpacingSetter : address)
    | SetMarketTickSpacing (id : bytes32) (newTickSpacing : uint256)
    | SetMarketSettlementFee (id : bytes32) (index newSettlementFee : uint256)
    | SetDefaultSettlementFee (loanToken : address) (index newSettlementFee : uint256)
    | SetFeeClaimer (feeClaimer : address)
    | SetMarketContinuousFee (id : bytes32) (newContinuousFee : uint256)
    | SetDefaultContinuousFee (loanToken : address) (newContinuousFee : uint256)
    | UpdatePosition
        (id : bytes32) (user : address)
        (creditDecrease pendingFeeDecrease accruedFee : uint256)
    | MarketCreated (market : Market.t) (id : bytes32)
    | Take
        (caller : address) (id : bytes32) (units : uint256)
        (taker maker : address) (offerIsBuy : bool) (group : bytes32)
        (buyerAssets sellerAssets consumed : uint256)
        (buyerPendingFeeIncrease sellerPendingFeeDecrease : uint256)
        (buyerCreditIncrease sellerCreditDecrease : uint256)
        (receiver payer : address)
    | Withdraw
        (caller : address) (id : bytes32) (units : uint256)
        (onBehalf receiver : address) (pendingFeeDecrease : uint256)
    | Repay
        (caller : address) (id : bytes32) (units : uint256)
        (onBehalf payer : address)
    | SupplyCollateral
        (caller : address) (id : bytes32) (collateral : address)
        (assets : uint256) (onBehalf : address)
    | WithdrawCollateral
        (caller : address) (id : bytes32) (collateral : address)
        (assets : uint256) (onBehalf receiver : address)
    | Liquidate
        (caller : address) (id : bytes32) (collateral : address)
        (seizedAssets repaidUnits : uint256) (borrower : address)
        (postMaturityMode : bool) (receiver payer : address)
        (badDebt latestLossFactor latestContinuousFeeCredit : uint256)
    | SetConsumed (caller : address) (group : bytes32) (amount : uint256) (onBehalf : address)
    | FlashLoan (caller : address) (tokens : list address) (assets : list uint256) (callback : address)
    | SetIsAuthorized
        (caller authorized : address) (newIsAuthorized : bool) (onBehalf : address)
    | ClaimContinuousFee (caller : address) (id : bytes32) (amount : uint256) (receiver : address)
    | ClaimSettlementFee (caller token : address) (amount : uint256) (receiver : address).
  End Event.

  Module Context.
    Record t : Set := {
      sender : address;
      timestamp : uint256;
      chainid : uint256;
      self : address;
    }.
  End Context.

  Module External.
    Record t : Set := {
      price : address -> uint256;
      isRatified : Offer.t -> bytes -> bytes32;
      canIncreaseCredit : address -> address -> bool;
      canIncreaseDebt : address -> address -> bool;
      canLiquidate : address -> address -> bool;
      onBuy :
        address -> bytes32 -> Market.t -> uint256 -> uint256 -> uint256 ->
        address -> bytes -> bytes32;
      onSell :
        address -> bytes32 -> Market.t -> uint256 -> uint256 -> uint256 ->
        address -> address -> bytes -> bytes32;
      onRepay : address -> bytes32 -> Market.t -> uint256 -> address -> bytes -> bytes32;
      onLiquidate :
        address -> address -> bytes32 -> Market.t -> uint256 -> uint256 -> uint256 ->
        address -> address -> bytes -> uint256 -> bytes32;
      onFlashLoan : address -> address -> list address -> list uint256 -> bytes -> bytes32;
      safeTransfer : address -> address -> uint256 -> bool;
      safeTransferFrom : address -> address -> address -> uint256 -> bool;
      delegatecall : address -> bytes -> bool;
      toId : Market.t -> uint256 -> address -> bytes32;
      toMarket : bytes32 -> option Market.t;
      storeInCode : Market.t -> uint256 -> address;
    }.
  End External.

  Module State.
    Record t : Set := {
      position : Dict.t (bytes32 * address) Position.t;
      marketState : Dict.t bytes32 MarketState.t;
      consumed : Dict.t (address * bytes32) uint256;
      isAuthorized : Dict.t (address * address) bool;
      defaultSettlementFeeCbp : Dict.t (address * uint256) uint16;
      defaultContinuousFee : Dict.t address uint32;
      claimableSettlementFee : Dict.t address uint256;
      roleSetter : address;
      feeSetter : address;
      feeClaimer : address;
      tickSpacingSetter : address;
      initialChainId : uint256;
      liquidationLocked : Dict.t (bytes32 * address) bool;
      events : list Event.t;
    }.

    Definition init : t := {|
      position := [];
      marketState := [];
      consumed := [];
      isAuthorized := [];
      defaultSettlementFeeCbp := [];
      defaultContinuousFee := [];
      claimableSettlementFee := [];
      roleSetter := 0;
      feeSetter := 0;
      feeClaimer := 0;
      tickSpacingSetter := 0;
      initialChainId := 0;
      liquidationLocked := [];
      events := [];
    |}.

    Definition emit (event : Event.t) (state : t) : t :=
      state <| events := event :: state.(events) |>.

    Definition getPosition (state : t) (id : bytes32) (user : address) : Position.t :=
      match Dict.get state.(position) (id, user) with
      | Some position => position
      | None => Position.init
      end.

    Definition setPosition (state : t) (id : bytes32) (user : address) (value : Position.t) : t :=
      state <| position := Dict.declare_or_assign state.(position) (id, user) value |>.

    Definition getMarketState (state : t) (id : bytes32) : MarketState.t :=
      match Dict.get state.(marketState) id with
      | Some marketState => marketState
      | None => MarketState.init
      end.

    Definition setMarketState (state : t) (id : bytes32) (value : MarketState.t) : t :=
      state <| marketState := Dict.declare_or_assign state.(marketState) id value |>.

    Definition consumedOf (state : t) (user : address) (group : bytes32) : uint256 :=
      match Dict.get state.(consumed) (user, group) with
      | Some amount => amount
      | None => 0
      end.

    Definition setConsumed (state : t) (user : address) (group : bytes32) (amount : uint256) : t :=
      state <| consumed := Dict.declare_or_assign state.(consumed) (user, group) amount |>.

    Definition isAuthorizedOf (state : t) (authorizer authorized : address) : bool :=
      match Dict.get state.(isAuthorized) (authorizer, authorized) with
      | Some value => value
      | None => false
      end.

    Definition setIsAuthorized
        (state : t) (authorizer authorized : address) (value : bool) : t :=
      state <| isAuthorized := Dict.declare_or_assign state.(isAuthorized) (authorizer, authorized) value |>.

    Definition defaultSettlementFeeCbpOf
        (state : t) (loanToken : address) (index : uint256) : uint16 :=
      match Dict.get state.(defaultSettlementFeeCbp) (loanToken, index) with
      | Some value => value
      | None => 0
      end.

    Definition setDefaultSettlementFeeCbp
        (state : t) (loanToken : address) (index value : uint256) : t :=
      state <| defaultSettlementFeeCbp :=
        Dict.declare_or_assign state.(defaultSettlementFeeCbp) (loanToken, index) value
      |>.

    Definition defaultContinuousFeeOf (state : t) (loanToken : address) : uint32 :=
      match Dict.get state.(defaultContinuousFee) loanToken with
      | Some value => value
      | None => 0
      end.

    Definition setDefaultContinuousFee (state : t) (loanToken : address) (value : uint256) : t :=
      state <| defaultContinuousFee := Dict.declare_or_assign state.(defaultContinuousFee) loanToken value |>.

    Definition claimableSettlementFeeOf (state : t) (token : address) : uint256 :=
      match Dict.get state.(claimableSettlementFee) token with
      | Some value => value
      | None => 0
      end.

    Definition setClaimableSettlementFee (state : t) (token : address) (value : uint256) : t :=
      state <| claimableSettlementFee :=
        Dict.declare_or_assign state.(claimableSettlementFee) token value
      |>.

    Definition liquidationLockedOf (state : t) (id : bytes32) (user : address) : bool :=
      match Dict.get state.(liquidationLocked) (id, user) with
      | Some value => value
      | None => false
      end.

    Definition setLiquidationLocked
        (state : t) (id : bytes32) (user : address) (value : bool) : t :=
      state <| liquidationLocked :=
        Dict.declare_or_assign state.(liquidationLocked) (id, user) value
      |>.
  End State.

  Module Outcome.
    Inductive t (A : Set) : Set :=
    | Ok (state : State.t) (value : A)
    | Revert (error : Error.t).

    Arguments Ok {_}.
    Arguments Revert {_}.
  End Outcome.
End MidnightSolidityTypes.
