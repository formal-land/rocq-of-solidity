
/// @use-src 0:"deps/midnight/src/Midnight.sol", 4:"deps/midnight/src/interfaces/IMidnight.sol"
object "Midnight_3973" {
    code {
        /// @src 0:12822:51370  "contract Midnight is IMidnight {..."
        mstore(64, memoryguard(160))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Midnight_3973()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("Midnight_3973_deployed"), datasize("Midnight_3973_deployed"))

        setimmutable(_1, "39", mload(128))

        return(_1, datasize("Midnight_3973_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_20_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function identity(value) -> ret {
            ret := value
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
        }

        function convert_t_uint160_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function prepare_store_t_address(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0_t_address_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function read_from_memoryt_uint256(ptr) -> returnValue {

            let value := cleanup_t_uint256(mload(ptr))

            returnValue :=

            value

        }

        function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
            mstore(pos, cleanup_t_uint256(value))
        }

        function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
            tail := add(headStart, 32)

            abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        }

        /// @ast-id 109
        /// @src 0:13697:13859  "constructor() {..."
        function constructor_Midnight_3973() {

            /// @src 0:13697:13859  "constructor() {..."
            constructor_IMidnight_4887()

            /// @src 0:13734:13744  "msg.sender"
            let expr_92 := caller()
            /// @src 0:13721:13744  "roleSetter = msg.sender"
            update_storage_value_offset_0_t_address_to_t_address(0x07, expr_92)
            let expr_93 := expr_92
            /// @src 0:13773:13786  "block.chainid"
            let expr_97 := chainid()
            /// @src 0:13754:13786  "INITIAL_CHAIN_ID = block.chainid"
            let _2 := expr_97
            mstore(128, _2)
            let expr_98 := expr_97
            /// @src 0:13801:13810  "EventsLib"
            let expr_100_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
            /// @src 0:13823:13833  "msg.sender"
            let expr_104 := caller()
            /// @src 0:13835:13851  "INITIAL_CHAIN_ID"
            let _3 := read_from_memoryt_uint256(128)
            let expr_105 := _3
            /// @src 0:13801:13852  "EventsLib.Constructor(msg.sender, INITIAL_CHAIN_ID)"
            let _4 := 0xadd70f1d05a5c8d3b8e617deff4be932032cf91813eecc19bae342315431e8de
            let _5 := convert_t_address_to_t_address(expr_104)
            {
                let _6 := allocate_unbounded()
                let _7 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_6 , expr_105)
                log2(_6, sub(_7, _6) , _4, _5)
            }
        }
        /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

        /// @src 4:1477:8754  "interface IMidnight {..."
        function constructor_IMidnight_4887() {

            /// @src 4:1477:8754  "interface IMidnight {..."

        }
        /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

    }
    /// @use-src 0:"deps/midnight/src/Midnight.sol", 7:"deps/midnight/src/libraries/ConstantsLib.sol", 9:"deps/midnight/src/libraries/IdLib.sol", 10:"deps/midnight/src/libraries/SafeTransferLib.sol", 11:"deps/midnight/src/libraries/TickLib.sol", 12:"deps/midnight/src/libraries/UtilsLib.sol"
    object "Midnight_3973_deployed" {
        code {
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x03d91692
                {
                    // updatePosition((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),address)

                    external_fun_updatePosition_3274()
                }

                case 0x06b4290c
                {
                    // isHealthy((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),bytes32,address)

                    external_fun_isHealthy_3821()
                }

                case 0x1b14c072
                {
                    // liquidationLocked(bytes32,address)

                    external_fun_liquidationLocked_3724()
                }

                case 0x21559e6b
                {
                    // setDefaultContinuousFee(address,uint256)

                    external_fun_setDefaultContinuousFee_629()
                }

                case 0x265d32c1
                {
                    // defaultContinuousFee(address)

                    external_fun_defaultContinuousFee_74()
                }

                case 0x2a7c7c09
                {
                    // settlementFeeCbps(bytes32)

                    external_fun_settlementFeeCbps_3646()
                }

                case 0x2abdc15e
                {
                    // claimSettlementFee(address,uint256,address)

                    external_fun_claimSettlementFee_672()
                }

                case 0x2bfb98ac
                {
                    // touchMarket((address,(address,uint256,uint256,address)[],uint256,uint256,address,address))

                    external_fun_touchMarket_3092()
                }

                case 0x355986fa
                {
                    // toId((address,(address,uint256,uint256,address)[],uint256,uint256,address,address))

                    external_fun_toId_3477()
                }

                case 0x3f6481ad
                {
                    // roleSetter()

                    external_fun_roleSetter_80()
                }

                case 0x462e59b4
                {
                    // setMarketContinuousFee(bytes32,uint256)

                    external_fun_setMarketContinuousFee_588()
                }

                case 0x4ae30a91
                {
                    // repay((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),uint256,address,address,bytes)

                    external_fun_repay_1785()
                }

                case 0x4bfde00e
                {
                    // updatePositionView((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),bytes32,address)

                    external_fun_updatePositionView_3235()
                }

                case 0x4f80fe10
                {
                    // flashLoan(address[],uint256[],address,bytes)

                    external_fun_flashLoan_2850()
                }

                case 0x525e8201
                {
                    // claimContinuousFee((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),uint256,address)

                    external_fun_claimContinuousFee_760()
                }

                case 0x5308a18f
                {
                    // claimableSettlementFee(address)

                    external_fun_claimableSettlementFee_78()
                }

                case 0x53a6332b
                {
                    // totalUnits(bytes32)

                    external_fun_totalUnits_3566()
                }

                case 0x54f33522
                {
                    // INITIAL_CHAIN_ID()

                    external_fun_INITIAL_CHAIN_ID_39()
                }

                case 0x564b55d9
                {
                    // withdrawCollateral((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),uint256,uint256,address,address)

                    external_fun_withdrawCollateral_2040()
                }

                case 0x570b935f
                {
                    // lossFactor(bytes32)

                    external_fun_lossFactor_3579()
                }

                case 0x5f59ebd8
                {
                    // setDefaultSettlementFee(address,uint256,uint256)

                    external_fun_setDefaultSettlementFee_531()
                }

                case 0x65e4ad9e
                {
                    // isAuthorized(address,address)

                    external_fun_isAuthorized_64()
                }

                case 0x7cf43d8c
                {
                    // withdrawable(bytes32)

                    external_fun_withdrawable_3605()
                }

                case 0x81a01d33
                {
                    // take(((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),bool,address,uint256,uint256,uint256,bytes32,address,bytes,address,address,bool,uint256,uint256),bytes,uint256,address,address,address,bytes)

                    external_fun_take_1531()
                }

                case 0x81cbd3ea
                {
                    // feeClaimer()

                    external_fun_feeClaimer_84()
                }

                case 0x87cf3ef4
                {
                    // feeSetter()

                    external_fun_feeSetter_82()
                }

                case 0x8c366a0a
                {
                    // lastLossFactor(bytes32,address)

                    external_fun_lastLossFactor_3420()
                }

                case 0x93c52062
                {
                    // position(bytes32,address)

                    external_fun_position_47()
                }

                case 0x98285e82
                {
                    // tickSpacingSetter()

                    external_fun_tickSpacingSetter_86()
                }

                case 0x9e3ff40a
                {
                    // setMarketSettlementFee(bytes32,uint256,uint256)

                    external_fun_setMarketSettlementFee_463()
                }

                case 0xa15bdf2f
                {
                    // liquidate((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),uint256,uint256,uint256,address,bool,address,address,bytes)

                    external_fun_liquidate_2643()
                }

                case 0xa9bef809
                {
                    // settlementFee(bytes32,uint256)

                    external_fun_settlementFee_3972()
                }

                case 0xac9650d8
                {
                    // multicall(bytes[])

                    external_fun_multicall_149()
                }

                case 0xb19805af
                {
                    // setFeeSetter(address)

                    external_fun_setFeeSetter_200()
                }

                case 0xb502e1f9
                {
                    // collateralBitmap(bytes32,address)

                    external_fun_collateralBitmap_3437()
                }

                case 0xb6a37a3b
                {
                    // creditOf(bytes32,address)

                    external_fun_creditOf_3536()
                }

                case 0xb6b271c7
                {
                    // withdraw((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),uint256,address,address)

                    external_fun_withdraw_1664()
                }

                case 0xb78212ab
                {
                    // setIsAuthorized(address,bool,address)

                    external_fun_setIsAuthorized_2745()
                }

                case 0xc04e7898
                {
                    // continuousFee(bytes32)

                    external_fun_continuousFee_3660()
                }

                case 0xc18f47da
                {
                    // defaultSettlementFeeCbp(address,uint256)

                    external_fun_defaultSettlementFeeCbp_70()
                }

                case 0xc2adf607
                {
                    // setRoleSetter(address)

                    external_fun_setRoleSetter_175()
                }

                case 0xc3accd48
                {
                    // setFeeClaimer(address)

                    external_fun_setFeeClaimer_225()
                }

                case 0xc60c6271
                {
                    // pendingFee(bytes32,address)

                    external_fun_pendingFee_3690()
                }

                case 0xd6359bf4
                {
                    // setConsumed(bytes32,uint256,address)

                    external_fun_setConsumed_2700()
                }

                case 0xd881a443
                {
                    // debtOf(bytes32,address)

                    external_fun_debtOf_3553()
                }

                case 0xdb94c029
                {
                    // tickSpacing(bytes32)

                    external_fun_tickSpacing_3592()
                }

                case 0xe20e9a64
                {
                    // lastAccrual(bytes32,address)

                    external_fun_lastAccrual_3707()
                }

                case 0xe29dfba8
                {
                    // consumed(address,bytes32)

                    external_fun_consumed_58()
                }

                case 0xead29b0b
                {
                    // marketState(bytes32)

                    external_fun_marketState_52()
                }

                case 0xecdcc72d
                {
                    // collateral(bytes32,address,uint256)

                    external_fun_collateral_3458()
                }

                case 0xf37e9ba4
                {
                    // setMarketTickSpacing(bytes32,uint256)

                    external_fun_setMarketTickSpacing_313()
                }

                case 0xf3ad575e
                {
                    // setTickSpacingSetter(address)

                    external_fun_setTickSpacingSetter_250()
                }

                case 0xfc20106c
                {
                    // toMarket(bytes32)

                    external_fun_toMarket_3519()
                }

                case 0xfd1b2036
                {
                    // supplyCollateral((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),uint256,uint256,address)

                    external_fun_supplyCollateral_1916()
                }

                case 0xfd2ff327
                {
                    // continuousFeeCredit(bytes32)

                    external_fun_continuousFeeCredit_3673()
                }

                default {}
            }

            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
                revert(0, 0)
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() {
                revert(0, 0)
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function finalize_allocation(memPtr, size) {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }

            function allocate_memory(size) -> memPtr {
                memPtr := allocate_unbounded()
                finalize_allocation(memPtr, size)
            }

            function revert_error_5e8f644817bc4960744f35c15999b6eff64ae702f94b1c46297cfd4e1aec2421() {
                revert(0, 0)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() {
                revert(0, 0)
            }

            function array_allocation_size_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() {
                revert(0, 0)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            // struct CollateralParams
            function abi_decode_t_struct$_CollateralParams_$4180_memory_ptr(headStart, end) -> value {
                if slt(sub(end, headStart), 0x80) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0x80)

                {
                    // token

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_address(add(headStart, offset), end))

                }

                {
                    // lltv

                    let offset := 32

                    mstore(add(value, 0x20), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // maxLif

                    let offset := 64

                    mstore(add(value, 0x40), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // oracle

                    let offset := 96

                    mstore(add(value, 0x60), abi_decode_t_address(add(headStart, offset), end))

                }

            }

            // struct CollateralParams[]
            function abi_decode_available_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(offset, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(length))
                let dst := array

                mstore(array, length)
                dst := add(array, 0x20)

                let srcEnd := add(offset, mul(length, 0x80))
                if gt(srcEnd, end) {
                    revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef()
                }
                for { let src := offset } lt(src, srcEnd) { src := add(src, 0x80) }
                {

                    let elementPos := src

                    mstore(dst, abi_decode_t_struct$_CollateralParams_$4180_memory_ptr(elementPos, end))
                    dst := add(dst, 0x20)
                }
            }

            // struct CollateralParams[]
            function abi_decode_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(add(offset, 0x20), length, end)
            }

            // struct Market
            function abi_decode_t_struct$_Market_$4171_memory_ptr(headStart, end) -> value {
                if slt(sub(end, headStart), 0xc0) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0xc0)

                {
                    // loanToken

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_address(add(headStart, offset), end))

                }

                {
                    // collateralParams

                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert_error_5e8f644817bc4960744f35c15999b6eff64ae702f94b1c46297cfd4e1aec2421() }

                    mstore(add(value, 0x20), abi_decode_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(add(headStart, offset), end))

                }

                {
                    // maturity

                    let offset := 64

                    mstore(add(value, 0x40), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // rcfThreshold

                    let offset := 96

                    mstore(add(value, 0x60), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // enterGate

                    let offset := 128

                    mstore(add(value, 0x80), abi_decode_t_address(add(headStart, offset), end))

                }

                {
                    // liquidatorGate

                    let offset := 160

                    mstore(add(value, 0xa0), abi_decode_t_address(add(headStart, offset), end))

                }

            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function cleanup_t_uint128(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffff)
            }

            function abi_encode_t_uint128_to_t_uint128_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint128(value))
            }

            function abi_encode_tuple_t_uint128_t_uint128_t_uint128__to_t_uint128_t_uint128_t_uint128__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_uint128_to_t_uint128_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint128_to_t_uint128_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint128_to_t_uint128_fromStack(value2,  add(headStart, 64))

            }

            function external_fun_updatePosition_3274() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_address(4, calldatasize())
                let ret_0, ret_1, ret_2 :=  fun_updatePosition_3274(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128_t_uint128_t_uint128__to_t_uint128_t_uint128_t_uint128__fromStack(memPos , ret_0, ret_1, ret_2)
                return(memPos, sub(memEnd, memPos))

            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function validator_revert_t_bytes32(value) {
                if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
            }

            function abi_decode_t_bytes32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bytes32(value)
            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_bytes32t_address(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_isHealthy_3821() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_bytes32t_address(4, calldatasize())
                let ret_0 :=  fun_isHealthy_3821(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_bytes32t_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_liquidationLocked_3724() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_address(4, calldatasize())
                let ret_0 :=  fun_liquidationLocked_3724(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_setDefaultContinuousFee_629() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                fun_setDefaultContinuousFee_629(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint32_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function cleanup_from_storage_t_uint32(value) -> cleaned {
                cleaned := and(value, 0xffffffff)
            }

            function extract_from_storage_value_dynamict_uint32(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint32(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_uint32(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint32(sload(slot), offset)

            }

            /// @ast-id 74
            /// @src 0:13402:13466  "mapping(address loanToken => uint32) public defaultContinuousFee"
            function getter_fun_defaultContinuousFee_74(key_0) -> ret {

                let slot := 5
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint32_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint32(slot, offset)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function cleanup_t_uint32(value) -> cleaned {
                cleaned := and(value, 0xffffffff)
            }

            function abi_encode_t_uint32_to_t_uint32_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint32(value))
            }

            function abi_encode_tuple_t_uint32__to_t_uint32__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint32_to_t_uint32_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_defaultContinuousFee_74() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                let ret_0 :=  getter_fun_defaultContinuousFee_74(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint32__to_t_uint32__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_bytes32(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

            }

            function array_length_t_array$_t_uint16_$7_memory_ptr(value) -> length {

                length := 0x07

            }

            function array_storeLengthForEncoding_t_array$_t_uint16_$7_memory_ptr_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function array_dataslot_t_array$_t_uint16_$7_memory_ptr(ptr) -> data {
                data := ptr

            }

            function cleanup_t_uint16(value) -> cleaned {
                cleaned := and(value, 0xffff)
            }

            function abi_encode_t_uint16_to_t_uint16(value, pos) {
                mstore(pos, cleanup_t_uint16(value))
            }

            function abi_encodeUpdatedPos_t_uint16_to_t_uint16(value0, pos) -> updatedPos {
                abi_encode_t_uint16_to_t_uint16(value0, pos)
                updatedPos := add(pos, 0x20)
            }

            function array_nextElement_t_array$_t_uint16_$7_memory_ptr(ptr) -> next {
                next := add(ptr, 0x20)
            }

            // uint16[7] -> uint16[7]
            function abi_encode_t_array$_t_uint16_$7_memory_ptr_to_t_array$_t_uint16_$7_memory_ptr_fromStack(value, pos)  {
                let length := array_length_t_array$_t_uint16_$7_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_array$_t_uint16_$7_memory_ptr_fromStack(pos, length)
                let baseRef := array_dataslot_t_array$_t_uint16_$7_memory_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := mload(srcPtr)
                    pos := abi_encodeUpdatedPos_t_uint16_to_t_uint16(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_uint16_$7_memory_ptr(srcPtr)
                }

            }

            function abi_encode_tuple_t_array$_t_uint16_$7_memory_ptr__to_t_array$_t_uint16_$7_memory_ptr__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 224)

                abi_encode_t_array$_t_uint16_$7_memory_ptr_to_t_array$_t_uint16_$7_memory_ptr_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_settlementFeeCbps_3646() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                let ret_0 :=  fun_settlementFeeCbps_3646(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_array$_t_uint16_$7_memory_ptr__to_t_array$_t_uint16_$7_memory_ptr__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_addresst_uint256t_address(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_claimSettlementFee_672() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_uint256t_address(4, calldatasize())
                fun_claimSettlementFee_672(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptr(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_touchMarket_3092() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptr(4, calldatasize())
                let ret_0 :=  fun_touchMarket_3092(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_toId_3477() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptr(4, calldatasize())
                let ret_0 :=  fun_toId_3477(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            /// @ast-id 80
            /// @src 0:13541:13566  "address public roleSetter"
            function getter_fun_roleSetter_80() -> ret {

                let slot := 7
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_roleSetter_80() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_roleSetter_80()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_bytes32t_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_setMarketContinuousFee_588() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_uint256(4, calldatasize())
                fun_setMarketContinuousFee_588(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_15abf5612cd996bc235ba1e55a4a30ac60e6bb601ff7ba4ad3f179b6be8d0490() {
                revert(0, 0)
            }

            // bytes
            function abi_decode_t_bytes_calldata_ptr(offset, end) -> arrayPos, length {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                length := calldataload(offset)
                if gt(length, 0xffffffffffffffff) { revert_error_15abf5612cd996bc235ba1e55a4a30ac60e6bb601ff7ba4ad3f179b6be8d0490() }
                arrayPos := add(offset, 0x20)
                if gt(add(arrayPos, mul(length, 0x01)), end) { revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() }
            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_addresst_addresst_bytes_calldata_ptr(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5 {
                if slt(sub(dataEnd, headStart), 160) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 96

                    value3 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 128))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value4, value5 := abi_decode_t_bytes_calldata_ptr(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_repay_1785() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4, param_5 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_addresst_addresst_bytes_calldata_ptr(4, calldatasize())
                fun_repay_1785(param_0, param_1, param_2, param_3, param_4, param_5)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_updatePositionView_3235() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_bytes32t_address(4, calldatasize())
                let ret_0, ret_1, ret_2 :=  fun_updatePositionView_3235(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128_t_uint128_t_uint128__to_t_uint128_t_uint128_t_uint128__fromStack(memPos , ret_0, ret_1, ret_2)
                return(memPos, sub(memEnd, memPos))

            }

            // address[]
            function abi_decode_t_array$_t_address_$dyn_calldata_ptr(offset, end) -> arrayPos, length {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                length := calldataload(offset)
                if gt(length, 0xffffffffffffffff) { revert_error_15abf5612cd996bc235ba1e55a4a30ac60e6bb601ff7ba4ad3f179b6be8d0490() }
                arrayPos := add(offset, 0x20)
                if gt(add(arrayPos, mul(length, 0x20)), end) { revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() }
            }

            // uint256[]
            function abi_decode_t_array$_t_uint256_$dyn_calldata_ptr(offset, end) -> arrayPos, length {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                length := calldataload(offset)
                if gt(length, 0xffffffffffffffff) { revert_error_15abf5612cd996bc235ba1e55a4a30ac60e6bb601ff7ba4ad3f179b6be8d0490() }
                arrayPos := add(offset, 0x20)
                if gt(add(arrayPos, mul(length, 0x20)), end) { revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() }
            }

            function abi_decode_tuple_t_array$_t_address_$dyn_calldata_ptrt_array$_t_uint256_$dyn_calldata_ptrt_addresst_bytes_calldata_ptr(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5, value6 {
                if slt(sub(dataEnd, headStart), 128) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0, value1 := abi_decode_t_array$_t_address_$dyn_calldata_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value2, value3 := abi_decode_t_array$_t_uint256_$dyn_calldata_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value4 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 96))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value5, value6 := abi_decode_t_bytes_calldata_ptr(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_flashLoan_2850() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4, param_5, param_6 :=  abi_decode_tuple_t_array$_t_address_$dyn_calldata_ptrt_array$_t_uint256_$dyn_calldata_ptrt_addresst_bytes_calldata_ptr(4, calldatasize())
                fun_flashLoan_2850(param_0, param_1, param_2, param_3, param_4, param_5, param_6)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_address(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_claimContinuousFee_760() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_address(4, calldatasize())
                fun_claimContinuousFee_760(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            /// @ast-id 78
            /// @src 0:13472:13535  "mapping(address token => uint256) public claimableSettlementFee"
            function getter_fun_claimableSettlementFee_78(key_0) -> ret {

                let slot := 6
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_claimableSettlementFee_78() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                let ret_0 :=  getter_fun_claimableSettlementFee_78(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_encode_tuple_t_uint128__to_t_uint128__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint128_to_t_uint128_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_totalUnits_3566() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                let ret_0 :=  fun_totalUnits_3566(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            /// @ast-id 39
            /// @src 0:12948:12989  "uint256 public immutable INITIAL_CHAIN_ID"
            function getter_fun_INITIAL_CHAIN_ID_39() -> rval {

                rval := loadimmutable("39")

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function external_fun_INITIAL_CHAIN_ID_39() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_INITIAL_CHAIN_ID_39()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_uint256t_addresst_address(headStart, dataEnd) -> value0, value1, value2, value3, value4 {
                if slt(sub(dataEnd, headStart), 160) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 96

                    value3 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 128

                    value4 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_withdrawCollateral_2040() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_uint256t_addresst_address(4, calldatasize())
                fun_withdrawCollateral_2040(param_0, param_1, param_2, param_3, param_4)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_lossFactor_3579() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                let ret_0 :=  fun_lossFactor_3579(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_addresst_uint256t_uint256(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_setDefaultSettlementFee_531() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_uint256t_uint256(4, calldatasize())
                fun_setDefaultSettlementFee_531(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_addresst_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

            }

            /// @ast-id 64
            /// @src 0:13234:13320  "mapping(address authorizer => mapping(address authorized => bool)) public isAuthorized"
            function getter_fun_isAuthorized_64(key_0, key_1) -> ret {

                let slot := 3
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(slot, key_0)

                slot := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(slot, key_1)

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function external_fun_isAuthorized_64() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_address(4, calldatasize())
                let ret_0 :=  getter_fun_isAuthorized_64(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_withdrawable_3605() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                let ret_0 :=  fun_withdrawable_3605(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function abi_decode_t_bool(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bool(value)
            }

            function revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() {
                revert(0, 0)
            }

            function array_allocation_size_t_bytes_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := round_up_to_mul_of_32(length)

                // add length slot
                size := add(size, 0x20)

            }

            function copy_calldata_to_memory_with_cleanup(src, dst, length) {

                calldatacopy(dst, src, length)
                mstore(add(dst, length), 0)

            }

            function abi_decode_available_length_t_bytes_memory_ptr(src, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_bytes_memory_ptr(length))
                mstore(array, length)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() }
                copy_calldata_to_memory_with_cleanup(src, dst, length)
            }

            // bytes
            function abi_decode_t_bytes_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_bytes_memory_ptr(add(offset, 0x20), length, end)
            }

            // struct Offer
            function abi_decode_t_struct$_Offer_$4210_memory_ptr(headStart, end) -> value {
                if slt(sub(end, headStart), 0x01c0) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0x01c0)

                {
                    // market

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_5e8f644817bc4960744f35c15999b6eff64ae702f94b1c46297cfd4e1aec2421() }

                    mstore(add(value, 0x00), abi_decode_t_struct$_Market_$4171_memory_ptr(add(headStart, offset), end))

                }

                {
                    // buy

                    let offset := 32

                    mstore(add(value, 0x20), abi_decode_t_bool(add(headStart, offset), end))

                }

                {
                    // maker

                    let offset := 64

                    mstore(add(value, 0x40), abi_decode_t_address(add(headStart, offset), end))

                }

                {
                    // start

                    let offset := 96

                    mstore(add(value, 0x60), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // expiry

                    let offset := 128

                    mstore(add(value, 0x80), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // tick

                    let offset := 160

                    mstore(add(value, 0xa0), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // group

                    let offset := 192

                    mstore(add(value, 0xc0), abi_decode_t_bytes32(add(headStart, offset), end))

                }

                {
                    // callback

                    let offset := 224

                    mstore(add(value, 0xe0), abi_decode_t_address(add(headStart, offset), end))

                }

                {
                    // callbackData

                    let offset := calldataload(add(headStart, 256))
                    if gt(offset, 0xffffffffffffffff) { revert_error_5e8f644817bc4960744f35c15999b6eff64ae702f94b1c46297cfd4e1aec2421() }

                    mstore(add(value, 0x0100), abi_decode_t_bytes_memory_ptr(add(headStart, offset), end))

                }

                {
                    // receiverIfMakerIsSeller

                    let offset := 288

                    mstore(add(value, 0x0120), abi_decode_t_address(add(headStart, offset), end))

                }

                {
                    // ratifier

                    let offset := 320

                    mstore(add(value, 0x0140), abi_decode_t_address(add(headStart, offset), end))

                }

                {
                    // reduceOnly

                    let offset := 352

                    mstore(add(value, 0x0160), abi_decode_t_bool(add(headStart, offset), end))

                }

                {
                    // maxUnits

                    let offset := 384

                    mstore(add(value, 0x0180), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // maxAssets

                    let offset := 416

                    mstore(add(value, 0x01a0), abi_decode_t_uint256(add(headStart, offset), end))

                }

            }

            function abi_decode_tuple_t_struct$_Offer_$4210_memory_ptrt_bytes_memory_ptrt_uint256t_addresst_addresst_addresst_bytes_memory_ptr(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5, value6 {
                if slt(sub(dataEnd, headStart), 224) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Offer_$4210_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value1 := abi_decode_t_bytes_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 96

                    value3 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 128

                    value4 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 160

                    value5 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 192))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value6 := abi_decode_t_bytes_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function external_fun_take_1531() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4, param_5, param_6 :=  abi_decode_tuple_t_struct$_Offer_$4210_memory_ptrt_bytes_memory_ptrt_uint256t_addresst_addresst_addresst_bytes_memory_ptr(4, calldatasize())
                let ret_0, ret_1 :=  fun_take_1531(param_0, param_1, param_2, param_3, param_4, param_5, param_6)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(memPos , ret_0, ret_1)
                return(memPos, sub(memEnd, memPos))

            }

            /// @ast-id 84
            /// @src 0:13602:13627  "address public feeClaimer"
            function getter_fun_feeClaimer_84() -> ret {

                let slot := 9
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function external_fun_feeClaimer_84() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_feeClaimer_84()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            /// @ast-id 82
            /// @src 0:13572:13596  "address public feeSetter"
            function getter_fun_feeSetter_82() -> ret {

                let slot := 8
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function external_fun_feeSetter_82() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_feeSetter_82()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_lastLossFactor_3420() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_address(4, calldatasize())
                let ret_0 :=  fun_lastLossFactor_3420(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function convert_t_bytes32_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(slot , key) -> dataSlot {
                mstore(0, convert_t_bytes32_to_t_bytes32(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function cleanup_from_storage_t_uint128(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_offset_0_t_uint128(slot_value) -> value {
                value := cleanup_from_storage_t_uint128(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint128(slot) -> value {
                value := extract_from_storage_value_offset_0_t_uint128(sload(slot))

            }

            function shift_right_128_unsigned(value) -> newValue {
                newValue :=

                shr(128, value)

            }

            function extract_from_storage_value_offset_16_t_uint128(slot_value) -> value {
                value := cleanup_from_storage_t_uint128(shift_right_128_unsigned(slot_value))
            }

            function read_from_storage_split_offset_16_t_uint128(slot) -> value {
                value := extract_from_storage_value_offset_16_t_uint128(sload(slot))

            }

            /// @ast-id 47
            /// @src 0:13017:13089  "mapping(bytes32 id => mapping(address user => Position)) public position"
            function getter_fun_position_47(key_0, key_1) -> ret_0, ret_1, ret_2, ret_3, ret_4, ret_5 {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(slot, key_0)

                slot := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(slot, key_1)

                ret_0 := read_from_storage_split_offset_0_t_uint128(add(slot, 0))

                ret_1 := read_from_storage_split_offset_16_t_uint128(add(slot, 0))

                ret_2 := read_from_storage_split_offset_0_t_uint128(add(slot, 1))

                ret_3 := read_from_storage_split_offset_16_t_uint128(add(slot, 1))

                ret_4 := read_from_storage_split_offset_0_t_uint128(add(slot, 2))

                ret_5 := read_from_storage_split_offset_16_t_uint128(add(slot, 2))

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function abi_encode_tuple_t_uint128_t_uint128_t_uint128_t_uint128_t_uint128_t_uint128__to_t_uint128_t_uint128_t_uint128_t_uint128_t_uint128_t_uint128__fromStack(headStart , value0, value1, value2, value3, value4, value5) -> tail {
                tail := add(headStart, 192)

                abi_encode_t_uint128_to_t_uint128_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint128_to_t_uint128_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint128_to_t_uint128_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint128_to_t_uint128_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint128_to_t_uint128_fromStack(value4,  add(headStart, 128))

                abi_encode_t_uint128_to_t_uint128_fromStack(value5,  add(headStart, 160))

            }

            function external_fun_position_47() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_address(4, calldatasize())
                let ret_0, ret_1, ret_2, ret_3, ret_4, ret_5 :=  getter_fun_position_47(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128_t_uint128_t_uint128_t_uint128_t_uint128_t_uint128__to_t_uint128_t_uint128_t_uint128_t_uint128_t_uint128_t_uint128__fromStack(memPos , ret_0, ret_1, ret_2, ret_3, ret_4, ret_5)
                return(memPos, sub(memEnd, memPos))

            }

            /// @ast-id 86
            /// @src 0:13633:13665  "address public tickSpacingSetter"
            function getter_fun_tickSpacingSetter_86() -> ret {

                let slot := 10
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function external_fun_tickSpacingSetter_86() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_tickSpacingSetter_86()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_bytes32t_uint256t_uint256(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_setMarketSettlementFee_463() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_bytes32t_uint256t_uint256(4, calldatasize())
                fun_setMarketSettlementFee_463(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_21fe6b43b4db61d76a176e95bf1a6b9ede4c301f93a4246f41fecb96e160861d() {
                revert(0, 0)
            }

            // struct Market
            function abi_decode_t_struct$_Market_$4171_calldata_ptr(offset, end) -> value {
                if slt(sub(end, offset), 192) { revert_error_21fe6b43b4db61d76a176e95bf1a6b9ede4c301f93a4246f41fecb96e160861d() }
                value := offset
            }

            function abi_decode_tuple_t_struct$_Market_$4171_calldata_ptrt_uint256t_uint256t_uint256t_addresst_boolt_addresst_addresst_bytes_calldata_ptr(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5, value6, value7, value8, value9 {
                if slt(sub(dataEnd, headStart), 288) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_calldata_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 96

                    value3 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 128

                    value4 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 160

                    value5 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 192

                    value6 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 224

                    value7 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 256))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value8, value9 := abi_decode_t_bytes_calldata_ptr(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_liquidate_2643() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7, param_8, param_9 :=  abi_decode_tuple_t_struct$_Market_$4171_calldata_ptrt_uint256t_uint256t_uint256t_addresst_boolt_addresst_addresst_bytes_calldata_ptr(4, calldatasize())
                let ret_0, ret_1 :=  fun_liquidate_2643(param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7, param_8, param_9)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(memPos , ret_0, ret_1)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_settlementFee_3972() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_uint256(4, calldatasize())
                let ret_0 :=  fun_settlementFee_3972(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            // bytes[]
            function abi_decode_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(offset, end) -> arrayPos, length {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                length := calldataload(offset)
                if gt(length, 0xffffffffffffffff) { revert_error_15abf5612cd996bc235ba1e55a4a30ac60e6bb601ff7ba4ad3f179b6be8d0490() }
                arrayPos := add(offset, 0x20)
                if gt(add(arrayPos, mul(length, 0x20)), end) { revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() }
            }

            function abi_decode_tuple_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0, value1 := abi_decode_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_multicall_149() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(4, calldatasize())
                fun_multicall_149(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_setFeeSetter_200() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                fun_setFeeSetter_200(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_collateralBitmap_3437() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_address(4, calldatasize())
                let ret_0 :=  fun_collateralBitmap_3437(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_creditOf_3536() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_address(4, calldatasize())
                let ret_0 :=  fun_creditOf_3536(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_addresst_address(headStart, dataEnd) -> value0, value1, value2, value3 {
                if slt(sub(dataEnd, headStart), 128) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 96

                    value3 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_withdraw_1664() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_addresst_address(4, calldatasize())
                fun_withdraw_1664(param_0, param_1, param_2, param_3)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_addresst_boolt_address(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_setIsAuthorized_2745() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_boolt_address(4, calldatasize())
                fun_setIsAuthorized_2745(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_continuousFee_3660() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                let ret_0 :=  fun_continuousFee_3660(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint32__to_t_uint32__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function mapping_index_access_t_mapping$_t_address_$_t_array$_t_uint16_$7_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error_0x32() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x32)
                revert(0, 0x24)
            }

            function array_length_t_array$_t_uint16_$7_storage(value) -> length {

                length := 0x07

            }

            function array_dataslot_t_array$_t_uint16_$7_storage(ptr) -> data {
                data := ptr

            }

            function array_dataslot_t_bytes_storage_ptr(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function long_byte_array_index_access_no_checks(array, index) -> slot, offset {

                offset := sub(31, mod(index, 0x20))
                let dataArea := array_dataslot_t_bytes_storage_ptr(array)
                slot := add(dataArea, div(index, 0x20))

            }

            function storage_array_index_access_t_array$_t_uint16_$7_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_uint16_$7_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error_0x32() }

                let dataArea := array_dataslot_t_array$_t_uint16_$7_storage(array)
                slot := add(dataArea, div(index, 16))
                offset := mul(mod(index, 16), 2)

            }

            function cleanup_from_storage_t_uint16(value) -> cleaned {
                cleaned := and(value, 0xffff)
            }

            function extract_from_storage_value_dynamict_uint16(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_uint16(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint16(sload(slot), offset)

            }

            /// @ast-id 70
            /// @src 0:13326:13396  "mapping(address loanToken => uint16[7]) public defaultSettlementFeeCbp"
            function getter_fun_defaultSettlementFeeCbp_70(key_0, key_1) -> ret {

                let slot := 4
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_array$_t_uint16_$7_storage_$_of_t_address(slot, key_0)

                if iszero(lt(key_1, array_length_t_array$_t_uint16_$7_storage(slot))) { revert(0, 0) }

                slot, offset := storage_array_index_access_t_array$_t_uint16_$7_storage(slot, key_1)

                ret := read_from_storage_split_dynamic_t_uint16(slot, offset)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function abi_encode_t_uint16_to_t_uint16_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint16(value))
            }

            function abi_encode_tuple_t_uint16__to_t_uint16__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint16_to_t_uint16_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_defaultSettlementFeeCbp_70() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                let ret_0 :=  getter_fun_defaultSettlementFeeCbp_70(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint16__to_t_uint16__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_setRoleSetter_175() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                fun_setRoleSetter_175(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_setFeeClaimer_225() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                fun_setFeeClaimer_225(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_pendingFee_3690() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_address(4, calldatasize())
                let ret_0 :=  fun_pendingFee_3690(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_bytes32t_uint256t_address(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_setConsumed_2700() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_bytes32t_uint256t_address(4, calldatasize())
                fun_setConsumed_2700(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_debtOf_3553() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_address(4, calldatasize())
                let ret_0 :=  fun_debtOf_3553(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple_t_uint8__to_t_uint8__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint8_to_t_uint8_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_tickSpacing_3592() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                let ret_0 :=  fun_tickSpacing_3592(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_lastAccrual_3707() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_address(4, calldatasize())
                let ret_0 :=  fun_lastAccrual_3707(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_addresst_bytes32(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

            }

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_uint256_$_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_bytes32_$_t_uint256_$_of_t_bytes32(slot , key) -> dataSlot {
                mstore(0, convert_t_bytes32_to_t_bytes32(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            /// @ast-id 58
            /// @src 0:13154:13228  "mapping(address user => mapping(bytes32 group => uint256)) public consumed"
            function getter_fun_consumed_58(key_0, key_1) -> ret {

                let slot := 2
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_uint256_$_$_of_t_address(slot, key_0)

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_uint256_$_of_t_bytes32(slot, key_1)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function external_fun_consumed_58() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_bytes32(4, calldatasize())
                let ret_0 :=  getter_fun_consumed_58(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(slot , key) -> dataSlot {
                mstore(0, convert_t_bytes32_to_t_bytes32(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function extract_from_storage_value_offset_0_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint16(slot) -> value {
                value := extract_from_storage_value_offset_0_t_uint16(sload(slot))

            }

            function shift_right_16_unsigned(value) -> newValue {
                newValue :=

                shr(16, value)

            }

            function extract_from_storage_value_offset_2_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_16_unsigned(slot_value))
            }

            function read_from_storage_split_offset_2_t_uint16(slot) -> value {
                value := extract_from_storage_value_offset_2_t_uint16(sload(slot))

            }

            function shift_right_32_unsigned(value) -> newValue {
                newValue :=

                shr(32, value)

            }

            function extract_from_storage_value_offset_4_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_32_unsigned(slot_value))
            }

            function read_from_storage_split_offset_4_t_uint16(slot) -> value {
                value := extract_from_storage_value_offset_4_t_uint16(sload(slot))

            }

            function shift_right_48_unsigned(value) -> newValue {
                newValue :=

                shr(48, value)

            }

            function extract_from_storage_value_offset_6_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_48_unsigned(slot_value))
            }

            function read_from_storage_split_offset_6_t_uint16(slot) -> value {
                value := extract_from_storage_value_offset_6_t_uint16(sload(slot))

            }

            function shift_right_64_unsigned(value) -> newValue {
                newValue :=

                shr(64, value)

            }

            function extract_from_storage_value_offset_8_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_64_unsigned(slot_value))
            }

            function read_from_storage_split_offset_8_t_uint16(slot) -> value {
                value := extract_from_storage_value_offset_8_t_uint16(sload(slot))

            }

            function shift_right_80_unsigned(value) -> newValue {
                newValue :=

                shr(80, value)

            }

            function extract_from_storage_value_offset_10_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_80_unsigned(slot_value))
            }

            function read_from_storage_split_offset_10_t_uint16(slot) -> value {
                value := extract_from_storage_value_offset_10_t_uint16(sload(slot))

            }

            function shift_right_96_unsigned(value) -> newValue {
                newValue :=

                shr(96, value)

            }

            function extract_from_storage_value_offset_12_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_96_unsigned(slot_value))
            }

            function read_from_storage_split_offset_12_t_uint16(slot) -> value {
                value := extract_from_storage_value_offset_12_t_uint16(sload(slot))

            }

            function shift_right_112_unsigned(value) -> newValue {
                newValue :=

                shr(112, value)

            }

            function extract_from_storage_value_offset_14_t_uint32(slot_value) -> value {
                value := cleanup_from_storage_t_uint32(shift_right_112_unsigned(slot_value))
            }

            function read_from_storage_split_offset_14_t_uint32(slot) -> value {
                value := extract_from_storage_value_offset_14_t_uint32(sload(slot))

            }

            function shift_right_144_unsigned(value) -> newValue {
                newValue :=

                shr(144, value)

            }

            function cleanup_from_storage_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function extract_from_storage_value_offset_18_t_uint8(slot_value) -> value {
                value := cleanup_from_storage_t_uint8(shift_right_144_unsigned(slot_value))
            }

            function read_from_storage_split_offset_18_t_uint8(slot) -> value {
                value := extract_from_storage_value_offset_18_t_uint8(sload(slot))

            }

            /// @ast-id 52
            /// @src 0:13095:13148  "mapping(bytes32 id => MarketState) public marketState"
            function getter_fun_marketState_52(key_0) -> ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6, ret_7, ret_8, ret_9, ret_10, ret_11, ret_12 {

                let slot := 1
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(slot, key_0)

                ret_0 := read_from_storage_split_offset_0_t_uint128(add(slot, 0))

                ret_1 := read_from_storage_split_offset_16_t_uint128(add(slot, 0))

                ret_2 := read_from_storage_split_offset_0_t_uint128(add(slot, 1))

                ret_3 := read_from_storage_split_offset_16_t_uint128(add(slot, 1))

                ret_4 := read_from_storage_split_offset_0_t_uint16(add(slot, 2))

                ret_5 := read_from_storage_split_offset_2_t_uint16(add(slot, 2))

                ret_6 := read_from_storage_split_offset_4_t_uint16(add(slot, 2))

                ret_7 := read_from_storage_split_offset_6_t_uint16(add(slot, 2))

                ret_8 := read_from_storage_split_offset_8_t_uint16(add(slot, 2))

                ret_9 := read_from_storage_split_offset_10_t_uint16(add(slot, 2))

                ret_10 := read_from_storage_split_offset_12_t_uint16(add(slot, 2))

                ret_11 := read_from_storage_split_offset_14_t_uint32(add(slot, 2))

                ret_12 := read_from_storage_split_offset_18_t_uint8(add(slot, 2))

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function abi_encode_tuple_t_uint128_t_uint128_t_uint128_t_uint128_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint32_t_uint8__to_t_uint128_t_uint128_t_uint128_t_uint128_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint32_t_uint8__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12) -> tail {
                tail := add(headStart, 416)

                abi_encode_t_uint128_to_t_uint128_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint128_to_t_uint128_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint128_to_t_uint128_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint128_to_t_uint128_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint16_to_t_uint16_fromStack(value4,  add(headStart, 128))

                abi_encode_t_uint16_to_t_uint16_fromStack(value5,  add(headStart, 160))

                abi_encode_t_uint16_to_t_uint16_fromStack(value6,  add(headStart, 192))

                abi_encode_t_uint16_to_t_uint16_fromStack(value7,  add(headStart, 224))

                abi_encode_t_uint16_to_t_uint16_fromStack(value8,  add(headStart, 256))

                abi_encode_t_uint16_to_t_uint16_fromStack(value9,  add(headStart, 288))

                abi_encode_t_uint16_to_t_uint16_fromStack(value10,  add(headStart, 320))

                abi_encode_t_uint32_to_t_uint32_fromStack(value11,  add(headStart, 352))

                abi_encode_t_uint8_to_t_uint8_fromStack(value12,  add(headStart, 384))

            }

            function external_fun_marketState_52() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                let ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6, ret_7, ret_8, ret_9, ret_10, ret_11, ret_12 :=  getter_fun_marketState_52(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128_t_uint128_t_uint128_t_uint128_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint32_t_uint8__to_t_uint128_t_uint128_t_uint128_t_uint128_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint16_t_uint32_t_uint8__fromStack(memPos , ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6, ret_7, ret_8, ret_9, ret_10, ret_11, ret_12)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_bytes32t_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_collateral_3458() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_bytes32t_addresst_uint256(4, calldatasize())
                let ret_0 :=  fun_collateral_3458(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_setMarketTickSpacing_313() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_uint256(4, calldatasize())
                fun_setMarketTickSpacing_313(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_setTickSpacingSetter_250() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                fun_setTickSpacingSetter_250(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_encode_t_address_to_t_address(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function array_dataslot_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function abi_encode_t_uint256_to_t_uint256(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            // struct CollateralParams -> struct CollateralParams
            function abi_encode_t_struct$_CollateralParams_$4180_memory_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(value, pos)  {
                let tail := add(pos, 0x80)

                {
                    // token

                    let memberValue0 := mload(add(value, 0x00))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x00))
                }

                {
                    // lltv

                    let memberValue0 := mload(add(value, 0x20))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x20))
                }

                {
                    // maxLif

                    let memberValue0 := mload(add(value, 0x40))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x40))
                }

                {
                    // oracle

                    let memberValue0 := mload(add(value, 0x60))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x60))
                }

            }

            function abi_encodeUpdatedPos_t_struct$_CollateralParams_$4180_memory_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(value0, pos) -> updatedPos {
                abi_encode_t_struct$_CollateralParams_$4180_memory_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(value0, pos)
                updatedPos := add(pos, 0x80)
            }

            function array_nextElement_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(ptr) -> next {
                next := add(ptr, 0x20)
            }

            // struct CollateralParams[] -> struct CollateralParams[]
            function abi_encode_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr_to_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(value, pos)  -> end  {
                let length := array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(pos, length)
                let baseRef := array_dataslot_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := mload(srcPtr)
                    pos := abi_encodeUpdatedPos_t_struct$_CollateralParams_$4180_memory_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(srcPtr)
                }
                end := pos
            }

            // struct Market -> struct Market
            function abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value, pos)  -> end  {
                let tail := add(pos, 0xc0)

                {
                    // loanToken

                    let memberValue0 := mload(add(value, 0x00))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x00))
                }

                {
                    // collateralParams

                    let memberValue0 := mload(add(value, 0x20))

                    mstore(add(pos, 0x20), sub(tail, pos))
                    tail := abi_encode_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr_to_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(memberValue0, tail)

                }

                {
                    // maturity

                    let memberValue0 := mload(add(value, 0x40))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x40))
                }

                {
                    // rcfThreshold

                    let memberValue0 := mload(add(value, 0x60))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x60))
                }

                {
                    // enterGate

                    let memberValue0 := mload(add(value, 0x80))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x80))
                }

                {
                    // liquidatorGate

                    let memberValue0 := mload(add(value, 0xa0))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0xa0))
                }

                end := tail
            }

            function abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value0,  tail)

            }

            function external_fun_toMarket_3519() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                let ret_0 :=  fun_toMarket_3519(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_uint256t_address(headStart, dataEnd) -> value0, value1, value2, value3 {
                if slt(sub(dataEnd, headStart), 128) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 96

                    value3 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_supplyCollateral_1916() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_uint256t_address(4, calldatasize())
                fun_supplyCollateral_1916(param_0, param_1, param_2, param_3)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_continuousFeeCredit_3673() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                let ret_0 :=  fun_continuousFeeCredit_3673(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint128__to_t_uint128__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function zero_value_for_split_t_uint128() -> ret {
                ret := 0
            }

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_0_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(identity(cleanup_t_rational_0_by_1(value)))
            }

            function require_helper_t_error_4310_MarketNotCreated(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x96e1352900000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 3274
            /// @src 0:44150:44417  "function updatePosition(Market memory market, address user) external returns (uint128, uint128, uint128) {..."
            function fun_updatePosition_3274(var_market_3239_mpos, var_user_3241) -> var__3244, var__3246, var__3248 {
                /// @src 0:44228:44235  "uint128"
                let zero_t_uint128_1 := zero_value_for_split_t_uint128()
                var__3244 := zero_t_uint128_1
                /// @src 0:44237:44244  "uint128"
                let zero_t_uint128_2 := zero_value_for_split_t_uint128()
                var__3246 := zero_t_uint128_2
                /// @src 0:44246:44253  "uint128"
                let zero_t_uint128_3 := zero_value_for_split_t_uint128()
                var__3248 := zero_t_uint128_3

                /// @src 0:44283:44289  "market"
                let _4_mpos := var_market_3239_mpos
                let expr_3253_mpos := _4_mpos
                /// @src 0:44278:44290  "toId(market)"
                let expr_3254 := fun_toId_3477(expr_3253_mpos)
                /// @src 0:44265:44290  "bytes32 id = toId(market)"
                let var_id_3251 := expr_3254
                /// @src 0:44308:44319  "marketState"
                let _5_slot := 0x01
                let expr_3257_slot := _5_slot
                /// @src 0:44320:44322  "id"
                let _6 := var_id_3251
                let expr_3258 := _6
                /// @src 0:44308:44323  "marketState[id]"
                let _7 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3257_slot,expr_3258)
                let _8_slot := _7
                let expr_3259_slot := _8_slot
                /// @src 0:44308:44335  "marketState[id].tickSpacing"
                let _9 := add(expr_3259_slot, 2)
                let _10 := read_from_storage_split_offset_18_t_uint8(_9)
                let expr_3260 := _10
                /// @src 0:44338:44339  "0"
                let expr_3261 := 0x00
                /// @src 0:44308:44339  "marketState[id].tickSpacing > 0"
                let expr_3262 := gt(cleanup_t_uint8(expr_3260), convert_t_rational_0_by_1_to_t_uint8(expr_3261))
                /// @src 0:44300:44360  "require(marketState[id].tickSpacing > 0, MarketNotCreated())"
                require_helper_t_error_4310_MarketNotCreated(expr_3262)
                /// @src 0:44393:44399  "market"
                let _11_mpos := var_market_3239_mpos
                let expr_3268_mpos := _11_mpos
                /// @src 0:44401:44403  "id"
                let _12 := var_id_3251
                let expr_3269 := _12
                /// @src 0:44405:44409  "user"
                let _13 := var_user_3241
                let expr_3270 := _13
                /// @src 0:44377:44410  "_updatePosition(market, id, user)"
                let expr_3271_component_1, expr_3271_component_2, expr_3271_component_3 := fun__updatePosition_3383(expr_3268_mpos, expr_3269, expr_3270)
                /// @src 0:44370:44410  "return _updatePosition(market, id, user)"
                var__3244 := expr_3271_component_1
                var__3246 := expr_3271_component_2
                var__3248 := expr_3271_component_3
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(value) -> converted {
                converted := value
            }

            function convert_t_uint128_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint128(value)))
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function convert_t_rational_0_by_1_to_t_uint128(value) -> converted {
                converted := cleanup_t_uint128(identity(cleanup_t_rational_0_by_1(value)))
            }

            function memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function read_from_memoryt_address(ptr) -> returnValue {

                let value := cleanup_t_address(mload(ptr))

                returnValue :=

                value

            }

            function convert_t_uint160_to_t_contract$_IOracle_$4895(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IOracle_$4895(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IOracle_$4895(value)
            }

            function convert_t_contract$_IOracle_$4895_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() {
                revert(0, 0)
            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

            }

            function abi_decode_t_uint256_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            function array_length_t_array$_t_uint128_$128_storage(value) -> length {

                length := 0x80

            }

            function array_dataslot_t_array$_t_uint128_$128_storage(ptr) -> data {
                data := ptr

            }

            function storage_array_index_access_t_array$_t_uint128_$128_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_uint128_$128_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error_0x32() }

                let dataArea := array_dataslot_t_array$_t_uint128_$128_storage(array)
                slot := add(dataArea, div(index, 2))
                offset := mul(mod(index, 2), 16)

            }

            function extract_from_storage_value_dynamict_uint128(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint128(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_uint128(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint128(sload(slot), offset)

            }

            function cleanup_t_rational_1000000000000000000000000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1000000000000000000000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1000000000000000000000000000000000000_by_1(value)))
            }

            /// @src 7:209:251  "uint256 constant ORACLE_PRICE_SCALE = 1e36"
            function constant_ORACLE_PRICE_SCALE_4920() -> ret {
                /// @src 7:247:251  "1e36"
                let expr_4919 := 0xc097ce7bc90715b34b9f1000000000
                let _52 := convert_t_rational_1000000000000000000000000000000000000_by_1_to_t_uint256(expr_4919)

                ret := _52
            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            function cleanup_t_rational_1000000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1000000000000000000_by_1(value)))
            }

            /// @src 7:180:207  "uint256 constant WAD = 1e18"
            function constant_WAD_4917() -> ret {
                /// @src 7:203:207  "1e18"
                let expr_4916 := 0x0de0b6b3a7640000
                let _56 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_4916)

                ret := _56
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                sum := add(x, y)

                if gt(x, sum) { panic_error_0x11() }

            }

            /// @ast-id 3821
            /// @src 0:49012:49871  "function isHealthy(Market memory market, bytes32 id, address borrower) public view returns (bool) {..."
            function fun_isHealthy_3821(var_market_3728_mpos, var_id_3730, var_borrower_3732) -> var__3735 {
                /// @src 0:49104:49108  "bool"
                let zero_t_bool_14 := zero_value_for_split_t_bool()
                var__3735 := zero_t_bool_14

                /// @src 0:49149:49157  "position"
                let _15_slot := 0x00
                let expr_3740_slot := _15_slot
                /// @src 0:49158:49160  "id"
                let _16 := var_id_3730
                let expr_3741 := _16
                /// @src 0:49149:49161  "position[id]"
                let _17 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3740_slot,expr_3741)
                let _18_slot := _17
                let expr_3742_slot := _18_slot
                /// @src 0:49162:49170  "borrower"
                let _19 := var_borrower_3732
                let expr_3743 := _19
                /// @src 0:49149:49171  "position[id][borrower]"
                let _20 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3742_slot,expr_3743)
                let _21_slot := _20
                let expr_3744_slot := _21_slot
                /// @src 0:49120:49171  "Position storage _position = position[id][borrower]"
                let var__position_3739_slot := convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(expr_3744_slot)
                /// @src 0:49196:49205  "_position"
                let _22_slot := var__position_3739_slot
                let expr_3748_slot := _22_slot
                /// @src 0:49196:49210  "_position.debt"
                let _23 := add(expr_3748_slot, 2)
                let _24 := read_from_storage_split_offset_0_t_uint128(_23)
                let expr_3749 := _24
                /// @src 0:49181:49210  "uint256 debt = _position.debt"
                let var_debt_3747 := convert_t_uint128_to_t_uint256(expr_3749)
                /// @src 0:49220:49235  "uint256 maxDebt"
                let var_maxDebt_3752
                let zero_t_uint256_25 := zero_value_for_split_t_uint256()
                var_maxDebt_3752 := zero_t_uint256_25
                /// @src 0:49249:49253  "debt"
                let _26 := var_debt_3747
                let expr_3754 := _26
                /// @src 0:49256:49257  "0"
                let expr_3755 := 0x00
                /// @src 0:49249:49257  "debt > 0"
                let expr_3756 := gt(cleanup_t_uint256(expr_3754), convert_t_rational_0_by_1_to_t_uint256(expr_3755))
                /// @src 0:49245:49833  "if (debt > 0) {..."
                if expr_3756 {
                    /// @src 0:49301:49310  "_position"
                    let _27_slot := var__position_3739_slot
                    let expr_3759_slot := _27_slot
                    /// @src 0:49301:49327  "_position.collateralBitmap"
                    let _28 := add(expr_3759_slot, 2)
                    let _29 := read_from_storage_split_offset_16_t_uint128(_28)
                    let expr_3760 := _29
                    /// @src 0:49273:49327  "uint128 _collateralBitmap = _position.collateralBitmap"
                    let var__collateralBitmap_3758 := expr_3760
                    /// @src 0:49341:49823  "while (_collateralBitmap != 0) {..."
                    for {
                        } 1 {
                    }
                    {
                        /// @src 0:49348:49365  "_collateralBitmap"
                        let _30 := var__collateralBitmap_3758
                        let expr_3762 := _30
                        /// @src 0:49369:49370  "0"
                        let expr_3763 := 0x00
                        /// @src 0:49348:49370  "_collateralBitmap != 0"
                        let expr_3764 := iszero(eq(cleanup_t_uint128(expr_3762), convert_t_rational_0_by_1_to_t_uint128(expr_3763)))
                        if iszero(expr_3764) { break }
                        /// @src 0:49402:49410  "UtilsLib"
                        let expr_3767_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                        /// @src 0:49415:49432  "_collateralBitmap"
                        let _31 := var__collateralBitmap_3758
                        let expr_3769 := _31
                        /// @src 0:49402:49433  "UtilsLib.msb(_collateralBitmap)"
                        let expr_3770 := fun_msb_5987(expr_3769)
                        /// @src 0:49390:49433  "uint256 i = UtilsLib.msb(_collateralBitmap)"
                        let var_i_3766 := expr_3770
                        /// @src 0:49493:49499  "market"
                        let _32_mpos := var_market_3728_mpos
                        let expr_3775_mpos := _32_mpos
                        /// @src 0:49493:49516  "market.collateralParams"
                        let _33 := add(expr_3775_mpos, 32)
                        let _34_mpos := mload(_33)
                        let expr_3776_mpos := _34_mpos
                        /// @src 0:49517:49518  "i"
                        let _35 := var_i_3766
                        let expr_3777 := _35
                        /// @src 0:49493:49519  "market.collateralParams[i]"
                        let _36_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_3776_mpos, expr_3777))
                        let expr_3778_mpos := _36_mpos
                        /// @src 0:49451:49519  "CollateralParams memory collateralParam = market.collateralParams[i]"
                        let var_collateralParam_3774_mpos := expr_3778_mpos
                        /// @src 0:49561:49576  "collateralParam"
                        let _37_mpos := var_collateralParam_3774_mpos
                        let expr_3783_mpos := _37_mpos
                        /// @src 0:49561:49583  "collateralParam.oracle"
                        let _38 := add(expr_3783_mpos, 96)
                        let _39 := read_from_memoryt_address(_38)
                        let expr_3784 := _39
                        /// @src 0:49553:49584  "IOracle(collateralParam.oracle)"
                        let expr_3785_address := convert_t_address_to_t_contract$_IOracle_$4895(expr_3784)
                        /// @src 0:49553:49590  "IOracle(collateralParam.oracle).price"
                        let expr_3786_address := convert_t_contract$_IOracle_$4895_to_t_address(expr_3785_address)
                        let expr_3786_functionSelector := 0xa035b1fe
                        /// @src 0:49553:49592  "IOracle(collateralParam.oracle).price()"

                        // storage for arguments and returned data
                        let _40 := allocate_unbounded()
                        mstore(_40, shift_left_224(expr_3786_functionSelector))
                        let _41 := abi_encode_tuple__to__fromStack(add(_40, 4) )

                        let _42 := staticcall(gas(), expr_3786_address,  _40, sub(_41, _40), _40, 32)

                        if iszero(_42) { revert_forward_1() }

                        let expr_3787
                        if _42 {

                            let _43 := 32

                            if gt(_43, returndatasize()) {
                                _43 := returndatasize()
                            }

                            // update freeMemoryPointer according to dynamic return size
                            finalize_allocation(_40, _43)

                            // decode return parameters from external try-call into retVars
                            expr_3787 :=  abi_decode_tuple_t_uint256_fromMemory(_40, add(_40, _43))
                        }
                        /// @src 0:49537:49592  "uint256 price = IOracle(collateralParam.oracle).price()"
                        let var_price_3781 := expr_3787
                        /// @src 0:49621:49630  "_position"
                        let _44_slot := var__position_3739_slot
                        let expr_3790_slot := _44_slot
                        /// @src 0:49621:49641  "_position.collateral"
                        let _45 := add(expr_3790_slot, 3)
                        let _46_slot := _45
                        let expr_3791_slot := _46_slot
                        /// @src 0:49642:49643  "i"
                        let _47 := var_i_3766
                        let expr_3792 := _47
                        /// @src 0:49621:49644  "_position.collateral[i]"

                        let _48, _49 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_3791_slot, expr_3792)
                        let _50 := read_from_storage_split_dynamic_t_uint128(_48, _49)
                        let expr_3793 := _50
                        /// @src 0:49621:49655  "_position.collateral[i].mulDivDown"
                        let expr_3794_self := convert_t_uint128_to_t_uint256(expr_3793)
                        /// @src 0:49656:49661  "price"
                        let _51 := var_price_3781
                        let expr_3795 := _51
                        /// @src 0:49663:49681  "ORACLE_PRICE_SCALE"
                        let expr_3796 := constant_ORACLE_PRICE_SCALE_4920()
                        /// @src 0:49621:49682  "_position.collateral[i].mulDivDown(price, ORACLE_PRICE_SCALE)"
                        let expr_3797 := fun_mulDivDown_5872(expr_3794_self, expr_3795, expr_3796)
                        /// @src 0:49621:49714  "_position.collateral[i].mulDivDown(price, ORACLE_PRICE_SCALE)..."
                        let expr_3798_self := expr_3797
                        /// @src 0:49715:49730  "collateralParam"
                        let _53_mpos := var_collateralParam_3774_mpos
                        let expr_3799_mpos := _53_mpos
                        /// @src 0:49715:49735  "collateralParam.lltv"
                        let _54 := add(expr_3799_mpos, 32)
                        let _55 := read_from_memoryt_uint256(_54)
                        let expr_3800 := _55
                        /// @src 0:49737:49740  "WAD"
                        let expr_3801 := constant_WAD_4917()
                        /// @src 0:49621:49741  "_position.collateral[i].mulDivDown(price, ORACLE_PRICE_SCALE)..."
                        let expr_3802 := fun_mulDivDown_5872(expr_3798_self, expr_3800, expr_3801)
                        /// @src 0:49610:49741  "maxDebt += _position.collateral[i].mulDivDown(price, ORACLE_PRICE_SCALE)..."
                        let _57 := var_maxDebt_3752
                        let expr_3803 := checked_add_t_uint256(_57, expr_3802)

                        var_maxDebt_3752 := expr_3803
                        /// @src 0:49779:49796  "_collateralBitmap"
                        let _58 := var__collateralBitmap_3758
                        let expr_3806 := _58
                        /// @src 0:49779:49805  "_collateralBitmap.clearBit"
                        let expr_3807_self := expr_3806
                        /// @src 0:49806:49807  "i"
                        let _59 := var_i_3766
                        let expr_3808 := _59
                        /// @src 0:49779:49808  "_collateralBitmap.clearBit(i)"
                        let expr_3809 := fun_clearBit_6030(expr_3807_self, expr_3808)
                        /// @src 0:49759:49808  "_collateralBitmap = _collateralBitmap.clearBit(i)"
                        var__collateralBitmap_3758 := expr_3809
                        let expr_3810 := expr_3809
                    }
                    /// @src 0:49245:49833  "if (debt > 0) {..."
                }
                /// @src 0:49849:49856  "maxDebt"
                let _60 := var_maxDebt_3752
                let expr_3816 := _60
                /// @src 0:49860:49864  "debt"
                let _61 := var_debt_3747
                let expr_3817 := _61
                /// @src 0:49849:49864  "maxDebt >= debt"
                let expr_3818 := iszero(lt(cleanup_t_uint256(expr_3816), cleanup_t_uint256(expr_3817)))
                /// @src 0:49842:49864  "return maxDebt >= debt"
                var__3735 := expr_3818
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
            }

            function convert_t_bytes32_to_t_uint256(value) -> converted {
                converted := convert_t_uint256_to_t_uint256(shift_right_0_unsigned(value))
            }

            /// @src 7:1011:1107  "uint256 constant LIQUIDATION_LOCK_SLOT = uint256(keccak256(\"morpho.midnight.liquidationLocked\"))"
            function constant_LIQUIDATION_LOCK_SLOT_4981() -> ret {
                /// @src 7:1060:1106  "keccak256(\"morpho.midnight.liquidationLocked\")"
                let expr_4979 := 0x90e10dad8320b2f9ee6b84bebe89829c27a3fc1209e68031bc1d4b65c22e4da4
                /// @src 7:1052:1107  "uint256(keccak256(\"morpho.midnight.liquidationLocked\"))"
                let expr_4980 := convert_t_bytes32_to_t_uint256(expr_4979)
                let _63 := expr_4980

                ret := _63
            }

            /// @ast-id 3724
            /// @src 0:48643:48793  "function liquidationLocked(bytes32 id, address user) public view returns (bool) {..."
            function fun_liquidationLocked_3724(var_id_3709, var_user_3711) -> var__3714 {
                /// @src 0:48717:48721  "bool"
                let zero_t_bool_62 := zero_value_for_split_t_bool()
                var__3714 := zero_t_bool_62

                /// @src 0:48740:48748  "UtilsLib"
                let expr_3716_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:48754:48775  "LIQUIDATION_LOCK_SLOT"
                let expr_3718 := constant_LIQUIDATION_LOCK_SLOT_4981()
                /// @src 0:48777:48779  "id"
                let _64 := var_id_3709
                let expr_3719 := _64
                /// @src 0:48781:48785  "user"
                let _65 := var_user_3711
                let expr_3720 := _65
                /// @src 0:48740:48786  "UtilsLib.tGet(LIQUIDATION_LOCK_SLOT, id, user)"
                let expr_3721 := fun_tGet_6088(expr_3718, expr_3719, expr_3720)
                /// @src 0:48733:48786  "return UtilsLib.tGet(LIQUIDATION_LOCK_SLOT, id, user)"
                var__3714 := expr_3721
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function extract_from_storage_value_offset_0_t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0_t_address(sload(slot))

            }

            function require_helper_t_error_4318_OnlyFeeSetter(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x7155bb1900000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function cleanup_t_rational_10000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_10000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_10000000000000000_by_1(value)))
            }

            function cleanup_t_rational_31536000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_31536000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_31536000_by_1(value)))
            }

            function panic_error_0x12() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x12)
                revert(0, 0x24)
            }

            function checked_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error_0x12() }

                r := div(x, y)
            }

            function convert_t_uint256_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(identity(cleanup_t_uint256(value)))
            }

            /// @src 7:687:768  "uint32 constant MAX_CONTINUOUS_FEE = uint32(uint256(0.01e18) / uint256(365 days))"
            function constant_MAX_CONTINUOUS_FEE_4958() -> ret {
                /// @src 7:739:746  "0.01e18"
                let expr_4950 := 0x2386f26fc10000
                /// @src 7:731:747  "uint256(0.01e18)"
                let expr_4951 := convert_t_rational_10000000000000000_by_1_to_t_uint256(expr_4950)
                /// @src 7:758:766  "365 days"
                let expr_4954 := 0x01e13380
                /// @src 7:750:767  "uint256(365 days)"
                let expr_4955 := convert_t_rational_31536000_by_1_to_t_uint256(expr_4954)
                /// @src 7:731:767  "uint256(0.01e18) / uint256(365 days)"
                let expr_4956 := checked_div_t_uint256(expr_4951, expr_4955)

                /// @src 7:724:768  "uint32(uint256(0.01e18) / uint256(365 days))"
                let expr_4957 := convert_t_uint256_to_t_uint32(expr_4956)
                let _68 := expr_4957

                ret := _68
            }

            function convert_t_uint32_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint32(value)))
            }

            function require_helper_t_error_4270_ContinuousFeeTooHigh(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xe204b2b100000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function update_byte_slice_4_shift_0(value, toInsert) -> result {
                let mask := 0xffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_uint32_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(identity(cleanup_t_uint32(value)))
            }

            function prepare_store_t_uint32(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0_t_uint32_to_t_uint32(slot, value_0) {
                let convertedValue_0 := convert_t_uint32_to_t_uint32(value_0)
                sstore(slot, update_byte_slice_4_shift_0(sload(slot), prepare_store_t_uint32(convertedValue_0)))
            }

            /// @ast-id 629
            /// @src 0:18520:19018  "function setDefaultContinuousFee(address loanToken, uint256 newContinuousFee) external {..."
            function fun_setDefaultContinuousFee_629(var_loanToken_590, var_newContinuousFee_592) {

                /// @src 0:18625:18635  "msg.sender"
                let expr_597 := caller()
                /// @src 0:18639:18648  "feeSetter"
                let _66 := read_from_storage_split_offset_0_t_address(0x08)
                let expr_598 := _66
                /// @src 0:18625:18648  "msg.sender == feeSetter"
                let expr_599 := eq(cleanup_t_address(expr_597), cleanup_t_address(expr_598))
                /// @src 0:18617:18666  "require(msg.sender == feeSetter, OnlyFeeSetter())"
                require_helper_t_error_4318_OnlyFeeSetter(expr_599)
                /// @src 0:18684:18700  "newContinuousFee"
                let _67 := var_newContinuousFee_592
                let expr_605 := _67
                /// @src 0:18704:18722  "MAX_CONTINUOUS_FEE"
                let expr_606 := constant_MAX_CONTINUOUS_FEE_4958()
                /// @src 0:18684:18722  "newContinuousFee <= MAX_CONTINUOUS_FEE"
                let expr_607 := iszero(gt(cleanup_t_uint256(expr_605), convert_t_uint32_to_t_uint256(expr_606)))
                /// @src 0:18676:18747  "require(newContinuousFee <= MAX_CONTINUOUS_FEE, ContinuousFeeTooHigh())"
                require_helper_t_error_4270_ContinuousFeeTooHigh(expr_607)
                /// @src 0:18917:18933  "newContinuousFee"
                let _69 := var_newContinuousFee_592
                let expr_617 := _69
                /// @src 0:18910:18934  "uint32(newContinuousFee)"
                let expr_618 := convert_t_uint256_to_t_uint32(expr_617)
                /// @src 0:18876:18896  "defaultContinuousFee"
                let _70_slot := 0x05
                let expr_612_slot := _70_slot
                /// @src 0:18897:18906  "loanToken"
                let _71 := var_loanToken_590
                let expr_613 := _71
                /// @src 0:18876:18907  "defaultContinuousFee[loanToken]"
                let _72 := mapping_index_access_t_mapping$_t_address_$_t_uint32_$_of_t_address(expr_612_slot,expr_613)
                /// @src 0:18876:18934  "defaultContinuousFee[loanToken] = uint32(newContinuousFee)"
                update_storage_value_offset_0_t_uint32_to_t_uint32(_72, expr_618)
                let expr_619 := expr_618
                /// @src 0:18949:18958  "EventsLib"
                let expr_621_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:18983:18992  "loanToken"
                let _73 := var_loanToken_590
                let expr_624 := _73
                /// @src 0:18994:19010  "newContinuousFee"
                let _74 := var_newContinuousFee_592
                let expr_625 := _74
                /// @src 0:18949:19011  "EventsLib.SetDefaultContinuousFee(loanToken, newContinuousFee)"
                let _75 := 0x57cfac4cdc6c10e16433620e0ab8e58bb0cb760645d7206c700486d8cd3ea769
                let _76 := convert_t_address_to_t_address(expr_624)
                {
                    let _77 := allocate_unbounded()
                    let _78 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_77 , expr_625)
                    log2(_77, sub(_78, _77) , _75, _76)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function array_allocation_size_t_array$_t_uint16_$7_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

            }

            function allocate_memory_array_t_array$_t_uint16_$7_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_array$_t_uint16_$7_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

            }

            function zero_memory_chunk_t_uint16(dataStart, dataSizeInBytes) {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }

            function allocate_and_zero_memory_array_t_array$_t_uint16_$7_memory_ptr(length) -> memPtr {
                memPtr := allocate_memory_array_t_array$_t_uint16_$7_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_uint16_$7_memory_ptr(length)

                zero_memory_chunk_t_uint16(dataStart, dataSize)
            }

            function zero_value_for_split_t_array$_t_uint16_$7_memory_ptr() -> ret {
                ret := allocate_and_zero_memory_array_t_array$_t_uint16_$7_memory_ptr(7)
            }

            function write_to_memory_t_uint16(memPtr, value) {
                mstore(memPtr, cleanup_t_uint16(value))
            }

            /// @ast-id 3646
            /// @src 0:47558:48001  "function settlementFeeCbps(bytes32 id) external view returns (uint16[7] memory) {..."
            function fun_settlementFeeCbps_3646(var_id_3608) -> var__3613_mpos {
                /// @src 0:47620:47636  "uint16[7] memory"
                let zero_t_array$_t_uint16_$7_memory_ptr_79_mpos := zero_value_for_split_t_array$_t_uint16_$7_memory_ptr()
                var__3613_mpos := zero_t_array$_t_uint16_$7_memory_ptr_79_mpos

                /// @src 0:47655:47994  "[..."
                let expr_3643_mpos := allocate_memory_array_t_array$_t_uint16_$7_memory_ptr(7)
                /// @src 0:47669:47680  "marketState"
                let _80_slot := 0x01
                let expr_3615_slot := _80_slot
                /// @src 0:47681:47683  "id"
                let _81 := var_id_3608
                let expr_3616 := _81
                /// @src 0:47669:47684  "marketState[id]"
                let _82 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3615_slot,expr_3616)
                let _83_slot := _82
                let expr_3617_slot := _83_slot
                /// @src 0:47669:47702  "marketState[id].settlementFeeCbp0"
                let _84 := add(expr_3617_slot, 2)
                let _85 := read_from_storage_split_offset_0_t_uint16(_84)
                let expr_3618 := _85
                /// @src 0:47655:47994  "[..."
                write_to_memory_t_uint16(add(expr_3643_mpos, 0), expr_3618)
                /// @src 0:47716:47727  "marketState"
                let _86_slot := 0x01
                let expr_3619_slot := _86_slot
                /// @src 0:47728:47730  "id"
                let _87 := var_id_3608
                let expr_3620 := _87
                /// @src 0:47716:47731  "marketState[id]"
                let _88 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3619_slot,expr_3620)
                let _89_slot := _88
                let expr_3621_slot := _89_slot
                /// @src 0:47716:47749  "marketState[id].settlementFeeCbp1"
                let _90 := add(expr_3621_slot, 2)
                let _91 := read_from_storage_split_offset_2_t_uint16(_90)
                let expr_3622 := _91
                /// @src 0:47655:47994  "[..."
                write_to_memory_t_uint16(add(expr_3643_mpos, 32), expr_3622)
                /// @src 0:47763:47774  "marketState"
                let _92_slot := 0x01
                let expr_3623_slot := _92_slot
                /// @src 0:47775:47777  "id"
                let _93 := var_id_3608
                let expr_3624 := _93
                /// @src 0:47763:47778  "marketState[id]"
                let _94 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3623_slot,expr_3624)
                let _95_slot := _94
                let expr_3625_slot := _95_slot
                /// @src 0:47763:47796  "marketState[id].settlementFeeCbp2"
                let _96 := add(expr_3625_slot, 2)
                let _97 := read_from_storage_split_offset_4_t_uint16(_96)
                let expr_3626 := _97
                /// @src 0:47655:47994  "[..."
                write_to_memory_t_uint16(add(expr_3643_mpos, 64), expr_3626)
                /// @src 0:47810:47821  "marketState"
                let _98_slot := 0x01
                let expr_3627_slot := _98_slot
                /// @src 0:47822:47824  "id"
                let _99 := var_id_3608
                let expr_3628 := _99
                /// @src 0:47810:47825  "marketState[id]"
                let _100 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3627_slot,expr_3628)
                let _101_slot := _100
                let expr_3629_slot := _101_slot
                /// @src 0:47810:47843  "marketState[id].settlementFeeCbp3"
                let _102 := add(expr_3629_slot, 2)
                let _103 := read_from_storage_split_offset_6_t_uint16(_102)
                let expr_3630 := _103
                /// @src 0:47655:47994  "[..."
                write_to_memory_t_uint16(add(expr_3643_mpos, 96), expr_3630)
                /// @src 0:47857:47868  "marketState"
                let _104_slot := 0x01
                let expr_3631_slot := _104_slot
                /// @src 0:47869:47871  "id"
                let _105 := var_id_3608
                let expr_3632 := _105
                /// @src 0:47857:47872  "marketState[id]"
                let _106 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3631_slot,expr_3632)
                let _107_slot := _106
                let expr_3633_slot := _107_slot
                /// @src 0:47857:47890  "marketState[id].settlementFeeCbp4"
                let _108 := add(expr_3633_slot, 2)
                let _109 := read_from_storage_split_offset_8_t_uint16(_108)
                let expr_3634 := _109
                /// @src 0:47655:47994  "[..."
                write_to_memory_t_uint16(add(expr_3643_mpos, 128), expr_3634)
                /// @src 0:47904:47915  "marketState"
                let _110_slot := 0x01
                let expr_3635_slot := _110_slot
                /// @src 0:47916:47918  "id"
                let _111 := var_id_3608
                let expr_3636 := _111
                /// @src 0:47904:47919  "marketState[id]"
                let _112 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3635_slot,expr_3636)
                let _113_slot := _112
                let expr_3637_slot := _113_slot
                /// @src 0:47904:47937  "marketState[id].settlementFeeCbp5"
                let _114 := add(expr_3637_slot, 2)
                let _115 := read_from_storage_split_offset_10_t_uint16(_114)
                let expr_3638 := _115
                /// @src 0:47655:47994  "[..."
                write_to_memory_t_uint16(add(expr_3643_mpos, 160), expr_3638)
                /// @src 0:47951:47962  "marketState"
                let _116_slot := 0x01
                let expr_3639_slot := _116_slot
                /// @src 0:47963:47965  "id"
                let _117 := var_id_3608
                let expr_3640 := _117
                /// @src 0:47951:47966  "marketState[id]"
                let _118 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3639_slot,expr_3640)
                let _119_slot := _118
                let expr_3641_slot := _119_slot
                /// @src 0:47951:47984  "marketState[id].settlementFeeCbp6"
                let _120 := add(expr_3641_slot, 2)
                let _121 := read_from_storage_split_offset_12_t_uint16(_120)
                let expr_3642 := _121
                /// @src 0:47655:47994  "[..."
                write_to_memory_t_uint16(add(expr_3643_mpos, 192), expr_3642)
                /// @src 0:47648:47994  "return [..."
                var__3613_mpos := expr_3643_mpos
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function require_helper_t_error_4316_OnlyFeeClaimer(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x14db09c000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function extract_from_storage_value_offset_0_t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0_t_uint256(sload(slot))

            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                diff := sub(x, y)

                if gt(diff, x) { panic_error_0x11() }

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0_t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            /// @ast-id 672
            /// @src 0:19024:19370  "function claimSettlementFee(address token, uint256 amount, address receiver) external {..."
            function fun_claimSettlementFee_672(var_token_631, var_amount_633, var_receiver_635) {

                /// @src 0:19128:19138  "msg.sender"
                let expr_640 := caller()
                /// @src 0:19142:19152  "feeClaimer"
                let _122 := read_from_storage_split_offset_0_t_address(0x09)
                let expr_641 := _122
                /// @src 0:19128:19152  "msg.sender == feeClaimer"
                let expr_642 := eq(cleanup_t_address(expr_640), cleanup_t_address(expr_641))
                /// @src 0:19120:19171  "require(msg.sender == feeClaimer, OnlyFeeClaimer())"
                require_helper_t_error_4316_OnlyFeeClaimer(expr_642)
                /// @src 0:19214:19220  "amount"
                let _123 := var_amount_633
                let expr_650 := _123
                /// @src 0:19181:19203  "claimableSettlementFee"
                let _124_slot := 0x06
                let expr_647_slot := _124_slot
                /// @src 0:19204:19209  "token"
                let _125 := var_token_631
                let expr_648 := _125
                /// @src 0:19181:19210  "claimableSettlementFee[token]"
                let _126 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_647_slot,expr_648)
                /// @src 0:19181:19220  "claimableSettlementFee[token] -= amount"
                let _127 := read_from_storage_split_offset_0_t_uint256(_126)
                let expr_651 := checked_sub_t_uint256(_127, expr_650)

                update_storage_value_offset_0_t_uint256_to_t_uint256(_126, expr_651)
                /// @src 0:19235:19244  "EventsLib"
                let expr_653_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:19264:19274  "msg.sender"
                let expr_657 := caller()
                /// @src 0:19276:19281  "token"
                let _128 := var_token_631
                let expr_658 := _128
                /// @src 0:19283:19289  "amount"
                let _129 := var_amount_633
                let expr_659 := _129
                /// @src 0:19291:19299  "receiver"
                let _130 := var_receiver_635
                let expr_660 := _130
                /// @src 0:19235:19300  "EventsLib.ClaimSettlementFee(msg.sender, token, amount, receiver)"
                let _131 := 0x9e96510a66432371715fc0021aa4e375a1b788f31ed2732bff0f7b70acaeb8c2
                let _132 := convert_t_address_to_t_address(expr_657)
                let _133 := convert_t_address_to_t_address(expr_658)
                let _134 := convert_t_address_to_t_address(expr_660)
                {
                    let _135 := allocate_unbounded()
                    let _136 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_135 , expr_659)
                    log4(_135, sub(_136, _135) , _131, _132, _133, _134)
                }/// @src 0:19310:19325  "SafeTransferLib"
                let expr_663_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:19339:19344  "token"
                let _137 := var_token_631
                let expr_666 := _137
                /// @src 0:19346:19354  "receiver"
                let _138 := var_receiver_635
                let expr_667 := _138
                /// @src 0:19356:19362  "amount"
                let _139 := var_amount_633
                let expr_668 := _139
                fun_safeTransfer_5503(expr_666, expr_667, expr_668)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function zero_value_for_split_t_bytes32() -> ret {
                ret := 0
            }

            function cleanup_t_rational_3153600000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_3153600000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_3153600000_by_1(value)))
            }

            function require_helper_t_error_4298_MaturityTooFar(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x23dcaa7300000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4302_NoCollateralParams(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x4c00034700000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function cleanup_t_rational_128_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_128_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_128_by_1(value)))
            }

            /// @src 7:817:855  "uint256 constant MAX_COLLATERALS = 128"
            function constant_MAX_COLLATERALS_4964() -> ret {
                /// @src 7:852:855  "128"
                let expr_4963 := 0x80
                let _157 := convert_t_rational_128_by_1_to_t_uint256(expr_4963)

                ret := _157
            }

            function require_helper_t_error_4342_TooManyCollateralParams(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xe8263e0200000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            function increment_wrapping_t_uint256(value) -> ret {
                ret := cleanup_t_uint256(add(value, 1))
            }

            function require_helper_t_error_4264_CollateralParamsNotSorted(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xb673f32b00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4294_LltvNotAllowed(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x515aa65c00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function cleanup_t_rational_250000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_250000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_250000000000000000_by_1(value)))
            }

            /// @src 7:909:958  "uint256 constant LIQUIDATION_CURSOR_LOW = 0.25e18"
            function constant_LIQUIDATION_CURSOR_LOW_4970() -> ret {
                /// @src 7:951:958  "0.25e18"
                let expr_4969 := 0x03782dace9d90000
                let _190 := convert_t_rational_250000000000000000_by_1_to_t_uint256(expr_4969)

                ret := _190
            }

            function cleanup_t_rational_500000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_500000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_500000000000000000_by_1(value)))
            }

            /// @src 7:960:1009  "uint256 constant LIQUIDATION_CURSOR_HIGH = 0.5e18"
            function constant_LIQUIDATION_CURSOR_HIGH_4973() -> ret {
                /// @src 7:1003:1009  "0.5e18"
                let expr_4972 := 0x06f05b59d3b20000
                let _199 := convert_t_rational_500000000000000000_by_1_to_t_uint256(expr_4972)

                ret := _199
            }

            function require_helper_t_error_4288_InvalidMaxLif(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xb8cd9f1d00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_struct$_MarketState_$4238_storage_to_t_struct$_MarketState_$4238_storage_ptr(value) -> converted {
                converted := value
            }

            function cleanup_t_rational_4_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_4_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(identity(cleanup_t_rational_4_by_1(value)))
            }

            /// @src 7:1191:1230  "uint8 constant DEFAULT_TICK_SPACING = 4"
            function constant_DEFAULT_TICK_SPACING_4989() -> ret {
                /// @src 7:1229:1230  "4"
                let expr_4988 := 0x04
                let _205 := convert_t_rational_4_by_1_to_t_uint8(expr_4988)

                ret := _205
            }

            function shift_left_144(value) -> newValue {
                newValue :=

                shl(144, value)

            }

            function update_byte_slice_1_shift_18(value, toInsert) -> result {
                let mask := 0xff000000000000000000000000000000000000
                toInsert := shift_left_144(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_uint8_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(identity(cleanup_t_uint8(value)))
            }

            function prepare_store_t_uint8(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_18_t_uint8_to_t_uint8(slot, value_0) {
                let convertedValue_0 := convert_t_uint8_to_t_uint8(value_0)
                sstore(slot, update_byte_slice_1_shift_18(sload(slot), prepare_store_t_uint8(convertedValue_0)))
            }

            function array_storeLengthForEncoding_t_array$_t_uint16_$7_memory_ptr(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function extract_from_storage_value_offset_14_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_112_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_16_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_128_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_18_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_144_unsigned(slot_value))
            }

            function shift_right_160_unsigned(value) -> newValue {
                newValue :=

                shr(160, value)

            }

            function extract_from_storage_value_offset_20_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_160_unsigned(slot_value))
            }

            function shift_right_176_unsigned(value) -> newValue {
                newValue :=

                shr(176, value)

            }

            function extract_from_storage_value_offset_22_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_176_unsigned(slot_value))
            }

            function shift_right_192_unsigned(value) -> newValue {
                newValue :=

                shr(192, value)

            }

            function extract_from_storage_value_offset_24_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_192_unsigned(slot_value))
            }

            function shift_right_208_unsigned(value) -> newValue {
                newValue :=

                shr(208, value)

            }

            function extract_from_storage_value_offset_26_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_208_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_28_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_224_unsigned(slot_value))
            }

            function shift_right_240_unsigned(value) -> newValue {
                newValue :=

                shr(240, value)

            }

            function extract_from_storage_value_offset_30_t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_240_unsigned(slot_value))
            }

            // uint16[7] -> uint16[7]
            function abi_encode_t_array$_t_uint16_$7_storage_to_t_array$_t_uint16_$7_memory_ptr(value, pos)  {
                let length := array_length_t_array$_t_uint16_$7_storage(value)
                pos := array_storeLengthForEncoding_t_array$_t_uint16_$7_memory_ptr(pos, length)
                let originalPos := pos
                let srcPtr := array_dataslot_t_array$_t_uint16_$7_storage(value)
                let itemCounter := 0
                if 0 {
                    // Run the loop over all full slots
                    for { } lt(add(itemCounter, sub(16, 1)), length)
                    { itemCounter := add(itemCounter, 16) }
                    {
                        let data := sload(srcPtr)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_0_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_2_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_4_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_6_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_8_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_10_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_12_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_14_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_16_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_18_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_20_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_22_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_24_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_26_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_28_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_30_t_uint16(data), pos)
                        pos := add(pos, 0x20)

                        srcPtr := add(srcPtr, 1)
                    }
                }
                // Handle the last (not necessarily full) slot specially
                if 1 {
                    let data := sload(srcPtr)

                    if 1 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_0_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 1 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_2_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 1 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_4_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 1 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_6_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 1 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_8_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 1 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_10_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 1 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_12_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 0 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_14_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 0 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_16_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 0 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_18_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 0 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_20_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 0 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_22_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 0 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_24_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 0 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_26_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 0 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_28_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                    if 0 {
                        abi_encode_t_uint16_to_t_uint16(extract_from_storage_value_offset_30_t_uint16(data), pos)
                        pos := add(pos, 0x20)
                        itemCounter := add(itemCounter, 1)
                    }

                }

            }

            function abi_encodeUpdatedPos_t_array$_t_uint16_$7_storage_to_t_array$_t_uint16_$7_memory_ptr(value0, pos) -> updatedPos {
                abi_encode_t_array$_t_uint16_$7_storage_to_t_array$_t_uint16_$7_memory_ptr(value0, pos)
                updatedPos := add(pos, 0xe0)
            }

            function copy_array_from_storage_to_memory_t_array$_t_uint16_$7_storage(slot) -> memPtr {
                memPtr := allocate_unbounded()
                let end := abi_encodeUpdatedPos_t_array$_t_uint16_$7_storage_to_t_array$_t_uint16_$7_memory_ptr(slot, memPtr)
                finalize_allocation(memPtr, sub(end, memPtr))
            }

            function convert_array_t_array$_t_uint16_$7_storage_to_t_array$_t_uint16_$7_memory_ptr(value) -> converted  {

                // Copy the array to a free position in memory
                converted :=

                copy_array_from_storage_to_memory_t_array$_t_uint16_$7_storage(value)

            }

            function memory_array_index_access_t_array$_t_uint16_$7_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_uint16_$7_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                addr := add(baseRef, offset)
            }

            function read_from_memoryt_uint16(ptr) -> returnValue {

                let value := cleanup_t_uint16(mload(ptr))

                returnValue :=

                value

            }

            function update_byte_slice_2_shift_0(value, toInsert) -> result {
                let mask := 65535
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_uint16_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(identity(cleanup_t_uint16(value)))
            }

            function prepare_store_t_uint16(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0_t_uint16_to_t_uint16(slot, value_0) {
                let convertedValue_0 := convert_t_uint16_to_t_uint16(value_0)
                sstore(slot, update_byte_slice_2_shift_0(sload(slot), prepare_store_t_uint16(convertedValue_0)))
            }

            function cleanup_t_rational_1_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1_by_1(value)))
            }

            function shift_left_16(value) -> newValue {
                newValue :=

                shl(16, value)

            }

            function update_byte_slice_2_shift_2(value, toInsert) -> result {
                let mask := 0xffff0000
                toInsert := shift_left_16(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_2_t_uint16_to_t_uint16(slot, value_0) {
                let convertedValue_0 := convert_t_uint16_to_t_uint16(value_0)
                sstore(slot, update_byte_slice_2_shift_2(sload(slot), prepare_store_t_uint16(convertedValue_0)))
            }

            function cleanup_t_rational_2_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_2_by_1(value)))
            }

            function shift_left_32(value) -> newValue {
                newValue :=

                shl(32, value)

            }

            function update_byte_slice_2_shift_4(value, toInsert) -> result {
                let mask := 0xffff00000000
                toInsert := shift_left_32(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_4_t_uint16_to_t_uint16(slot, value_0) {
                let convertedValue_0 := convert_t_uint16_to_t_uint16(value_0)
                sstore(slot, update_byte_slice_2_shift_4(sload(slot), prepare_store_t_uint16(convertedValue_0)))
            }

            function cleanup_t_rational_3_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_3_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_3_by_1(value)))
            }

            function shift_left_48(value) -> newValue {
                newValue :=

                shl(48, value)

            }

            function update_byte_slice_2_shift_6(value, toInsert) -> result {
                let mask := 0xffff000000000000
                toInsert := shift_left_48(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_6_t_uint16_to_t_uint16(slot, value_0) {
                let convertedValue_0 := convert_t_uint16_to_t_uint16(value_0)
                sstore(slot, update_byte_slice_2_shift_6(sload(slot), prepare_store_t_uint16(convertedValue_0)))
            }

            function convert_t_rational_4_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_4_by_1(value)))
            }

            function shift_left_64(value) -> newValue {
                newValue :=

                shl(64, value)

            }

            function update_byte_slice_2_shift_8(value, toInsert) -> result {
                let mask := 0xffff0000000000000000
                toInsert := shift_left_64(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_8_t_uint16_to_t_uint16(slot, value_0) {
                let convertedValue_0 := convert_t_uint16_to_t_uint16(value_0)
                sstore(slot, update_byte_slice_2_shift_8(sload(slot), prepare_store_t_uint16(convertedValue_0)))
            }

            function cleanup_t_rational_5_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_5_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_5_by_1(value)))
            }

            function shift_left_80(value) -> newValue {
                newValue :=

                shl(80, value)

            }

            function update_byte_slice_2_shift_10(value, toInsert) -> result {
                let mask := 0xffff00000000000000000000
                toInsert := shift_left_80(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_10_t_uint16_to_t_uint16(slot, value_0) {
                let convertedValue_0 := convert_t_uint16_to_t_uint16(value_0)
                sstore(slot, update_byte_slice_2_shift_10(sload(slot), prepare_store_t_uint16(convertedValue_0)))
            }

            function cleanup_t_rational_6_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_6_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_6_by_1(value)))
            }

            function shift_left_96(value) -> newValue {
                newValue :=

                shl(96, value)

            }

            function update_byte_slice_2_shift_12(value, toInsert) -> result {
                let mask := 0xffff000000000000000000000000
                toInsert := shift_left_96(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_12_t_uint16_to_t_uint16(slot, value_0) {
                let convertedValue_0 := convert_t_uint16_to_t_uint16(value_0)
                sstore(slot, update_byte_slice_2_shift_12(sload(slot), prepare_store_t_uint16(convertedValue_0)))
            }

            function extract_from_storage_value_offset_0_t_uint32(slot_value) -> value {
                value := cleanup_from_storage_t_uint32(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint32(slot) -> value {
                value := extract_from_storage_value_offset_0_t_uint32(sload(slot))

            }

            function shift_left_112(value) -> newValue {
                newValue :=

                shl(112, value)

            }

            function update_byte_slice_4_shift_14(value, toInsert) -> result {
                let mask := 0xffffffff0000000000000000000000000000
                toInsert := shift_left_112(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_14_t_uint32_to_t_uint32(slot, value_0) {
                let convertedValue_0 := convert_t_uint32_to_t_uint32(value_0)
                sstore(slot, update_byte_slice_4_shift_14(sload(slot), prepare_store_t_uint32(convertedValue_0)))
            }

            /// @ast-id 3092
            /// @src 0:40240:42404  "function touchMarket(Market memory market) public returns (bytes32) {..."
            function fun_touchMarket_3092(var_market_2854_mpos) -> var__2857 {
                /// @src 0:40299:40306  "bytes32"
                let zero_t_bytes32_140 := zero_value_for_split_t_bytes32()
                var__2857 := zero_t_bytes32_140

                /// @src 0:40336:40342  "market"
                let _141_mpos := var_market_2854_mpos
                let expr_2862_mpos := _141_mpos
                /// @src 0:40331:40343  "toId(market)"
                let expr_2863 := fun_toId_3477(expr_2862_mpos)
                /// @src 0:40318:40343  "bytes32 id = toId(market)"
                let var_id_2860 := expr_2863
                /// @src 0:40357:40368  "marketState"
                let _142_slot := 0x01
                let expr_2865_slot := _142_slot
                /// @src 0:40369:40371  "id"
                let _143 := var_id_2860
                let expr_2866 := _143
                /// @src 0:40357:40372  "marketState[id]"
                let _144 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_2865_slot,expr_2866)
                let _145_slot := _144
                let expr_2867_slot := _145_slot
                /// @src 0:40357:40384  "marketState[id].tickSpacing"
                let _146 := add(expr_2867_slot, 2)
                let _147 := read_from_storage_split_offset_18_t_uint8(_146)
                let expr_2868 := _147
                /// @src 0:40388:40389  "0"
                let expr_2869 := 0x00
                /// @src 0:40357:40389  "marketState[id].tickSpacing == 0"
                let expr_2870 := eq(cleanup_t_uint8(expr_2868), convert_t_rational_0_by_1_to_t_uint8(expr_2869))
                /// @src 0:40353:42379  "if (marketState[id].tickSpacing == 0) {..."
                if expr_2870 {
                    /// @src 0:40413:40419  "market"
                    let _148_mpos := var_market_2854_mpos
                    let expr_2872_mpos := _148_mpos
                    /// @src 0:40413:40428  "market.maturity"
                    let _149 := add(expr_2872_mpos, 64)
                    let _150 := read_from_memoryt_uint256(_149)
                    let expr_2873 := _150
                    /// @src 0:40432:40447  "block.timestamp"
                    let expr_2875 := timestamp()
                    /// @src 0:40450:40464  "100 * 365 days"
                    let expr_2878 := 0xbbf81e00
                    /// @src 0:40432:40464  "block.timestamp + 100 * 365 days"
                    let expr_2879 := checked_add_t_uint256(expr_2875, convert_t_rational_3153600000_by_1_to_t_uint256(expr_2878))

                    /// @src 0:40413:40464  "market.maturity <= block.timestamp + 100 * 365 days"
                    let expr_2880 := iszero(gt(cleanup_t_uint256(expr_2873), cleanup_t_uint256(expr_2879)))
                    /// @src 0:40405:40483  "require(market.maturity <= block.timestamp + 100 * 365 days, MaturityTooFar())"
                    require_helper_t_error_4298_MaturityTooFar(expr_2880)
                    /// @src 0:40505:40511  "market"
                    let _151_mpos := var_market_2854_mpos
                    let expr_2886_mpos := _151_mpos
                    /// @src 0:40505:40528  "market.collateralParams"
                    let _152 := add(expr_2886_mpos, 32)
                    let _153_mpos := mload(_152)
                    let expr_2887_mpos := _153_mpos
                    /// @src 0:40505:40535  "market.collateralParams.length"
                    let expr_2888 := array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_2887_mpos)
                    /// @src 0:40538:40539  "0"
                    let expr_2889 := 0x00
                    /// @src 0:40505:40539  "market.collateralParams.length > 0"
                    let expr_2890 := gt(cleanup_t_uint256(expr_2888), convert_t_rational_0_by_1_to_t_uint256(expr_2889))
                    /// @src 0:40497:40562  "require(market.collateralParams.length > 0, NoCollateralParams())"
                    require_helper_t_error_4302_NoCollateralParams(expr_2890)
                    /// @src 0:40584:40590  "market"
                    let _154_mpos := var_market_2854_mpos
                    let expr_2896_mpos := _154_mpos
                    /// @src 0:40584:40607  "market.collateralParams"
                    let _155 := add(expr_2896_mpos, 32)
                    let _156_mpos := mload(_155)
                    let expr_2897_mpos := _156_mpos
                    /// @src 0:40584:40614  "market.collateralParams.length"
                    let expr_2898 := array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_2897_mpos)
                    /// @src 0:40618:40633  "MAX_COLLATERALS"
                    let expr_2899 := constant_MAX_COLLATERALS_4964()
                    /// @src 0:40584:40633  "market.collateralParams.length <= MAX_COLLATERALS"
                    let expr_2900 := iszero(gt(cleanup_t_uint256(expr_2898), cleanup_t_uint256(expr_2899)))
                    /// @src 0:40576:40661  "require(market.collateralParams.length <= MAX_COLLATERALS, TooManyCollateralParams())"
                    require_helper_t_error_4342_TooManyCollateralParams(expr_2900)
                    /// @src 0:40675:40706  "address previousCollateralToken"
                    let var_previousCollateralToken_2906
                    let zero_t_address_158 := zero_value_for_split_t_address()
                    var_previousCollateralToken_2906 := zero_t_address_158
                    /// @src 0:40720:41433  "for (uint256 i = 0; i < market.collateralParams.length; i++) {..."
                    for {
                        /// @src 0:40737:40738  "0"
                        let expr_2910 := 0x00
                        /// @src 0:40725:40738  "uint256 i = 0"
                        let var_i_2909 := convert_t_rational_0_by_1_to_t_uint256(expr_2910)
                        } 1 {
                        /// @src 0:40776:40779  "i++"
                        let _160 := var_i_2909
                        let _159 := increment_wrapping_t_uint256(_160)
                        var_i_2909 := _159
                        let expr_2918 := _160
                    }
                    {
                        /// @src 0:40740:40741  "i"
                        let _161 := var_i_2909
                        let expr_2912 := _161
                        /// @src 0:40744:40750  "market"
                        let _162_mpos := var_market_2854_mpos
                        let expr_2913_mpos := _162_mpos
                        /// @src 0:40744:40767  "market.collateralParams"
                        let _163 := add(expr_2913_mpos, 32)
                        let _164_mpos := mload(_163)
                        let expr_2914_mpos := _164_mpos
                        /// @src 0:40744:40774  "market.collateralParams.length"
                        let expr_2915 := array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_2914_mpos)
                        /// @src 0:40740:40774  "i < market.collateralParams.length"
                        let expr_2916 := lt(cleanup_t_uint256(expr_2912), cleanup_t_uint256(expr_2915))
                        if iszero(expr_2916) { break }
                        /// @src 0:40825:40831  "market"
                        let _165_mpos := var_market_2854_mpos
                        let expr_2922_mpos := _165_mpos
                        /// @src 0:40825:40848  "market.collateralParams"
                        let _166 := add(expr_2922_mpos, 32)
                        let _167_mpos := mload(_166)
                        let expr_2923_mpos := _167_mpos
                        /// @src 0:40849:40850  "i"
                        let _168 := var_i_2909
                        let expr_2924 := _168
                        /// @src 0:40825:40851  "market.collateralParams[i]"
                        let _169_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_2923_mpos, expr_2924))
                        let expr_2925_mpos := _169_mpos
                        /// @src 0:40825:40857  "market.collateralParams[i].token"
                        let _170 := add(expr_2925_mpos, 0)
                        let _171 := read_from_memoryt_address(_170)
                        let expr_2926 := _171
                        /// @src 0:40799:40857  "address collateralToken = market.collateralParams[i].token"
                        let var_collateralToken_2921 := expr_2926
                        /// @src 0:40883:40898  "collateralToken"
                        let _172 := var_collateralToken_2921
                        let expr_2929 := _172
                        /// @src 0:40901:40924  "previousCollateralToken"
                        let _173 := var_previousCollateralToken_2906
                        let expr_2930 := _173
                        /// @src 0:40883:40924  "collateralToken > previousCollateralToken"
                        let expr_2931 := gt(cleanup_t_address(expr_2929), cleanup_t_address(expr_2930))
                        /// @src 0:40875:40954  "require(collateralToken > previousCollateralToken, CollateralParamsNotSorted())"
                        require_helper_t_error_4264_CollateralParamsNotSorted(expr_2931)
                        /// @src 0:40987:40993  "market"
                        let _174_mpos := var_market_2854_mpos
                        let expr_2938_mpos := _174_mpos
                        /// @src 0:40987:41010  "market.collateralParams"
                        let _175 := add(expr_2938_mpos, 32)
                        let _176_mpos := mload(_175)
                        let expr_2939_mpos := _176_mpos
                        /// @src 0:41011:41012  "i"
                        let _177 := var_i_2909
                        let expr_2940 := _177
                        /// @src 0:40987:41013  "market.collateralParams[i]"
                        let _178_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_2939_mpos, expr_2940))
                        let expr_2941_mpos := _178_mpos
                        /// @src 0:40987:41018  "market.collateralParams[i].lltv"
                        let _179 := add(expr_2941_mpos, 32)
                        let _180 := read_from_memoryt_uint256(_179)
                        let expr_2942 := _180
                        /// @src 0:40972:41018  "uint256 lltv = market.collateralParams[i].lltv"
                        let var_lltv_2937 := expr_2942
                        /// @src 0:41058:41062  "lltv"
                        let _181 := var_lltv_2937
                        let expr_2946 := _181
                        /// @src 0:41044:41063  "isLltvAllowed(lltv)"
                        let expr_2947 := fun_isLltvAllowed_5062(expr_2946)
                        /// @src 0:41036:41082  "require(isLltvAllowed(lltv), LltvNotAllowed())"
                        require_helper_t_error_4294_LltvNotAllowed(expr_2947)
                        /// @src 0:41129:41135  "market"
                        let _182_mpos := var_market_2854_mpos
                        let expr_2953_mpos := _182_mpos
                        /// @src 0:41129:41152  "market.collateralParams"
                        let _183 := add(expr_2953_mpos, 32)
                        let _184_mpos := mload(_183)
                        let expr_2954_mpos := _184_mpos
                        /// @src 0:41153:41154  "i"
                        let _185 := var_i_2909
                        let expr_2955 := _185
                        /// @src 0:41129:41155  "market.collateralParams[i]"
                        let _186_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_2954_mpos, expr_2955))
                        let expr_2956_mpos := _186_mpos
                        /// @src 0:41129:41162  "market.collateralParams[i].maxLif"
                        let _187 := add(expr_2956_mpos, 64)
                        let _188 := read_from_memoryt_uint256(_187)
                        let expr_2957 := _188
                        /// @src 0:41173:41177  "lltv"
                        let _189 := var_lltv_2937
                        let expr_2959 := _189
                        /// @src 0:41179:41201  "LIQUIDATION_CURSOR_LOW"
                        let expr_2960 := constant_LIQUIDATION_CURSOR_LOW_4970()
                        /// @src 0:41166:41202  "maxLif(lltv, LIQUIDATION_CURSOR_LOW)"
                        let expr_2961 := fun_maxLif_5109(expr_2959, expr_2960)
                        /// @src 0:41129:41202  "market.collateralParams[i].maxLif == maxLif(lltv, LIQUIDATION_CURSOR_LOW)"
                        let expr_2962 := eq(cleanup_t_uint256(expr_2957), cleanup_t_uint256(expr_2961))
                        /// @src 0:41129:41304  "market.collateralParams[i].maxLif == maxLif(lltv, LIQUIDATION_CURSOR_LOW)..."
                        let expr_2973 := expr_2962
                        if iszero(expr_2973) {
                            /// @src 0:41230:41236  "market"
                            let _191_mpos := var_market_2854_mpos
                            let expr_2963_mpos := _191_mpos
                            /// @src 0:41230:41253  "market.collateralParams"
                            let _192 := add(expr_2963_mpos, 32)
                            let _193_mpos := mload(_192)
                            let expr_2964_mpos := _193_mpos
                            /// @src 0:41254:41255  "i"
                            let _194 := var_i_2909
                            let expr_2965 := _194
                            /// @src 0:41230:41256  "market.collateralParams[i]"
                            let _195_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_2964_mpos, expr_2965))
                            let expr_2966_mpos := _195_mpos
                            /// @src 0:41230:41263  "market.collateralParams[i].maxLif"
                            let _196 := add(expr_2966_mpos, 64)
                            let _197 := read_from_memoryt_uint256(_196)
                            let expr_2967 := _197
                            /// @src 0:41274:41278  "lltv"
                            let _198 := var_lltv_2937
                            let expr_2969 := _198
                            /// @src 0:41280:41303  "LIQUIDATION_CURSOR_HIGH"
                            let expr_2970 := constant_LIQUIDATION_CURSOR_HIGH_4973()
                            /// @src 0:41267:41304  "maxLif(lltv, LIQUIDATION_CURSOR_HIGH)"
                            let expr_2971 := fun_maxLif_5109(expr_2969, expr_2970)
                            /// @src 0:41230:41304  "market.collateralParams[i].maxLif == maxLif(lltv, LIQUIDATION_CURSOR_HIGH)"
                            let expr_2972 := eq(cleanup_t_uint256(expr_2967), cleanup_t_uint256(expr_2971))
                            /// @src 0:41129:41304  "market.collateralParams[i].maxLif == maxLif(lltv, LIQUIDATION_CURSOR_LOW)..."
                            expr_2973 := expr_2972
                        }
                        /// @src 0:41100:41359  "require(..."
                        require_helper_t_error_4288_InvalidMaxLif(expr_2973)
                        /// @src 0:41403:41418  "collateralToken"
                        let _200 := var_collateralToken_2921
                        let expr_2979 := _200
                        /// @src 0:41377:41418  "previousCollateralToken = collateralToken"
                        var_previousCollateralToken_2906 := expr_2979
                        let expr_2980 := expr_2979
                    }
                    /// @src 0:41482:41493  "marketState"
                    let _201_slot := 0x01
                    let expr_2987_slot := _201_slot
                    /// @src 0:41494:41496  "id"
                    let _202 := var_id_2860
                    let expr_2988 := _202
                    /// @src 0:41482:41497  "marketState[id]"
                    let _203 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_2987_slot,expr_2988)
                    let _204_slot := _203
                    let expr_2989_slot := _204_slot
                    /// @src 0:41447:41497  "MarketState storage _marketState = marketState[id]"
                    let var__marketState_2986_slot := convert_t_struct$_MarketState_$4238_storage_to_t_struct$_MarketState_$4238_storage_ptr(expr_2989_slot)
                    /// @src 0:41538:41558  "DEFAULT_TICK_SPACING"
                    let expr_2994 := constant_DEFAULT_TICK_SPACING_4989()
                    /// @src 0:41511:41523  "_marketState"
                    let _206_slot := var__marketState_2986_slot
                    let expr_2991_slot := _206_slot
                    /// @src 0:41511:41535  "_marketState.tickSpacing"
                    let _207 := add(expr_2991_slot, 2)
                    /// @src 0:41511:41558  "_marketState.tickSpacing = DEFAULT_TICK_SPACING"
                    update_storage_value_offset_18_t_uint8_to_t_uint8(_207, expr_2994)
                    let expr_2995 := expr_2994
                    /// @src 0:41579:41580  "7"
                    let expr_2999 := 0x07
                    /// @src 0:41616:41639  "defaultSettlementFeeCbp"
                    let _208_slot := 0x04
                    let expr_3003_slot := _208_slot
                    /// @src 0:41640:41646  "market"
                    let _209_mpos := var_market_2854_mpos
                    let expr_3004_mpos := _209_mpos
                    /// @src 0:41640:41656  "market.loanToken"
                    let _210 := add(expr_3004_mpos, 0)
                    let _211 := read_from_memoryt_address(_210)
                    let expr_3005 := _211
                    /// @src 0:41616:41657  "defaultSettlementFeeCbp[market.loanToken]"
                    let _212 := mapping_index_access_t_mapping$_t_address_$_t_array$_t_uint16_$7_storage_$_of_t_address(expr_3003_slot,expr_3005)
                    let _213_slot := _212
                    let expr_3006_slot := _213_slot
                    /// @src 0:41572:41657  "uint16[7] memory _defaultSettlementFeeCbp = defaultSettlementFeeCbp[market.loanToken]"
                    let var__defaultSettlementFeeCbp_3002_mpos := convert_array_t_array$_t_uint16_$7_storage_to_t_array$_t_uint16_$7_memory_ptr(expr_3006_slot)
                    /// @src 0:41704:41728  "_defaultSettlementFeeCbp"
                    let _214_mpos := var__defaultSettlementFeeCbp_3002_mpos
                    let expr_3011_mpos := _214_mpos
                    /// @src 0:41729:41730  "0"
                    let expr_3012 := 0x00
                    /// @src 0:41704:41731  "_defaultSettlementFeeCbp[0]"
                    let _215 := read_from_memoryt_uint16(memory_array_index_access_t_array$_t_uint16_$7_memory_ptr(expr_3011_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_3012)))
                    let expr_3013 := _215
                    /// @src 0:41671:41683  "_marketState"
                    let _216_slot := var__marketState_2986_slot
                    let expr_3008_slot := _216_slot
                    /// @src 0:41671:41701  "_marketState.settlementFeeCbp0"
                    let _217 := add(expr_3008_slot, 2)
                    /// @src 0:41671:41731  "_marketState.settlementFeeCbp0 = _defaultSettlementFeeCbp[0]"
                    update_storage_value_offset_0_t_uint16_to_t_uint16(_217, expr_3013)
                    let expr_3014 := expr_3013
                    /// @src 0:41778:41802  "_defaultSettlementFeeCbp"
                    let _218_mpos := var__defaultSettlementFeeCbp_3002_mpos
                    let expr_3019_mpos := _218_mpos
                    /// @src 0:41803:41804  "1"
                    let expr_3020 := 0x01
                    /// @src 0:41778:41805  "_defaultSettlementFeeCbp[1]"
                    let _219 := read_from_memoryt_uint16(memory_array_index_access_t_array$_t_uint16_$7_memory_ptr(expr_3019_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_3020)))
                    let expr_3021 := _219
                    /// @src 0:41745:41757  "_marketState"
                    let _220_slot := var__marketState_2986_slot
                    let expr_3016_slot := _220_slot
                    /// @src 0:41745:41775  "_marketState.settlementFeeCbp1"
                    let _221 := add(expr_3016_slot, 2)
                    /// @src 0:41745:41805  "_marketState.settlementFeeCbp1 = _defaultSettlementFeeCbp[1]"
                    update_storage_value_offset_2_t_uint16_to_t_uint16(_221, expr_3021)
                    let expr_3022 := expr_3021
                    /// @src 0:41852:41876  "_defaultSettlementFeeCbp"
                    let _222_mpos := var__defaultSettlementFeeCbp_3002_mpos
                    let expr_3027_mpos := _222_mpos
                    /// @src 0:41877:41878  "2"
                    let expr_3028 := 0x02
                    /// @src 0:41852:41879  "_defaultSettlementFeeCbp[2]"
                    let _223 := read_from_memoryt_uint16(memory_array_index_access_t_array$_t_uint16_$7_memory_ptr(expr_3027_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_3028)))
                    let expr_3029 := _223
                    /// @src 0:41819:41831  "_marketState"
                    let _224_slot := var__marketState_2986_slot
                    let expr_3024_slot := _224_slot
                    /// @src 0:41819:41849  "_marketState.settlementFeeCbp2"
                    let _225 := add(expr_3024_slot, 2)
                    /// @src 0:41819:41879  "_marketState.settlementFeeCbp2 = _defaultSettlementFeeCbp[2]"
                    update_storage_value_offset_4_t_uint16_to_t_uint16(_225, expr_3029)
                    let expr_3030 := expr_3029
                    /// @src 0:41926:41950  "_defaultSettlementFeeCbp"
                    let _226_mpos := var__defaultSettlementFeeCbp_3002_mpos
                    let expr_3035_mpos := _226_mpos
                    /// @src 0:41951:41952  "3"
                    let expr_3036 := 0x03
                    /// @src 0:41926:41953  "_defaultSettlementFeeCbp[3]"
                    let _227 := read_from_memoryt_uint16(memory_array_index_access_t_array$_t_uint16_$7_memory_ptr(expr_3035_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_3036)))
                    let expr_3037 := _227
                    /// @src 0:41893:41905  "_marketState"
                    let _228_slot := var__marketState_2986_slot
                    let expr_3032_slot := _228_slot
                    /// @src 0:41893:41923  "_marketState.settlementFeeCbp3"
                    let _229 := add(expr_3032_slot, 2)
                    /// @src 0:41893:41953  "_marketState.settlementFeeCbp3 = _defaultSettlementFeeCbp[3]"
                    update_storage_value_offset_6_t_uint16_to_t_uint16(_229, expr_3037)
                    let expr_3038 := expr_3037
                    /// @src 0:42000:42024  "_defaultSettlementFeeCbp"
                    let _230_mpos := var__defaultSettlementFeeCbp_3002_mpos
                    let expr_3043_mpos := _230_mpos
                    /// @src 0:42025:42026  "4"
                    let expr_3044 := 0x04
                    /// @src 0:42000:42027  "_defaultSettlementFeeCbp[4]"
                    let _231 := read_from_memoryt_uint16(memory_array_index_access_t_array$_t_uint16_$7_memory_ptr(expr_3043_mpos, convert_t_rational_4_by_1_to_t_uint256(expr_3044)))
                    let expr_3045 := _231
                    /// @src 0:41967:41979  "_marketState"
                    let _232_slot := var__marketState_2986_slot
                    let expr_3040_slot := _232_slot
                    /// @src 0:41967:41997  "_marketState.settlementFeeCbp4"
                    let _233 := add(expr_3040_slot, 2)
                    /// @src 0:41967:42027  "_marketState.settlementFeeCbp4 = _defaultSettlementFeeCbp[4]"
                    update_storage_value_offset_8_t_uint16_to_t_uint16(_233, expr_3045)
                    let expr_3046 := expr_3045
                    /// @src 0:42074:42098  "_defaultSettlementFeeCbp"
                    let _234_mpos := var__defaultSettlementFeeCbp_3002_mpos
                    let expr_3051_mpos := _234_mpos
                    /// @src 0:42099:42100  "5"
                    let expr_3052 := 0x05
                    /// @src 0:42074:42101  "_defaultSettlementFeeCbp[5]"
                    let _235 := read_from_memoryt_uint16(memory_array_index_access_t_array$_t_uint16_$7_memory_ptr(expr_3051_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_3052)))
                    let expr_3053 := _235
                    /// @src 0:42041:42053  "_marketState"
                    let _236_slot := var__marketState_2986_slot
                    let expr_3048_slot := _236_slot
                    /// @src 0:42041:42071  "_marketState.settlementFeeCbp5"
                    let _237 := add(expr_3048_slot, 2)
                    /// @src 0:42041:42101  "_marketState.settlementFeeCbp5 = _defaultSettlementFeeCbp[5]"
                    update_storage_value_offset_10_t_uint16_to_t_uint16(_237, expr_3053)
                    let expr_3054 := expr_3053
                    /// @src 0:42148:42172  "_defaultSettlementFeeCbp"
                    let _238_mpos := var__defaultSettlementFeeCbp_3002_mpos
                    let expr_3059_mpos := _238_mpos
                    /// @src 0:42173:42174  "6"
                    let expr_3060 := 0x06
                    /// @src 0:42148:42175  "_defaultSettlementFeeCbp[6]"
                    let _239 := read_from_memoryt_uint16(memory_array_index_access_t_array$_t_uint16_$7_memory_ptr(expr_3059_mpos, convert_t_rational_6_by_1_to_t_uint256(expr_3060)))
                    let expr_3061 := _239
                    /// @src 0:42115:42127  "_marketState"
                    let _240_slot := var__marketState_2986_slot
                    let expr_3056_slot := _240_slot
                    /// @src 0:42115:42145  "_marketState.settlementFeeCbp6"
                    let _241 := add(expr_3056_slot, 2)
                    /// @src 0:42115:42175  "_marketState.settlementFeeCbp6 = _defaultSettlementFeeCbp[6]"
                    update_storage_value_offset_12_t_uint16_to_t_uint16(_241, expr_3061)
                    let expr_3062 := expr_3061
                    /// @src 0:42218:42238  "defaultContinuousFee"
                    let _242_slot := 0x05
                    let expr_3067_slot := _242_slot
                    /// @src 0:42239:42245  "market"
                    let _243_mpos := var_market_2854_mpos
                    let expr_3068_mpos := _243_mpos
                    /// @src 0:42239:42255  "market.loanToken"
                    let _244 := add(expr_3068_mpos, 0)
                    let _245 := read_from_memoryt_address(_244)
                    let expr_3069 := _245
                    /// @src 0:42218:42256  "defaultContinuousFee[market.loanToken]"
                    let _246 := mapping_index_access_t_mapping$_t_address_$_t_uint32_$_of_t_address(expr_3067_slot,expr_3069)
                    let _247 := read_from_storage_split_offset_0_t_uint32(_246)
                    let expr_3070 := _247
                    /// @src 0:42189:42201  "_marketState"
                    let _248_slot := var__marketState_2986_slot
                    let expr_3064_slot := _248_slot
                    /// @src 0:42189:42215  "_marketState.continuousFee"
                    let _249 := add(expr_3064_slot, 2)
                    /// @src 0:42189:42256  "_marketState.continuousFee = defaultContinuousFee[market.loanToken]"
                    update_storage_value_offset_14_t_uint32_to_t_uint32(_249, expr_3070)
                    let expr_3071 := expr_3070
                    /// @src 0:42270:42275  "IdLib"
                    let expr_3073_address := linkersymbol("deps/midnight/src/libraries/IdLib.sol:IdLib")
                    /// @src 0:42288:42294  "market"
                    let _250_mpos := var_market_2854_mpos
                    let expr_3076_mpos := _250_mpos
                    /// @src 0:42296:42312  "INITIAL_CHAIN_ID"
                    let _251 := loadimmutable("39")
                    let expr_3077 := _251
                    /// @src 0:42270:42313  "IdLib.storeInCode(market, INITIAL_CHAIN_ID)"
                    let expr_3078 := fun_storeInCode_5434(expr_3076_mpos, expr_3077)
                    /// @src 0:42333:42342  "EventsLib"
                    let expr_3080_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                    /// @src 0:42357:42363  "market"
                    let _252_mpos := var_market_2854_mpos
                    let expr_3083_mpos := _252_mpos
                    /// @src 0:42365:42367  "id"
                    let _253 := var_id_2860
                    let expr_3084 := _253
                    /// @src 0:42333:42368  "EventsLib.MarketCreated(market, id)"
                    let _254 := 0x9dd8b41002a91b0d3012878d3ad9d9521a381ce66f064246f7db07355bf9749e
                    let _255 := convert_t_bytes32_to_t_bytes32(expr_3084)
                    {
                        let _256 := allocate_unbounded()
                        let _257 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(_256 , expr_3083_mpos)
                        log2(_256, sub(_257, _256) , _254, _255)
                    }/// @src 0:40353:42379  "if (marketState[id].tickSpacing == 0) {..."
                }
                /// @src 0:42395:42397  "id"
                let _258 := var_id_2860
                let expr_3089 := _258
                /// @src 0:42388:42397  "return id"
                var__2857 := expr_3089
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function convert_t_contract$_Midnight_$3973_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            /// @ast-id 3477
            /// @src 0:46154:46295  "function toId(Market memory market) public view returns (bytes32) {..."
            function fun_toId_3477(var_market_3461_mpos) -> var__3464 {
                /// @src 0:46211:46218  "bytes32"
                let zero_t_bytes32_259 := zero_value_for_split_t_bytes32()
                var__3464 := zero_t_bytes32_259

                /// @src 0:46237:46242  "IdLib"
                let expr_3466_address := linkersymbol("deps/midnight/src/libraries/IdLib.sol:IdLib")
                /// @src 0:46248:46254  "market"
                let _260_mpos := var_market_3461_mpos
                let expr_3468_mpos := _260_mpos
                /// @src 0:46256:46272  "INITIAL_CHAIN_ID"
                let _261 := loadimmutable("39")
                let expr_3469 := _261
                /// @src 0:46282:46286  "this"
                let expr_3472_address := address()
                /// @src 0:46274:46287  "address(this)"
                let expr_3473 := convert_t_contract$_Midnight_$3973_to_t_address(expr_3472_address)
                /// @src 0:46237:46288  "IdLib.toId(market, INITIAL_CHAIN_ID, address(this))"
                let expr_3474 := fun_toId_5399(expr_3468_mpos, expr_3469, expr_3473)
                /// @src 0:46230:46288  "return IdLib.toId(market, INITIAL_CHAIN_ID, address(this))"
                var__3464 := expr_3474
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 588
            /// @src 0:17910:18514  "function setMarketContinuousFee(bytes32 id, uint256 newContinuousFee) external {..."
            function fun_setMarketContinuousFee_588(var_id_533, var_newContinuousFee_535) {

                /// @src 0:18034:18045  "marketState"
                let _262_slot := 0x01
                let expr_541_slot := _262_slot
                /// @src 0:18046:18048  "id"
                let _263 := var_id_533
                let expr_542 := _263
                /// @src 0:18034:18049  "marketState[id]"
                let _264 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_541_slot,expr_542)
                let _265_slot := _264
                let expr_543_slot := _265_slot
                /// @src 0:17999:18049  "MarketState storage _marketState = marketState[id]"
                let var__marketState_540_slot := convert_t_struct$_MarketState_$4238_storage_to_t_struct$_MarketState_$4238_storage_ptr(expr_543_slot)
                /// @src 0:18067:18077  "msg.sender"
                let expr_547 := caller()
                /// @src 0:18081:18090  "feeSetter"
                let _266 := read_from_storage_split_offset_0_t_address(0x08)
                let expr_548 := _266
                /// @src 0:18067:18090  "msg.sender == feeSetter"
                let expr_549 := eq(cleanup_t_address(expr_547), cleanup_t_address(expr_548))
                /// @src 0:18059:18108  "require(msg.sender == feeSetter, OnlyFeeSetter())"
                require_helper_t_error_4318_OnlyFeeSetter(expr_549)
                /// @src 0:18126:18142  "newContinuousFee"
                let _267 := var_newContinuousFee_535
                let expr_555 := _267
                /// @src 0:18146:18164  "MAX_CONTINUOUS_FEE"
                let expr_556 := constant_MAX_CONTINUOUS_FEE_4958()
                /// @src 0:18126:18164  "newContinuousFee <= MAX_CONTINUOUS_FEE"
                let expr_557 := iszero(gt(cleanup_t_uint256(expr_555), convert_t_uint32_to_t_uint256(expr_556)))
                /// @src 0:18118:18189  "require(newContinuousFee <= MAX_CONTINUOUS_FEE, ContinuousFeeTooHigh())"
                require_helper_t_error_4270_ContinuousFeeTooHigh(expr_557)
                /// @src 0:18207:18219  "_marketState"
                let _268_slot := var__marketState_540_slot
                let expr_563_slot := _268_slot
                /// @src 0:18207:18231  "_marketState.tickSpacing"
                let _269 := add(expr_563_slot, 2)
                let _270 := read_from_storage_split_offset_18_t_uint8(_269)
                let expr_564 := _270
                /// @src 0:18234:18235  "0"
                let expr_565 := 0x00
                /// @src 0:18207:18235  "_marketState.tickSpacing > 0"
                let expr_566 := gt(cleanup_t_uint8(expr_564), convert_t_rational_0_by_1_to_t_uint8(expr_565))
                /// @src 0:18199:18256  "require(_marketState.tickSpacing > 0, MarketNotCreated())"
                require_helper_t_error_4310_MarketNotCreated(expr_566)
                /// @src 0:18421:18437  "newContinuousFee"
                let _271 := var_newContinuousFee_535
                let expr_576 := _271
                /// @src 0:18414:18438  "uint32(newContinuousFee)"
                let expr_577 := convert_t_uint256_to_t_uint32(expr_576)
                /// @src 0:18385:18397  "_marketState"
                let _272_slot := var__marketState_540_slot
                let expr_571_slot := _272_slot
                /// @src 0:18385:18411  "_marketState.continuousFee"
                let _273 := add(expr_571_slot, 2)
                /// @src 0:18385:18438  "_marketState.continuousFee = uint32(newContinuousFee)"
                update_storage_value_offset_14_t_uint32_to_t_uint32(_273, expr_577)
                let expr_578 := expr_577
                /// @src 0:18453:18462  "EventsLib"
                let expr_580_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:18486:18488  "id"
                let _274 := var_id_533
                let expr_583 := _274
                /// @src 0:18490:18506  "newContinuousFee"
                let _275 := var_newContinuousFee_535
                let expr_584 := _275
                /// @src 0:18453:18507  "EventsLib.SetMarketContinuousFee(id, newContinuousFee)"
                let _276 := 0xbf609558d120b32620da3fe5220a2e268bda00456bf69e25e6a2c517114cce9b
                let _277 := convert_t_bytes32_to_t_bytes32(expr_583)
                {
                    let _278 := allocate_unbounded()
                    let _279 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_278 , expr_584)
                    log2(_278, sub(_279, _278) , _276, _277)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function extract_from_storage_value_offset_0_t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0_t_bool(sload(slot))

            }

            function require_helper_t_error_4346_Unauthorized(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x82b4290000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function checked_sub_t_uint128(x, y) -> diff {
                x := cleanup_t_uint128(x)
                y := cleanup_t_uint128(y)
                diff := sub(x, y)

                if gt(diff, 0xffffffffffffffffffffffffffffffff) { panic_error_0x11() }

            }

            function update_byte_slice_16_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_uint128_to_t_uint128(value) -> converted {
                converted := cleanup_t_uint128(identity(cleanup_t_uint128(value)))
            }

            function prepare_store_t_uint128(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0_t_uint128_to_t_uint128(slot, value_0) {
                let convertedValue_0 := convert_t_uint128_to_t_uint128(value_0)
                sstore(slot, update_byte_slice_16_shift_0(sload(slot), prepare_store_t_uint128(convertedValue_0)))
            }

            function checked_add_t_uint128(x, y) -> sum {
                x := cleanup_t_uint128(x)
                y := cleanup_t_uint128(y)
                sum := add(x, y)

                if gt(sum, 0xffffffffffffffffffffffffffffffff) { panic_error_0x11() }

            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_rational_0_by_1(value)))
            }

            function convert_t_rational_0_by_1_to_t_address(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function abi_encode_tuple_t_uint256_t_address__to_t_uint256_t_address__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

            }

            function convert_t_uint160_to_t_contract$_IRepayCallback_$4065(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IRepayCallback_$4065(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IRepayCallback_$4065(value)
            }

            function convert_t_contract$_IRepayCallback_$4065_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_decode_t_bytes32_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_bytes32(value)
            }

            function abi_decode_tuple_t_bytes32_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            // bytes -> bytes
            function abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_fromStack(start, length, pos) -> end {
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, length)

                copy_calldata_to_memory_with_cleanup(start, pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            function abi_encode_tuple_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_address_t_bytes_calldata_ptr__to_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_address_t_bytes_memory_ptr__fromStack(headStart , value0, value1, value2, value3, value4, value5) -> tail {
                tail := add(headStart, 160)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                mstore(add(headStart, 32), sub(tail, headStart))
                tail := abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value1,  tail)

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_address_to_t_address_fromStack(value3,  add(headStart, 96))

                mstore(add(headStart, 128), sub(tail, headStart))
                tail := abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_fromStack(value4, value5,  tail)

            }

            /// @src 7:1109:1189  "bytes32 constant CALLBACK_SUCCESS = keccak256(\"morpho.midnight.callbackSuccess\")"
            function constant_CALLBACK_SUCCESS_4986() -> ret {
                /// @src 7:1145:1189  "keccak256(\"morpho.midnight.callbackSuccess\")"
                let expr_4985 := 0x7f87788ea698181ea4d28d1576d0ba4fc92c0dbe5bf75b43692af2ce91dbaea2
                let _328 := expr_4985

                ret := _328
            }

            function require_helper_t_error_4280_WrongRepayCallbackReturnValue(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x40a13da200000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 1785
            /// @src 0:28626:29504  "function repay(Market memory market, uint256 units, address onBehalf, address callback, bytes calldata data)..."
            function fun_repay_1785(var_market_1667_mpos, var_units_1669, var_onBehalf_1671, var_callback_1673, var_data_1675_offset, var_data_1675_length) {

                /// @src 0:28774:28782  "onBehalf"
                let _280 := var_onBehalf_1671
                let expr_1679 := _280
                /// @src 0:28786:28796  "msg.sender"
                let expr_1681 := caller()
                /// @src 0:28774:28796  "onBehalf == msg.sender"
                let expr_1682 := eq(cleanup_t_address(expr_1679), cleanup_t_address(expr_1681))
                /// @src 0:28774:28834  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                let expr_1689 := expr_1682
                if iszero(expr_1689) {
                    /// @src 0:28800:28812  "isAuthorized"
                    let _281_slot := 0x03
                    let expr_1683_slot := _281_slot
                    /// @src 0:28813:28821  "onBehalf"
                    let _282 := var_onBehalf_1671
                    let expr_1684 := _282
                    /// @src 0:28800:28822  "isAuthorized[onBehalf]"
                    let _283 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(expr_1683_slot,expr_1684)
                    let _284_slot := _283
                    let expr_1685_slot := _284_slot
                    /// @src 0:28823:28833  "msg.sender"
                    let expr_1687 := caller()
                    /// @src 0:28800:28834  "isAuthorized[onBehalf][msg.sender]"
                    let _285 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_1685_slot,expr_1687)
                    let _286 := read_from_storage_split_offset_0_t_bool(_285)
                    let expr_1688 := _286
                    /// @src 0:28774:28834  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                    expr_1689 := expr_1688
                }
                /// @src 0:28766:28851  "require(onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender], Unauthorized())"
                require_helper_t_error_4346_Unauthorized(expr_1689)
                /// @src 0:28886:28892  "market"
                let _287_mpos := var_market_1667_mpos
                let expr_1697_mpos := _287_mpos
                /// @src 0:28874:28893  "touchMarket(market)"
                let expr_1698 := fun_touchMarket_3092(expr_1697_mpos)
                /// @src 0:28861:28893  "bytes32 id = touchMarket(market)"
                let var_id_1695 := expr_1698
                /// @src 0:28935:28943  "UtilsLib"
                let expr_1706_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:28954:28959  "units"
                let _288 := var_units_1669
                let expr_1708 := _288
                /// @src 0:28935:28960  "UtilsLib.toUint128(units)"
                let expr_1709 := fun_toUint128_5922(expr_1708)
                /// @src 0:28904:28912  "position"
                let _289_slot := 0x00
                let expr_1700_slot := _289_slot
                /// @src 0:28913:28915  "id"
                let _290 := var_id_1695
                let expr_1701 := _290
                /// @src 0:28904:28916  "position[id]"
                let _291 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_1700_slot,expr_1701)
                let _292_slot := _291
                let expr_1703_slot := _292_slot
                /// @src 0:28917:28925  "onBehalf"
                let _293 := var_onBehalf_1671
                let expr_1702 := _293
                /// @src 0:28904:28926  "position[id][onBehalf]"
                let _294 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_1703_slot,expr_1702)
                let _295_slot := _294
                let expr_1704_slot := _295_slot
                /// @src 0:28904:28931  "position[id][onBehalf].debt"
                let _296 := add(expr_1704_slot, 2)
                /// @src 0:28904:28960  "position[id][onBehalf].debt -= UtilsLib.toUint128(units)"
                let _297 := read_from_storage_split_offset_0_t_uint128(_296)
                let expr_1710 := checked_sub_t_uint128(_297, expr_1709)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_296, expr_1710)
                /// @src 0:29002:29010  "UtilsLib"
                let expr_1716_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:29021:29026  "units"
                let _298 := var_units_1669
                let expr_1718 := _298
                /// @src 0:29002:29027  "UtilsLib.toUint128(units)"
                let expr_1719 := fun_toUint128_5922(expr_1718)
                /// @src 0:28970:28981  "marketState"
                let _299_slot := 0x01
                let expr_1712_slot := _299_slot
                /// @src 0:28982:28984  "id"
                let _300 := var_id_1695
                let expr_1713 := _300
                /// @src 0:28970:28985  "marketState[id]"
                let _301 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_1712_slot,expr_1713)
                let _302_slot := _301
                let expr_1714_slot := _302_slot
                /// @src 0:28970:28998  "marketState[id].withdrawable"
                let _303 := add(expr_1714_slot, 1)
                /// @src 0:28970:29027  "marketState[id].withdrawable += UtilsLib.toUint128(units)"
                let _304 := read_from_storage_split_offset_0_t_uint128(_303)
                let expr_1720 := checked_add_t_uint128(_304, expr_1719)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_303, expr_1720)
                /// @src 0:29054:29062  "callback"
                let _305 := var_callback_1673
                let expr_1724 := _305
                /// @src 0:29074:29075  "0"
                let expr_1727 := 0x00
                /// @src 0:29066:29076  "address(0)"
                let expr_1728 := convert_t_rational_0_by_1_to_t_address(expr_1727)
                /// @src 0:29054:29076  "callback != address(0)"
                let expr_1729 := iszero(eq(cleanup_t_address(expr_1724), cleanup_t_address(expr_1728)))
                /// @src 0:29054:29100  "callback != address(0) ? callback : msg.sender"
                let expr_1733
                switch expr_1729
                case 0 {
                    /// @src 0:29090:29100  "msg.sender"
                    let expr_1732 := caller()
                    /// @src 0:29054:29100  "callback != address(0) ? callback : msg.sender"
                    expr_1733 := expr_1732
                }
                default {
                    /// @src 0:29079:29087  "callback"
                    let _306 := var_callback_1673
                    let expr_1730 := _306
                    /// @src 0:29054:29100  "callback != address(0) ? callback : msg.sender"
                    expr_1733 := expr_1730
                }
                /// @src 0:29038:29100  "address payer = callback != address(0) ? callback : msg.sender"
                let var_payer_1723 := expr_1733
                /// @src 0:29115:29124  "EventsLib"
                let expr_1735_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:29131:29141  "msg.sender"
                let expr_1739 := caller()
                /// @src 0:29143:29145  "id"
                let _307 := var_id_1695
                let expr_1740 := _307
                /// @src 0:29147:29152  "units"
                let _308 := var_units_1669
                let expr_1741 := _308
                /// @src 0:29154:29162  "onBehalf"
                let _309 := var_onBehalf_1671
                let expr_1742 := _309
                /// @src 0:29164:29169  "payer"
                let _310 := var_payer_1723
                let expr_1743 := _310
                /// @src 0:29115:29170  "EventsLib.Repay(msg.sender, id, units, onBehalf, payer)"
                let _311 := 0x8b2d9c5b5a1393c4a278da77a782a77bfd7ef753c26429830b006487d3167088
                let _312 := convert_t_address_to_t_address(expr_1739)
                let _313 := convert_t_bytes32_to_t_bytes32(expr_1740)
                let _314 := convert_t_address_to_t_address(expr_1742)
                {
                    let _315 := allocate_unbounded()
                    let _316 := abi_encode_tuple_t_uint256_t_address__to_t_uint256_t_address__fromStack(_315 , expr_1741, expr_1743)
                    log4(_315, sub(_316, _315) , _311, _312, _313, _314)
                }/// @src 0:29185:29193  "callback"
                let _317 := var_callback_1673
                let expr_1746 := _317
                /// @src 0:29205:29206  "0"
                let expr_1749 := 0x00
                /// @src 0:29197:29207  "address(0)"
                let expr_1750 := convert_t_rational_0_by_1_to_t_address(expr_1749)
                /// @src 0:29185:29207  "callback != address(0)"
                let expr_1751 := iszero(eq(cleanup_t_address(expr_1746), cleanup_t_address(expr_1750)))
                /// @src 0:29181:29409  "if (callback != address(0)) {..."
                if expr_1751 {
                    /// @src 0:29263:29271  "callback"
                    let _318 := var_callback_1673
                    let expr_1754 := _318
                    /// @src 0:29248:29272  "IRepayCallback(callback)"
                    let expr_1755_address := convert_t_address_to_t_contract$_IRepayCallback_$4065(expr_1754)
                    /// @src 0:29248:29280  "IRepayCallback(callback).onRepay"
                    let expr_1756_address := convert_t_contract$_IRepayCallback_$4065_to_t_address(expr_1755_address)
                    let expr_1756_functionSelector := 0xfc56f72e
                    /// @src 0:29281:29283  "id"
                    let _319 := var_id_1695
                    let expr_1757 := _319
                    /// @src 0:29285:29291  "market"
                    let _320_mpos := var_market_1667_mpos
                    let expr_1758_mpos := _320_mpos
                    /// @src 0:29293:29298  "units"
                    let _321 := var_units_1669
                    let expr_1759 := _321
                    /// @src 0:29300:29308  "onBehalf"
                    let _322 := var_onBehalf_1671
                    let expr_1760 := _322
                    /// @src 0:29310:29314  "data"
                    let _323_offset := var_data_1675_offset
                    let _323_length := var_data_1675_length
                    let expr_1761_offset := _323_offset
                    let expr_1761_length := _323_length
                    /// @src 0:29248:29315  "IRepayCallback(callback).onRepay(id, market, units, onBehalf, data)"

                    // storage for arguments and returned data
                    let _324 := allocate_unbounded()
                    mstore(_324, shift_left_224(expr_1756_functionSelector))
                    let _325 := abi_encode_tuple_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_address_t_bytes_calldata_ptr__to_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_address_t_bytes_memory_ptr__fromStack(add(_324, 4) , expr_1757, expr_1758_mpos, expr_1759, expr_1760, expr_1761_offset, expr_1761_length)

                    let _326 := call(gas(), expr_1756_address,  0,  _324, sub(_325, _324), _324, 32)

                    if iszero(_326) { revert_forward_1() }

                    let expr_1762
                    if _326 {

                        let _327 := 32

                        if gt(_327, returndatasize()) {
                            _327 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_324, _327)

                        // decode return parameters from external try-call into retVars
                        expr_1762 :=  abi_decode_tuple_t_bytes32_fromMemory(_324, add(_324, _327))
                    }
                    /// @src 0:29319:29335  "CALLBACK_SUCCESS"
                    let expr_1763 := constant_CALLBACK_SUCCESS_4986()
                    /// @src 0:29248:29335  "IRepayCallback(callback).onRepay(id, market, units, onBehalf, data) == CALLBACK_SUCCESS"
                    let expr_1764 := eq(cleanup_t_bytes32(expr_1762), cleanup_t_bytes32(expr_1763))
                    /// @src 0:29223:29398  "require(..."
                    require_helper_t_error_4280_WrongRepayCallbackReturnValue(expr_1764)
                    /// @src 0:29181:29409  "if (callback != address(0)) {..."
                }
                /// @src 0:29418:29433  "SafeTransferLib"
                let expr_1771_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:29451:29457  "market"
                let _329_mpos := var_market_1667_mpos
                let expr_1774_mpos := _329_mpos
                /// @src 0:29451:29467  "market.loanToken"
                let _330 := add(expr_1774_mpos, 0)
                let _331 := read_from_memoryt_address(_330)
                let expr_1775 := _331
                /// @src 0:29469:29474  "payer"
                let _332 := var_payer_1723
                let expr_1776 := _332
                /// @src 0:29484:29488  "this"
                let expr_1779_address := address()
                /// @src 0:29476:29489  "address(this)"
                let expr_1780 := convert_t_contract$_Midnight_$3973_to_t_address(expr_1779_address)
                /// @src 0:29491:29496  "units"
                let _333 := var_units_1669
                let expr_1781 := _333
                fun_safeTransferFrom_5564(expr_1775, expr_1776, expr_1780, expr_1781)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function convert_t_uint256_to_t_uint128(value) -> converted {
                converted := cleanup_t_uint128(identity(cleanup_t_uint256(value)))
            }

            /// @ast-id 3235
            /// @src 0:42626:43973  "function updatePositionView(Market memory market, bytes32 id, address user)..."
            function fun_updatePositionView_3235(var_market_3096_mpos, var_id_3098, var_user_3100) -> var__3103, var__3105, var__3107 {
                /// @src 0:42747:42754  "uint128"
                let zero_t_uint128_334 := zero_value_for_split_t_uint128()
                var__3103 := zero_t_uint128_334
                /// @src 0:42756:42763  "uint128"
                let zero_t_uint128_335 := zero_value_for_split_t_uint128()
                var__3105 := zero_t_uint128_335
                /// @src 0:42765:42772  "uint128"
                let zero_t_uint128_336 := zero_value_for_split_t_uint128()
                var__3107 := zero_t_uint128_336

                /// @src 0:42817:42825  "position"
                let _337_slot := 0x00
                let expr_3112_slot := _337_slot
                /// @src 0:42826:42828  "id"
                let _338 := var_id_3098
                let expr_3113 := _338
                /// @src 0:42817:42829  "position[id]"
                let _339 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3112_slot,expr_3113)
                let _340_slot := _339
                let expr_3114_slot := _340_slot
                /// @src 0:42830:42834  "user"
                let _341 := var_user_3100
                let expr_3115 := _341
                /// @src 0:42817:42835  "position[id][user]"
                let _342 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3114_slot,expr_3115)
                let _343_slot := _342
                let expr_3116_slot := _343_slot
                /// @src 0:42788:42835  "Position storage _position = position[id][user]"
                let var__position_3111_slot := convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(expr_3116_slot)
                /// @src 0:42862:42871  "_position"
                let _344_slot := var__position_3111_slot
                let expr_3120_slot := _344_slot
                /// @src 0:42862:42878  "_position.credit"
                let _345 := add(expr_3120_slot, 0)
                let _346 := read_from_storage_split_offset_0_t_uint128(_345)
                let expr_3121 := _346
                /// @src 0:42845:42878  "uint128 credit = _position.credit"
                let var_credit_3119 := expr_3121
                /// @src 0:42914:42923  "_position"
                let _347_slot := var__position_3111_slot
                let expr_3125_slot := _347_slot
                /// @src 0:42914:42938  "_position.lastLossFactor"
                let _348 := add(expr_3125_slot, 1)
                let _349 := read_from_storage_split_offset_0_t_uint128(_348)
                let expr_3126 := _349
                /// @src 0:42888:42938  "uint128 _lastLossFactor = _position.lastLossFactor"
                let var__lastLossFactor_3124 := expr_3126
                /// @src 0:42974:42989  "_lastLossFactor"
                let _350 := var__lastLossFactor_3124
                let expr_3130 := _350
                /// @src 0:42992:43009  "type(uint128).max"
                let expr_3135 := 0xffffffffffffffffffffffffffffffff
                /// @src 0:42974:43009  "_lastLossFactor < type(uint128).max"
                let expr_3136 := lt(cleanup_t_uint128(expr_3130), cleanup_t_uint128(expr_3135))
                /// @src 0:42974:43142  "_lastLossFactor < type(uint128).max..."
                let expr_3158
                switch expr_3136
                case 0 {
                    /// @src 0:43141:43142  "0"
                    let expr_3157 := 0x00
                    /// @src 0:42974:43142  "_lastLossFactor < type(uint128).max..."
                    expr_3158 := convert_t_rational_0_by_1_to_t_uint256(expr_3157)
                }
                default {
                    /// @src 0:43024:43030  "credit"
                    let _351 := var_credit_3119
                    let expr_3137 := _351
                    /// @src 0:43024:43041  "credit.mulDivDown"
                    let expr_3138_self := convert_t_uint128_to_t_uint256(expr_3137)
                    /// @src 0:43042:43059  "type(uint128).max"
                    let expr_3143 := 0xffffffffffffffffffffffffffffffff
                    /// @src 0:43062:43073  "marketState"
                    let _352_slot := 0x01
                    let expr_3144_slot := _352_slot
                    /// @src 0:43074:43076  "id"
                    let _353 := var_id_3098
                    let expr_3145 := _353
                    /// @src 0:43062:43077  "marketState[id]"
                    let _354 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3144_slot,expr_3145)
                    let _355_slot := _354
                    let expr_3146_slot := _355_slot
                    /// @src 0:43062:43088  "marketState[id].lossFactor"
                    let _356 := add(expr_3146_slot, 0)
                    let _357 := read_from_storage_split_offset_16_t_uint128(_356)
                    let expr_3147 := _357
                    /// @src 0:43042:43088  "type(uint128).max - marketState[id].lossFactor"
                    let expr_3148 := checked_sub_t_uint128(expr_3143, expr_3147)

                    /// @src 0:43090:43107  "type(uint128).max"
                    let expr_3153 := 0xffffffffffffffffffffffffffffffff
                    /// @src 0:43110:43125  "_lastLossFactor"
                    let _358 := var__lastLossFactor_3124
                    let expr_3154 := _358
                    /// @src 0:43090:43125  "type(uint128).max - _lastLossFactor"
                    let expr_3155 := checked_sub_t_uint128(expr_3153, expr_3154)

                    /// @src 0:43024:43126  "credit.mulDivDown(type(uint128).max - marketState[id].lossFactor, type(uint128).max - _lastLossFactor)"
                    let _359 := convert_t_uint128_to_t_uint256(expr_3148)
                    let _360 := convert_t_uint128_to_t_uint256(expr_3155)
                    let expr_3156 := fun_mulDivDown_5872(expr_3138_self, _359, _360)
                    /// @src 0:42974:43142  "_lastLossFactor < type(uint128).max..."
                    expr_3158 := expr_3156
                }
                /// @src 0:42948:43142  "uint256 postSlashCredit = _lastLossFactor < type(uint128).max..."
                let var_postSlashCredit_3129 := expr_3158
                /// @src 0:43174:43183  "_position"
                let _361_slot := var__position_3111_slot
                let expr_3162_slot := _361_slot
                /// @src 0:43174:43194  "_position.pendingFee"
                let _362 := add(expr_3162_slot, 0)
                let _363 := read_from_storage_split_offset_16_t_uint128(_362)
                let expr_3163 := _363
                /// @src 0:43152:43194  "uint128 _pendingFee = _position.pendingFee"
                let var__pendingFee_3161 := expr_3163
                /// @src 0:43246:43252  "credit"
                let _364 := var_credit_3119
                let expr_3167 := _364
                /// @src 0:43255:43256  "0"
                let expr_3168 := 0x00
                /// @src 0:43246:43256  "credit > 0"
                let expr_3169 := gt(cleanup_t_uint128(expr_3167), convert_t_rational_0_by_1_to_t_uint128(expr_3168))
                /// @src 0:43246:43331  "credit > 0 ? _pendingFee - _pendingFee.mulDivUp(credit - postSlashCredit, credit) : 0"
                let expr_3180
                switch expr_3169
                case 0 {
                    /// @src 0:43330:43331  "0"
                    let expr_3179 := 0x00
                    /// @src 0:43246:43331  "credit > 0 ? _pendingFee - _pendingFee.mulDivUp(credit - postSlashCredit, credit) : 0"
                    expr_3180 := convert_t_rational_0_by_1_to_t_uint256(expr_3179)
                }
                default {
                    /// @src 0:43259:43270  "_pendingFee"
                    let _365 := var__pendingFee_3161
                    let expr_3170 := _365
                    /// @src 0:43273:43284  "_pendingFee"
                    let _366 := var__pendingFee_3161
                    let expr_3171 := _366
                    /// @src 0:43273:43293  "_pendingFee.mulDivUp"
                    let expr_3172_self := convert_t_uint128_to_t_uint256(expr_3171)
                    /// @src 0:43294:43300  "credit"
                    let _367 := var_credit_3119
                    let expr_3173 := _367
                    /// @src 0:43303:43318  "postSlashCredit"
                    let _368 := var_postSlashCredit_3129
                    let expr_3174 := _368
                    /// @src 0:43294:43318  "credit - postSlashCredit"
                    let expr_3175 := checked_sub_t_uint256(convert_t_uint128_to_t_uint256(expr_3173), expr_3174)

                    /// @src 0:43320:43326  "credit"
                    let _369 := var_credit_3119
                    let expr_3176 := _369
                    /// @src 0:43273:43327  "_pendingFee.mulDivUp(credit - postSlashCredit, credit)"
                    let _370 := convert_t_uint128_to_t_uint256(expr_3176)
                    let expr_3177 := fun_mulDivUp_5897(expr_3172_self, expr_3175, _370)
                    /// @src 0:43259:43327  "_pendingFee - _pendingFee.mulDivUp(credit - postSlashCredit, credit)"
                    let expr_3178 := checked_sub_t_uint256(convert_t_uint128_to_t_uint256(expr_3170), expr_3177)

                    /// @src 0:43246:43331  "credit > 0 ? _pendingFee - _pendingFee.mulDivUp(credit - postSlashCredit, credit) : 0"
                    expr_3180 := expr_3178
                }
                /// @src 0:43204:43331  "uint256 postSlashPendingFee =..."
                let var_postSlashPendingFee_3166 := expr_3180
                /// @src 0:43362:43370  "UtilsLib"
                let expr_3184_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:43375:43390  "block.timestamp"
                let expr_3187 := timestamp()
                /// @src 0:43392:43398  "market"
                let _371_mpos := var_market_3096_mpos
                let expr_3188_mpos := _371_mpos
                /// @src 0:43392:43407  "market.maturity"
                let _372 := add(expr_3188_mpos, 64)
                let _373 := read_from_memoryt_uint256(_372)
                let expr_3189 := _373
                /// @src 0:43362:43408  "UtilsLib.min(block.timestamp, market.maturity)"
                let expr_3190 := fun_min_5841(expr_3187, expr_3189)
                /// @src 0:43341:43408  "uint256 accrualEnd = UtilsLib.min(block.timestamp, market.maturity)"
                let var_accrualEnd_3183 := expr_3190
                /// @src 0:43441:43450  "_position"
                let _374_slot := var__position_3111_slot
                let expr_3194_slot := _374_slot
                /// @src 0:43441:43462  "_position.lastAccrual"
                let _375 := add(expr_3194_slot, 1)
                let _376 := read_from_storage_split_offset_16_t_uint128(_375)
                let expr_3195 := _376
                /// @src 0:43418:43462  "uint128 _lastAccrual = _position.lastAccrual"
                let var__lastAccrual_3193 := expr_3195
                /// @src 0:43606:43618  "_lastAccrual"
                let _377 := var__lastAccrual_3193
                let expr_3199 := _377
                /// @src 0:43621:43627  "market"
                let _378_mpos := var_market_3096_mpos
                let expr_3200_mpos := _378_mpos
                /// @src 0:43621:43636  "market.maturity"
                let _379 := add(expr_3200_mpos, 64)
                let _380 := read_from_memoryt_uint256(_379)
                let expr_3201 := _380
                /// @src 0:43606:43636  "_lastAccrual < market.maturity"
                let expr_3202 := lt(convert_t_uint128_to_t_uint256(expr_3199), cleanup_t_uint256(expr_3201))
                /// @src 0:43606:43765  "_lastAccrual < market.maturity..."
                let expr_3217
                switch expr_3202
                case 0 {
                    /// @src 0:43764:43765  "0"
                    let expr_3216 := 0x00
                    /// @src 0:43606:43765  "_lastAccrual < market.maturity..."
                    expr_3217 := convert_t_rational_0_by_1_to_t_uint128(expr_3216)
                }
                default {
                    /// @src 0:43659:43678  "postSlashPendingFee"
                    let _381 := var_postSlashPendingFee_3166
                    let expr_3205 := _381
                    /// @src 0:43659:43689  "postSlashPendingFee.mulDivDown"
                    let expr_3206_self := expr_3205
                    /// @src 0:43690:43700  "accrualEnd"
                    let _382 := var_accrualEnd_3183
                    let expr_3207 := _382
                    /// @src 0:43703:43715  "_lastAccrual"
                    let _383 := var__lastAccrual_3193
                    let expr_3208 := _383
                    /// @src 0:43690:43715  "accrualEnd - _lastAccrual"
                    let expr_3209 := checked_sub_t_uint256(expr_3207, convert_t_uint128_to_t_uint256(expr_3208))

                    /// @src 0:43717:43723  "market"
                    let _384_mpos := var_market_3096_mpos
                    let expr_3210_mpos := _384_mpos
                    /// @src 0:43717:43732  "market.maturity"
                    let _385 := add(expr_3210_mpos, 64)
                    let _386 := read_from_memoryt_uint256(_385)
                    let expr_3211 := _386
                    /// @src 0:43735:43747  "_lastAccrual"
                    let _387 := var__lastAccrual_3193
                    let expr_3212 := _387
                    /// @src 0:43717:43747  "market.maturity - _lastAccrual"
                    let expr_3213 := checked_sub_t_uint256(expr_3211, convert_t_uint128_to_t_uint256(expr_3212))

                    /// @src 0:43659:43748  "postSlashPendingFee.mulDivDown(accrualEnd - _lastAccrual, market.maturity - _lastAccrual)"
                    let expr_3214 := fun_mulDivDown_5872(expr_3206_self, expr_3209, expr_3213)
                    /// @src 0:43651:43749  "uint128(postSlashPendingFee.mulDivDown(accrualEnd - _lastAccrual, market.maturity - _lastAccrual))"
                    let expr_3215 := convert_t_uint256_to_t_uint128(expr_3214)
                    /// @src 0:43606:43765  "_lastAccrual < market.maturity..."
                    expr_3217 := expr_3215
                }
                /// @src 0:43592:43765  "uint128 fee = _lastAccrual < market.maturity..."
                let var_fee_3198 := expr_3217
                /// @src 0:43902:43917  "postSlashCredit"
                let _388 := var_postSlashCredit_3129
                let expr_3221 := _388
                /// @src 0:43894:43918  "uint128(postSlashCredit)"
                let expr_3222 := convert_t_uint256_to_t_uint128(expr_3221)
                /// @src 0:43921:43924  "fee"
                let _389 := var_fee_3198
                let expr_3223 := _389
                /// @src 0:43894:43924  "uint128(postSlashCredit) - fee"
                let expr_3224 := checked_sub_t_uint128(expr_3222, expr_3223)

                /// @src 0:43893:43966  "(uint128(postSlashCredit) - fee, uint128(postSlashPendingFee) - fee, fee)"
                let expr_3232_component_1 := expr_3224
                /// @src 0:43934:43953  "postSlashPendingFee"
                let _390 := var_postSlashPendingFee_3166
                let expr_3227 := _390
                /// @src 0:43926:43954  "uint128(postSlashPendingFee)"
                let expr_3228 := convert_t_uint256_to_t_uint128(expr_3227)
                /// @src 0:43957:43960  "fee"
                let _391 := var_fee_3198
                let expr_3229 := _391
                /// @src 0:43926:43960  "uint128(postSlashPendingFee) - fee"
                let expr_3230 := checked_sub_t_uint128(expr_3228, expr_3229)

                /// @src 0:43893:43966  "(uint128(postSlashCredit) - fee, uint128(postSlashPendingFee) - fee, fee)"
                let expr_3232_component_2 := expr_3230
                /// @src 0:43962:43965  "fee"
                let _392 := var_fee_3198
                let expr_3231 := _392
                /// @src 0:43893:43966  "(uint128(postSlashCredit) - fee, uint128(postSlashPendingFee) - fee, fee)"
                let expr_3232_component_3 := expr_3231
                /// @src 0:43886:43966  "return (uint128(postSlashCredit) - fee, uint128(postSlashPendingFee) - fee, fee)"
                var__3103 := expr_3232_component_1
                var__3105 := expr_3232_component_2
                var__3107 := expr_3232_component_3
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function array_length_t_array$_t_address_$dyn_calldata_ptr(value, len) -> length {

                length := len

            }

            function array_length_t_array$_t_uint256_$dyn_calldata_ptr(value, len) -> length {

                length := len

            }

            function require_helper_t_error_4274_InconsistentInput(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xf0732dd700000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function array_storeLengthForEncoding_t_array$_t_address_$dyn_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function array_dataslot_t_array$_t_address_$dyn_calldata_ptr(ptr) -> data {
                data := ptr

            }

            function abi_encodeUpdatedPos_t_address_to_t_address(value0, pos) -> updatedPos {
                abi_encode_t_address_to_t_address(value0, pos)
                updatedPos := add(pos, 0x20)
            }

            function calldata_access_t_address(baseRef, ptr) -> value {
                value := abi_decode_t_address(ptr, add(ptr, 32))
            }

            function array_nextElement_t_array$_t_address_$dyn_calldata_ptr(ptr) -> next {
                next := add(ptr, 0x20)
            }

            // address[] -> address[]
            function abi_encode_t_array$_t_address_$dyn_calldata_ptr_to_t_array$_t_address_$dyn_memory_ptr_fromStack(value, length, pos)  -> end  {

                pos := array_storeLengthForEncoding_t_array$_t_address_$dyn_memory_ptr_fromStack(pos, length)
                let baseRef := array_dataslot_t_array$_t_address_$dyn_calldata_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := calldata_access_t_address(baseRef, srcPtr)
                    pos := abi_encodeUpdatedPos_t_address_to_t_address(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_address_$dyn_calldata_ptr(srcPtr)
                }
                end := pos
            }

            function array_storeLengthForEncoding_t_array$_t_uint256_$dyn_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function revert_error_d0468cefdb41083d2ff66f1e66140f10c9da08cd905521a779422e76a84d11ec() {
                revert(0, 0)
            }

            function copy_calldata_to_memory(src, dst, length) {

                calldatacopy(dst, src, length)

            }

            // uint256[] -> uint256[]
            function abi_encode_t_array$_t_uint256_$dyn_calldata_ptr_to_t_array$_t_uint256_$dyn_memory_ptr_fromStack(start, length, pos) -> end {
                pos := array_storeLengthForEncoding_t_array$_t_uint256_$dyn_memory_ptr_fromStack(pos, length)

                if gt(length, 0x07ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { revert_error_d0468cefdb41083d2ff66f1e66140f10c9da08cd905521a779422e76a84d11ec() }
                length := mul(length, 0x20)

                copy_calldata_to_memory(start, pos, length)
                end := add(pos, length)
            }

            function abi_encode_tuple_t_array$_t_address_$dyn_calldata_ptr_t_array$_t_uint256_$dyn_calldata_ptr__to_t_array$_t_address_$dyn_memory_ptr_t_array$_t_uint256_$dyn_memory_ptr__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 64)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_array$_t_address_$dyn_calldata_ptr_to_t_array$_t_address_$dyn_memory_ptr_fromStack(value0, value1,  tail)

                mstore(add(headStart, 32), sub(tail, headStart))
                tail := abi_encode_t_array$_t_uint256_$dyn_calldata_ptr_to_t_array$_t_uint256_$dyn_memory_ptr_fromStack(value2, value3,  tail)

            }

            function calldata_array_index_access_t_array$_t_address_$dyn_calldata_ptr(base_ref, length, index) -> addr {
                if iszero(lt(index, length)) { panic_error_0x32() }
                addr := add(base_ref, mul(index, 32))

            }

            function read_from_calldatat_address(ptr) -> returnValue {

                let value := calldataload(ptr)
                validator_revert_t_address(value)

                returnValue :=

                value

            }

            function calldata_array_index_access_t_array$_t_uint256_$dyn_calldata_ptr(base_ref, length, index) -> addr {
                if iszero(lt(index, length)) { panic_error_0x32() }
                addr := add(base_ref, mul(index, 32))

            }

            function read_from_calldatat_uint256(ptr) -> returnValue {

                let value := calldataload(ptr)
                validator_revert_t_uint256(value)

                returnValue :=

                value

            }

            function convert_t_uint160_to_t_contract$_IFlashLoanCallback_$4081(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IFlashLoanCallback_$4081(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IFlashLoanCallback_$4081(value)
            }

            function convert_t_contract$_IFlashLoanCallback_$4081_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_tuple_t_address_t_array$_t_address_$dyn_calldata_ptr_t_array$_t_uint256_$dyn_calldata_ptr_t_bytes_calldata_ptr__to_t_address_t_array$_t_address_$dyn_memory_ptr_t_array$_t_uint256_$dyn_memory_ptr_t_bytes_memory_ptr__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6) -> tail {
                tail := add(headStart, 128)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                mstore(add(headStart, 32), sub(tail, headStart))
                tail := abi_encode_t_array$_t_address_$dyn_calldata_ptr_to_t_array$_t_address_$dyn_memory_ptr_fromStack(value1, value2,  tail)

                mstore(add(headStart, 64), sub(tail, headStart))
                tail := abi_encode_t_array$_t_uint256_$dyn_calldata_ptr_to_t_array$_t_uint256_$dyn_memory_ptr_fromStack(value3, value4,  tail)

                mstore(add(headStart, 96), sub(tail, headStart))
                tail := abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_fromStack(value5, value6,  tail)

            }

            function require_helper_t_error_4284_WrongFlashLoanCallbackReturnValue(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xa429c87000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 2850
            /// @src 0:39390:40151  "function flashLoan(address[] calldata tokens, uint256[] calldata assets, address callback, bytes calldata data)..."
            function fun_flashLoan_2850(var_tokens_2748_offset, var_tokens_2748_length, var_assets_2751_offset, var_assets_2751_length, var_callback_2753, var_data_2755_offset, var_data_2755_length) {

                /// @src 0:39541:39547  "tokens"
                let _393_offset := var_tokens_2748_offset
                let _393_length := var_tokens_2748_length
                let expr_2759_offset := _393_offset
                let expr_2759_length := _393_length
                /// @src 0:39541:39554  "tokens.length"
                let expr_2760 := array_length_t_array$_t_address_$dyn_calldata_ptr(expr_2759_offset, expr_2759_length)
                /// @src 0:39558:39564  "assets"
                let _394_offset := var_assets_2751_offset
                let _394_length := var_assets_2751_length
                let expr_2761_offset := _394_offset
                let expr_2761_length := _394_length
                /// @src 0:39558:39571  "assets.length"
                let expr_2762 := array_length_t_array$_t_uint256_$dyn_calldata_ptr(expr_2761_offset, expr_2761_length)
                /// @src 0:39541:39571  "tokens.length == assets.length"
                let expr_2763 := eq(cleanup_t_uint256(expr_2760), cleanup_t_uint256(expr_2762))
                /// @src 0:39533:39593  "require(tokens.length == assets.length, InconsistentInput())"
                require_helper_t_error_4274_InconsistentInput(expr_2763)
                /// @src 0:39608:39617  "EventsLib"
                let expr_2768_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:39628:39638  "msg.sender"
                let expr_2772 := caller()
                /// @src 0:39640:39646  "tokens"
                let _395_offset := var_tokens_2748_offset
                let _395_length := var_tokens_2748_length
                let expr_2773_offset := _395_offset
                let expr_2773_length := _395_length
                /// @src 0:39648:39654  "assets"
                let _396_offset := var_assets_2751_offset
                let _396_length := var_assets_2751_length
                let expr_2774_offset := _396_offset
                let expr_2774_length := _396_length
                /// @src 0:39656:39664  "callback"
                let _397 := var_callback_2753
                let expr_2775 := _397
                /// @src 0:39608:39665  "EventsLib.FlashLoan(msg.sender, tokens, assets, callback)"
                let _398 := 0x3a1534fae3196d51e11f8e6ba02e8a834d8eded5eb826d766d3fd048f3c6b83c
                let _399 := convert_t_address_to_t_address(expr_2772)
                let _400 := convert_t_address_to_t_address(expr_2775)
                {
                    let _401 := allocate_unbounded()
                    let _402 := abi_encode_tuple_t_array$_t_address_$dyn_calldata_ptr_t_array$_t_uint256_$dyn_calldata_ptr__to_t_array$_t_address_$dyn_memory_ptr_t_array$_t_uint256_$dyn_memory_ptr__fromStack(_401 , expr_2773_offset, expr_2773_length, expr_2774_offset, expr_2774_length)
                    log3(_401, sub(_402, _401) , _398, _399, _400)
                }/// @src 0:39675:39804  "for (uint256 i = 0; i < tokens.length; i++) {..."
                for {
                    /// @src 0:39692:39693  "0"
                    let expr_2780 := 0x00
                    /// @src 0:39680:39693  "uint256 i = 0"
                    let var_i_2779 := convert_t_rational_0_by_1_to_t_uint256(expr_2780)
                    } 1 {
                    /// @src 0:39714:39717  "i++"
                    let _404 := var_i_2779
                    let _403 := increment_wrapping_t_uint256(_404)
                    var_i_2779 := _403
                    let expr_2787 := _404
                }
                {
                    /// @src 0:39695:39696  "i"
                    let _405 := var_i_2779
                    let expr_2782 := _405
                    /// @src 0:39699:39705  "tokens"
                    let _406_offset := var_tokens_2748_offset
                    let _406_length := var_tokens_2748_length
                    let expr_2783_offset := _406_offset
                    let expr_2783_length := _406_length
                    /// @src 0:39699:39712  "tokens.length"
                    let expr_2784 := array_length_t_array$_t_address_$dyn_calldata_ptr(expr_2783_offset, expr_2783_length)
                    /// @src 0:39695:39712  "i < tokens.length"
                    let expr_2785 := lt(cleanup_t_uint256(expr_2782), cleanup_t_uint256(expr_2784))
                    if iszero(expr_2785) { break }
                    /// @src 0:39733:39748  "SafeTransferLib"
                    let expr_2789_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                    /// @src 0:39762:39768  "tokens"
                    let _407_offset := var_tokens_2748_offset
                    let _407_length := var_tokens_2748_length
                    let expr_2792_offset := _407_offset
                    let expr_2792_length := _407_length
                    /// @src 0:39769:39770  "i"
                    let _408 := var_i_2779
                    let expr_2793 := _408
                    /// @src 0:39762:39771  "tokens[i]"
                    let expr_2794 := read_from_calldatat_address(calldata_array_index_access_t_array$_t_address_$dyn_calldata_ptr(expr_2792_offset, expr_2792_length, expr_2793))
                    /// @src 0:39773:39781  "callback"
                    let _409 := var_callback_2753
                    let expr_2795 := _409
                    /// @src 0:39783:39789  "assets"
                    let _410_offset := var_assets_2751_offset
                    let _410_length := var_assets_2751_length
                    let expr_2796_offset := _410_offset
                    let expr_2796_length := _410_length
                    /// @src 0:39790:39791  "i"
                    let _411 := var_i_2779
                    let expr_2797 := _411
                    /// @src 0:39783:39792  "assets[i]"
                    let expr_2798 := read_from_calldatat_uint256(calldata_array_index_access_t_array$_t_uint256_$dyn_calldata_ptr(expr_2796_offset, expr_2796_length, expr_2797))
                    fun_safeTransfer_5503(expr_2794, expr_2795, expr_2798)
                }
                /// @src 0:39853:39861  "callback"
                let _412 := var_callback_2753
                let expr_2805 := _412
                /// @src 0:39834:39862  "IFlashLoanCallback(callback)"
                let expr_2806_address := convert_t_address_to_t_contract$_IFlashLoanCallback_$4081(expr_2805)
                /// @src 0:39834:39874  "IFlashLoanCallback(callback).onFlashLoan"
                let expr_2807_address := convert_t_contract$_IFlashLoanCallback_$4081_to_t_address(expr_2806_address)
                let expr_2807_functionSelector := 0xd1f260c3
                /// @src 0:39875:39885  "msg.sender"
                let expr_2809 := caller()
                /// @src 0:39887:39893  "tokens"
                let _413_offset := var_tokens_2748_offset
                let _413_length := var_tokens_2748_length
                let expr_2810_offset := _413_offset
                let expr_2810_length := _413_length
                /// @src 0:39895:39901  "assets"
                let _414_offset := var_assets_2751_offset
                let _414_length := var_assets_2751_length
                let expr_2811_offset := _414_offset
                let expr_2811_length := _414_length
                /// @src 0:39903:39907  "data"
                let _415_offset := var_data_2755_offset
                let _415_length := var_data_2755_length
                let expr_2812_offset := _415_offset
                let expr_2812_length := _415_length
                /// @src 0:39834:39908  "IFlashLoanCallback(callback).onFlashLoan(msg.sender, tokens, assets, data)"

                // storage for arguments and returned data
                let _416 := allocate_unbounded()
                mstore(_416, shift_left_224(expr_2807_functionSelector))
                let _417 := abi_encode_tuple_t_address_t_array$_t_address_$dyn_calldata_ptr_t_array$_t_uint256_$dyn_calldata_ptr_t_bytes_calldata_ptr__to_t_address_t_array$_t_address_$dyn_memory_ptr_t_array$_t_uint256_$dyn_memory_ptr_t_bytes_memory_ptr__fromStack(add(_416, 4) , expr_2809, expr_2810_offset, expr_2810_length, expr_2811_offset, expr_2811_length, expr_2812_offset, expr_2812_length)

                let _418 := call(gas(), expr_2807_address,  0,  _416, sub(_417, _416), _416, 32)

                if iszero(_418) { revert_forward_1() }

                let expr_2813
                if _418 {

                    let _419 := 32

                    if gt(_419, returndatasize()) {
                        _419 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_416, _419)

                    // decode return parameters from external try-call into retVars
                    expr_2813 :=  abi_decode_tuple_t_bytes32_fromMemory(_416, add(_416, _419))
                }
                /// @src 0:39912:39928  "CALLBACK_SUCCESS"
                let expr_2814 := constant_CALLBACK_SUCCESS_4986()
                /// @src 0:39834:39928  "IFlashLoanCallback(callback).onFlashLoan(msg.sender, tokens, assets, data) == CALLBACK_SUCCESS"
                let expr_2815 := eq(cleanup_t_bytes32(expr_2813), cleanup_t_bytes32(expr_2814))
                /// @src 0:39813:39987  "require(..."
                require_helper_t_error_4284_WrongFlashLoanCallbackReturnValue(expr_2815)
                /// @src 0:39997:40145  "for (uint256 i = 0; i < tokens.length; i++) {..."
                for {
                    /// @src 0:40014:40015  "0"
                    let expr_2822 := 0x00
                    /// @src 0:40002:40015  "uint256 i = 0"
                    let var_i_2821 := convert_t_rational_0_by_1_to_t_uint256(expr_2822)
                    } 1 {
                    /// @src 0:40036:40039  "i++"
                    let _421 := var_i_2821
                    let _420 := increment_wrapping_t_uint256(_421)
                    var_i_2821 := _420
                    let expr_2829 := _421
                }
                {
                    /// @src 0:40017:40018  "i"
                    let _422 := var_i_2821
                    let expr_2824 := _422
                    /// @src 0:40021:40027  "tokens"
                    let _423_offset := var_tokens_2748_offset
                    let _423_length := var_tokens_2748_length
                    let expr_2825_offset := _423_offset
                    let expr_2825_length := _423_length
                    /// @src 0:40021:40034  "tokens.length"
                    let expr_2826 := array_length_t_array$_t_address_$dyn_calldata_ptr(expr_2825_offset, expr_2825_length)
                    /// @src 0:40017:40034  "i < tokens.length"
                    let expr_2827 := lt(cleanup_t_uint256(expr_2824), cleanup_t_uint256(expr_2826))
                    if iszero(expr_2827) { break }
                    /// @src 0:40055:40070  "SafeTransferLib"
                    let expr_2831_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                    /// @src 0:40088:40094  "tokens"
                    let _424_offset := var_tokens_2748_offset
                    let _424_length := var_tokens_2748_length
                    let expr_2834_offset := _424_offset
                    let expr_2834_length := _424_length
                    /// @src 0:40095:40096  "i"
                    let _425 := var_i_2821
                    let expr_2835 := _425
                    /// @src 0:40088:40097  "tokens[i]"
                    let expr_2836 := read_from_calldatat_address(calldata_array_index_access_t_array$_t_address_$dyn_calldata_ptr(expr_2834_offset, expr_2834_length, expr_2835))
                    /// @src 0:40099:40107  "callback"
                    let _426 := var_callback_2753
                    let expr_2837 := _426
                    /// @src 0:40117:40121  "this"
                    let expr_2840_address := address()
                    /// @src 0:40109:40122  "address(this)"
                    let expr_2841 := convert_t_contract$_Midnight_$3973_to_t_address(expr_2840_address)
                    /// @src 0:40124:40130  "assets"
                    let _427_offset := var_assets_2751_offset
                    let _427_length := var_assets_2751_length
                    let expr_2842_offset := _427_offset
                    let expr_2842_length := _427_length
                    /// @src 0:40131:40132  "i"
                    let _428 := var_i_2821
                    let expr_2843 := _428
                    /// @src 0:40124:40133  "assets[i]"
                    let expr_2844 := read_from_calldatat_uint256(calldata_array_index_access_t_array$_t_uint256_$dyn_calldata_ptr(expr_2842_offset, expr_2842_length, expr_2843))
                    fun_safeTransferFrom_5564(expr_2836, expr_2837, expr_2841, expr_2844)
                }

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function shift_left_128(value) -> newValue {
                newValue :=

                shl(128, value)

            }

            function update_byte_slice_16_shift_16(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffff00000000000000000000000000000000
                toInsert := shift_left_128(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_16_t_uint128_to_t_uint128(slot, value_0) {
                let convertedValue_0 := convert_t_uint128_to_t_uint128(value_0)
                sstore(slot, update_byte_slice_16_shift_16(sload(slot), prepare_store_t_uint128(convertedValue_0)))
            }

            /// @ast-id 760
            /// @src 0:19376:20053  "function claimContinuousFee(Market memory market, uint256 amount, address receiver) external {..."
            function fun_claimContinuousFee_760(var_market_675_mpos, var_amount_677, var_receiver_679) {

                /// @src 0:19497:19503  "market"
                let _429_mpos := var_market_675_mpos
                let expr_685_mpos := _429_mpos
                /// @src 0:19492:19504  "toId(market)"
                let expr_686 := fun_toId_3477(expr_685_mpos)
                /// @src 0:19479:19504  "bytes32 id = toId(market)"
                let var_id_683 := expr_686
                /// @src 0:19549:19560  "marketState"
                let _430_slot := 0x01
                let expr_691_slot := _430_slot
                /// @src 0:19561:19563  "id"
                let _431 := var_id_683
                let expr_692 := _431
                /// @src 0:19549:19564  "marketState[id]"
                let _432 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_691_slot,expr_692)
                let _433_slot := _432
                let expr_693_slot := _433_slot
                /// @src 0:19514:19564  "MarketState storage _marketState = marketState[id]"
                let var__marketState_690_slot := convert_t_struct$_MarketState_$4238_storage_to_t_struct$_MarketState_$4238_storage_ptr(expr_693_slot)
                /// @src 0:19582:19592  "msg.sender"
                let expr_697 := caller()
                /// @src 0:19596:19606  "feeClaimer"
                let _434 := read_from_storage_split_offset_0_t_address(0x09)
                let expr_698 := _434
                /// @src 0:19582:19606  "msg.sender == feeClaimer"
                let expr_699 := eq(cleanup_t_address(expr_697), cleanup_t_address(expr_698))
                /// @src 0:19574:19625  "require(msg.sender == feeClaimer, OnlyFeeClaimer())"
                require_helper_t_error_4316_OnlyFeeClaimer(expr_699)
                /// @src 0:19643:19655  "_marketState"
                let _435_slot := var__marketState_690_slot
                let expr_705_slot := _435_slot
                /// @src 0:19643:19667  "_marketState.tickSpacing"
                let _436 := add(expr_705_slot, 2)
                let _437 := read_from_storage_split_offset_18_t_uint8(_436)
                let expr_706 := _437
                /// @src 0:19670:19671  "0"
                let expr_707 := 0x00
                /// @src 0:19643:19671  "_marketState.tickSpacing > 0"
                let expr_708 := gt(cleanup_t_uint8(expr_706), convert_t_rational_0_by_1_to_t_uint8(expr_707))
                /// @src 0:19635:19692  "require(_marketState.tickSpacing > 0, MarketNotCreated())"
                require_helper_t_error_4310_MarketNotCreated(expr_708)
                /// @src 0:19739:19747  "UtilsLib"
                let expr_716_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:19758:19764  "amount"
                let _438 := var_amount_677
                let expr_718 := _438
                /// @src 0:19739:19765  "UtilsLib.toUint128(amount)"
                let expr_719 := fun_toUint128_5922(expr_718)
                /// @src 0:19703:19715  "_marketState"
                let _439_slot := var__marketState_690_slot
                let expr_713_slot := _439_slot
                /// @src 0:19703:19735  "_marketState.continuousFeeCredit"
                let _440 := add(expr_713_slot, 1)
                /// @src 0:19703:19765  "_marketState.continuousFeeCredit -= UtilsLib.toUint128(amount)"
                let _441 := read_from_storage_split_offset_16_t_uint128(_440)
                let expr_720 := checked_sub_t_uint128(_441, expr_719)

                update_storage_value_offset_16_t_uint128_to_t_uint128(_440, expr_720)
                /// @src 0:19802:19810  "UtilsLib"
                let expr_725_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:19821:19827  "amount"
                let _442 := var_amount_677
                let expr_727 := _442
                /// @src 0:19802:19828  "UtilsLib.toUint128(amount)"
                let expr_728 := fun_toUint128_5922(expr_727)
                /// @src 0:19775:19787  "_marketState"
                let _443_slot := var__marketState_690_slot
                let expr_722_slot := _443_slot
                /// @src 0:19775:19798  "_marketState.totalUnits"
                let _444 := add(expr_722_slot, 0)
                /// @src 0:19775:19828  "_marketState.totalUnits -= UtilsLib.toUint128(amount)"
                let _445 := read_from_storage_split_offset_0_t_uint128(_444)
                let expr_729 := checked_sub_t_uint128(_445, expr_728)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_444, expr_729)
                /// @src 0:19867:19875  "UtilsLib"
                let expr_734_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:19886:19892  "amount"
                let _446 := var_amount_677
                let expr_736 := _446
                /// @src 0:19867:19893  "UtilsLib.toUint128(amount)"
                let expr_737 := fun_toUint128_5922(expr_736)
                /// @src 0:19838:19850  "_marketState"
                let _447_slot := var__marketState_690_slot
                let expr_731_slot := _447_slot
                /// @src 0:19838:19863  "_marketState.withdrawable"
                let _448 := add(expr_731_slot, 1)
                /// @src 0:19838:19893  "_marketState.withdrawable -= UtilsLib.toUint128(amount)"
                let _449 := read_from_storage_split_offset_0_t_uint128(_448)
                let expr_738 := checked_sub_t_uint128(_449, expr_737)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_448, expr_738)
                /// @src 0:19909:19918  "EventsLib"
                let expr_740_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:19938:19948  "msg.sender"
                let expr_744 := caller()
                /// @src 0:19950:19952  "id"
                let _450 := var_id_683
                let expr_745 := _450
                /// @src 0:19954:19960  "amount"
                let _451 := var_amount_677
                let expr_746 := _451
                /// @src 0:19962:19970  "receiver"
                let _452 := var_receiver_679
                let expr_747 := _452
                /// @src 0:19909:19971  "EventsLib.ClaimContinuousFee(msg.sender, id, amount, receiver)"
                let _453 := 0xd64453ff5184816a23d670b5224717cd441c4a7cd5f4e7dbc30f8511d35f597b
                let _454 := convert_t_address_to_t_address(expr_744)
                let _455 := convert_t_bytes32_to_t_bytes32(expr_745)
                let _456 := convert_t_address_to_t_address(expr_747)
                {
                    let _457 := allocate_unbounded()
                    let _458 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_457 , expr_746)
                    log4(_457, sub(_458, _457) , _453, _454, _455, _456)
                }/// @src 0:19982:19997  "SafeTransferLib"
                let expr_750_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:20011:20017  "market"
                let _459_mpos := var_market_675_mpos
                let expr_753_mpos := _459_mpos
                /// @src 0:20011:20027  "market.loanToken"
                let _460 := add(expr_753_mpos, 0)
                let _461 := read_from_memoryt_address(_460)
                let expr_754 := _461
                /// @src 0:20029:20037  "receiver"
                let _462 := var_receiver_679
                let expr_755 := _462
                /// @src 0:20039:20045  "amount"
                let _463 := var_amount_677
                let expr_756 := _463
                fun_safeTransfer_5503(expr_754, expr_755, expr_756)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3566
            /// @src 0:46965:47079  "function totalUnits(bytes32 id) external view returns (uint128) {..."
            function fun_totalUnits_3566(var_id_3555) -> var__3558 {
                /// @src 0:47020:47027  "uint128"
                let zero_t_uint128_464 := zero_value_for_split_t_uint128()
                var__3558 := zero_t_uint128_464

                /// @src 0:47046:47057  "marketState"
                let _465_slot := 0x01
                let expr_3560_slot := _465_slot
                /// @src 0:47058:47060  "id"
                let _466 := var_id_3555
                let expr_3561 := _466
                /// @src 0:47046:47061  "marketState[id]"
                let _467 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3560_slot,expr_3561)
                let _468_slot := _467
                let expr_3562_slot := _468_slot
                /// @src 0:47046:47072  "marketState[id].totalUnits"
                let _469 := add(expr_3562_slot, 0)
                let _470 := read_from_storage_split_offset_0_t_uint128(_469)
                let expr_3563 := _470
                /// @src 0:47039:47072  "return marketState[id].totalUnits"
                var__3558 := expr_3563
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function shift_left_dynamic(bits, value) -> newValue {
                newValue :=

                shl(bits, value)

            }

            function update_byte_slice_dynamic16(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffff)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_t_uint128_to_t_uint128(slot, offset, value_0) {
                let convertedValue_0 := convert_t_uint128_to_t_uint128(value_0)
                sstore(slot, update_byte_slice_dynamic16(sload(slot), offset, prepare_store_t_uint128(convertedValue_0)))
            }

            function require_helper_t_error_4348_UnhealthyBorrower(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x4f4e473e00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function abi_encode_tuple_t_address_t_uint256_t_address__to_t_address_t_uint256_t_address__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_address_to_t_address_fromStack(value2,  add(headStart, 64))

            }

            /// @ast-id 2040
            /// @src 0:30825:31863  "function withdrawCollateral(..."
            function fun_withdrawCollateral_2040(var_market_1920_mpos, var_collateralIndex_1922, var_assets_1924, var_onBehalf_1926, var_receiver_1928) {

                /// @src 0:31025:31033  "onBehalf"
                let _471 := var_onBehalf_1926
                let expr_1932 := _471
                /// @src 0:31037:31047  "msg.sender"
                let expr_1934 := caller()
                /// @src 0:31025:31047  "onBehalf == msg.sender"
                let expr_1935 := eq(cleanup_t_address(expr_1932), cleanup_t_address(expr_1934))
                /// @src 0:31025:31085  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                let expr_1942 := expr_1935
                if iszero(expr_1942) {
                    /// @src 0:31051:31063  "isAuthorized"
                    let _472_slot := 0x03
                    let expr_1936_slot := _472_slot
                    /// @src 0:31064:31072  "onBehalf"
                    let _473 := var_onBehalf_1926
                    let expr_1937 := _473
                    /// @src 0:31051:31073  "isAuthorized[onBehalf]"
                    let _474 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(expr_1936_slot,expr_1937)
                    let _475_slot := _474
                    let expr_1938_slot := _475_slot
                    /// @src 0:31074:31084  "msg.sender"
                    let expr_1940 := caller()
                    /// @src 0:31051:31085  "isAuthorized[onBehalf][msg.sender]"
                    let _476 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_1938_slot,expr_1940)
                    let _477 := read_from_storage_split_offset_0_t_bool(_476)
                    let expr_1941 := _477
                    /// @src 0:31025:31085  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                    expr_1942 := expr_1941
                }
                /// @src 0:31017:31102  "require(onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender], Unauthorized())"
                require_helper_t_error_4346_Unauthorized(expr_1942)
                /// @src 0:31137:31143  "market"
                let _478_mpos := var_market_1920_mpos
                let expr_1950_mpos := _478_mpos
                /// @src 0:31125:31144  "touchMarket(market)"
                let expr_1951 := fun_touchMarket_3092(expr_1950_mpos)
                /// @src 0:31112:31144  "bytes32 id = touchMarket(market)"
                let var_id_1948 := expr_1951
                /// @src 0:31180:31186  "market"
                let _479_mpos := var_market_1920_mpos
                let expr_1955_mpos := _479_mpos
                /// @src 0:31180:31203  "market.collateralParams"
                let _480 := add(expr_1955_mpos, 32)
                let _481_mpos := mload(_480)
                let expr_1956_mpos := _481_mpos
                /// @src 0:31204:31219  "collateralIndex"
                let _482 := var_collateralIndex_1922
                let expr_1957 := _482
                /// @src 0:31180:31220  "market.collateralParams[collateralIndex]"
                let _483_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_1956_mpos, expr_1957))
                let expr_1958_mpos := _483_mpos
                /// @src 0:31180:31226  "market.collateralParams[collateralIndex].token"
                let _484 := add(expr_1958_mpos, 0)
                let _485 := read_from_memoryt_address(_484)
                let expr_1959 := _485
                /// @src 0:31154:31226  "address collateralToken = market.collateralParams[collateralIndex].token"
                let var_collateralToken_1954 := expr_1959
                /// @src 0:31266:31274  "position"
                let _486_slot := 0x00
                let expr_1964_slot := _486_slot
                /// @src 0:31275:31277  "id"
                let _487 := var_id_1948
                let expr_1965 := _487
                /// @src 0:31266:31278  "position[id]"
                let _488 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_1964_slot,expr_1965)
                let _489_slot := _488
                let expr_1966_slot := _489_slot
                /// @src 0:31279:31287  "onBehalf"
                let _490 := var_onBehalf_1926
                let expr_1967 := _490
                /// @src 0:31266:31288  "position[id][onBehalf]"
                let _491 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_1966_slot,expr_1967)
                let _492_slot := _491
                let expr_1968_slot := _492_slot
                /// @src 0:31237:31288  "Position storage _position = position[id][onBehalf]"
                let var__position_1963_slot := convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(expr_1968_slot)
                /// @src 0:31322:31331  "_position"
                let _493_slot := var__position_1963_slot
                let expr_1972_slot := _493_slot
                /// @src 0:31322:31342  "_position.collateral"
                let _494 := add(expr_1972_slot, 3)
                let _495_slot := _494
                let expr_1973_slot := _495_slot
                /// @src 0:31343:31358  "collateralIndex"
                let _496 := var_collateralIndex_1922
                let expr_1974 := _496
                /// @src 0:31322:31359  "_position.collateral[collateralIndex]"

                let _497, _498 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_1973_slot, expr_1974)
                let _499 := read_from_storage_split_dynamic_t_uint128(_497, _498)
                let expr_1975 := _499
                /// @src 0:31362:31368  "assets"
                let _500 := var_assets_1924
                let expr_1976 := _500
                /// @src 0:31322:31368  "_position.collateral[collateralIndex] - assets"
                let expr_1977 := checked_sub_t_uint256(convert_t_uint128_to_t_uint256(expr_1975), expr_1976)

                /// @src 0:31298:31368  "uint256 newCollateral = _position.collateral[collateralIndex] - assets"
                let var_newCollateral_1971 := expr_1977
                /// @src 0:31418:31426  "UtilsLib"
                let expr_1984_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:31437:31450  "newCollateral"
                let _501 := var_newCollateral_1971
                let expr_1986 := _501
                /// @src 0:31418:31451  "UtilsLib.toUint128(newCollateral)"
                let expr_1987 := fun_toUint128_5922(expr_1986)
                /// @src 0:31378:31387  "_position"
                let _502_slot := var__position_1963_slot
                let expr_1979_slot := _502_slot
                /// @src 0:31378:31398  "_position.collateral"
                let _503 := add(expr_1979_slot, 3)
                let _504_slot := _503
                let expr_1982_slot := _504_slot
                /// @src 0:31399:31414  "collateralIndex"
                let _505 := var_collateralIndex_1922
                let expr_1981 := _505
                /// @src 0:31378:31415  "_position.collateral[collateralIndex]"

                let _506, _507 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_1982_slot, expr_1981)
                /// @src 0:31378:31451  "_position.collateral[collateralIndex] = UtilsLib.toUint128(newCollateral)"
                update_storage_value_t_uint128_to_t_uint128(_506, _507, expr_1987)
                let expr_1988 := expr_1987
                /// @src 0:31466:31479  "newCollateral"
                let _508 := var_newCollateral_1971
                let expr_1990 := _508
                /// @src 0:31483:31484  "0"
                let expr_1991 := 0x00
                /// @src 0:31466:31484  "newCollateral == 0"
                let expr_1992 := eq(cleanup_t_uint256(expr_1990), convert_t_rational_0_by_1_to_t_uint256(expr_1991))
                /// @src 0:31466:31498  "newCollateral == 0 && assets > 0"
                let expr_1996 := expr_1992
                if expr_1996 {
                    /// @src 0:31488:31494  "assets"
                    let _509 := var_assets_1924
                    let expr_1993 := _509
                    /// @src 0:31497:31498  "0"
                    let expr_1994 := 0x00
                    /// @src 0:31488:31498  "assets > 0"
                    let expr_1995 := gt(cleanup_t_uint256(expr_1993), convert_t_rational_0_by_1_to_t_uint256(expr_1994))
                    /// @src 0:31466:31498  "newCollateral == 0 && assets > 0"
                    expr_1996 := expr_1995
                }
                /// @src 0:31462:31606  "if (newCollateral == 0 && assets > 0) {..."
                if expr_1996 {
                    /// @src 0:31543:31552  "_position"
                    let _510_slot := var__position_1963_slot
                    let expr_2000_slot := _510_slot
                    /// @src 0:31543:31569  "_position.collateralBitmap"
                    let _511 := add(expr_2000_slot, 2)
                    let _512 := read_from_storage_split_offset_16_t_uint128(_511)
                    let expr_2001 := _512
                    /// @src 0:31543:31578  "_position.collateralBitmap.clearBit"
                    let expr_2002_self := expr_2001
                    /// @src 0:31579:31594  "collateralIndex"
                    let _513 := var_collateralIndex_1922
                    let expr_2003 := _513
                    /// @src 0:31543:31595  "_position.collateralBitmap.clearBit(collateralIndex)"
                    let expr_2004 := fun_clearBit_6030(expr_2002_self, expr_2003)
                    /// @src 0:31514:31523  "_position"
                    let _514_slot := var__position_1963_slot
                    let expr_1997_slot := _514_slot
                    /// @src 0:31514:31540  "_position.collateralBitmap"
                    let _515 := add(expr_1997_slot, 2)
                    /// @src 0:31514:31595  "_position.collateralBitmap = _position.collateralBitmap.clearBit(collateralIndex)"
                    update_storage_value_offset_16_t_uint128_to_t_uint128(_515, expr_2004)
                    let expr_2005 := expr_2004
                    /// @src 0:31462:31606  "if (newCollateral == 0 && assets > 0) {..."
                }
                /// @src 0:31634:31640  "market"
                let _516_mpos := var_market_1920_mpos
                let expr_2011_mpos := _516_mpos
                /// @src 0:31642:31644  "id"
                let _517 := var_id_1948
                let expr_2012 := _517
                /// @src 0:31646:31654  "onBehalf"
                let _518 := var_onBehalf_1926
                let expr_2013 := _518
                /// @src 0:31624:31655  "isHealthy(market, id, onBehalf)"
                let expr_2014 := fun_isHealthy_3821(expr_2011_mpos, expr_2012, expr_2013)
                /// @src 0:31616:31677  "require(isHealthy(market, id, onBehalf), UnhealthyBorrower())"
                require_helper_t_error_4348_UnhealthyBorrower(expr_2014)
                /// @src 0:31693:31702  "EventsLib"
                let expr_2019_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:31722:31732  "msg.sender"
                let expr_2023 := caller()
                /// @src 0:31734:31736  "id"
                let _519 := var_id_1948
                let expr_2024 := _519
                /// @src 0:31738:31753  "collateralToken"
                let _520 := var_collateralToken_1954
                let expr_2025 := _520
                /// @src 0:31755:31761  "assets"
                let _521 := var_assets_1924
                let expr_2026 := _521
                /// @src 0:31763:31771  "onBehalf"
                let _522 := var_onBehalf_1926
                let expr_2027 := _522
                /// @src 0:31773:31781  "receiver"
                let _523 := var_receiver_1928
                let expr_2028 := _523
                /// @src 0:31693:31782  "EventsLib.WithdrawCollateral(msg.sender, id, collateralToken, assets, onBehalf, receiver)"
                let _524 := 0x626c0b2bb9d8e812f145a6a7bdb09fe8fb92c53781755f343d5fd65c7e27949a
                let _525 := convert_t_bytes32_to_t_bytes32(expr_2024)
                let _526 := convert_t_address_to_t_address(expr_2025)
                let _527 := convert_t_address_to_t_address(expr_2027)
                {
                    let _528 := allocate_unbounded()
                    let _529 := abi_encode_tuple_t_address_t_uint256_t_address__to_t_address_t_uint256_t_address__fromStack(_528 , expr_2023, expr_2026, expr_2028)
                    log4(_528, sub(_529, _528) , _524, _525, _526, _527)
                }/// @src 0:31793:31808  "SafeTransferLib"
                let expr_2031_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:31822:31837  "collateralToken"
                let _530 := var_collateralToken_1954
                let expr_2034 := _530
                /// @src 0:31839:31847  "receiver"
                let _531 := var_receiver_1928
                let expr_2035 := _531
                /// @src 0:31849:31855  "assets"
                let _532 := var_assets_1924
                let expr_2036 := _532
                fun_safeTransfer_5503(expr_2034, expr_2035, expr_2036)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3579
            /// @src 0:47085:47199  "function lossFactor(bytes32 id) external view returns (uint128) {..."
            function fun_lossFactor_3579(var_id_3568) -> var__3571 {
                /// @src 0:47140:47147  "uint128"
                let zero_t_uint128_533 := zero_value_for_split_t_uint128()
                var__3571 := zero_t_uint128_533

                /// @src 0:47166:47177  "marketState"
                let _534_slot := 0x01
                let expr_3573_slot := _534_slot
                /// @src 0:47178:47180  "id"
                let _535 := var_id_3568
                let expr_3574 := _535
                /// @src 0:47166:47181  "marketState[id]"
                let _536 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3573_slot,expr_3574)
                let _537_slot := _536
                let expr_3575_slot := _537_slot
                /// @src 0:47166:47192  "marketState[id].lossFactor"
                let _538 := add(expr_3575_slot, 0)
                let _539 := read_from_storage_split_offset_16_t_uint128(_538)
                let expr_3576 := _539
                /// @src 0:47159:47192  "return marketState[id].lossFactor"
                var__3571 := expr_3576
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function require_helper_t_error_4286_InvalidFeeIndex(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x37f6201f00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4344_SettlementFeeTooHigh(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x1f5a6e3100000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function cleanup_t_rational_1000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1000000000000_by_1(value)))
            }

            /// @src 7:253:280  "uint256 constant CBP = 1e12"
            function constant_CBP_4923() -> ret {
                /// @src 7:276:280  "1e12"
                let expr_4922 := 0xe8d4a51000
                let _545 := convert_t_rational_1000000000000_by_1_to_t_uint256(expr_4922)

                ret := _545
            }

            function mod_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error_0x12() }
                r := mod(x, y)
            }

            function require_helper_t_error_4272_FeeNotMultipleOfFeeCbp(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x1468c5cb00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_uint256_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(identity(cleanup_t_uint256(value)))
            }

            function update_byte_slice_dynamic2(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 65535)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_t_uint16_to_t_uint16(slot, offset, value_0) {
                let convertedValue_0 := convert_t_uint16_to_t_uint16(value_0)
                sstore(slot, update_byte_slice_dynamic2(sload(slot), offset, prepare_store_t_uint16(convertedValue_0)))
            }

            /// @ast-id 531
            /// @src 0:17244:17904  "function setDefaultSettlementFee(address loanToken, uint256 index, uint256 newSettlementFee) external {..."
            function fun_setDefaultSettlementFee_531(var_loanToken_465, var_index_467, var_newSettlementFee_469) {

                /// @src 0:17364:17374  "msg.sender"
                let expr_474 := caller()
                /// @src 0:17378:17387  "feeSetter"
                let _540 := read_from_storage_split_offset_0_t_address(0x08)
                let expr_475 := _540
                /// @src 0:17364:17387  "msg.sender == feeSetter"
                let expr_476 := eq(cleanup_t_address(expr_474), cleanup_t_address(expr_475))
                /// @src 0:17356:17405  "require(msg.sender == feeSetter, OnlyFeeSetter())"
                require_helper_t_error_4318_OnlyFeeSetter(expr_476)
                /// @src 0:17423:17428  "index"
                let _541 := var_index_467
                let expr_482 := _541
                /// @src 0:17432:17433  "6"
                let expr_483 := 0x06
                /// @src 0:17423:17433  "index <= 6"
                let expr_484 := iszero(gt(cleanup_t_uint256(expr_482), convert_t_rational_6_by_1_to_t_uint256(expr_483)))
                /// @src 0:17415:17453  "require(index <= 6, InvalidFeeIndex())"
                require_helper_t_error_4286_InvalidFeeIndex(expr_484)
                /// @src 0:17471:17487  "newSettlementFee"
                let _542 := var_newSettlementFee_469
                let expr_490 := _542
                /// @src 0:17508:17513  "index"
                let _543 := var_index_467
                let expr_492 := _543
                /// @src 0:17491:17514  "maxSettlementFee(index)"
                let expr_493 := fun_maxSettlementFee_5082(expr_492)
                /// @src 0:17471:17514  "newSettlementFee <= maxSettlementFee(index)"
                let expr_494 := iszero(gt(cleanup_t_uint256(expr_490), cleanup_t_uint256(expr_493)))
                /// @src 0:17463:17539  "require(newSettlementFee <= maxSettlementFee(index), SettlementFeeTooHigh())"
                require_helper_t_error_4344_SettlementFeeTooHigh(expr_494)
                /// @src 0:17557:17573  "newSettlementFee"
                let _544 := var_newSettlementFee_469
                let expr_500 := _544
                /// @src 0:17576:17579  "CBP"
                let expr_501 := constant_CBP_4923()
                /// @src 0:17557:17579  "newSettlementFee % CBP"
                let expr_502 := mod_t_uint256(expr_500, expr_501)

                /// @src 0:17583:17584  "0"
                let expr_503 := 0x00
                /// @src 0:17557:17584  "newSettlementFee % CBP == 0"
                let expr_504 := eq(cleanup_t_uint256(expr_502), convert_t_rational_0_by_1_to_t_uint256(expr_503))
                /// @src 0:17549:17611  "require(newSettlementFee % CBP == 0, FeeNotMultipleOfFeeCbp())"
                require_helper_t_error_4272_FeeNotMultipleOfFeeCbp(expr_504)
                /// @src 0:17790:17806  "newSettlementFee"
                let _546 := var_newSettlementFee_469
                let expr_516 := _546
                /// @src 0:17809:17812  "CBP"
                let expr_517 := constant_CBP_4923()
                /// @src 0:17790:17812  "newSettlementFee / CBP"
                let expr_518 := checked_div_t_uint256(expr_516, expr_517)

                /// @src 0:17783:17813  "uint16(newSettlementFee / CBP)"
                let expr_519 := convert_t_uint256_to_t_uint16(expr_518)
                /// @src 0:17739:17762  "defaultSettlementFeeCbp"
                let _547_slot := 0x04
                let expr_509_slot := _547_slot
                /// @src 0:17763:17772  "loanToken"
                let _548 := var_loanToken_465
                let expr_510 := _548
                /// @src 0:17739:17773  "defaultSettlementFeeCbp[loanToken]"
                let _549 := mapping_index_access_t_mapping$_t_address_$_t_array$_t_uint16_$7_storage_$_of_t_address(expr_509_slot,expr_510)
                let _550_slot := _549
                let expr_512_slot := _550_slot
                /// @src 0:17774:17779  "index"
                let _551 := var_index_467
                let expr_511 := _551
                /// @src 0:17739:17780  "defaultSettlementFeeCbp[loanToken][index]"

                let _552, _553 := storage_array_index_access_t_array$_t_uint16_$7_storage(expr_512_slot, expr_511)
                /// @src 0:17739:17813  "defaultSettlementFeeCbp[loanToken][index] = uint16(newSettlementFee / CBP)"
                update_storage_value_t_uint16_to_t_uint16(_552, _553, expr_519)
                let expr_520 := expr_519
                /// @src 0:17828:17837  "EventsLib"
                let expr_522_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:17862:17871  "loanToken"
                let _554 := var_loanToken_465
                let expr_525 := _554
                /// @src 0:17873:17878  "index"
                let _555 := var_index_467
                let expr_526 := _555
                /// @src 0:17880:17896  "newSettlementFee"
                let _556 := var_newSettlementFee_469
                let expr_527 := _556
                /// @src 0:17828:17897  "EventsLib.SetDefaultSettlementFee(loanToken, index, newSettlementFee)"
                let _557 := 0x4a3a913aa0adf6796a2827443c326f4c5e2c345f39314b893d3233751793b824
                let _558 := convert_t_address_to_t_address(expr_525)
                let _559 := convert_t_uint256_to_t_uint256(expr_526)
                {
                    let _560 := allocate_unbounded()
                    let _561 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_560 , expr_527)
                    log3(_560, sub(_561, _560) , _557, _558, _559)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3605
            /// @src 0:47325:47443  "function withdrawable(bytes32 id) external view returns (uint128) {..."
            function fun_withdrawable_3605(var_id_3594) -> var__3597 {
                /// @src 0:47382:47389  "uint128"
                let zero_t_uint128_562 := zero_value_for_split_t_uint128()
                var__3597 := zero_t_uint128_562

                /// @src 0:47408:47419  "marketState"
                let _563_slot := 0x01
                let expr_3599_slot := _563_slot
                /// @src 0:47420:47422  "id"
                let _564 := var_id_3594
                let expr_3600 := _564
                /// @src 0:47408:47423  "marketState[id]"
                let _565 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3599_slot,expr_3600)
                let _566_slot := _565
                let expr_3601_slot := _566_slot
                /// @src 0:47408:47436  "marketState[id].withdrawable"
                let _567 := add(expr_3601_slot, 1)
                let _568 := read_from_storage_split_offset_0_t_uint128(_567)
                let expr_3602 := _568
                /// @src 0:47401:47436  "return marketState[id].withdrawable"
                var__3597 := expr_3602
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function require_helper_t_error_4336_TakerUnauthorized(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x336c6d7f00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4308_MarketLossFactorMaxedOut(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x803b176400000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4300_MultipleNonZero(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x8c7ba16a00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_uint8_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint8(value)))
            }

            function require_helper_t_error_4338_TickNotAccessible(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x6e17dfb000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4314_OfferNotStarted(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x3df0df7600000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4312_OfferExpired(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x9cb1308700000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4330_SelfTake(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x116e7ef200000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4326_RatifierUnauthorized(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xa8d9c8bf00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_uint160_to_t_contract$_IRatifier_$4910(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IRatifier_$4910(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IRatifier_$4910(value)
            }

            function convert_t_contract$_IRatifier_$4910_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            // struct Market -> struct Market
            function abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr(value, pos)  -> end  {
                let tail := add(pos, 0xc0)

                {
                    // loanToken

                    let memberValue0 := mload(add(value, 0x00))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x00))
                }

                {
                    // collateralParams

                    let memberValue0 := mload(add(value, 0x20))

                    mstore(add(pos, 0x20), sub(tail, pos))
                    tail := abi_encode_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr_to_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(memberValue0, tail)

                }

                {
                    // maturity

                    let memberValue0 := mload(add(value, 0x40))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x40))
                }

                {
                    // rcfThreshold

                    let memberValue0 := mload(add(value, 0x60))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x60))
                }

                {
                    // enterGate

                    let memberValue0 := mload(add(value, 0x80))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x80))
                }

                {
                    // liquidatorGate

                    let memberValue0 := mload(add(value, 0xa0))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0xa0))
                }

                end := tail
            }

            function abi_encode_t_bool_to_t_bool(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_bytes_memory_ptr(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function copy_memory_to_memory_with_cleanup(src, dst, length) {

                mcopy(dst, src, length)
                mstore(add(dst, length), 0)

            }

            function abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr(value, pos) -> end {
                let length := array_length_t_bytes_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr(pos, length)
                copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            // struct Offer -> struct Offer
            function abi_encode_t_struct$_Offer_$4210_memory_ptr_to_t_struct$_Offer_$4210_memory_ptr_fromStack(value, pos)  -> end  {
                let tail := add(pos, 0x01c0)

                {
                    // market

                    let memberValue0 := mload(add(value, 0x00))

                    mstore(add(pos, 0x00), sub(tail, pos))
                    tail := abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr(memberValue0, tail)

                }

                {
                    // buy

                    let memberValue0 := mload(add(value, 0x20))
                    abi_encode_t_bool_to_t_bool(memberValue0, add(pos, 0x20))
                }

                {
                    // maker

                    let memberValue0 := mload(add(value, 0x40))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x40))
                }

                {
                    // start

                    let memberValue0 := mload(add(value, 0x60))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x60))
                }

                {
                    // expiry

                    let memberValue0 := mload(add(value, 0x80))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x80))
                }

                {
                    // tick

                    let memberValue0 := mload(add(value, 0xa0))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0xa0))
                }

                {
                    // group

                    let memberValue0 := mload(add(value, 0xc0))
                    abi_encode_t_bytes32_to_t_bytes32(memberValue0, add(pos, 0xc0))
                }

                {
                    // callback

                    let memberValue0 := mload(add(value, 0xe0))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0xe0))
                }

                {
                    // callbackData

                    let memberValue0 := mload(add(value, 0x0100))

                    mstore(add(pos, 0x0100), sub(tail, pos))
                    tail := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr(memberValue0, tail)

                }

                {
                    // receiverIfMakerIsSeller

                    let memberValue0 := mload(add(value, 0x0120))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x0120))
                }

                {
                    // ratifier

                    let memberValue0 := mload(add(value, 0x0140))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x0140))
                }

                {
                    // reduceOnly

                    let memberValue0 := mload(add(value, 0x0160))
                    abi_encode_t_bool_to_t_bool(memberValue0, add(pos, 0x0160))
                }

                {
                    // maxUnits

                    let memberValue0 := mload(add(value, 0x0180))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x0180))
                }

                {
                    // maxAssets

                    let memberValue0 := mload(add(value, 0x01a0))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x01a0))
                }

                end := tail
            }

            function abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value, pos) -> end {
                let length := array_length_t_bytes_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, length)
                copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            function abi_encode_tuple_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr__to_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_struct$_Offer_$4210_memory_ptr_to_t_struct$_Offer_$4210_memory_ptr_fromStack(value0,  tail)

                mstore(add(headStart, 32), sub(tail, headStart))
                tail := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value1,  tail)

            }

            function require_helper_t_error_4324_RatifierFail(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x9e8ec67600000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function read_from_memoryt_bool(ptr) -> returnValue {

                let value := cleanup_t_bool(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_bytes32(ptr) -> returnValue {

                let value := cleanup_t_bytes32(mload(ptr))

                returnValue :=

                value

            }

            function require_helper_t_error_4268_ConsumedUnits(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xe7a700db00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4266_ConsumedAssets(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x22b950bf00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                let product_raw := mul(x, y)
                product := cleanup_t_uint256(product_raw)

                // overflow, if x != 0 and y != product/x
                if iszero(
                    or(
                        iszero(x),
                        eq(y, div(product, x))
                    )
                ) { panic_error_0x11() }

            }

            function require_helper_t_error_4262_CannotIncreaseDebtPostMaturity(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xe43f9c6200000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4296_MakerCreditOrDebtIncreased(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x98dce2bc00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_uint160_to_t_contract$_IEnterGate_$4146(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IEnterGate_$4146(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IEnterGate_$4146(value)
            }

            function convert_t_contract$_IEnterGate_$4146_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_decode_t_bool_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_bool(value)
            }

            function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function require_helper_t_error_4260_BuyerGatedFromIncreasingCredit(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x71a4e09b00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4332_SellerGatedFromIncreasingDebt(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xe2d4c76c00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function abi_encode_t_uint128_to_t_uint256_fromStack(value, pos) {
                mstore(pos, convert_t_uint128_to_t_uint256(value))
            }

            function abi_encode_tuple_t_address_t_uint256_t_bool_t_bytes32_t_uint256_t_uint256_t_uint256_t_uint128_t_uint128_t_uint256_t_uint256_t_address_t_address__to_t_address_t_uint256_t_bool_t_bytes32_t_uint256_t_uint256_t_uint256_t_uint256_t_uint256_t_uint256_t_uint256_t_address_t_address__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12) -> tail {
                tail := add(headStart, 416)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_bool_to_t_bool_fromStack(value2,  add(headStart, 64))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint256_to_t_uint256_fromStack(value4,  add(headStart, 128))

                abi_encode_t_uint256_to_t_uint256_fromStack(value5,  add(headStart, 160))

                abi_encode_t_uint256_to_t_uint256_fromStack(value6,  add(headStart, 192))

                abi_encode_t_uint128_to_t_uint256_fromStack(value7,  add(headStart, 224))

                abi_encode_t_uint128_to_t_uint256_fromStack(value8,  add(headStart, 256))

                abi_encode_t_uint256_to_t_uint256_fromStack(value9,  add(headStart, 288))

                abi_encode_t_uint256_to_t_uint256_fromStack(value10,  add(headStart, 320))

                abi_encode_t_address_to_t_address_fromStack(value11,  add(headStart, 352))

                abi_encode_t_address_to_t_address_fromStack(value12,  add(headStart, 384))

            }

            function convert_t_uint160_to_t_contract$_IBuyCallback_$3998(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IBuyCallback_$3998(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IBuyCallback_$3998(value)
            }

            function convert_t_contract$_IBuyCallback_$3998_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_tuple_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint128_t_address_t_bytes_memory_ptr__to_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint256_t_address_t_bytes_memory_ptr__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6) -> tail {
                tail := add(headStart, 224)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                mstore(add(headStart, 32), sub(tail, headStart))
                tail := abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value1,  tail)

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint128_to_t_uint256_fromStack(value4,  add(headStart, 128))

                abi_encode_t_address_to_t_address_fromStack(value5,  add(headStart, 160))

                mstore(add(headStart, 192), sub(tail, headStart))
                tail := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value6,  tail)

            }

            function require_helper_t_error_4276_WrongBuyCallbackReturnValue(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xa8f3eb4400000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_uint160_to_t_contract$_ISellCallback_$4021(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_ISellCallback_$4021(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_ISellCallback_$4021(value)
            }

            function convert_t_contract$_ISellCallback_$4021_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_tuple_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint128_t_address_t_address_t_bytes_memory_ptr__to_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint256_t_address_t_address_t_bytes_memory_ptr__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6, value7) -> tail {
                tail := add(headStart, 256)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                mstore(add(headStart, 32), sub(tail, headStart))
                tail := abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value1,  tail)

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint128_to_t_uint256_fromStack(value4,  add(headStart, 128))

                abi_encode_t_address_to_t_address_fromStack(value5,  add(headStart, 160))

                abi_encode_t_address_to_t_address_fromStack(value6,  add(headStart, 192))

                mstore(add(headStart, 224), sub(tail, headStart))
                tail := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value7,  tail)

            }

            function require_helper_t_error_4278_WrongSellCallbackReturnValue(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xa4fb788300000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4334_SellerIsLiquidatable(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x4aa9880900000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 1531
            /// @src 0:20711:27602  "function take(..."
            function fun_take_1531(var_offer_764_mpos, var_ratifierData_766_mpos, var_units_768, var_taker_770, var_receiverIfTakerIsSeller_772, var_takerCallback_774, var_takerCallbackData_776_mpos) -> var__779, var__781 {
                /// @src 0:20970:20977  "uint256"
                let zero_t_uint256_569 := zero_value_for_split_t_uint256()
                var__779 := zero_t_uint256_569
                /// @src 0:20979:20986  "uint256"
                let zero_t_uint256_570 := zero_value_for_split_t_uint256()
                var__781 := zero_t_uint256_570

                /// @src 0:21006:21011  "taker"
                let _571 := var_taker_770
                let expr_784 := _571
                /// @src 0:21015:21025  "msg.sender"
                let expr_786 := caller()
                /// @src 0:21006:21025  "taker == msg.sender"
                let expr_787 := eq(cleanup_t_address(expr_784), cleanup_t_address(expr_786))
                /// @src 0:21006:21060  "taker == msg.sender || isAuthorized[taker][msg.sender]"
                let expr_794 := expr_787
                if iszero(expr_794) {
                    /// @src 0:21029:21041  "isAuthorized"
                    let _572_slot := 0x03
                    let expr_788_slot := _572_slot
                    /// @src 0:21042:21047  "taker"
                    let _573 := var_taker_770
                    let expr_789 := _573
                    /// @src 0:21029:21048  "isAuthorized[taker]"
                    let _574 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(expr_788_slot,expr_789)
                    let _575_slot := _574
                    let expr_790_slot := _575_slot
                    /// @src 0:21049:21059  "msg.sender"
                    let expr_792 := caller()
                    /// @src 0:21029:21060  "isAuthorized[taker][msg.sender]"
                    let _576 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_790_slot,expr_792)
                    let _577 := read_from_storage_split_offset_0_t_bool(_576)
                    let expr_793 := _577
                    /// @src 0:21006:21060  "taker == msg.sender || isAuthorized[taker][msg.sender]"
                    expr_794 := expr_793
                }
                /// @src 0:20998:21082  "require(taker == msg.sender || isAuthorized[taker][msg.sender], TakerUnauthorized())"
                require_helper_t_error_4336_TakerUnauthorized(expr_794)
                /// @src 0:21117:21122  "offer"
                let _578_mpos := var_offer_764_mpos
                let expr_802_mpos := _578_mpos
                /// @src 0:21117:21129  "offer.market"
                let _579 := add(expr_802_mpos, 0)
                let _580_mpos := mload(_579)
                let expr_803_mpos := _580_mpos
                /// @src 0:21105:21130  "touchMarket(offer.market)"
                let expr_804 := fun_touchMarket_3092(expr_803_mpos)
                /// @src 0:21092:21130  "bytes32 id = touchMarket(offer.market)"
                let var_id_800 := expr_804
                /// @src 0:21175:21186  "marketState"
                let _581_slot := 0x01
                let expr_809_slot := _581_slot
                /// @src 0:21187:21189  "id"
                let _582 := var_id_800
                let expr_810 := _582
                /// @src 0:21175:21190  "marketState[id]"
                let _583 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_809_slot,expr_810)
                let _584_slot := _583
                let expr_811_slot := _584_slot
                /// @src 0:21140:21190  "MarketState storage _marketState = marketState[id]"
                let var__marketState_808_slot := convert_t_struct$_MarketState_$4238_storage_to_t_struct$_MarketState_$4238_storage_ptr(expr_811_slot)
                /// @src 0:21208:21220  "_marketState"
                let _585_slot := var__marketState_808_slot
                let expr_814_slot := _585_slot
                /// @src 0:21208:21231  "_marketState.lossFactor"
                let _586 := add(expr_814_slot, 0)
                let _587 := read_from_storage_split_offset_16_t_uint128(_586)
                let expr_815 := _587
                /// @src 0:21234:21251  "type(uint128).max"
                let expr_820 := 0xffffffffffffffffffffffffffffffff
                /// @src 0:21208:21251  "_marketState.lossFactor < type(uint128).max"
                let expr_821 := lt(cleanup_t_uint128(expr_815), cleanup_t_uint128(expr_820))
                /// @src 0:21200:21280  "require(_marketState.lossFactor < type(uint128).max, MarketLossFactorMaxedOut())"
                require_helper_t_error_4308_MarketLossFactorMaxedOut(expr_821)
                /// @src 0:21298:21306  "UtilsLib"
                let expr_827_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:21324:21329  "offer"
                let _588_mpos := var_offer_764_mpos
                let expr_829_mpos := _588_mpos
                /// @src 0:21324:21339  "offer.maxAssets"
                let _589 := add(expr_829_mpos, 416)
                let _590 := read_from_memoryt_uint256(_589)
                let expr_830 := _590
                /// @src 0:21341:21346  "offer"
                let _591_mpos := var_offer_764_mpos
                let expr_831_mpos := _591_mpos
                /// @src 0:21341:21355  "offer.maxUnits"
                let _592 := add(expr_831_mpos, 384)
                let _593 := read_from_memoryt_uint256(_592)
                let expr_832 := _593
                /// @src 0:21298:21356  "UtilsLib.atMostOneNonZero(offer.maxAssets, offer.maxUnits)"
                let expr_833 := fun_atMostOneNonZero_5829(expr_830, expr_832)
                /// @src 0:21290:21376  "require(UtilsLib.atMostOneNonZero(offer.maxAssets, offer.maxUnits), MultipleNonZero())"
                require_helper_t_error_4300_MultipleNonZero(expr_833)
                /// @src 0:21394:21399  "offer"
                let _594_mpos := var_offer_764_mpos
                let expr_839_mpos := _594_mpos
                /// @src 0:21394:21404  "offer.tick"
                let _595 := add(expr_839_mpos, 160)
                let _596 := read_from_memoryt_uint256(_595)
                let expr_840 := _596
                /// @src 0:21407:21419  "_marketState"
                let _597_slot := var__marketState_808_slot
                let expr_841_slot := _597_slot
                /// @src 0:21407:21431  "_marketState.tickSpacing"
                let _598 := add(expr_841_slot, 2)
                let _599 := read_from_storage_split_offset_18_t_uint8(_598)
                let expr_842 := _599
                /// @src 0:21394:21431  "offer.tick % _marketState.tickSpacing"
                let expr_843 := mod_t_uint256(expr_840, convert_t_uint8_to_t_uint256(expr_842))

                /// @src 0:21435:21436  "0"
                let expr_844 := 0x00
                /// @src 0:21394:21436  "offer.tick % _marketState.tickSpacing == 0"
                let expr_845 := eq(cleanup_t_uint256(expr_843), convert_t_rational_0_by_1_to_t_uint256(expr_844))
                /// @src 0:21386:21458  "require(offer.tick % _marketState.tickSpacing == 0, TickNotAccessible())"
                require_helper_t_error_4338_TickNotAccessible(expr_845)
                /// @src 0:21476:21491  "block.timestamp"
                let expr_852 := timestamp()
                /// @src 0:21495:21500  "offer"
                let _600_mpos := var_offer_764_mpos
                let expr_853_mpos := _600_mpos
                /// @src 0:21495:21506  "offer.start"
                let _601 := add(expr_853_mpos, 96)
                let _602 := read_from_memoryt_uint256(_601)
                let expr_854 := _602
                /// @src 0:21476:21506  "block.timestamp >= offer.start"
                let expr_855 := iszero(lt(cleanup_t_uint256(expr_852), cleanup_t_uint256(expr_854)))
                /// @src 0:21468:21526  "require(block.timestamp >= offer.start, OfferNotStarted())"
                require_helper_t_error_4314_OfferNotStarted(expr_855)
                /// @src 0:21544:21559  "block.timestamp"
                let expr_862 := timestamp()
                /// @src 0:21563:21568  "offer"
                let _603_mpos := var_offer_764_mpos
                let expr_863_mpos := _603_mpos
                /// @src 0:21563:21575  "offer.expiry"
                let _604 := add(expr_863_mpos, 128)
                let _605 := read_from_memoryt_uint256(_604)
                let expr_864 := _605
                /// @src 0:21544:21575  "block.timestamp <= offer.expiry"
                let expr_865 := iszero(gt(cleanup_t_uint256(expr_862), cleanup_t_uint256(expr_864)))
                /// @src 0:21536:21592  "require(block.timestamp <= offer.expiry, OfferExpired())"
                require_helper_t_error_4312_OfferExpired(expr_865)
                /// @src 0:21610:21615  "offer"
                let _606_mpos := var_offer_764_mpos
                let expr_871_mpos := _606_mpos
                /// @src 0:21610:21621  "offer.maker"
                let _607 := add(expr_871_mpos, 64)
                let _608 := read_from_memoryt_address(_607)
                let expr_872 := _608
                /// @src 0:21625:21630  "taker"
                let _609 := var_taker_770
                let expr_873 := _609
                /// @src 0:21610:21630  "offer.maker != taker"
                let expr_874 := iszero(eq(cleanup_t_address(expr_872), cleanup_t_address(expr_873)))
                /// @src 0:21602:21643  "require(offer.maker != taker, SelfTake())"
                require_helper_t_error_4330_SelfTake(expr_874)
                /// @src 0:21661:21673  "isAuthorized"
                let _610_slot := 0x03
                let expr_880_slot := _610_slot
                /// @src 0:21674:21679  "offer"
                let _611_mpos := var_offer_764_mpos
                let expr_881_mpos := _611_mpos
                /// @src 0:21674:21685  "offer.maker"
                let _612 := add(expr_881_mpos, 64)
                let _613 := read_from_memoryt_address(_612)
                let expr_882 := _613
                /// @src 0:21661:21686  "isAuthorized[offer.maker]"
                let _614 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(expr_880_slot,expr_882)
                let _615_slot := _614
                let expr_883_slot := _615_slot
                /// @src 0:21687:21692  "offer"
                let _616_mpos := var_offer_764_mpos
                let expr_884_mpos := _616_mpos
                /// @src 0:21687:21701  "offer.ratifier"
                let _617 := add(expr_884_mpos, 320)
                let _618 := read_from_memoryt_address(_617)
                let expr_885 := _618
                /// @src 0:21661:21702  "isAuthorized[offer.maker][offer.ratifier]"
                let _619 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_883_slot,expr_885)
                let _620 := read_from_storage_split_offset_0_t_bool(_619)
                let expr_886 := _620
                /// @src 0:21653:21727  "require(isAuthorized[offer.maker][offer.ratifier], RatifierUnauthorized())"
                require_helper_t_error_4326_RatifierUnauthorized(expr_886)
                /// @src 0:21755:21760  "offer"
                let _621_mpos := var_offer_764_mpos
                let expr_893_mpos := _621_mpos
                /// @src 0:21755:21769  "offer.ratifier"
                let _622 := add(expr_893_mpos, 320)
                let _623 := read_from_memoryt_address(_622)
                let expr_894 := _623
                /// @src 0:21745:21770  "IRatifier(offer.ratifier)"
                let expr_895_address := convert_t_address_to_t_contract$_IRatifier_$4910(expr_894)
                /// @src 0:21745:21781  "IRatifier(offer.ratifier).isRatified"
                let expr_896_address := convert_t_contract$_IRatifier_$4910_to_t_address(expr_895_address)
                let expr_896_functionSelector := 0x675ef8d3
                /// @src 0:21782:21787  "offer"
                let _624_mpos := var_offer_764_mpos
                let expr_897_mpos := _624_mpos
                /// @src 0:21789:21801  "ratifierData"
                let _625_mpos := var_ratifierData_766_mpos
                let expr_898_mpos := _625_mpos
                /// @src 0:21745:21802  "IRatifier(offer.ratifier).isRatified(offer, ratifierData)"

                // storage for arguments and returned data
                let _626 := allocate_unbounded()
                mstore(_626, shift_left_224(expr_896_functionSelector))
                let _627 := abi_encode_tuple_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr__to_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr__fromStack(add(_626, 4) , expr_897_mpos, expr_898_mpos)

                let _628 := staticcall(gas(), expr_896_address,  _626, sub(_627, _626), _626, 32)

                if iszero(_628) { revert_forward_1() }

                let expr_899
                if _628 {

                    let _629 := 32

                    if gt(_629, returndatasize()) {
                        _629 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_626, _629)

                    // decode return parameters from external try-call into retVars
                    expr_899 :=  abi_decode_tuple_t_bytes32_fromMemory(_626, add(_626, _629))
                }
                /// @src 0:21806:21822  "CALLBACK_SUCCESS"
                let expr_900 := constant_CALLBACK_SUCCESS_4986()
                /// @src 0:21745:21822  "IRatifier(offer.ratifier).isRatified(offer, ratifierData) == CALLBACK_SUCCESS"
                let expr_901 := eq(cleanup_t_bytes32(expr_899), cleanup_t_bytes32(expr_900))
                /// @src 0:21737:21839  "require(IRatifier(offer.ratifier).isRatified(offer, ratifierData) == CALLBACK_SUCCESS, RatifierFail())"
                require_helper_t_error_4324_RatifierFail(expr_901)
                /// @src 0:21871:21878  "TickLib"
                let expr_908_address := linkersymbol("deps/midnight/src/libraries/TickLib.sol:TickLib")
                /// @src 0:21891:21896  "offer"
                let _630_mpos := var_offer_764_mpos
                let expr_910_mpos := _630_mpos
                /// @src 0:21891:21901  "offer.tick"
                let _631 := add(expr_910_mpos, 160)
                let _632 := read_from_memoryt_uint256(_631)
                let expr_911 := _632
                /// @src 0:21871:21902  "TickLib.tickToPrice(offer.tick)"
                let expr_912 := fun_tickToPrice_5743(expr_911)
                /// @src 0:21850:21902  "uint256 offerPrice = TickLib.tickToPrice(offer.tick)"
                let var_offerPrice_907 := expr_912
                /// @src 0:21937:21945  "UtilsLib"
                let expr_916_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:21959:21964  "offer"
                let _633_mpos := var_offer_764_mpos
                let expr_918_mpos := _633_mpos
                /// @src 0:21959:21971  "offer.market"
                let _634 := add(expr_918_mpos, 0)
                let _635_mpos := mload(_634)
                let expr_919_mpos := _635_mpos
                /// @src 0:21959:21980  "offer.market.maturity"
                let _636 := add(expr_919_mpos, 64)
                let _637 := read_from_memoryt_uint256(_636)
                let expr_920 := _637
                /// @src 0:21982:21997  "block.timestamp"
                let expr_922 := timestamp()
                /// @src 0:21937:21998  "UtilsLib.zeroFloorSub(offer.market.maturity, block.timestamp)"
                let expr_923 := fun_zeroFloorSub_5852(expr_920, expr_922)
                /// @src 0:21912:21998  "uint256 timeToMaturity = UtilsLib.zeroFloorSub(offer.market.maturity, block.timestamp)"
                let var_timeToMaturity_915 := expr_923
                /// @src 0:22047:22049  "id"
                let _638 := var_id_800
                let expr_928 := _638
                /// @src 0:22051:22065  "timeToMaturity"
                let _639 := var_timeToMaturity_915
                let expr_929 := _639
                /// @src 0:22033:22066  "settlementFee(id, timeToMaturity)"
                let expr_930 := fun_settlementFee_3972(expr_928, expr_929)
                /// @src 0:22008:22066  "uint256 _settlementFee = settlementFee(id, timeToMaturity)"
                let var__settlementFee_926 := expr_930
                /// @src 0:22098:22103  "offer"
                let _640_mpos := var_offer_764_mpos
                let expr_934_mpos := _640_mpos
                /// @src 0:22098:22107  "offer.buy"
                let _641 := add(expr_934_mpos, 32)
                let _642 := read_from_memoryt_bool(_641)
                let expr_935 := _642
                /// @src 0:22098:22150  "offer.buy ? offerPrice - _settlementFee : offerPrice"
                let expr_940
                switch expr_935
                case 0 {
                    /// @src 0:22140:22150  "offerPrice"
                    let _643 := var_offerPrice_907
                    let expr_939 := _643
                    /// @src 0:22098:22150  "offer.buy ? offerPrice - _settlementFee : offerPrice"
                    expr_940 := expr_939
                }
                default {
                    /// @src 0:22110:22120  "offerPrice"
                    let _644 := var_offerPrice_907
                    let expr_936 := _644
                    /// @src 0:22123:22137  "_settlementFee"
                    let _645 := var__settlementFee_926
                    let expr_937 := _645
                    /// @src 0:22110:22137  "offerPrice - _settlementFee"
                    let expr_938 := checked_sub_t_uint256(expr_936, expr_937)

                    /// @src 0:22098:22150  "offer.buy ? offerPrice - _settlementFee : offerPrice"
                    expr_940 := expr_938
                }
                /// @src 0:22076:22150  "uint256 sellerPrice = offer.buy ? offerPrice - _settlementFee : offerPrice"
                let var_sellerPrice_933 := expr_940
                /// @src 0:22181:22192  "sellerPrice"
                let _646 := var_sellerPrice_933
                let expr_944 := _646
                /// @src 0:22195:22209  "_settlementFee"
                let _647 := var__settlementFee_926
                let expr_945 := _647
                /// @src 0:22181:22209  "sellerPrice + _settlementFee"
                let expr_946 := checked_add_t_uint256(expr_944, expr_945)

                /// @src 0:22160:22209  "uint256 buyerPrice = sellerPrice + _settlementFee"
                let var_buyerPrice_943 := expr_946
                /// @src 0:22241:22246  "offer"
                let _648_mpos := var_offer_764_mpos
                let expr_950_mpos := _648_mpos
                /// @src 0:22241:22250  "offer.buy"
                let _649 := add(expr_950_mpos, 32)
                let _650 := read_from_memoryt_bool(_649)
                let expr_951 := _650
                /// @src 0:22241:22320  "offer.buy ? units.mulDivDown(buyerPrice, WAD) : units.mulDivUp(buyerPrice, WAD)"
                let expr_962
                switch expr_951
                case 0 {
                    /// @src 0:22289:22294  "units"
                    let _651 := var_units_768
                    let expr_957 := _651
                    /// @src 0:22289:22303  "units.mulDivUp"
                    let expr_958_self := expr_957
                    /// @src 0:22304:22314  "buyerPrice"
                    let _652 := var_buyerPrice_943
                    let expr_959 := _652
                    /// @src 0:22316:22319  "WAD"
                    let expr_960 := constant_WAD_4917()
                    /// @src 0:22289:22320  "units.mulDivUp(buyerPrice, WAD)"
                    let expr_961 := fun_mulDivUp_5897(expr_958_self, expr_959, expr_960)
                    /// @src 0:22241:22320  "offer.buy ? units.mulDivDown(buyerPrice, WAD) : units.mulDivUp(buyerPrice, WAD)"
                    expr_962 := expr_961
                }
                default {
                    /// @src 0:22253:22258  "units"
                    let _653 := var_units_768
                    let expr_952 := _653
                    /// @src 0:22253:22269  "units.mulDivDown"
                    let expr_953_self := expr_952
                    /// @src 0:22270:22280  "buyerPrice"
                    let _654 := var_buyerPrice_943
                    let expr_954 := _654
                    /// @src 0:22282:22285  "WAD"
                    let expr_955 := constant_WAD_4917()
                    /// @src 0:22253:22286  "units.mulDivDown(buyerPrice, WAD)"
                    let expr_956 := fun_mulDivDown_5872(expr_953_self, expr_954, expr_955)
                    /// @src 0:22241:22320  "offer.buy ? units.mulDivDown(buyerPrice, WAD) : units.mulDivUp(buyerPrice, WAD)"
                    expr_962 := expr_956
                }
                /// @src 0:22219:22320  "uint256 buyerAssets = offer.buy ? units.mulDivDown(buyerPrice, WAD) : units.mulDivUp(buyerPrice, WAD)"
                let var_buyerAssets_949 := expr_962
                /// @src 0:22353:22358  "offer"
                let _655_mpos := var_offer_764_mpos
                let expr_966_mpos := _655_mpos
                /// @src 0:22353:22362  "offer.buy"
                let _656 := add(expr_966_mpos, 32)
                let _657 := read_from_memoryt_bool(_656)
                let expr_967 := _657
                /// @src 0:22353:22434  "offer.buy ? units.mulDivDown(sellerPrice, WAD) : units.mulDivUp(sellerPrice, WAD)"
                let expr_978
                switch expr_967
                case 0 {
                    /// @src 0:22402:22407  "units"
                    let _658 := var_units_768
                    let expr_973 := _658
                    /// @src 0:22402:22416  "units.mulDivUp"
                    let expr_974_self := expr_973
                    /// @src 0:22417:22428  "sellerPrice"
                    let _659 := var_sellerPrice_933
                    let expr_975 := _659
                    /// @src 0:22430:22433  "WAD"
                    let expr_976 := constant_WAD_4917()
                    /// @src 0:22402:22434  "units.mulDivUp(sellerPrice, WAD)"
                    let expr_977 := fun_mulDivUp_5897(expr_974_self, expr_975, expr_976)
                    /// @src 0:22353:22434  "offer.buy ? units.mulDivDown(sellerPrice, WAD) : units.mulDivUp(sellerPrice, WAD)"
                    expr_978 := expr_977
                }
                default {
                    /// @src 0:22365:22370  "units"
                    let _660 := var_units_768
                    let expr_968 := _660
                    /// @src 0:22365:22381  "units.mulDivDown"
                    let expr_969_self := expr_968
                    /// @src 0:22382:22393  "sellerPrice"
                    let _661 := var_sellerPrice_933
                    let expr_970 := _661
                    /// @src 0:22395:22398  "WAD"
                    let expr_971 := constant_WAD_4917()
                    /// @src 0:22365:22399  "units.mulDivDown(sellerPrice, WAD)"
                    let expr_972 := fun_mulDivDown_5872(expr_969_self, expr_970, expr_971)
                    /// @src 0:22353:22434  "offer.buy ? units.mulDivDown(sellerPrice, WAD) : units.mulDivUp(sellerPrice, WAD)"
                    expr_978 := expr_972
                }
                /// @src 0:22330:22434  "uint256 sellerAssets = offer.buy ? units.mulDivDown(sellerPrice, WAD) : units.mulDivUp(sellerPrice, WAD)"
                let var_sellerAssets_965 := expr_978
                /// @src 0:22445:22464  "uint256 newConsumed"
                let var_newConsumed_981
                let zero_t_uint256_662 := zero_value_for_split_t_uint256()
                var_newConsumed_981 := zero_t_uint256_662
                /// @src 0:22478:22483  "offer"
                let _663_mpos := var_offer_764_mpos
                let expr_983_mpos := _663_mpos
                /// @src 0:22478:22493  "offer.maxAssets"
                let _664 := add(expr_983_mpos, 416)
                let _665 := read_from_memoryt_uint256(_664)
                let expr_984 := _665
                /// @src 0:22496:22497  "0"
                let expr_985 := 0x00
                /// @src 0:22478:22497  "offer.maxAssets > 0"
                let expr_986 := gt(cleanup_t_uint256(expr_984), convert_t_rational_0_by_1_to_t_uint256(expr_985))
                /// @src 0:22474:22842  "if (offer.maxAssets > 0) {..."
                switch expr_986
                case 0 {
                    /// @src 0:22757:22762  "units"
                    let _666 := var_units_768
                    let expr_1021 := _666
                    /// @src 0:22719:22727  "consumed"
                    let _667_slot := 0x02
                    let expr_1014_slot := _667_slot
                    /// @src 0:22728:22733  "offer"
                    let _668_mpos := var_offer_764_mpos
                    let expr_1015_mpos := _668_mpos
                    /// @src 0:22728:22739  "offer.maker"
                    let _669 := add(expr_1015_mpos, 64)
                    let _670 := read_from_memoryt_address(_669)
                    let expr_1016 := _670
                    /// @src 0:22719:22740  "consumed[offer.maker]"
                    let _671 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_uint256_$_$_of_t_address(expr_1014_slot,expr_1016)
                    let _672_slot := _671
                    let expr_1017_slot := _672_slot
                    /// @src 0:22741:22746  "offer"
                    let _673_mpos := var_offer_764_mpos
                    let expr_1018_mpos := _673_mpos
                    /// @src 0:22741:22752  "offer.group"
                    let _674 := add(expr_1018_mpos, 192)
                    let _675 := read_from_memoryt_bytes32(_674)
                    let expr_1019 := _675
                    /// @src 0:22719:22753  "consumed[offer.maker][offer.group]"
                    let _676 := mapping_index_access_t_mapping$_t_bytes32_$_t_uint256_$_of_t_bytes32(expr_1017_slot,expr_1019)
                    /// @src 0:22719:22762  "consumed[offer.maker][offer.group] += units"
                    let _677 := read_from_storage_split_offset_0_t_uint256(_676)
                    let expr_1022 := checked_add_t_uint256(_677, expr_1021)

                    update_storage_value_offset_0_t_uint256_to_t_uint256(_676, expr_1022)
                    /// @src 0:22705:22762  "newConsumed = consumed[offer.maker][offer.group] += units"
                    var_newConsumed_981 := expr_1022
                    let expr_1023 := expr_1022
                    /// @src 0:22784:22795  "newConsumed"
                    let _678 := var_newConsumed_981
                    let expr_1026 := _678
                    /// @src 0:22799:22804  "offer"
                    let _679_mpos := var_offer_764_mpos
                    let expr_1027_mpos := _679_mpos
                    /// @src 0:22799:22813  "offer.maxUnits"
                    let _680 := add(expr_1027_mpos, 384)
                    let _681 := read_from_memoryt_uint256(_680)
                    let expr_1028 := _681
                    /// @src 0:22784:22813  "newConsumed <= offer.maxUnits"
                    let expr_1029 := iszero(gt(cleanup_t_uint256(expr_1026), cleanup_t_uint256(expr_1028)))
                    /// @src 0:22776:22831  "require(newConsumed <= offer.maxUnits, ConsumedUnits())"
                    require_helper_t_error_4268_ConsumedUnits(expr_1029)
                    /// @src 0:22474:22842  "if (offer.maxAssets > 0) {..."
                }
                default {
                    /// @src 0:22565:22570  "offer"
                    let _682_mpos := var_offer_764_mpos
                    let expr_995_mpos := _682_mpos
                    /// @src 0:22565:22574  "offer.buy"
                    let _683 := add(expr_995_mpos, 32)
                    let _684 := read_from_memoryt_bool(_683)
                    let expr_996 := _684
                    /// @src 0:22565:22603  "offer.buy ? buyerAssets : sellerAssets"
                    let expr_999
                    switch expr_996
                    case 0 {
                        /// @src 0:22591:22603  "sellerAssets"
                        let _685 := var_sellerAssets_965
                        let expr_998 := _685
                        /// @src 0:22565:22603  "offer.buy ? buyerAssets : sellerAssets"
                        expr_999 := expr_998
                    }
                    default {
                        /// @src 0:22577:22588  "buyerAssets"
                        let _686 := var_buyerAssets_949
                        let expr_997 := _686
                        /// @src 0:22565:22603  "offer.buy ? buyerAssets : sellerAssets"
                        expr_999 := expr_997
                    }
                    /// @src 0:22527:22535  "consumed"
                    let _687_slot := 0x02
                    let expr_988_slot := _687_slot
                    /// @src 0:22536:22541  "offer"
                    let _688_mpos := var_offer_764_mpos
                    let expr_989_mpos := _688_mpos
                    /// @src 0:22536:22547  "offer.maker"
                    let _689 := add(expr_989_mpos, 64)
                    let _690 := read_from_memoryt_address(_689)
                    let expr_990 := _690
                    /// @src 0:22527:22548  "consumed[offer.maker]"
                    let _691 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_uint256_$_$_of_t_address(expr_988_slot,expr_990)
                    let _692_slot := _691
                    let expr_991_slot := _692_slot
                    /// @src 0:22549:22554  "offer"
                    let _693_mpos := var_offer_764_mpos
                    let expr_992_mpos := _693_mpos
                    /// @src 0:22549:22560  "offer.group"
                    let _694 := add(expr_992_mpos, 192)
                    let _695 := read_from_memoryt_bytes32(_694)
                    let expr_993 := _695
                    /// @src 0:22527:22561  "consumed[offer.maker][offer.group]"
                    let _696 := mapping_index_access_t_mapping$_t_bytes32_$_t_uint256_$_of_t_bytes32(expr_991_slot,expr_993)
                    /// @src 0:22527:22603  "consumed[offer.maker][offer.group] += offer.buy ? buyerAssets : sellerAssets"
                    let _697 := read_from_storage_split_offset_0_t_uint256(_696)
                    let expr_1000 := checked_add_t_uint256(_697, expr_999)

                    update_storage_value_offset_0_t_uint256_to_t_uint256(_696, expr_1000)
                    /// @src 0:22513:22603  "newConsumed = consumed[offer.maker][offer.group] += offer.buy ? buyerAssets : sellerAssets"
                    var_newConsumed_981 := expr_1000
                    let expr_1001 := expr_1000
                    /// @src 0:22625:22636  "newConsumed"
                    let _698 := var_newConsumed_981
                    let expr_1004 := _698
                    /// @src 0:22640:22645  "offer"
                    let _699_mpos := var_offer_764_mpos
                    let expr_1005_mpos := _699_mpos
                    /// @src 0:22640:22655  "offer.maxAssets"
                    let _700 := add(expr_1005_mpos, 416)
                    let _701 := read_from_memoryt_uint256(_700)
                    let expr_1006 := _701
                    /// @src 0:22625:22655  "newConsumed <= offer.maxAssets"
                    let expr_1007 := iszero(gt(cleanup_t_uint256(expr_1004), cleanup_t_uint256(expr_1006)))
                    /// @src 0:22617:22674  "require(newConsumed <= offer.maxAssets, ConsumedAssets())"
                    require_helper_t_error_4266_ConsumedAssets(expr_1007)
                    /// @src 0:22474:22842  "if (offer.maxAssets > 0) {..."
                }
                /// @src 0:22886:22891  "offer"
                let _702_mpos := var_offer_764_mpos
                let expr_1040_mpos := _702_mpos
                /// @src 0:22886:22895  "offer.buy"
                let _703 := add(expr_1040_mpos, 32)
                let _704 := read_from_memoryt_bool(_703)
                let expr_1041 := _704
                /// @src 0:22886:22941  "offer.buy ? (offer.maker, taker) : (taker, offer.maker)"
                let expr_1050_component_1, expr_1050_component_2
                switch expr_1041
                case 0 {
                    /// @src 0:22922:22927  "taker"
                    let _705 := var_taker_770
                    let expr_1046 := _705
                    /// @src 0:22921:22941  "(taker, offer.maker)"
                    let expr_1049_component_1 := expr_1046
                    /// @src 0:22929:22934  "offer"
                    let _706_mpos := var_offer_764_mpos
                    let expr_1047_mpos := _706_mpos
                    /// @src 0:22929:22940  "offer.maker"
                    let _707 := add(expr_1047_mpos, 64)
                    let _708 := read_from_memoryt_address(_707)
                    let expr_1048 := _708
                    /// @src 0:22921:22941  "(taker, offer.maker)"
                    let expr_1049_component_2 := expr_1048
                    /// @src 0:22886:22941  "offer.buy ? (offer.maker, taker) : (taker, offer.maker)"
                    expr_1050_component_1 := expr_1049_component_1
                    expr_1050_component_2 := expr_1049_component_2
                }
                default {
                    /// @src 0:22899:22904  "offer"
                    let _709_mpos := var_offer_764_mpos
                    let expr_1042_mpos := _709_mpos
                    /// @src 0:22899:22910  "offer.maker"
                    let _710 := add(expr_1042_mpos, 64)
                    let _711 := read_from_memoryt_address(_710)
                    let expr_1043 := _711
                    /// @src 0:22898:22918  "(offer.maker, taker)"
                    let expr_1045_component_1 := expr_1043
                    /// @src 0:22912:22917  "taker"
                    let _712 := var_taker_770
                    let expr_1044 := _712
                    /// @src 0:22898:22918  "(offer.maker, taker)"
                    let expr_1045_component_2 := expr_1044
                    /// @src 0:22886:22941  "offer.buy ? (offer.maker, taker) : (taker, offer.maker)"
                    expr_1050_component_1 := expr_1045_component_1
                    expr_1050_component_2 := expr_1045_component_2
                }
                /// @src 0:22852:22941  "(address buyer, address seller) = offer.buy ? (offer.maker, taker) : (taker, offer.maker)"
                let var_buyer_1037 := expr_1050_component_1
                let var_seller_1039 := expr_1050_component_2
                /// @src 0:22979:22987  "position"
                let _713_slot := 0x00
                let expr_1055_slot := _713_slot
                /// @src 0:22988:22990  "id"
                let _714 := var_id_800
                let expr_1056 := _714
                /// @src 0:22979:22991  "position[id]"
                let _715 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_1055_slot,expr_1056)
                let _716_slot := _715
                let expr_1057_slot := _716_slot
                /// @src 0:22992:22997  "buyer"
                let _717 := var_buyer_1037
                let expr_1058 := _717
                /// @src 0:22979:22998  "position[id][buyer]"
                let _718 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_1057_slot,expr_1058)
                let _719_slot := _718
                let expr_1059_slot := _719_slot
                /// @src 0:22951:22998  "Position storage buyerPos = position[id][buyer]"
                let var_buyerPos_1054_slot := convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(expr_1059_slot)
                /// @src 0:23037:23045  "position"
                let _720_slot := 0x00
                let expr_1064_slot := _720_slot
                /// @src 0:23046:23048  "id"
                let _721 := var_id_800
                let expr_1065 := _721
                /// @src 0:23037:23049  "position[id]"
                let _722 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_1064_slot,expr_1065)
                let _723_slot := _722
                let expr_1066_slot := _723_slot
                /// @src 0:23050:23056  "seller"
                let _724 := var_seller_1039
                let expr_1067 := _724
                /// @src 0:23037:23057  "position[id][seller]"
                let _725 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_1066_slot,expr_1067)
                let _726_slot := _725
                let expr_1068_slot := _726_slot
                /// @src 0:23008:23057  "Position storage sellerPos = position[id][seller]"
                let var_sellerPos_1063_slot := convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(expr_1068_slot)
                /// @src 0:23082:23084  "id"
                let _727 := var_id_800
                let expr_1071 := _727
                /// @src 0:23086:23091  "buyer"
                let _728 := var_buyer_1037
                let expr_1072 := _728
                /// @src 0:23072:23092  "hasCredit(id, buyer)"
                let expr_1073 := fun_hasCredit_3402(expr_1071, expr_1072)
                /// @src 0:23072:23117  "hasCredit(id, buyer) || units > buyerPos.debt"
                let expr_1078 := expr_1073
                if iszero(expr_1078) {
                    /// @src 0:23096:23101  "units"
                    let _729 := var_units_768
                    let expr_1074 := _729
                    /// @src 0:23104:23112  "buyerPos"
                    let _730_slot := var_buyerPos_1054_slot
                    let expr_1075_slot := _730_slot
                    /// @src 0:23104:23117  "buyerPos.debt"
                    let _731 := add(expr_1075_slot, 2)
                    let _732 := read_from_storage_split_offset_0_t_uint128(_731)
                    let expr_1076 := _732
                    /// @src 0:23096:23117  "units > buyerPos.debt"
                    let expr_1077 := gt(cleanup_t_uint256(expr_1074), convert_t_uint128_to_t_uint256(expr_1076))
                    /// @src 0:23072:23117  "hasCredit(id, buyer) || units > buyerPos.debt"
                    expr_1078 := expr_1077
                }
                /// @src 0:23068:23159  "if (hasCredit(id, buyer) || units > buyerPos.debt) _updatePosition(offer.market, id, buyer)"
                if expr_1078 {
                    /// @src 0:23135:23140  "offer"
                    let _733_mpos := var_offer_764_mpos
                    let expr_1080_mpos := _733_mpos
                    /// @src 0:23135:23147  "offer.market"
                    let _734 := add(expr_1080_mpos, 0)
                    let _735_mpos := mload(_734)
                    let expr_1081_mpos := _735_mpos
                    /// @src 0:23149:23151  "id"
                    let _736 := var_id_800
                    let expr_1082 := _736
                    /// @src 0:23153:23158  "buyer"
                    let _737 := var_buyer_1037
                    let expr_1083 := _737
                    /// @src 0:23119:23159  "_updatePosition(offer.market, id, buyer)"
                    let expr_1084_component_1, expr_1084_component_2, expr_1084_component_3 := fun__updatePosition_3383(expr_1081_mpos, expr_1082, expr_1083)
                    /// @src 0:23068:23159  "if (hasCredit(id, buyer) || units > buyerPos.debt) _updatePosition(offer.market, id, buyer)"
                }
                /// @src 0:23183:23185  "id"
                let _738 := var_id_800
                let expr_1088 := _738
                /// @src 0:23187:23193  "seller"
                let _739 := var_seller_1039
                let expr_1089 := _739
                /// @src 0:23173:23194  "hasCredit(id, seller)"
                let expr_1090 := fun_hasCredit_3402(expr_1088, expr_1089)
                /// @src 0:23169:23237  "if (hasCredit(id, seller)) _updatePosition(offer.market, id, seller)"
                if expr_1090 {
                    /// @src 0:23212:23217  "offer"
                    let _740_mpos := var_offer_764_mpos
                    let expr_1092_mpos := _740_mpos
                    /// @src 0:23212:23224  "offer.market"
                    let _741 := add(expr_1092_mpos, 0)
                    let _742_mpos := mload(_741)
                    let expr_1093_mpos := _742_mpos
                    /// @src 0:23226:23228  "id"
                    let _743 := var_id_800
                    let expr_1094 := _743
                    /// @src 0:23230:23236  "seller"
                    let _744 := var_seller_1039
                    let expr_1095 := _744
                    /// @src 0:23196:23237  "_updatePosition(offer.market, id, seller)"
                    let expr_1096_component_1, expr_1096_component_2, expr_1096_component_3 := fun__updatePosition_3383(expr_1093_mpos, expr_1094, expr_1095)
                    /// @src 0:23169:23237  "if (hasCredit(id, seller)) _updatePosition(offer.market, id, seller)"
                }
                /// @src 0:23278:23286  "UtilsLib"
                let expr_1101_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:23300:23305  "units"
                let _745 := var_units_768
                let expr_1103 := _745
                /// @src 0:23307:23315  "buyerPos"
                let _746_slot := var_buyerPos_1054_slot
                let expr_1104_slot := _746_slot
                /// @src 0:23307:23320  "buyerPos.debt"
                let _747 := add(expr_1104_slot, 2)
                let _748 := read_from_storage_split_offset_0_t_uint128(_747)
                let expr_1105 := _748
                /// @src 0:23278:23321  "UtilsLib.zeroFloorSub(units, buyerPos.debt)"
                let _749 := convert_t_uint128_to_t_uint256(expr_1105)
                let expr_1106 := fun_zeroFloorSub_5852(expr_1103, _749)
                /// @src 0:23248:23321  "uint256 buyerCreditIncrease = UtilsLib.zeroFloorSub(units, buyerPos.debt)"
                let var_buyerCreditIncrease_1100 := expr_1106
                /// @src 0:23362:23370  "UtilsLib"
                let expr_1110_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:23375:23380  "units"
                let _750 := var_units_768
                let expr_1112 := _750
                /// @src 0:23382:23391  "sellerPos"
                let _751_slot := var_sellerPos_1063_slot
                let expr_1113_slot := _751_slot
                /// @src 0:23382:23398  "sellerPos.credit"
                let _752 := add(expr_1113_slot, 0)
                let _753 := read_from_storage_split_offset_0_t_uint128(_752)
                let expr_1114 := _753
                /// @src 0:23362:23399  "UtilsLib.min(units, sellerPos.credit)"
                let _754 := convert_t_uint128_to_t_uint256(expr_1114)
                let expr_1115 := fun_min_5841(expr_1112, _754)
                /// @src 0:23331:23399  "uint256 sellerCreditDecrease = UtilsLib.min(units, sellerPos.credit)"
                let var_sellerCreditDecrease_1109 := expr_1115
                /// @src 0:23438:23443  "units"
                let _755 := var_units_768
                let expr_1119 := _755
                /// @src 0:23446:23466  "sellerCreditDecrease"
                let _756 := var_sellerCreditDecrease_1109
                let expr_1120 := _756
                /// @src 0:23438:23466  "units - sellerCreditDecrease"
                let expr_1121 := checked_sub_t_uint256(expr_1119, expr_1120)

                /// @src 0:23409:23466  "uint256 sellerDebtIncrease = units - sellerCreditDecrease"
                let var_sellerDebtIncrease_1118 := expr_1121
                /// @src 0:23522:23530  "UtilsLib"
                let expr_1125_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:23541:23560  "buyerCreditIncrease"
                let _757 := var_buyerCreditIncrease_1100
                let expr_1127 := _757
                /// @src 0:23541:23571  "buyerCreditIncrease.mulDivDown"
                let expr_1128_self := expr_1127
                /// @src 0:23572:23584  "_marketState"
                let _758_slot := var__marketState_808_slot
                let expr_1129_slot := _758_slot
                /// @src 0:23572:23598  "_marketState.continuousFee"
                let _759 := add(expr_1129_slot, 2)
                let _760 := read_from_storage_split_offset_14_t_uint32(_759)
                let expr_1130 := _760
                /// @src 0:23601:23615  "timeToMaturity"
                let _761 := var_timeToMaturity_915
                let expr_1131 := _761
                /// @src 0:23572:23615  "_marketState.continuousFee * timeToMaturity"
                let expr_1132 := checked_mul_t_uint256(convert_t_uint32_to_t_uint256(expr_1130), expr_1131)

                /// @src 0:23617:23620  "WAD"
                let expr_1133 := constant_WAD_4917()
                /// @src 0:23541:23621  "buyerCreditIncrease.mulDivDown(_marketState.continuousFee * timeToMaturity, WAD)"
                let expr_1134 := fun_mulDivDown_5872(expr_1128_self, expr_1132, expr_1133)
                /// @src 0:23522:23622  "UtilsLib.toUint128(buyerCreditIncrease.mulDivDown(_marketState.continuousFee * timeToMaturity, WAD))"
                let expr_1135 := fun_toUint128_5922(expr_1134)
                /// @src 0:23476:23622  "uint128 buyerPendingFeeIncrease =..."
                let var_buyerPendingFeeIncrease_1124 := expr_1135
                /// @src 0:23667:23676  "sellerPos"
                let _762_slot := var_sellerPos_1063_slot
                let expr_1139_slot := _762_slot
                /// @src 0:23667:23683  "sellerPos.credit"
                let _763 := add(expr_1139_slot, 0)
                let _764 := read_from_storage_split_offset_0_t_uint128(_763)
                let expr_1140 := _764
                /// @src 0:23686:23687  "0"
                let expr_1141 := 0x00
                /// @src 0:23667:23687  "sellerPos.credit > 0"
                let expr_1142 := gt(cleanup_t_uint128(expr_1140), convert_t_rational_0_by_1_to_t_uint128(expr_1141))
                /// @src 0:23667:23807  "sellerPos.credit > 0..."
                let expr_1154
                switch expr_1142
                case 0 {
                    /// @src 0:23806:23807  "0"
                    let expr_1153 := 0x00
                    /// @src 0:23667:23807  "sellerPos.credit > 0..."
                    expr_1154 := convert_t_rational_0_by_1_to_t_uint128(expr_1153)
                }
                default {
                    /// @src 0:23702:23710  "UtilsLib"
                    let expr_1143_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:23721:23730  "sellerPos"
                    let _765_slot := var_sellerPos_1063_slot
                    let expr_1145_slot := _765_slot
                    /// @src 0:23721:23741  "sellerPos.pendingFee"
                    let _766 := add(expr_1145_slot, 0)
                    let _767 := read_from_storage_split_offset_16_t_uint128(_766)
                    let expr_1146 := _767
                    /// @src 0:23721:23750  "sellerPos.pendingFee.mulDivUp"
                    let expr_1147_self := convert_t_uint128_to_t_uint256(expr_1146)
                    /// @src 0:23751:23771  "sellerCreditDecrease"
                    let _768 := var_sellerCreditDecrease_1109
                    let expr_1148 := _768
                    /// @src 0:23773:23782  "sellerPos"
                    let _769_slot := var_sellerPos_1063_slot
                    let expr_1149_slot := _769_slot
                    /// @src 0:23773:23789  "sellerPos.credit"
                    let _770 := add(expr_1149_slot, 0)
                    let _771 := read_from_storage_split_offset_0_t_uint128(_770)
                    let expr_1150 := _771
                    /// @src 0:23721:23790  "sellerPos.pendingFee.mulDivUp(sellerCreditDecrease, sellerPos.credit)"
                    let _772 := convert_t_uint128_to_t_uint256(expr_1150)
                    let expr_1151 := fun_mulDivUp_5897(expr_1147_self, expr_1148, _772)
                    /// @src 0:23702:23791  "UtilsLib.toUint128(sellerPos.pendingFee.mulDivUp(sellerCreditDecrease, sellerPos.credit))"
                    let expr_1152 := fun_toUint128_5922(expr_1151)
                    /// @src 0:23667:23807  "sellerPos.credit > 0..."
                    expr_1154 := expr_1152
                }
                /// @src 0:23632:23807  "uint128 sellerPendingFeeDecrease = sellerPos.credit > 0..."
                let var_sellerPendingFeeDecrease_1138 := expr_1154
                /// @src 0:23826:23841  "block.timestamp"
                let expr_1158 := timestamp()
                /// @src 0:23845:23850  "offer"
                let _773_mpos := var_offer_764_mpos
                let expr_1159_mpos := _773_mpos
                /// @src 0:23845:23857  "offer.market"
                let _774 := add(expr_1159_mpos, 0)
                let _775_mpos := mload(_774)
                let expr_1160_mpos := _775_mpos
                /// @src 0:23845:23866  "offer.market.maturity"
                let _776 := add(expr_1160_mpos, 64)
                let _777 := read_from_memoryt_uint256(_776)
                let expr_1161 := _777
                /// @src 0:23826:23866  "block.timestamp <= offer.market.maturity"
                let expr_1162 := iszero(gt(cleanup_t_uint256(expr_1158), cleanup_t_uint256(expr_1161)))
                /// @src 0:23826:23893  "block.timestamp <= offer.market.maturity || sellerDebtIncrease == 0"
                let expr_1166 := expr_1162
                if iszero(expr_1166) {
                    /// @src 0:23870:23888  "sellerDebtIncrease"
                    let _778 := var_sellerDebtIncrease_1118
                    let expr_1163 := _778
                    /// @src 0:23892:23893  "0"
                    let expr_1164 := 0x00
                    /// @src 0:23870:23893  "sellerDebtIncrease == 0"
                    let expr_1165 := eq(cleanup_t_uint256(expr_1163), convert_t_rational_0_by_1_to_t_uint256(expr_1164))
                    /// @src 0:23826:23893  "block.timestamp <= offer.market.maturity || sellerDebtIncrease == 0"
                    expr_1166 := expr_1165
                }
                /// @src 0:23818:23928  "require(block.timestamp <= offer.market.maturity || sellerDebtIncrease == 0, CannotIncreaseDebtPostMaturity())"
                require_helper_t_error_4262_CannotIncreaseDebtPostMaturity(expr_1166)
                /// @src 0:23960:23965  "offer"
                let _779_mpos := var_offer_764_mpos
                let expr_1172_mpos := _779_mpos
                /// @src 0:23960:23976  "offer.reduceOnly"
                let _780 := add(expr_1172_mpos, 352)
                let _781 := read_from_memoryt_bool(_780)
                let expr_1173 := _781
                /// @src 0:23959:23976  "!offer.reduceOnly"
                let expr_1174 := cleanup_t_bool(iszero(expr_1173))
                /// @src 0:23959:24044  "!offer.reduceOnly || (offer.buy ? buyerCreditIncrease == 0 : sellerDebtIncrease == 0)"
                let expr_1185 := expr_1174
                if iszero(expr_1185) {
                    /// @src 0:23981:23986  "offer"
                    let _782_mpos := var_offer_764_mpos
                    let expr_1175_mpos := _782_mpos
                    /// @src 0:23981:23990  "offer.buy"
                    let _783 := add(expr_1175_mpos, 32)
                    let _784 := read_from_memoryt_bool(_783)
                    let expr_1176 := _784
                    /// @src 0:23981:24043  "offer.buy ? buyerCreditIncrease == 0 : sellerDebtIncrease == 0"
                    let expr_1183
                    switch expr_1176
                    case 0 {
                        /// @src 0:24020:24038  "sellerDebtIncrease"
                        let _785 := var_sellerDebtIncrease_1118
                        let expr_1180 := _785
                        /// @src 0:24042:24043  "0"
                        let expr_1181 := 0x00
                        /// @src 0:24020:24043  "sellerDebtIncrease == 0"
                        let expr_1182 := eq(cleanup_t_uint256(expr_1180), convert_t_rational_0_by_1_to_t_uint256(expr_1181))
                        /// @src 0:23981:24043  "offer.buy ? buyerCreditIncrease == 0 : sellerDebtIncrease == 0"
                        expr_1183 := expr_1182
                    }
                    default {
                        /// @src 0:23993:24012  "buyerCreditIncrease"
                        let _786 := var_buyerCreditIncrease_1100
                        let expr_1177 := _786
                        /// @src 0:24016:24017  "0"
                        let expr_1178 := 0x00
                        /// @src 0:23993:24017  "buyerCreditIncrease == 0"
                        let expr_1179 := eq(cleanup_t_uint256(expr_1177), convert_t_rational_0_by_1_to_t_uint256(expr_1178))
                        /// @src 0:23981:24043  "offer.buy ? buyerCreditIncrease == 0 : sellerDebtIncrease == 0"
                        expr_1183 := expr_1179
                    }
                    /// @src 0:23980:24044  "(offer.buy ? buyerCreditIncrease == 0 : sellerDebtIncrease == 0)"
                    let expr_1184 := expr_1183
                    /// @src 0:23959:24044  "!offer.reduceOnly || (offer.buy ? buyerCreditIncrease == 0 : sellerDebtIncrease == 0)"
                    expr_1185 := expr_1184
                }
                /// @src 0:23938:24096  "require(..."
                require_helper_t_error_4296_MakerCreditOrDebtIncreased(expr_1185)
                /// @src 0:24128:24133  "offer"
                let _787_mpos := var_offer_764_mpos
                let expr_1191_mpos := _787_mpos
                /// @src 0:24128:24140  "offer.market"
                let _788 := add(expr_1191_mpos, 0)
                let _789_mpos := mload(_788)
                let expr_1192_mpos := _789_mpos
                /// @src 0:24128:24150  "offer.market.enterGate"
                let _790 := add(expr_1192_mpos, 128)
                let _791 := read_from_memoryt_address(_790)
                let expr_1193 := _791
                /// @src 0:24162:24163  "0"
                let expr_1196 := 0x00
                /// @src 0:24154:24164  "address(0)"
                let expr_1197 := convert_t_rational_0_by_1_to_t_address(expr_1196)
                /// @src 0:24128:24164  "offer.market.enterGate == address(0)"
                let expr_1198 := eq(cleanup_t_address(expr_1193), cleanup_t_address(expr_1197))
                /// @src 0:24128:24192  "offer.market.enterGate == address(0) || buyerCreditIncrease == 0"
                let expr_1202 := expr_1198
                if iszero(expr_1202) {
                    /// @src 0:24168:24187  "buyerCreditIncrease"
                    let _792 := var_buyerCreditIncrease_1100
                    let expr_1199 := _792
                    /// @src 0:24191:24192  "0"
                    let expr_1200 := 0x00
                    /// @src 0:24168:24192  "buyerCreditIncrease == 0"
                    let expr_1201 := eq(cleanup_t_uint256(expr_1199), convert_t_rational_0_by_1_to_t_uint256(expr_1200))
                    /// @src 0:24128:24192  "offer.market.enterGate == address(0) || buyerCreditIncrease == 0"
                    expr_1202 := expr_1201
                }
                /// @src 0:24128:24271  "offer.market.enterGate == address(0) || buyerCreditIncrease == 0..."
                let expr_1211 := expr_1202
                if iszero(expr_1211) {
                    /// @src 0:24223:24228  "offer"
                    let _793_mpos := var_offer_764_mpos
                    let expr_1204_mpos := _793_mpos
                    /// @src 0:24223:24235  "offer.market"
                    let _794 := add(expr_1204_mpos, 0)
                    let _795_mpos := mload(_794)
                    let expr_1205_mpos := _795_mpos
                    /// @src 0:24223:24245  "offer.market.enterGate"
                    let _796 := add(expr_1205_mpos, 128)
                    let _797 := read_from_memoryt_address(_796)
                    let expr_1206 := _797
                    /// @src 0:24212:24246  "IEnterGate(offer.market.enterGate)"
                    let expr_1207_address := convert_t_address_to_t_contract$_IEnterGate_$4146(expr_1206)
                    /// @src 0:24212:24264  "IEnterGate(offer.market.enterGate).canIncreaseCredit"
                    let expr_1208_address := convert_t_contract$_IEnterGate_$4146_to_t_address(expr_1207_address)
                    let expr_1208_functionSelector := 0x58ac9f9e
                    /// @src 0:24265:24270  "buyer"
                    let _798 := var_buyer_1037
                    let expr_1209 := _798
                    /// @src 0:24212:24271  "IEnterGate(offer.market.enterGate).canIncreaseCredit(buyer)"

                    // storage for arguments and returned data
                    let _799 := allocate_unbounded()
                    mstore(_799, shift_left_224(expr_1208_functionSelector))
                    let _800 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_799, 4) , expr_1209)

                    let _801 := staticcall(gas(), expr_1208_address,  _799, sub(_800, _799), _799, 32)

                    if iszero(_801) { revert_forward_1() }

                    let expr_1210
                    if _801 {

                        let _802 := 32

                        if gt(_802, returndatasize()) {
                            _802 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_799, _802)

                        // decode return parameters from external try-call into retVars
                        expr_1210 :=  abi_decode_tuple_t_bool_fromMemory(_799, add(_799, _802))
                    }
                    /// @src 0:24128:24271  "offer.market.enterGate == address(0) || buyerCreditIncrease == 0..."
                    expr_1211 := expr_1210
                }
                /// @src 0:24107:24327  "require(..."
                require_helper_t_error_4260_BuyerGatedFromIncreasingCredit(expr_1211)
                /// @src 0:24358:24363  "offer"
                let _803_mpos := var_offer_764_mpos
                let expr_1217_mpos := _803_mpos
                /// @src 0:24358:24370  "offer.market"
                let _804 := add(expr_1217_mpos, 0)
                let _805_mpos := mload(_804)
                let expr_1218_mpos := _805_mpos
                /// @src 0:24358:24380  "offer.market.enterGate"
                let _806 := add(expr_1218_mpos, 128)
                let _807 := read_from_memoryt_address(_806)
                let expr_1219 := _807
                /// @src 0:24392:24393  "0"
                let expr_1222 := 0x00
                /// @src 0:24384:24394  "address(0)"
                let expr_1223 := convert_t_rational_0_by_1_to_t_address(expr_1222)
                /// @src 0:24358:24394  "offer.market.enterGate == address(0)"
                let expr_1224 := eq(cleanup_t_address(expr_1219), cleanup_t_address(expr_1223))
                /// @src 0:24358:24421  "offer.market.enterGate == address(0) || sellerDebtIncrease == 0"
                let expr_1228 := expr_1224
                if iszero(expr_1228) {
                    /// @src 0:24398:24416  "sellerDebtIncrease"
                    let _808 := var_sellerDebtIncrease_1118
                    let expr_1225 := _808
                    /// @src 0:24420:24421  "0"
                    let expr_1226 := 0x00
                    /// @src 0:24398:24421  "sellerDebtIncrease == 0"
                    let expr_1227 := eq(cleanup_t_uint256(expr_1225), convert_t_rational_0_by_1_to_t_uint256(expr_1226))
                    /// @src 0:24358:24421  "offer.market.enterGate == address(0) || sellerDebtIncrease == 0"
                    expr_1228 := expr_1227
                }
                /// @src 0:24358:24499  "offer.market.enterGate == address(0) || sellerDebtIncrease == 0..."
                let expr_1237 := expr_1228
                if iszero(expr_1237) {
                    /// @src 0:24452:24457  "offer"
                    let _809_mpos := var_offer_764_mpos
                    let expr_1230_mpos := _809_mpos
                    /// @src 0:24452:24464  "offer.market"
                    let _810 := add(expr_1230_mpos, 0)
                    let _811_mpos := mload(_810)
                    let expr_1231_mpos := _811_mpos
                    /// @src 0:24452:24474  "offer.market.enterGate"
                    let _812 := add(expr_1231_mpos, 128)
                    let _813 := read_from_memoryt_address(_812)
                    let expr_1232 := _813
                    /// @src 0:24441:24475  "IEnterGate(offer.market.enterGate)"
                    let expr_1233_address := convert_t_address_to_t_contract$_IEnterGate_$4146(expr_1232)
                    /// @src 0:24441:24491  "IEnterGate(offer.market.enterGate).canIncreaseDebt"
                    let expr_1234_address := convert_t_contract$_IEnterGate_$4146_to_t_address(expr_1233_address)
                    let expr_1234_functionSelector := 0xfe9bf956
                    /// @src 0:24492:24498  "seller"
                    let _814 := var_seller_1039
                    let expr_1235 := _814
                    /// @src 0:24441:24499  "IEnterGate(offer.market.enterGate).canIncreaseDebt(seller)"

                    // storage for arguments and returned data
                    let _815 := allocate_unbounded()
                    mstore(_815, shift_left_224(expr_1234_functionSelector))
                    let _816 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_815, 4) , expr_1235)

                    let _817 := staticcall(gas(), expr_1234_address,  _815, sub(_816, _815), _815, 32)

                    if iszero(_817) { revert_forward_1() }

                    let expr_1236
                    if _817 {

                        let _818 := 32

                        if gt(_818, returndatasize()) {
                            _818 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_815, _818)

                        // decode return parameters from external try-call into retVars
                        expr_1236 :=  abi_decode_tuple_t_bool_fromMemory(_815, add(_815, _818))
                    }
                    /// @src 0:24358:24499  "offer.market.enterGate == address(0) || sellerDebtIncrease == 0..."
                    expr_1237 := expr_1236
                }
                /// @src 0:24337:24554  "require(..."
                require_helper_t_error_4332_SellerGatedFromIncreasingDebt(expr_1237)
                /// @src 0:24582:24590  "UtilsLib"
                let expr_1245_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:24601:24606  "units"
                let _819 := var_units_768
                let expr_1247 := _819
                /// @src 0:24609:24628  "buyerCreditIncrease"
                let _820 := var_buyerCreditIncrease_1100
                let expr_1248 := _820
                /// @src 0:24601:24628  "units - buyerCreditIncrease"
                let expr_1249 := checked_sub_t_uint256(expr_1247, expr_1248)

                /// @src 0:24582:24629  "UtilsLib.toUint128(units - buyerCreditIncrease)"
                let expr_1250 := fun_toUint128_5922(expr_1249)
                /// @src 0:24565:24573  "buyerPos"
                let _821_slot := var_buyerPos_1054_slot
                let expr_1242_slot := _821_slot
                /// @src 0:24565:24578  "buyerPos.debt"
                let _822 := add(expr_1242_slot, 2)
                /// @src 0:24565:24629  "buyerPos.debt -= UtilsLib.toUint128(units - buyerCreditIncrease)"
                let _823 := read_from_storage_split_offset_0_t_uint128(_822)
                let expr_1251 := checked_sub_t_uint128(_823, expr_1250)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_822, expr_1251)
                /// @src 0:24662:24685  "buyerPendingFeeIncrease"
                let _824 := var_buyerPendingFeeIncrease_1124
                let expr_1256 := _824
                /// @src 0:24639:24647  "buyerPos"
                let _825_slot := var_buyerPos_1054_slot
                let expr_1253_slot := _825_slot
                /// @src 0:24639:24658  "buyerPos.pendingFee"
                let _826 := add(expr_1253_slot, 0)
                /// @src 0:24639:24685  "buyerPos.pendingFee += buyerPendingFeeIncrease"
                let _827 := read_from_storage_split_offset_16_t_uint128(_826)
                let expr_1257 := checked_add_t_uint128(_827, expr_1256)

                update_storage_value_offset_16_t_uint128_to_t_uint128(_826, expr_1257)
                /// @src 0:24714:24722  "UtilsLib"
                let expr_1262_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:24733:24752  "buyerCreditIncrease"
                let _828 := var_buyerCreditIncrease_1100
                let expr_1264 := _828
                /// @src 0:24714:24753  "UtilsLib.toUint128(buyerCreditIncrease)"
                let expr_1265 := fun_toUint128_5922(expr_1264)
                /// @src 0:24695:24703  "buyerPos"
                let _829_slot := var_buyerPos_1054_slot
                let expr_1259_slot := _829_slot
                /// @src 0:24695:24710  "buyerPos.credit"
                let _830 := add(expr_1259_slot, 0)
                /// @src 0:24695:24753  "buyerPos.credit += UtilsLib.toUint128(buyerCreditIncrease)"
                let _831 := read_from_storage_split_offset_0_t_uint128(_830)
                let expr_1266 := checked_add_t_uint128(_831, expr_1265)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_830, expr_1266)
                /// @src 0:24788:24812  "sellerPendingFeeDecrease"
                let _832 := var_sellerPendingFeeDecrease_1138
                let expr_1271 := _832
                /// @src 0:24764:24773  "sellerPos"
                let _833_slot := var_sellerPos_1063_slot
                let expr_1268_slot := _833_slot
                /// @src 0:24764:24784  "sellerPos.pendingFee"
                let _834 := add(expr_1268_slot, 0)
                /// @src 0:24764:24812  "sellerPos.pendingFee -= sellerPendingFeeDecrease"
                let _835 := read_from_storage_split_offset_16_t_uint128(_834)
                let expr_1272 := checked_sub_t_uint128(_835, expr_1271)

                update_storage_value_offset_16_t_uint128_to_t_uint128(_834, expr_1272)
                /// @src 0:24842:24850  "UtilsLib"
                let expr_1277_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:24861:24881  "sellerCreditDecrease"
                let _836 := var_sellerCreditDecrease_1109
                let expr_1279 := _836
                /// @src 0:24842:24882  "UtilsLib.toUint128(sellerCreditDecrease)"
                let expr_1280 := fun_toUint128_5922(expr_1279)
                /// @src 0:24822:24831  "sellerPos"
                let _837_slot := var_sellerPos_1063_slot
                let expr_1274_slot := _837_slot
                /// @src 0:24822:24838  "sellerPos.credit"
                let _838 := add(expr_1274_slot, 0)
                /// @src 0:24822:24882  "sellerPos.credit -= UtilsLib.toUint128(sellerCreditDecrease)"
                let _839 := read_from_storage_split_offset_0_t_uint128(_838)
                let expr_1281 := checked_sub_t_uint128(_839, expr_1280)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_838, expr_1281)
                /// @src 0:24910:24918  "UtilsLib"
                let expr_1286_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:24929:24947  "sellerDebtIncrease"
                let _840 := var_sellerDebtIncrease_1118
                let expr_1288 := _840
                /// @src 0:24910:24948  "UtilsLib.toUint128(sellerDebtIncrease)"
                let expr_1289 := fun_toUint128_5922(expr_1288)
                /// @src 0:24892:24901  "sellerPos"
                let _841_slot := var_sellerPos_1063_slot
                let expr_1283_slot := _841_slot
                /// @src 0:24892:24906  "sellerPos.debt"
                let _842 := add(expr_1283_slot, 2)
                /// @src 0:24892:24948  "sellerPos.debt += UtilsLib.toUint128(sellerDebtIncrease)"
                let _843 := read_from_storage_split_offset_0_t_uint128(_842)
                let expr_1290 := checked_add_t_uint128(_843, expr_1289)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_842, expr_1290)
                /// @src 0:24997:25005  "UtilsLib"
                let expr_1295_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:25016:25028  "_marketState"
                let _844_slot := var__marketState_808_slot
                let expr_1297_slot := _844_slot
                /// @src 0:25016:25039  "_marketState.totalUnits"
                let _845 := add(expr_1297_slot, 0)
                let _846 := read_from_storage_split_offset_0_t_uint128(_845)
                let expr_1298 := _846
                /// @src 0:25042:25061  "buyerCreditIncrease"
                let _847 := var_buyerCreditIncrease_1100
                let expr_1299 := _847
                /// @src 0:25016:25061  "_marketState.totalUnits + buyerCreditIncrease"
                let expr_1300 := checked_add_t_uint256(convert_t_uint128_to_t_uint256(expr_1298), expr_1299)

                /// @src 0:25064:25084  "sellerCreditDecrease"
                let _848 := var_sellerCreditDecrease_1109
                let expr_1301 := _848
                /// @src 0:25016:25084  "_marketState.totalUnits + buyerCreditIncrease - sellerCreditDecrease"
                let expr_1302 := checked_sub_t_uint256(expr_1300, expr_1301)

                /// @src 0:24997:25085  "UtilsLib.toUint128(_marketState.totalUnits + buyerCreditIncrease - sellerCreditDecrease)"
                let expr_1303 := fun_toUint128_5922(expr_1302)
                /// @src 0:24959:24971  "_marketState"
                let _849_slot := var__marketState_808_slot
                let expr_1292_slot := _849_slot
                /// @src 0:24959:24982  "_marketState.totalUnits"
                let _850 := add(expr_1292_slot, 0)
                /// @src 0:24959:25085  "_marketState.totalUnits =..."
                update_storage_value_offset_0_t_uint128_to_t_uint128(_850, expr_1303)
                let expr_1304 := expr_1303
                /// @src 0:25145:25156  "buyerAssets"
                let _851 := var_buyerAssets_949
                let expr_1311 := _851
                /// @src 0:25159:25171  "sellerAssets"
                let _852 := var_sellerAssets_965
                let expr_1312 := _852
                /// @src 0:25145:25171  "buyerAssets - sellerAssets"
                let expr_1313 := checked_sub_t_uint256(expr_1311, expr_1312)

                /// @src 0:25095:25117  "claimableSettlementFee"
                let _853_slot := 0x06
                let expr_1306_slot := _853_slot
                /// @src 0:25118:25123  "offer"
                let _854_mpos := var_offer_764_mpos
                let expr_1307_mpos := _854_mpos
                /// @src 0:25118:25130  "offer.market"
                let _855 := add(expr_1307_mpos, 0)
                let _856_mpos := mload(_855)
                let expr_1308_mpos := _856_mpos
                /// @src 0:25118:25140  "offer.market.loanToken"
                let _857 := add(expr_1308_mpos, 0)
                let _858 := read_from_memoryt_address(_857)
                let expr_1309 := _858
                /// @src 0:25095:25141  "claimableSettlementFee[offer.market.loanToken]"
                let _859 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_1306_slot,expr_1309)
                /// @src 0:25095:25171  "claimableSettlementFee[offer.market.loanToken] += buyerAssets - sellerAssets"
                let _860 := read_from_storage_split_offset_0_t_uint256(_859)
                let expr_1314 := checked_add_t_uint256(_860, expr_1313)

                update_storage_value_offset_0_t_uint256_to_t_uint256(_859, expr_1314)
                /// @src 0:25206:25211  "offer"
                let _861_mpos := var_offer_764_mpos
                let expr_1318_mpos := _861_mpos
                /// @src 0:25206:25215  "offer.buy"
                let _862 := add(expr_1318_mpos, 32)
                let _863 := read_from_memoryt_bool(_862)
                let expr_1319 := _863
                /// @src 0:25206:25248  "offer.buy ? offer.callback : takerCallback"
                let expr_1323
                switch expr_1319
                case 0 {
                    /// @src 0:25235:25248  "takerCallback"
                    let _864 := var_takerCallback_774
                    let expr_1322 := _864
                    /// @src 0:25206:25248  "offer.buy ? offer.callback : takerCallback"
                    expr_1323 := expr_1322
                }
                default {
                    /// @src 0:25218:25223  "offer"
                    let _865_mpos := var_offer_764_mpos
                    let expr_1320_mpos := _865_mpos
                    /// @src 0:25218:25232  "offer.callback"
                    let _866 := add(expr_1320_mpos, 224)
                    let _867 := read_from_memoryt_address(_866)
                    let expr_1321 := _867
                    /// @src 0:25206:25248  "offer.buy ? offer.callback : takerCallback"
                    expr_1323 := expr_1321
                }
                /// @src 0:25182:25248  "address buyerCallback = offer.buy ? offer.callback : takerCallback"
                let var_buyerCallback_1317 := expr_1323
                /// @src 0:25283:25288  "offer"
                let _868_mpos := var_offer_764_mpos
                let expr_1327_mpos := _868_mpos
                /// @src 0:25283:25292  "offer.buy"
                let _869 := add(expr_1327_mpos, 32)
                let _870 := read_from_memoryt_bool(_869)
                let expr_1328 := _870
                /// @src 0:25283:25325  "offer.buy ? takerCallback : offer.callback"
                let expr_1332
                switch expr_1328
                case 0 {
                    /// @src 0:25311:25316  "offer"
                    let _871_mpos := var_offer_764_mpos
                    let expr_1330_mpos := _871_mpos
                    /// @src 0:25311:25325  "offer.callback"
                    let _872 := add(expr_1330_mpos, 224)
                    let _873 := read_from_memoryt_address(_872)
                    let expr_1331 := _873
                    /// @src 0:25283:25325  "offer.buy ? takerCallback : offer.callback"
                    expr_1332 := expr_1331
                }
                default {
                    /// @src 0:25295:25308  "takerCallback"
                    let _874 := var_takerCallback_774
                    let expr_1329 := _874
                    /// @src 0:25283:25325  "offer.buy ? takerCallback : offer.callback"
                    expr_1332 := expr_1329
                }
                /// @src 0:25258:25325  "address sellerCallback = offer.buy ? takerCallback : offer.callback"
                let var_sellerCallback_1326 := expr_1332
                /// @src 0:25351:25364  "buyerCallback"
                let _875 := var_buyerCallback_1317
                let expr_1336 := _875
                /// @src 0:25376:25377  "0"
                let expr_1339 := 0x00
                /// @src 0:25368:25378  "address(0)"
                let expr_1340 := convert_t_rational_0_by_1_to_t_address(expr_1339)
                /// @src 0:25351:25378  "buyerCallback != address(0)"
                let expr_1341 := iszero(eq(cleanup_t_address(expr_1336), cleanup_t_address(expr_1340)))
                /// @src 0:25351:25429  "buyerCallback != address(0) ? buyerCallback : (offer.buy ? buyer : msg.sender)"
                let expr_1350
                switch expr_1341
                case 0 {
                    /// @src 0:25398:25403  "offer"
                    let _876_mpos := var_offer_764_mpos
                    let expr_1343_mpos := _876_mpos
                    /// @src 0:25398:25407  "offer.buy"
                    let _877 := add(expr_1343_mpos, 32)
                    let _878 := read_from_memoryt_bool(_877)
                    let expr_1344 := _878
                    /// @src 0:25398:25428  "offer.buy ? buyer : msg.sender"
                    let expr_1348
                    switch expr_1344
                    case 0 {
                        /// @src 0:25418:25428  "msg.sender"
                        let expr_1347 := caller()
                        /// @src 0:25398:25428  "offer.buy ? buyer : msg.sender"
                        expr_1348 := expr_1347
                    }
                    default {
                        /// @src 0:25410:25415  "buyer"
                        let _879 := var_buyer_1037
                        let expr_1345 := _879
                        /// @src 0:25398:25428  "offer.buy ? buyer : msg.sender"
                        expr_1348 := expr_1345
                    }
                    /// @src 0:25397:25429  "(offer.buy ? buyer : msg.sender)"
                    let expr_1349 := expr_1348
                    /// @src 0:25351:25429  "buyerCallback != address(0) ? buyerCallback : (offer.buy ? buyer : msg.sender)"
                    expr_1350 := expr_1349
                }
                default {
                    /// @src 0:25381:25394  "buyerCallback"
                    let _880 := var_buyerCallback_1317
                    let expr_1342 := _880
                    /// @src 0:25351:25429  "buyerCallback != address(0) ? buyerCallback : (offer.buy ? buyer : msg.sender)"
                    expr_1350 := expr_1342
                }
                /// @src 0:25335:25429  "address payer = buyerCallback != address(0) ? buyerCallback : (offer.buy ? buyer : msg.sender)"
                let var_payer_1335 := expr_1350
                /// @src 0:25458:25463  "offer"
                let _881_mpos := var_offer_764_mpos
                let expr_1354_mpos := _881_mpos
                /// @src 0:25458:25467  "offer.buy"
                let _882 := add(expr_1354_mpos, 32)
                let _883 := read_from_memoryt_bool(_882)
                let expr_1355 := _883
                /// @src 0:25458:25525  "offer.buy ? receiverIfTakerIsSeller : offer.receiverIfMakerIsSeller"
                let expr_1359
                switch expr_1355
                case 0 {
                    /// @src 0:25496:25501  "offer"
                    let _884_mpos := var_offer_764_mpos
                    let expr_1357_mpos := _884_mpos
                    /// @src 0:25496:25525  "offer.receiverIfMakerIsSeller"
                    let _885 := add(expr_1357_mpos, 288)
                    let _886 := read_from_memoryt_address(_885)
                    let expr_1358 := _886
                    /// @src 0:25458:25525  "offer.buy ? receiverIfTakerIsSeller : offer.receiverIfMakerIsSeller"
                    expr_1359 := expr_1358
                }
                default {
                    /// @src 0:25470:25493  "receiverIfTakerIsSeller"
                    let _887 := var_receiverIfTakerIsSeller_772
                    let expr_1356 := _887
                    /// @src 0:25458:25525  "offer.buy ? receiverIfTakerIsSeller : offer.receiverIfMakerIsSeller"
                    expr_1359 := expr_1356
                }
                /// @src 0:25439:25525  "address receiver = offer.buy ? receiverIfTakerIsSeller : offer.receiverIfMakerIsSeller"
                let var_receiver_1353 := expr_1359
                /// @src 0:25541:25550  "EventsLib"
                let expr_1361_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:25569:25579  "msg.sender"
                let expr_1365 := caller()
                /// @src 0:25593:25595  "id"
                let _888 := var_id_800
                let expr_1366 := _888
                /// @src 0:25609:25614  "units"
                let _889 := var_units_768
                let expr_1367 := _889
                /// @src 0:25628:25633  "taker"
                let _890 := var_taker_770
                let expr_1368 := _890
                /// @src 0:25647:25652  "offer"
                let _891_mpos := var_offer_764_mpos
                let expr_1369_mpos := _891_mpos
                /// @src 0:25647:25658  "offer.maker"
                let _892 := add(expr_1369_mpos, 64)
                let _893 := read_from_memoryt_address(_892)
                let expr_1370 := _893
                /// @src 0:25672:25677  "offer"
                let _894_mpos := var_offer_764_mpos
                let expr_1371_mpos := _894_mpos
                /// @src 0:25672:25681  "offer.buy"
                let _895 := add(expr_1371_mpos, 32)
                let _896 := read_from_memoryt_bool(_895)
                let expr_1372 := _896
                /// @src 0:25695:25700  "offer"
                let _897_mpos := var_offer_764_mpos
                let expr_1373_mpos := _897_mpos
                /// @src 0:25695:25706  "offer.group"
                let _898 := add(expr_1373_mpos, 192)
                let _899 := read_from_memoryt_bytes32(_898)
                let expr_1374 := _899
                /// @src 0:25720:25731  "buyerAssets"
                let _900 := var_buyerAssets_949
                let expr_1375 := _900
                /// @src 0:25745:25757  "sellerAssets"
                let _901 := var_sellerAssets_965
                let expr_1376 := _901
                /// @src 0:25771:25782  "newConsumed"
                let _902 := var_newConsumed_981
                let expr_1377 := _902
                /// @src 0:25796:25819  "buyerPendingFeeIncrease"
                let _903 := var_buyerPendingFeeIncrease_1124
                let expr_1378 := _903
                /// @src 0:25833:25857  "sellerPendingFeeDecrease"
                let _904 := var_sellerPendingFeeDecrease_1138
                let expr_1379 := _904
                /// @src 0:25871:25890  "buyerCreditIncrease"
                let _905 := var_buyerCreditIncrease_1100
                let expr_1380 := _905
                /// @src 0:25904:25924  "sellerCreditDecrease"
                let _906 := var_sellerCreditDecrease_1109
                let expr_1381 := _906
                /// @src 0:25938:25946  "receiver"
                let _907 := var_receiver_1353
                let expr_1382 := _907
                /// @src 0:25960:25965  "payer"
                let _908 := var_payer_1335
                let expr_1383 := _908
                /// @src 0:25541:25975  "EventsLib.Take(..."
                let _909 := 0x9e0c6d3ffe2895519e5543fe8da6e54858f4c06530d7557d808068b0ecdc9bc3
                let _910 := convert_t_bytes32_to_t_bytes32(expr_1366)
                let _911 := convert_t_address_to_t_address(expr_1368)
                let _912 := convert_t_address_to_t_address(expr_1370)
                {
                    let _913 := allocate_unbounded()
                    let _914 := abi_encode_tuple_t_address_t_uint256_t_bool_t_bytes32_t_uint256_t_uint256_t_uint256_t_uint128_t_uint128_t_uint256_t_uint256_t_address_t_address__to_t_address_t_uint256_t_bool_t_bytes32_t_uint256_t_uint256_t_uint256_t_uint256_t_uint256_t_uint256_t_uint256_t_address_t_address__fromStack(_913 , expr_1365, expr_1367, expr_1372, expr_1374, expr_1375, expr_1376, expr_1377, expr_1378, expr_1379, expr_1380, expr_1381, expr_1382, expr_1383)
                    log4(_913, sub(_914, _913) , _909, _910, _911, _912)
                }/// @src 0:26003:26011  "UtilsLib"
                let expr_1388_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:26022:26043  "LIQUIDATION_LOCK_SLOT"
                let expr_1390 := constant_LIQUIDATION_LOCK_SLOT_4981()
                /// @src 0:26045:26047  "id"
                let _915 := var_id_800
                let expr_1391 := _915
                /// @src 0:26049:26055  "seller"
                let _916 := var_seller_1039
                let expr_1392 := _916
                /// @src 0:26057:26061  "true"
                let expr_1393 := 0x01
                /// @src 0:26003:26062  "UtilsLib.tExchange(LIQUIDATION_LOCK_SLOT, id, seller, true)"
                let expr_1394 := fun_tExchange_6060(expr_1390, expr_1391, expr_1392, expr_1393)
                /// @src 0:25986:26062  "bool wasLocked = UtilsLib.tExchange(LIQUIDATION_LOCK_SLOT, id, seller, true)"
                let var_wasLocked_1387 := expr_1394
                /// @src 0:26076:26089  "buyerCallback"
                let _917 := var_buyerCallback_1317
                let expr_1396 := _917
                /// @src 0:26101:26102  "0"
                let expr_1399 := 0x00
                /// @src 0:26093:26103  "address(0)"
                let expr_1400 := convert_t_rational_0_by_1_to_t_address(expr_1399)
                /// @src 0:26076:26103  "buyerCallback != address(0)"
                let expr_1401 := iszero(eq(cleanup_t_address(expr_1396), cleanup_t_address(expr_1400)))
                /// @src 0:26072:26492  "if (buyerCallback != address(0)) {..."
                if expr_1401 {
                    /// @src 0:26152:26157  "offer"
                    let _918_mpos := var_offer_764_mpos
                    let expr_1404_mpos := _918_mpos
                    /// @src 0:26152:26161  "offer.buy"
                    let _919 := add(expr_1404_mpos, 32)
                    let _920 := read_from_memoryt_bool(_919)
                    let expr_1405 := _920
                    /// @src 0:26152:26202  "offer.buy ? offer.callbackData : takerCallbackData"
                    let expr_1409_mpos
                    switch expr_1405
                    case 0 {
                        /// @src 0:26185:26202  "takerCallbackData"
                        let _921_mpos := var_takerCallbackData_776_mpos
                        let expr_1408_mpos := _921_mpos
                        /// @src 0:26152:26202  "offer.buy ? offer.callbackData : takerCallbackData"
                        expr_1409_mpos := expr_1408_mpos
                    }
                    default {
                        /// @src 0:26164:26169  "offer"
                        let _922_mpos := var_offer_764_mpos
                        let expr_1406_mpos := _922_mpos
                        /// @src 0:26164:26182  "offer.callbackData"
                        let _923 := add(expr_1406_mpos, 256)
                        let _924_mpos := mload(_923)
                        let expr_1407_mpos := _924_mpos
                        /// @src 0:26152:26202  "offer.buy ? offer.callbackData : takerCallbackData"
                        expr_1409_mpos := expr_1407_mpos
                    }
                    /// @src 0:26119:26202  "bytes memory buyerCallbackData = offer.buy ? offer.callbackData : takerCallbackData"
                    let var_buyerCallbackData_1403_mpos := expr_1409_mpos
                    /// @src 0:26254:26267  "buyerCallback"
                    let _925 := var_buyerCallback_1317
                    let expr_1413 := _925
                    /// @src 0:26241:26268  "IBuyCallback(buyerCallback)"
                    let expr_1414_address := convert_t_address_to_t_contract$_IBuyCallback_$3998(expr_1413)
                    /// @src 0:26241:26295  "IBuyCallback(buyerCallback)..."
                    let expr_1415_address := convert_t_contract$_IBuyCallback_$3998_to_t_address(expr_1414_address)
                    let expr_1415_functionSelector := 0xf151bd5c
                    /// @src 0:26296:26298  "id"
                    let _926 := var_id_800
                    let expr_1416 := _926
                    /// @src 0:26300:26305  "offer"
                    let _927_mpos := var_offer_764_mpos
                    let expr_1417_mpos := _927_mpos
                    /// @src 0:26300:26312  "offer.market"
                    let _928 := add(expr_1417_mpos, 0)
                    let _929_mpos := mload(_928)
                    let expr_1418_mpos := _929_mpos
                    /// @src 0:26314:26325  "buyerAssets"
                    let _930 := var_buyerAssets_949
                    let expr_1419 := _930
                    /// @src 0:26327:26332  "units"
                    let _931 := var_units_768
                    let expr_1420 := _931
                    /// @src 0:26334:26357  "buyerPendingFeeIncrease"
                    let _932 := var_buyerPendingFeeIncrease_1124
                    let expr_1421 := _932
                    /// @src 0:26359:26364  "buyer"
                    let _933 := var_buyer_1037
                    let expr_1422 := _933
                    /// @src 0:26366:26383  "buyerCallbackData"
                    let _934_mpos := var_buyerCallbackData_1403_mpos
                    let expr_1423_mpos := _934_mpos
                    /// @src 0:26241:26384  "IBuyCallback(buyerCallback)..."

                    // storage for arguments and returned data
                    let _935 := allocate_unbounded()
                    mstore(_935, shift_left_224(expr_1415_functionSelector))
                    let _936 := abi_encode_tuple_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint128_t_address_t_bytes_memory_ptr__to_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint256_t_address_t_bytes_memory_ptr__fromStack(add(_935, 4) , expr_1416, expr_1418_mpos, expr_1419, expr_1420, expr_1421, expr_1422, expr_1423_mpos)

                    let _937 := call(gas(), expr_1415_address,  0,  _935, sub(_936, _935), _935, 32)

                    if iszero(_937) { revert_forward_1() }

                    let expr_1424
                    if _937 {

                        let _938 := 32

                        if gt(_938, returndatasize()) {
                            _938 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_935, _938)

                        // decode return parameters from external try-call into retVars
                        expr_1424 :=  abi_decode_tuple_t_bytes32_fromMemory(_935, add(_935, _938))
                    }
                    /// @src 0:26404:26420  "CALLBACK_SUCCESS"
                    let expr_1425 := constant_CALLBACK_SUCCESS_4986()
                    /// @src 0:26241:26420  "IBuyCallback(buyerCallback)..."
                    let expr_1426 := eq(cleanup_t_bytes32(expr_1424), cleanup_t_bytes32(expr_1425))
                    /// @src 0:26216:26481  "require(..."
                    require_helper_t_error_4276_WrongBuyCallbackReturnValue(expr_1426)
                    /// @src 0:26072:26492  "if (buyerCallback != address(0)) {..."
                }
                /// @src 0:26502:26517  "SafeTransferLib"
                let expr_1433_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:26535:26540  "offer"
                let _939_mpos := var_offer_764_mpos
                let expr_1436_mpos := _939_mpos
                /// @src 0:26535:26547  "offer.market"
                let _940 := add(expr_1436_mpos, 0)
                let _941_mpos := mload(_940)
                let expr_1437_mpos := _941_mpos
                /// @src 0:26535:26557  "offer.market.loanToken"
                let _942 := add(expr_1437_mpos, 0)
                let _943 := read_from_memoryt_address(_942)
                let expr_1438 := _943
                /// @src 0:26559:26564  "payer"
                let _944 := var_payer_1335
                let expr_1439 := _944
                /// @src 0:26574:26578  "this"
                let expr_1442_address := address()
                /// @src 0:26566:26579  "address(this)"
                let expr_1443 := convert_t_contract$_Midnight_$3973_to_t_address(expr_1442_address)
                /// @src 0:26581:26592  "buyerAssets"
                let _945 := var_buyerAssets_949
                let expr_1444 := _945
                /// @src 0:26595:26607  "sellerAssets"
                let _946 := var_sellerAssets_965
                let expr_1445 := _946
                /// @src 0:26581:26607  "buyerAssets - sellerAssets"
                let expr_1446 := checked_sub_t_uint256(expr_1444, expr_1445)

                fun_safeTransferFrom_5564(expr_1438, expr_1439, expr_1443, expr_1446)
                /// @src 0:26618:26633  "SafeTransferLib"
                let expr_1449_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:26651:26656  "offer"
                let _947_mpos := var_offer_764_mpos
                let expr_1452_mpos := _947_mpos
                /// @src 0:26651:26663  "offer.market"
                let _948 := add(expr_1452_mpos, 0)
                let _949_mpos := mload(_948)
                let expr_1453_mpos := _949_mpos
                /// @src 0:26651:26673  "offer.market.loanToken"
                let _950 := add(expr_1453_mpos, 0)
                let _951 := read_from_memoryt_address(_950)
                let expr_1454 := _951
                /// @src 0:26675:26680  "payer"
                let _952 := var_payer_1335
                let expr_1455 := _952
                /// @src 0:26682:26690  "receiver"
                let _953 := var_receiver_1353
                let expr_1456 := _953
                /// @src 0:26692:26704  "sellerAssets"
                let _954 := var_sellerAssets_965
                let expr_1457 := _954
                fun_safeTransferFrom_5564(expr_1454, expr_1455, expr_1456, expr_1457)
                /// @src 0:26720:26734  "sellerCallback"
                let _955 := var_sellerCallback_1326
                let expr_1460 := _955
                /// @src 0:26746:26747  "0"
                let expr_1463 := 0x00
                /// @src 0:26738:26748  "address(0)"
                let expr_1464 := convert_t_rational_0_by_1_to_t_address(expr_1463)
                /// @src 0:26720:26748  "sellerCallback != address(0)"
                let expr_1465 := iszero(eq(cleanup_t_address(expr_1460), cleanup_t_address(expr_1464)))
                /// @src 0:26716:27354  "if (sellerCallback != address(0)) {..."
                if expr_1465 {
                    /// @src 0:26798:26803  "offer"
                    let _956_mpos := var_offer_764_mpos
                    let expr_1468_mpos := _956_mpos
                    /// @src 0:26798:26807  "offer.buy"
                    let _957 := add(expr_1468_mpos, 32)
                    let _958 := read_from_memoryt_bool(_957)
                    let expr_1469 := _958
                    /// @src 0:26798:26848  "offer.buy ? takerCallbackData : offer.callbackData"
                    let expr_1473_mpos
                    switch expr_1469
                    case 0 {
                        /// @src 0:26830:26835  "offer"
                        let _959_mpos := var_offer_764_mpos
                        let expr_1471_mpos := _959_mpos
                        /// @src 0:26830:26848  "offer.callbackData"
                        let _960 := add(expr_1471_mpos, 256)
                        let _961_mpos := mload(_960)
                        let expr_1472_mpos := _961_mpos
                        /// @src 0:26798:26848  "offer.buy ? takerCallbackData : offer.callbackData"
                        expr_1473_mpos := expr_1472_mpos
                    }
                    default {
                        /// @src 0:26810:26827  "takerCallbackData"
                        let _962_mpos := var_takerCallbackData_776_mpos
                        let expr_1470_mpos := _962_mpos
                        /// @src 0:26798:26848  "offer.buy ? takerCallbackData : offer.callbackData"
                        expr_1473_mpos := expr_1470_mpos
                    }
                    /// @src 0:26764:26848  "bytes memory sellerCallbackData = offer.buy ? takerCallbackData : offer.callbackData"
                    let var_sellerCallbackData_1467_mpos := expr_1473_mpos
                    /// @src 0:26901:26915  "sellerCallback"
                    let _963 := var_sellerCallback_1326
                    let expr_1477 := _963
                    /// @src 0:26887:26916  "ISellCallback(sellerCallback)"
                    let expr_1478_address := convert_t_address_to_t_contract$_ISellCallback_$4021(expr_1477)
                    /// @src 0:26887:26944  "ISellCallback(sellerCallback)..."
                    let expr_1479_address := convert_t_contract$_ISellCallback_$4021_to_t_address(expr_1478_address)
                    let expr_1479_functionSelector := 0x7f44a13a
                    /// @src 0:26970:26972  "id"
                    let _964 := var_id_800
                    let expr_1480 := _964
                    /// @src 0:26998:27003  "offer"
                    let _965_mpos := var_offer_764_mpos
                    let expr_1481_mpos := _965_mpos
                    /// @src 0:26998:27010  "offer.market"
                    let _966 := add(expr_1481_mpos, 0)
                    let _967_mpos := mload(_966)
                    let expr_1482_mpos := _967_mpos
                    /// @src 0:27036:27048  "sellerAssets"
                    let _968 := var_sellerAssets_965
                    let expr_1483 := _968
                    /// @src 0:27074:27079  "units"
                    let _969 := var_units_768
                    let expr_1484 := _969
                    /// @src 0:27105:27129  "sellerPendingFeeDecrease"
                    let _970 := var_sellerPendingFeeDecrease_1138
                    let expr_1485 := _970
                    /// @src 0:27155:27161  "seller"
                    let _971 := var_seller_1039
                    let expr_1486 := _971
                    /// @src 0:27187:27195  "receiver"
                    let _972 := var_receiver_1353
                    let expr_1487 := _972
                    /// @src 0:27221:27239  "sellerCallbackData"
                    let _973_mpos := var_sellerCallbackData_1467_mpos
                    let expr_1488_mpos := _973_mpos
                    /// @src 0:26887:27261  "ISellCallback(sellerCallback)..."

                    // storage for arguments and returned data
                    let _974 := allocate_unbounded()
                    mstore(_974, shift_left_224(expr_1479_functionSelector))
                    let _975 := abi_encode_tuple_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint128_t_address_t_address_t_bytes_memory_ptr__to_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint256_t_address_t_address_t_bytes_memory_ptr__fromStack(add(_974, 4) , expr_1480, expr_1482_mpos, expr_1483, expr_1484, expr_1485, expr_1486, expr_1487, expr_1488_mpos)

                    let _976 := call(gas(), expr_1479_address,  0,  _974, sub(_975, _974), _974, 32)

                    if iszero(_976) { revert_forward_1() }

                    let expr_1489
                    if _976 {

                        let _977 := 32

                        if gt(_977, returndatasize()) {
                            _977 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_974, _977)

                        // decode return parameters from external try-call into retVars
                        expr_1489 :=  abi_decode_tuple_t_bytes32_fromMemory(_974, add(_974, _977))
                    }
                    /// @src 0:27265:27281  "CALLBACK_SUCCESS"
                    let expr_1490 := constant_CALLBACK_SUCCESS_4986()
                    /// @src 0:26887:27281  "ISellCallback(sellerCallback)..."
                    let expr_1491 := eq(cleanup_t_bytes32(expr_1489), cleanup_t_bytes32(expr_1490))
                    /// @src 0:26862:27343  "require(..."
                    require_helper_t_error_4278_WrongSellCallbackReturnValue(expr_1491)
                    /// @src 0:26716:27354  "if (sellerCallback != address(0)) {..."
                }
                /// @src 0:27368:27377  "wasLocked"
                let _978 := var_wasLocked_1387
                let expr_1498 := _978
                /// @src 0:27367:27377  "!wasLocked"
                let expr_1499 := cleanup_t_bool(iszero(expr_1498))
                /// @src 0:27363:27439  "if (!wasLocked) UtilsLib.tExchange(LIQUIDATION_LOCK_SLOT, id, seller, false)"
                if expr_1499 {
                    /// @src 0:27379:27387  "UtilsLib"
                    let expr_1500_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:27398:27419  "LIQUIDATION_LOCK_SLOT"
                    let expr_1503 := constant_LIQUIDATION_LOCK_SLOT_4981()
                    /// @src 0:27421:27423  "id"
                    let _979 := var_id_800
                    let expr_1504 := _979
                    /// @src 0:27425:27431  "seller"
                    let _980 := var_seller_1039
                    let expr_1505 := _980
                    /// @src 0:27433:27438  "false"
                    let expr_1506 := 0x00
                    /// @src 0:27379:27439  "UtilsLib.tExchange(LIQUIDATION_LOCK_SLOT, id, seller, false)"
                    let expr_1507 := fun_tExchange_6060(expr_1503, expr_1504, expr_1505, expr_1506)
                    /// @src 0:27363:27439  "if (!wasLocked) UtilsLib.tExchange(LIQUIDATION_LOCK_SLOT, id, seller, false)"
                }
                /// @src 0:27475:27477  "id"
                let _981 := var_id_800
                let expr_1512 := _981
                /// @src 0:27479:27485  "seller"
                let _982 := var_seller_1039
                let expr_1513 := _982
                /// @src 0:27457:27486  "liquidationLocked(id, seller)"
                let expr_1514 := fun_liquidationLocked_3724(expr_1512, expr_1513)
                /// @src 0:27457:27525  "liquidationLocked(id, seller) || isHealthy(offer.market, id, seller)"
                let expr_1521 := expr_1514
                if iszero(expr_1521) {
                    /// @src 0:27500:27505  "offer"
                    let _983_mpos := var_offer_764_mpos
                    let expr_1516_mpos := _983_mpos
                    /// @src 0:27500:27512  "offer.market"
                    let _984 := add(expr_1516_mpos, 0)
                    let _985_mpos := mload(_984)
                    let expr_1517_mpos := _985_mpos
                    /// @src 0:27514:27516  "id"
                    let _986 := var_id_800
                    let expr_1518 := _986
                    /// @src 0:27518:27524  "seller"
                    let _987 := var_seller_1039
                    let expr_1519 := _987
                    /// @src 0:27490:27525  "isHealthy(offer.market, id, seller)"
                    let expr_1520 := fun_isHealthy_3821(expr_1517_mpos, expr_1518, expr_1519)
                    /// @src 0:27457:27525  "liquidationLocked(id, seller) || isHealthy(offer.market, id, seller)"
                    expr_1521 := expr_1520
                }
                /// @src 0:27449:27550  "require(liquidationLocked(id, seller) || isHealthy(offer.market, id, seller), SellerIsLiquidatable())"
                require_helper_t_error_4334_SellerIsLiquidatable(expr_1521)
                /// @src 0:27569:27580  "buyerAssets"
                let _988 := var_buyerAssets_949
                let expr_1526 := _988
                /// @src 0:27568:27595  "(buyerAssets, sellerAssets)"
                let expr_1528_component_1 := expr_1526
                /// @src 0:27582:27594  "sellerAssets"
                let _989 := var_sellerAssets_965
                let expr_1527 := _989
                /// @src 0:27568:27595  "(buyerAssets, sellerAssets)"
                let expr_1528_component_2 := expr_1527
                /// @src 0:27561:27595  "return (buyerAssets, sellerAssets)"
                var__779 := expr_1528_component_1
                var__781 := expr_1528_component_2
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3420
            /// @src 0:45701:45840  "function lastLossFactor(bytes32 id, address user) external view returns (uint128) {..."
            function fun_lastLossFactor_3420(var_id_3405, var_user_3407) -> var__3410 {
                /// @src 0:45774:45781  "uint128"
                let zero_t_uint128_990 := zero_value_for_split_t_uint128()
                var__3410 := zero_t_uint128_990

                /// @src 0:45800:45808  "position"
                let _991_slot := 0x00
                let expr_3412_slot := _991_slot
                /// @src 0:45809:45811  "id"
                let _992 := var_id_3405
                let expr_3413 := _992
                /// @src 0:45800:45812  "position[id]"
                let _993 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3412_slot,expr_3413)
                let _994_slot := _993
                let expr_3414_slot := _994_slot
                /// @src 0:45813:45817  "user"
                let _995 := var_user_3407
                let expr_3415 := _995
                /// @src 0:45800:45818  "position[id][user]"
                let _996 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3414_slot,expr_3415)
                let _997_slot := _996
                let expr_3416_slot := _997_slot
                /// @src 0:45800:45833  "position[id][user].lastLossFactor"
                let _998 := add(expr_3416_slot, 1)
                let _999 := read_from_storage_split_offset_0_t_uint128(_998)
                let expr_3417 := _999
                /// @src 0:45793:45833  "return position[id][user].lastLossFactor"
                var__3410 := expr_3417
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 463
            /// @src 0:15906:17238  "function setMarketSettlementFee(bytes32 id, uint256 index, uint256 newSettlementFee) external {..."
            function fun_setMarketSettlementFee_463(var_id_315, var_index_317, var_newSettlementFee_319) {

                /// @src 0:16045:16056  "marketState"
                let _1000_slot := 0x01
                let expr_325_slot := _1000_slot
                /// @src 0:16057:16059  "id"
                let _1001 := var_id_315
                let expr_326 := _1001
                /// @src 0:16045:16060  "marketState[id]"
                let _1002 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_325_slot,expr_326)
                let _1003_slot := _1002
                let expr_327_slot := _1003_slot
                /// @src 0:16010:16060  "MarketState storage _marketState = marketState[id]"
                let var__marketState_324_slot := convert_t_struct$_MarketState_$4238_storage_to_t_struct$_MarketState_$4238_storage_ptr(expr_327_slot)
                /// @src 0:16078:16088  "msg.sender"
                let expr_331 := caller()
                /// @src 0:16092:16101  "feeSetter"
                let _1004 := read_from_storage_split_offset_0_t_address(0x08)
                let expr_332 := _1004
                /// @src 0:16078:16101  "msg.sender == feeSetter"
                let expr_333 := eq(cleanup_t_address(expr_331), cleanup_t_address(expr_332))
                /// @src 0:16070:16119  "require(msg.sender == feeSetter, OnlyFeeSetter())"
                require_helper_t_error_4318_OnlyFeeSetter(expr_333)
                /// @src 0:16137:16142  "index"
                let _1005 := var_index_317
                let expr_339 := _1005
                /// @src 0:16146:16147  "6"
                let expr_340 := 0x06
                /// @src 0:16137:16147  "index <= 6"
                let expr_341 := iszero(gt(cleanup_t_uint256(expr_339), convert_t_rational_6_by_1_to_t_uint256(expr_340)))
                /// @src 0:16129:16167  "require(index <= 6, InvalidFeeIndex())"
                require_helper_t_error_4286_InvalidFeeIndex(expr_341)
                /// @src 0:16185:16201  "newSettlementFee"
                let _1006 := var_newSettlementFee_319
                let expr_347 := _1006
                /// @src 0:16222:16227  "index"
                let _1007 := var_index_317
                let expr_349 := _1007
                /// @src 0:16205:16228  "maxSettlementFee(index)"
                let expr_350 := fun_maxSettlementFee_5082(expr_349)
                /// @src 0:16185:16228  "newSettlementFee <= maxSettlementFee(index)"
                let expr_351 := iszero(gt(cleanup_t_uint256(expr_347), cleanup_t_uint256(expr_350)))
                /// @src 0:16177:16253  "require(newSettlementFee <= maxSettlementFee(index), SettlementFeeTooHigh())"
                require_helper_t_error_4344_SettlementFeeTooHigh(expr_351)
                /// @src 0:16271:16287  "newSettlementFee"
                let _1008 := var_newSettlementFee_319
                let expr_357 := _1008
                /// @src 0:16290:16293  "CBP"
                let expr_358 := constant_CBP_4923()
                /// @src 0:16271:16293  "newSettlementFee % CBP"
                let expr_359 := mod_t_uint256(expr_357, expr_358)

                /// @src 0:16297:16298  "0"
                let expr_360 := 0x00
                /// @src 0:16271:16298  "newSettlementFee % CBP == 0"
                let expr_361 := eq(cleanup_t_uint256(expr_359), convert_t_rational_0_by_1_to_t_uint256(expr_360))
                /// @src 0:16263:16325  "require(newSettlementFee % CBP == 0, FeeNotMultipleOfFeeCbp())"
                require_helper_t_error_4272_FeeNotMultipleOfFeeCbp(expr_361)
                /// @src 0:16343:16355  "_marketState"
                let _1009_slot := var__marketState_324_slot
                let expr_367_slot := _1009_slot
                /// @src 0:16343:16367  "_marketState.tickSpacing"
                let _1010 := add(expr_367_slot, 2)
                let _1011 := read_from_storage_split_offset_18_t_uint8(_1010)
                let expr_368 := _1011
                /// @src 0:16370:16371  "0"
                let expr_369 := 0x00
                /// @src 0:16343:16371  "_marketState.tickSpacing > 0"
                let expr_370 := gt(cleanup_t_uint8(expr_368), convert_t_rational_0_by_1_to_t_uint8(expr_369))
                /// @src 0:16335:16392  "require(_marketState.tickSpacing > 0, MarketNotCreated())"
                require_helper_t_error_4310_MarketNotCreated(expr_370)
                /// @src 0:16556:16572  "newSettlementFee"
                let _1012 := var_newSettlementFee_319
                let expr_379 := _1012
                /// @src 0:16575:16578  "CBP"
                let expr_380 := constant_CBP_4923()
                /// @src 0:16556:16578  "newSettlementFee / CBP"
                let expr_381 := checked_div_t_uint256(expr_379, expr_380)

                /// @src 0:16549:16579  "uint16(newSettlementFee / CBP)"
                let expr_382 := convert_t_uint256_to_t_uint16(expr_381)
                /// @src 0:16520:16579  "uint16 newSettlementFeeCbp = uint16(newSettlementFee / CBP)"
                let var_newSettlementFeeCbp_376 := expr_382
                /// @src 0:16593:16598  "index"
                let _1013 := var_index_317
                let expr_384 := _1013
                /// @src 0:16602:16603  "0"
                let expr_385 := 0x00
                /// @src 0:16593:16603  "index == 0"
                let expr_386 := eq(cleanup_t_uint256(expr_384), convert_t_rational_0_by_1_to_t_uint256(expr_385))
                /// @src 0:16589:17155  "if (index == 0) _marketState.settlementFeeCbp0 = newSettlementFeeCbp;..."
                switch expr_386
                case 0 {
                    /// @src 0:16676:16681  "index"
                    let _1014 := var_index_317
                    let expr_393 := _1014
                    /// @src 0:16685:16686  "1"
                    let expr_394 := 0x01
                    /// @src 0:16676:16686  "index == 1"
                    let expr_395 := eq(cleanup_t_uint256(expr_393), convert_t_rational_1_by_1_to_t_uint256(expr_394))
                    /// @src 0:16672:17155  "if (index == 1) _marketState.settlementFeeCbp1 = newSettlementFeeCbp;..."
                    switch expr_395
                    case 0 {
                        /// @src 0:16759:16764  "index"
                        let _1015 := var_index_317
                        let expr_402 := _1015
                        /// @src 0:16768:16769  "2"
                        let expr_403 := 0x02
                        /// @src 0:16759:16769  "index == 2"
                        let expr_404 := eq(cleanup_t_uint256(expr_402), convert_t_rational_2_by_1_to_t_uint256(expr_403))
                        /// @src 0:16755:17155  "if (index == 2) _marketState.settlementFeeCbp2 = newSettlementFeeCbp;..."
                        switch expr_404
                        case 0 {
                            /// @src 0:16842:16847  "index"
                            let _1016 := var_index_317
                            let expr_411 := _1016
                            /// @src 0:16851:16852  "3"
                            let expr_412 := 0x03
                            /// @src 0:16842:16852  "index == 3"
                            let expr_413 := eq(cleanup_t_uint256(expr_411), convert_t_rational_3_by_1_to_t_uint256(expr_412))
                            /// @src 0:16838:17155  "if (index == 3) _marketState.settlementFeeCbp3 = newSettlementFeeCbp;..."
                            switch expr_413
                            case 0 {
                                /// @src 0:16925:16930  "index"
                                let _1017 := var_index_317
                                let expr_420 := _1017
                                /// @src 0:16934:16935  "4"
                                let expr_421 := 0x04
                                /// @src 0:16925:16935  "index == 4"
                                let expr_422 := eq(cleanup_t_uint256(expr_420), convert_t_rational_4_by_1_to_t_uint256(expr_421))
                                /// @src 0:16921:17155  "if (index == 4) _marketState.settlementFeeCbp4 = newSettlementFeeCbp;..."
                                switch expr_422
                                case 0 {
                                    /// @src 0:17008:17013  "index"
                                    let _1018 := var_index_317
                                    let expr_429 := _1018
                                    /// @src 0:17017:17018  "5"
                                    let expr_430 := 0x05
                                    /// @src 0:17008:17018  "index == 5"
                                    let expr_431 := eq(cleanup_t_uint256(expr_429), convert_t_rational_5_by_1_to_t_uint256(expr_430))
                                    /// @src 0:17004:17155  "if (index == 5) _marketState.settlementFeeCbp5 = newSettlementFeeCbp;..."
                                    switch expr_431
                                    case 0 {
                                        /// @src 0:17091:17096  "index"
                                        let _1019 := var_index_317
                                        let expr_438 := _1019
                                        /// @src 0:17100:17101  "6"
                                        let expr_439 := 0x06
                                        /// @src 0:17091:17101  "index == 6"
                                        let expr_440 := eq(cleanup_t_uint256(expr_438), convert_t_rational_6_by_1_to_t_uint256(expr_439))
                                        /// @src 0:17087:17155  "if (index == 6) _marketState.settlementFeeCbp6 = newSettlementFeeCbp"
                                        if expr_440 {
                                            /// @src 0:17136:17155  "newSettlementFeeCbp"
                                            let _1020 := var_newSettlementFeeCbp_376
                                            let expr_444 := _1020
                                            /// @src 0:17103:17115  "_marketState"
                                            let _1021_slot := var__marketState_324_slot
                                            let expr_441_slot := _1021_slot
                                            /// @src 0:17103:17133  "_marketState.settlementFeeCbp6"
                                            let _1022 := add(expr_441_slot, 2)
                                            /// @src 0:17103:17155  "_marketState.settlementFeeCbp6 = newSettlementFeeCbp"
                                            update_storage_value_offset_12_t_uint16_to_t_uint16(_1022, expr_444)
                                            let expr_445 := expr_444
                                            /// @src 0:17087:17155  "if (index == 6) _marketState.settlementFeeCbp6 = newSettlementFeeCbp"
                                        }
                                        /// @src 0:17004:17155  "if (index == 5) _marketState.settlementFeeCbp5 = newSettlementFeeCbp;..."
                                    }
                                    default {
                                        /// @src 0:17053:17072  "newSettlementFeeCbp"
                                        let _1023 := var_newSettlementFeeCbp_376
                                        let expr_435 := _1023
                                        /// @src 0:17020:17032  "_marketState"
                                        let _1024_slot := var__marketState_324_slot
                                        let expr_432_slot := _1024_slot
                                        /// @src 0:17020:17050  "_marketState.settlementFeeCbp5"
                                        let _1025 := add(expr_432_slot, 2)
                                        /// @src 0:17020:17072  "_marketState.settlementFeeCbp5 = newSettlementFeeCbp"
                                        update_storage_value_offset_10_t_uint16_to_t_uint16(_1025, expr_435)
                                        let expr_436 := expr_435
                                        /// @src 0:17004:17155  "if (index == 5) _marketState.settlementFeeCbp5 = newSettlementFeeCbp;..."
                                    }
                                    /// @src 0:16921:17155  "if (index == 4) _marketState.settlementFeeCbp4 = newSettlementFeeCbp;..."
                                }
                                default {
                                    /// @src 0:16970:16989  "newSettlementFeeCbp"
                                    let _1026 := var_newSettlementFeeCbp_376
                                    let expr_426 := _1026
                                    /// @src 0:16937:16949  "_marketState"
                                    let _1027_slot := var__marketState_324_slot
                                    let expr_423_slot := _1027_slot
                                    /// @src 0:16937:16967  "_marketState.settlementFeeCbp4"
                                    let _1028 := add(expr_423_slot, 2)
                                    /// @src 0:16937:16989  "_marketState.settlementFeeCbp4 = newSettlementFeeCbp"
                                    update_storage_value_offset_8_t_uint16_to_t_uint16(_1028, expr_426)
                                    let expr_427 := expr_426
                                    /// @src 0:16921:17155  "if (index == 4) _marketState.settlementFeeCbp4 = newSettlementFeeCbp;..."
                                }
                                /// @src 0:16838:17155  "if (index == 3) _marketState.settlementFeeCbp3 = newSettlementFeeCbp;..."
                            }
                            default {
                                /// @src 0:16887:16906  "newSettlementFeeCbp"
                                let _1029 := var_newSettlementFeeCbp_376
                                let expr_417 := _1029
                                /// @src 0:16854:16866  "_marketState"
                                let _1030_slot := var__marketState_324_slot
                                let expr_414_slot := _1030_slot
                                /// @src 0:16854:16884  "_marketState.settlementFeeCbp3"
                                let _1031 := add(expr_414_slot, 2)
                                /// @src 0:16854:16906  "_marketState.settlementFeeCbp3 = newSettlementFeeCbp"
                                update_storage_value_offset_6_t_uint16_to_t_uint16(_1031, expr_417)
                                let expr_418 := expr_417
                                /// @src 0:16838:17155  "if (index == 3) _marketState.settlementFeeCbp3 = newSettlementFeeCbp;..."
                            }
                            /// @src 0:16755:17155  "if (index == 2) _marketState.settlementFeeCbp2 = newSettlementFeeCbp;..."
                        }
                        default {
                            /// @src 0:16804:16823  "newSettlementFeeCbp"
                            let _1032 := var_newSettlementFeeCbp_376
                            let expr_408 := _1032
                            /// @src 0:16771:16783  "_marketState"
                            let _1033_slot := var__marketState_324_slot
                            let expr_405_slot := _1033_slot
                            /// @src 0:16771:16801  "_marketState.settlementFeeCbp2"
                            let _1034 := add(expr_405_slot, 2)
                            /// @src 0:16771:16823  "_marketState.settlementFeeCbp2 = newSettlementFeeCbp"
                            update_storage_value_offset_4_t_uint16_to_t_uint16(_1034, expr_408)
                            let expr_409 := expr_408
                            /// @src 0:16755:17155  "if (index == 2) _marketState.settlementFeeCbp2 = newSettlementFeeCbp;..."
                        }
                        /// @src 0:16672:17155  "if (index == 1) _marketState.settlementFeeCbp1 = newSettlementFeeCbp;..."
                    }
                    default {
                        /// @src 0:16721:16740  "newSettlementFeeCbp"
                        let _1035 := var_newSettlementFeeCbp_376
                        let expr_399 := _1035
                        /// @src 0:16688:16700  "_marketState"
                        let _1036_slot := var__marketState_324_slot
                        let expr_396_slot := _1036_slot
                        /// @src 0:16688:16718  "_marketState.settlementFeeCbp1"
                        let _1037 := add(expr_396_slot, 2)
                        /// @src 0:16688:16740  "_marketState.settlementFeeCbp1 = newSettlementFeeCbp"
                        update_storage_value_offset_2_t_uint16_to_t_uint16(_1037, expr_399)
                        let expr_400 := expr_399
                        /// @src 0:16672:17155  "if (index == 1) _marketState.settlementFeeCbp1 = newSettlementFeeCbp;..."
                    }
                    /// @src 0:16589:17155  "if (index == 0) _marketState.settlementFeeCbp0 = newSettlementFeeCbp;..."
                }
                default {
                    /// @src 0:16638:16657  "newSettlementFeeCbp"
                    let _1038 := var_newSettlementFeeCbp_376
                    let expr_390 := _1038
                    /// @src 0:16605:16617  "_marketState"
                    let _1039_slot := var__marketState_324_slot
                    let expr_387_slot := _1039_slot
                    /// @src 0:16605:16635  "_marketState.settlementFeeCbp0"
                    let _1040 := add(expr_387_slot, 2)
                    /// @src 0:16605:16657  "_marketState.settlementFeeCbp0 = newSettlementFeeCbp"
                    update_storage_value_offset_0_t_uint16_to_t_uint16(_1040, expr_390)
                    let expr_391 := expr_390
                    /// @src 0:16589:17155  "if (index == 0) _marketState.settlementFeeCbp0 = newSettlementFeeCbp;..."
                }
                /// @src 0:17170:17179  "EventsLib"
                let expr_454_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:17203:17205  "id"
                let _1041 := var_id_315
                let expr_457 := _1041
                /// @src 0:17207:17212  "index"
                let _1042 := var_index_317
                let expr_458 := _1042
                /// @src 0:17214:17230  "newSettlementFee"
                let _1043 := var_newSettlementFee_319
                let expr_459 := _1043
                /// @src 0:17170:17231  "EventsLib.SetMarketSettlementFee(id, index, newSettlementFee)"
                let _1044 := 0xd316faedf187698c4bd62cf9b5484dd13466d6504d0d98ff5eb0110b2d325e17
                let _1045 := convert_t_bytes32_to_t_bytes32(expr_457)
                let _1046 := convert_t_uint256_to_t_uint256(expr_458)
                {
                    let _1047 := allocate_unbounded()
                    let _1048 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_1047 , expr_459)
                    log3(_1047, sub(_1048, _1047) , _1044, _1045, _1046)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function convert_t_struct$_Market_$4171_calldata_ptr_to_t_struct$_Market_$4171_memory_ptr(value) -> converted {

                converted := abi_decode_t_struct$_Market_$4171_memory_ptr(value, calldatasize())

            }

            function require_helper_t_error_4304_NotBorrower(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xcb1e8f3800000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_uint160_to_t_contract$_ILiquidatorGate_$4154(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_ILiquidatorGate_$4154(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_ILiquidatorGate_$4154(value)
            }

            function convert_t_contract$_ILiquidatorGate_$4154_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function require_helper_t_error_4292_LiquidatorGatedFromLiquidating(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x37a4840b00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function revert_error_356d538aaf70fba12156cc466564b792649f8f3befb07b071c91142253e175ad() {
                revert(0, 0)
            }

            function revert_error_1e55d03107e9c4f1b5e21c76a16fba166a461117ab153bcce65e6a4ea8e5fc8a() {
                revert(0, 0)
            }

            function revert_error_977805620ff29572292dee35f70b0f3f3f73d3fdd0e9f4d7a901c2e43ab18a2e() {
                revert(0, 0)
            }

            function access_calldata_tail_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(base_ref, ptr_to_tail) -> addr, length {
                let rel_offset_of_tail := calldataload(ptr_to_tail)
                if iszero(slt(rel_offset_of_tail, sub(sub(calldatasize(), base_ref), sub(0x20, 1)))) { revert_error_356d538aaf70fba12156cc466564b792649f8f3befb07b071c91142253e175ad() }
                addr := add(base_ref, rel_offset_of_tail)

                length := calldataload(addr)
                if gt(length, 0xffffffffffffffff) { revert_error_1e55d03107e9c4f1b5e21c76a16fba166a461117ab153bcce65e6a4ea8e5fc8a() }
                addr := add(addr, 32)
                if sgt(addr, sub(calldatasize(), mul(length, 0x80))) { revert_error_977805620ff29572292dee35f70b0f3f3f73d3fdd0e9f4d7a901c2e43ab18a2e() }

            }

            function calldata_array_index_access_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(base_ref, length, index) -> addr {
                if iszero(lt(index, length)) { panic_error_0x32() }
                addr := add(base_ref, mul(index, 128))

            }

            function convert_t_struct$_CollateralParams_$4180_calldata_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(value) -> converted {

                converted := abi_decode_t_struct$_CollateralParams_$4180_memory_ptr(value, calldatasize())

            }

            function require_helper_t_error_4306_NotLiquidatable(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xddeb79ba00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function cleanup_t_rational_900_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_900_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_900_by_1(value)))
            }

            /// @src 7:770:815  "uint256 constant TIME_TO_MAX_LIF = 15 minutes"
            function constant_TIME_TO_MAX_LIF_4961() -> ret {
                /// @src 7:805:815  "15 minutes"
                let expr_4960 := 0x0384
                let _1173 := convert_t_rational_900_by_1_to_t_uint256(expr_4960)

                ret := _1173
            }

            function require_helper_t_error_4328_RecoveryCloseFactorConditionsViolated(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x1b428e8800000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function abi_encode_tuple_t_address_t_uint256_t_uint256_t_bool_t_address_t_address_t_uint256_t_uint128_t_uint128__to_t_address_t_uint256_t_uint256_t_bool_t_address_t_address_t_uint256_t_uint256_t_uint256__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6, value7, value8) -> tail {
                tail := add(headStart, 288)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_bool_to_t_bool_fromStack(value3,  add(headStart, 96))

                abi_encode_t_address_to_t_address_fromStack(value4,  add(headStart, 128))

                abi_encode_t_address_to_t_address_fromStack(value5,  add(headStart, 160))

                abi_encode_t_uint256_to_t_uint256_fromStack(value6,  add(headStart, 192))

                abi_encode_t_uint128_to_t_uint256_fromStack(value7,  add(headStart, 224))

                abi_encode_t_uint128_to_t_uint256_fromStack(value8,  add(headStart, 256))

            }

            function convert_t_uint160_to_t_contract$_ILiquidateCallback_$4048(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_ILiquidateCallback_$4048(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_ILiquidateCallback_$4048(value)
            }

            function convert_t_contract$_ILiquidateCallback_$4048_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function revert_error_0803104b3ab68501accf02de57372b8e5e6e1582158b771d3f89279dc6822fe2() {
                revert(0, 0)
            }

            function revert_error_3894daff73bdbb8963c284e167b207f7abade3c031c50828ea230a16bdbc0f20() {
                revert(0, 0)
            }

            function revert_error_db64ea6d4a12deece376118739de8d9f517a2db5b58ea2ca332ea908c04c71d4() {
                revert(0, 0)
            }

            function calldata_access_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(base_ref, ptr) -> value, length {
                let rel_offset_of_tail := calldataload(ptr)
                if iszero(slt(rel_offset_of_tail, sub(sub(calldatasize(), base_ref), sub(0x20, 1)))) { revert_error_db64ea6d4a12deece376118739de8d9f517a2db5b58ea2ca332ea908c04c71d4() }
                value := add(rel_offset_of_tail, base_ref)

                length := calldataload(value)
                value := add(value, 0x20)
                if gt(length, 0xffffffffffffffff) { revert_error_0803104b3ab68501accf02de57372b8e5e6e1582158b771d3f89279dc6822fe2() }
                if sgt(value, sub(calldatasize(), mul(length, 0x80))) { revert_error_3894daff73bdbb8963c284e167b207f7abade3c031c50828ea230a16bdbc0f20() }

            }

            function array_dataslot_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(ptr) -> data {
                data := ptr

            }

            function calldata_access_t_uint256(baseRef, ptr) -> value {
                value := abi_decode_t_uint256(ptr, add(ptr, 32))
            }

            // struct CollateralParams -> struct CollateralParams
            function abi_encode_t_struct$_CollateralParams_$4180_calldata_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(value, pos)  {
                let tail := add(pos, 0x80)

                {
                    // token

                    let memberValue0 := calldata_access_t_address(value, add(value, 0x00))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x00))
                }

                {
                    // lltv

                    let memberValue0 := calldata_access_t_uint256(value, add(value, 0x20))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x20))
                }

                {
                    // maxLif

                    let memberValue0 := calldata_access_t_uint256(value, add(value, 0x40))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x40))
                }

                {
                    // oracle

                    let memberValue0 := calldata_access_t_address(value, add(value, 0x60))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x60))
                }

            }

            function abi_encodeUpdatedPos_t_struct$_CollateralParams_$4180_calldata_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(value0, pos) -> updatedPos {
                abi_encode_t_struct$_CollateralParams_$4180_calldata_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(value0, pos)
                updatedPos := add(pos, 0x80)
            }

            function calldata_access_t_struct$_CollateralParams_$4180_calldata_ptr(baseRef, ptr) -> value {
                value := ptr
            }

            function array_nextElement_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(ptr) -> next {
                next := add(ptr, 0x80)
            }

            // struct CollateralParams[] -> struct CollateralParams[]
            function abi_encode_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr_to_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(value, length, pos)  -> end  {

                pos := array_storeLengthForEncoding_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(pos, length)
                let baseRef := array_dataslot_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := calldata_access_t_struct$_CollateralParams_$4180_calldata_ptr(baseRef, srcPtr)
                    pos := abi_encodeUpdatedPos_t_struct$_CollateralParams_$4180_calldata_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(srcPtr)
                }
                end := pos
            }

            // struct Market -> struct Market
            function abi_encode_t_struct$_Market_$4171_calldata_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value, pos)  -> end  {
                let tail := add(pos, 0xc0)

                {
                    // loanToken

                    let memberValue0 := calldata_access_t_address(value, add(value, 0x00))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x00))
                }

                {
                    // collateralParams

                    let memberValue0, memberValue1 := calldata_access_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(value, add(value, 0x20))

                    mstore(add(pos, 0x20), sub(tail, pos))
                    tail := abi_encode_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr_to_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(memberValue0, memberValue1, tail)

                }

                {
                    // maturity

                    let memberValue0 := calldata_access_t_uint256(value, add(value, 0x40))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x40))
                }

                {
                    // rcfThreshold

                    let memberValue0 := calldata_access_t_uint256(value, add(value, 0x60))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x60))
                }

                {
                    // enterGate

                    let memberValue0 := calldata_access_t_address(value, add(value, 0x80))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x80))
                }

                {
                    // liquidatorGate

                    let memberValue0 := calldata_access_t_address(value, add(value, 0xa0))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0xa0))
                }

                end := tail
            }

            function abi_encode_tuple_t_address_t_bytes32_t_struct$_Market_$4171_calldata_ptr_t_uint256_t_uint256_t_uint256_t_address_t_address_t_bytes_calldata_ptr_t_uint256__to_t_address_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint256_t_address_t_address_t_bytes_memory_ptr_t_uint256__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10) -> tail {
                tail := add(headStart, 320)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value1,  add(headStart, 32))

                mstore(add(headStart, 64), sub(tail, headStart))
                tail := abi_encode_t_struct$_Market_$4171_calldata_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value2,  tail)

                abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint256_to_t_uint256_fromStack(value4,  add(headStart, 128))

                abi_encode_t_uint256_to_t_uint256_fromStack(value5,  add(headStart, 160))

                abi_encode_t_address_to_t_address_fromStack(value6,  add(headStart, 192))

                abi_encode_t_address_to_t_address_fromStack(value7,  add(headStart, 224))

                mstore(add(headStart, 256), sub(tail, headStart))
                tail := abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_fromStack(value8, value9,  tail)

                abi_encode_t_uint256_to_t_uint256_fromStack(value10,  add(headStart, 288))

            }

            function require_helper_t_error_4282_WrongLiquidateCallbackReturnValue(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x70b53d4b00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 2643
            /// @src 0:32314:38513  "function liquidate(..."
            function fun_liquidate_2643(var_market_2044_offset, var_collateralIndex_2046, var_seizedAssets_2048, var_repaidUnits_2050, var_borrower_2052, var_postMaturityMode_2054, var_receiver_2056, var_callback_2058, var_data_2060_offset, var_data_2060_length) -> var__2063, var__2065 {
                /// @src 0:32619:32626  "uint256"
                let zero_t_uint256_1049 := zero_value_for_split_t_uint256()
                var__2063 := zero_t_uint256_1049
                /// @src 0:32628:32635  "uint256"
                let zero_t_uint256_1050 := zero_value_for_split_t_uint256()
                var__2065 := zero_t_uint256_1050

                /// @src 0:32672:32678  "market"
                let _1051_offset := var_market_2044_offset
                let expr_2070_offset := _1051_offset
                /// @src 0:32660:32679  "touchMarket(market)"
                let _1052_mpos := convert_t_struct$_Market_$4171_calldata_ptr_to_t_struct$_Market_$4171_memory_ptr(expr_2070_offset)
                let expr_2071 := fun_touchMarket_3092(_1052_mpos)
                /// @src 0:32647:32679  "bytes32 id = touchMarket(market)"
                let var_id_2068 := expr_2071
                /// @src 0:32724:32735  "marketState"
                let _1053_slot := 0x01
                let expr_2076_slot := _1053_slot
                /// @src 0:32736:32738  "id"
                let _1054 := var_id_2068
                let expr_2077 := _1054
                /// @src 0:32724:32739  "marketState[id]"
                let _1055 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_2076_slot,expr_2077)
                let _1056_slot := _1055
                let expr_2078_slot := _1056_slot
                /// @src 0:32689:32739  "MarketState storage _marketState = marketState[id]"
                let var__marketState_2075_slot := convert_t_struct$_MarketState_$4238_storage_to_t_struct$_MarketState_$4238_storage_ptr(expr_2078_slot)
                /// @src 0:32778:32786  "position"
                let _1057_slot := 0x00
                let expr_2083_slot := _1057_slot
                /// @src 0:32787:32789  "id"
                let _1058 := var_id_2068
                let expr_2084 := _1058
                /// @src 0:32778:32790  "position[id]"
                let _1059 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_2083_slot,expr_2084)
                let _1060_slot := _1059
                let expr_2085_slot := _1060_slot
                /// @src 0:32791:32799  "borrower"
                let _1061 := var_borrower_2052
                let expr_2086 := _1061
                /// @src 0:32778:32800  "position[id][borrower]"
                let _1062 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_2085_slot,expr_2086)
                let _1063_slot := _1062
                let expr_2087_slot := _1063_slot
                /// @src 0:32749:32800  "Position storage _position = position[id][borrower]"
                let var__position_2082_slot := convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(expr_2087_slot)
                /// @src 0:32818:32826  "UtilsLib"
                let expr_2090_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:32844:32855  "repaidUnits"
                let _1064 := var_repaidUnits_2050
                let expr_2092 := _1064
                /// @src 0:32857:32869  "seizedAssets"
                let _1065 := var_seizedAssets_2048
                let expr_2093 := _1065
                /// @src 0:32818:32870  "UtilsLib.atMostOneNonZero(repaidUnits, seizedAssets)"
                let expr_2094 := fun_atMostOneNonZero_5829(expr_2092, expr_2093)
                /// @src 0:32810:32892  "require(UtilsLib.atMostOneNonZero(repaidUnits, seizedAssets), InconsistentInput())"
                require_helper_t_error_4274_InconsistentInput(expr_2094)
                /// @src 0:32910:32919  "_position"
                let _1066_slot := var__position_2082_slot
                let expr_2100_slot := _1066_slot
                /// @src 0:32910:32924  "_position.debt"
                let _1067 := add(expr_2100_slot, 2)
                let _1068 := read_from_storage_split_offset_0_t_uint128(_1067)
                let expr_2101 := _1068
                /// @src 0:32927:32928  "0"
                let expr_2102 := 0x00
                /// @src 0:32910:32928  "_position.debt > 0"
                let expr_2103 := gt(cleanup_t_uint128(expr_2101), convert_t_rational_0_by_1_to_t_uint128(expr_2102))
                /// @src 0:32902:32944  "require(_position.debt > 0, NotBorrower())"
                require_helper_t_error_4304_NotBorrower(expr_2103)
                /// @src 0:33033:33039  "market"
                let _1069_offset := var_market_2044_offset
                let expr_2109_offset := _1069_offset
                /// @src 0:33033:33054  "market.liquidatorGate"
                let _1070 := add(expr_2109_offset, 160)
                let expr_2110 := read_from_calldatat_address(_1070)
                /// @src 0:33066:33067  "0"
                let expr_2113 := 0x00
                /// @src 0:33058:33068  "address(0)"
                let expr_2114 := convert_t_rational_0_by_1_to_t_address(expr_2113)
                /// @src 0:33033:33068  "market.liquidatorGate == address(0)"
                let expr_2115 := eq(cleanup_t_address(expr_2110), cleanup_t_address(expr_2114))
                /// @src 0:33033:33135  "market.liquidatorGate == address(0) || ILiquidatorGate(market.liquidatorGate).canLiquidate(msg.sender)"
                let expr_2124 := expr_2115
                if iszero(expr_2124) {
                    /// @src 0:33088:33094  "market"
                    let _1071_offset := var_market_2044_offset
                    let expr_2117_offset := _1071_offset
                    /// @src 0:33088:33109  "market.liquidatorGate"
                    let _1072 := add(expr_2117_offset, 160)
                    let expr_2118 := read_from_calldatat_address(_1072)
                    /// @src 0:33072:33110  "ILiquidatorGate(market.liquidatorGate)"
                    let expr_2119_address := convert_t_address_to_t_contract$_ILiquidatorGate_$4154(expr_2118)
                    /// @src 0:33072:33123  "ILiquidatorGate(market.liquidatorGate).canLiquidate"
                    let expr_2120_address := convert_t_contract$_ILiquidatorGate_$4154_to_t_address(expr_2119_address)
                    let expr_2120_functionSelector := 0xb9f4ff55
                    /// @src 0:33124:33134  "msg.sender"
                    let expr_2122 := caller()
                    /// @src 0:33072:33135  "ILiquidatorGate(market.liquidatorGate).canLiquidate(msg.sender)"

                    // storage for arguments and returned data
                    let _1073 := allocate_unbounded()
                    mstore(_1073, shift_left_224(expr_2120_functionSelector))
                    let _1074 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_1073, 4) , expr_2122)

                    let _1075 := staticcall(gas(), expr_2120_address,  _1073, sub(_1074, _1073), _1073, 32)

                    if iszero(_1075) { revert_forward_1() }

                    let expr_2123
                    if _1075 {

                        let _1076 := 32

                        if gt(_1076, returndatasize()) {
                            _1076 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_1073, _1076)

                        // decode return parameters from external try-call into retVars
                        expr_2123 :=  abi_decode_tuple_t_bool_fromMemory(_1073, add(_1073, _1076))
                    }
                    /// @src 0:33033:33135  "market.liquidatorGate == address(0) || ILiquidatorGate(market.liquidatorGate).canLiquidate(msg.sender)"
                    expr_2124 := expr_2123
                }
                /// @src 0:33012:33191  "require(..."
                require_helper_t_error_4292_LiquidatorGatedFromLiquidating(expr_2124)
                /// @src 0:33202:33217  "uint256 maxDebt"
                let var_maxDebt_2130
                let zero_t_uint256_1077 := zero_value_for_split_t_uint256()
                var_maxDebt_2130 := zero_t_uint256_1077
                /// @src 0:33227:33256  "uint256 liquidatedCollatPrice"
                let var_liquidatedCollatPrice_2133
                let zero_t_uint256_1078 := zero_value_for_split_t_uint256()
                var_liquidatedCollatPrice_2133 := zero_t_uint256_1078
                /// @src 0:33289:33298  "_position"
                let _1079_slot := var__position_2082_slot
                let expr_2137_slot := _1079_slot
                /// @src 0:33289:33303  "_position.debt"
                let _1080 := add(expr_2137_slot, 2)
                let _1081 := read_from_storage_split_offset_0_t_uint128(_1080)
                let expr_2138 := _1081
                /// @src 0:33266:33303  "uint256 originalDebt = _position.debt"
                let var_originalDebt_2136 := convert_t_uint128_to_t_uint256(expr_2138)
                /// @src 0:33331:33343  "originalDebt"
                let _1082 := var_originalDebt_2136
                let expr_2142 := _1082
                /// @src 0:33313:33343  "uint256 badDebt = originalDebt"
                let var_badDebt_2141 := expr_2142
                /// @src 0:33381:33390  "_position"
                let _1083_slot := var__position_2082_slot
                let expr_2146_slot := _1083_slot
                /// @src 0:33381:33407  "_position.collateralBitmap"
                let _1084 := add(expr_2146_slot, 2)
                let _1085 := read_from_storage_split_offset_16_t_uint128(_1084)
                let expr_2147 := _1085
                /// @src 0:33353:33407  "uint128 _collateralBitmap = _position.collateralBitmap"
                let var__collateralBitmap_2145 := expr_2147
                /// @src 0:33417:34135  "while (_collateralBitmap != 0) {..."
                for {
                    } 1 {
                }
                {
                    /// @src 0:33424:33441  "_collateralBitmap"
                    let _1086 := var__collateralBitmap_2145
                    let expr_2149 := _1086
                    /// @src 0:33445:33446  "0"
                    let expr_2150 := 0x00
                    /// @src 0:33424:33446  "_collateralBitmap != 0"
                    let expr_2151 := iszero(eq(cleanup_t_uint128(expr_2149), convert_t_rational_0_by_1_to_t_uint128(expr_2150)))
                    if iszero(expr_2151) { break }
                    /// @src 0:33474:33482  "UtilsLib"
                    let expr_2154_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:33487:33504  "_collateralBitmap"
                    let _1087 := var__collateralBitmap_2145
                    let expr_2156 := _1087
                    /// @src 0:33474:33505  "UtilsLib.msb(_collateralBitmap)"
                    let expr_2157 := fun_msb_5987(expr_2156)
                    /// @src 0:33462:33505  "uint256 i = UtilsLib.msb(_collateralBitmap)"
                    let var_i_2153 := expr_2157
                    /// @src 0:33562:33568  "market"
                    let _1088_offset := var_market_2044_offset
                    let expr_2162_offset := _1088_offset
                    /// @src 0:33562:33585  "market.collateralParams"
                    let _1089 := add(expr_2162_offset, 32)
                    let expr_2163_offset, expr_2163_length := access_calldata_tail_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2162_offset, _1089)
                    /// @src 0:33586:33587  "i"
                    let _1090 := var_i_2153
                    let expr_2164 := _1090
                    /// @src 0:33562:33588  "market.collateralParams[i]"
                    let expr_2165_offset := calldata_array_index_access_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2163_offset, expr_2163_length, expr_2164)
                    /// @src 0:33519:33588  "CollateralParams memory _collateralParam = market.collateralParams[i]"
                    let var__collateralParam_2161_mpos := convert_t_struct$_CollateralParams_$4180_calldata_ptr_to_t_struct$_CollateralParams_$4180_memory_ptr(expr_2165_offset)
                    /// @src 0:33626:33642  "_collateralParam"
                    let _1091_mpos := var__collateralParam_2161_mpos
                    let expr_2170_mpos := _1091_mpos
                    /// @src 0:33626:33649  "_collateralParam.oracle"
                    let _1092 := add(expr_2170_mpos, 96)
                    let _1093 := read_from_memoryt_address(_1092)
                    let expr_2171 := _1093
                    /// @src 0:33618:33650  "IOracle(_collateralParam.oracle)"
                    let expr_2172_address := convert_t_address_to_t_contract$_IOracle_$4895(expr_2171)
                    /// @src 0:33618:33656  "IOracle(_collateralParam.oracle).price"
                    let expr_2173_address := convert_t_contract$_IOracle_$4895_to_t_address(expr_2172_address)
                    let expr_2173_functionSelector := 0xa035b1fe
                    /// @src 0:33618:33658  "IOracle(_collateralParam.oracle).price()"

                    // storage for arguments and returned data
                    let _1094 := allocate_unbounded()
                    mstore(_1094, shift_left_224(expr_2173_functionSelector))
                    let _1095 := abi_encode_tuple__to__fromStack(add(_1094, 4) )

                    let _1096 := staticcall(gas(), expr_2173_address,  _1094, sub(_1095, _1094), _1094, 32)

                    if iszero(_1096) { revert_forward_1() }

                    let expr_2174
                    if _1096 {

                        let _1097 := 32

                        if gt(_1097, returndatasize()) {
                            _1097 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_1094, _1097)

                        // decode return parameters from external try-call into retVars
                        expr_2174 :=  abi_decode_tuple_t_uint256_fromMemory(_1094, add(_1094, _1097))
                    }
                    /// @src 0:33602:33658  "uint256 price = IOracle(_collateralParam.oracle).price()"
                    let var_price_2168 := expr_2174
                    /// @src 0:33676:33677  "i"
                    let _1098 := var_i_2153
                    let expr_2176 := _1098
                    /// @src 0:33681:33696  "collateralIndex"
                    let _1099 := var_collateralIndex_2046
                    let expr_2177 := _1099
                    /// @src 0:33676:33696  "i == collateralIndex"
                    let expr_2178 := eq(cleanup_t_uint256(expr_2176), cleanup_t_uint256(expr_2177))
                    /// @src 0:33672:33727  "if (i == collateralIndex) liquidatedCollatPrice = price"
                    if expr_2178 {
                        /// @src 0:33722:33727  "price"
                        let _1100 := var_price_2168
                        let expr_2180 := _1100
                        /// @src 0:33698:33727  "liquidatedCollatPrice = price"
                        var_liquidatedCollatPrice_2133 := expr_2180
                        let expr_2181 := expr_2180
                        /// @src 0:33672:33727  "if (i == collateralIndex) liquidatedCollatPrice = price"
                    }
                    /// @src 0:33763:33772  "_position"
                    let _1101_slot := var__position_2082_slot
                    let expr_2186_slot := _1101_slot
                    /// @src 0:33763:33783  "_position.collateral"
                    let _1102 := add(expr_2186_slot, 3)
                    let _1103_slot := _1102
                    let expr_2187_slot := _1103_slot
                    /// @src 0:33784:33785  "i"
                    let _1104 := var_i_2153
                    let expr_2188 := _1104
                    /// @src 0:33763:33786  "_position.collateral[i]"

                    let _1105, _1106 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_2187_slot, expr_2188)
                    let _1107 := read_from_storage_split_dynamic_t_uint128(_1105, _1106)
                    let expr_2189 := _1107
                    /// @src 0:33741:33786  "uint256 _collateral = _position.collateral[i]"
                    let var__collateral_2185 := convert_t_uint128_to_t_uint256(expr_2189)
                    /// @src 0:33811:33822  "_collateral"
                    let _1108 := var__collateral_2185
                    let expr_2192 := _1108
                    /// @src 0:33811:33833  "_collateral.mulDivDown"
                    let expr_2193_self := expr_2192
                    /// @src 0:33834:33839  "price"
                    let _1109 := var_price_2168
                    let expr_2194 := _1109
                    /// @src 0:33841:33859  "ORACLE_PRICE_SCALE"
                    let expr_2195 := constant_ORACLE_PRICE_SCALE_4920()
                    /// @src 0:33811:33860  "_collateral.mulDivDown(price, ORACLE_PRICE_SCALE)"
                    let expr_2196 := fun_mulDivDown_5872(expr_2193_self, expr_2194, expr_2195)
                    /// @src 0:33811:33871  "_collateral.mulDivDown(price, ORACLE_PRICE_SCALE).mulDivDown"
                    let expr_2197_self := expr_2196
                    /// @src 0:33872:33888  "_collateralParam"
                    let _1110_mpos := var__collateralParam_2161_mpos
                    let expr_2198_mpos := _1110_mpos
                    /// @src 0:33872:33893  "_collateralParam.lltv"
                    let _1111 := add(expr_2198_mpos, 32)
                    let _1112 := read_from_memoryt_uint256(_1111)
                    let expr_2199 := _1112
                    /// @src 0:33895:33898  "WAD"
                    let expr_2200 := constant_WAD_4917()
                    /// @src 0:33811:33899  "_collateral.mulDivDown(price, ORACLE_PRICE_SCALE).mulDivDown(_collateralParam.lltv, WAD)"
                    let expr_2201 := fun_mulDivDown_5872(expr_2197_self, expr_2199, expr_2200)
                    /// @src 0:33800:33899  "maxDebt += _collateral.mulDivDown(price, ORACLE_PRICE_SCALE).mulDivDown(_collateralParam.lltv, WAD)"
                    let _1113 := var_maxDebt_2130
                    let expr_2202 := checked_add_t_uint256(_1113, expr_2201)

                    var_maxDebt_2130 := expr_2202
                    /// @src 0:33923:33930  "badDebt"
                    let _1114 := var_badDebt_2141
                    let expr_2205 := _1114
                    /// @src 0:33923:33943  "badDebt.zeroFloorSub"
                    let expr_2206_self := expr_2205
                    /// @src 0:33961:33972  "_collateral"
                    let _1115 := var__collateral_2185
                    let expr_2207 := _1115
                    /// @src 0:33961:33981  "_collateral.mulDivUp"
                    let expr_2208_self := expr_2207
                    /// @src 0:33982:33987  "price"
                    let _1116 := var_price_2168
                    let expr_2209 := _1116
                    /// @src 0:33989:34007  "ORACLE_PRICE_SCALE"
                    let expr_2210 := constant_ORACLE_PRICE_SCALE_4920()
                    /// @src 0:33961:34008  "_collateral.mulDivUp(price, ORACLE_PRICE_SCALE)"
                    let expr_2211 := fun_mulDivUp_5897(expr_2208_self, expr_2209, expr_2210)
                    /// @src 0:33961:34017  "_collateral.mulDivUp(price, ORACLE_PRICE_SCALE).mulDivUp"
                    let expr_2212_self := expr_2211
                    /// @src 0:34018:34021  "WAD"
                    let expr_2213 := constant_WAD_4917()
                    /// @src 0:34023:34039  "_collateralParam"
                    let _1117_mpos := var__collateralParam_2161_mpos
                    let expr_2214_mpos := _1117_mpos
                    /// @src 0:34023:34046  "_collateralParam.maxLif"
                    let _1118 := add(expr_2214_mpos, 64)
                    let _1119 := read_from_memoryt_uint256(_1118)
                    let expr_2215 := _1119
                    /// @src 0:33961:34047  "_collateral.mulDivUp(price, ORACLE_PRICE_SCALE).mulDivUp(WAD, _collateralParam.maxLif)"
                    let expr_2216 := fun_mulDivUp_5897(expr_2212_self, expr_2213, expr_2215)
                    /// @src 0:33923:34061  "badDebt.zeroFloorSub(..."
                    let expr_2217 := fun_zeroFloorSub_5852(expr_2206_self, expr_2216)
                    /// @src 0:33913:34061  "badDebt = badDebt.zeroFloorSub(..."
                    var_badDebt_2141 := expr_2217
                    let expr_2218 := expr_2217
                    /// @src 0:34095:34112  "_collateralBitmap"
                    let _1120 := var__collateralBitmap_2145
                    let expr_2221 := _1120
                    /// @src 0:34095:34121  "_collateralBitmap.clearBit"
                    let expr_2222_self := expr_2221
                    /// @src 0:34122:34123  "i"
                    let _1121 := var_i_2153
                    let expr_2223 := _1121
                    /// @src 0:34095:34124  "_collateralBitmap.clearBit(i)"
                    let expr_2224 := fun_clearBit_6030(expr_2222_self, expr_2223)
                    /// @src 0:34075:34124  "_collateralBitmap = _collateralBitmap.clearBit(i)"
                    var__collateralBitmap_2145 := expr_2224
                    let expr_2225 := expr_2224
                }
                /// @src 0:34185:34187  "id"
                let _1122 := var_id_2068
                let expr_2231 := _1122
                /// @src 0:34189:34197  "borrower"
                let _1123 := var_borrower_2052
                let expr_2232 := _1123
                /// @src 0:34167:34198  "liquidationLocked(id, borrower)"
                let expr_2233 := fun_liquidationLocked_3724(expr_2231, expr_2232)
                /// @src 0:34166:34198  "!liquidationLocked(id, borrower)"
                let expr_2234 := cleanup_t_bool(iszero(expr_2233))
                /// @src 0:34166:34297  "!liquidationLocked(id, borrower)..."
                let expr_2246 := expr_2234
                if expr_2246 {
                    /// @src 0:34219:34235  "postMaturityMode"
                    let _1124 := var_postMaturityMode_2054
                    let expr_2235 := _1124
                    /// @src 0:34219:34296  "postMaturityMode ? block.timestamp > market.maturity : originalDebt > maxDebt"
                    let expr_2244
                    switch expr_2235
                    case 0 {
                        /// @src 0:34274:34286  "originalDebt"
                        let _1125 := var_originalDebt_2136
                        let expr_2241 := _1125
                        /// @src 0:34289:34296  "maxDebt"
                        let _1126 := var_maxDebt_2130
                        let expr_2242 := _1126
                        /// @src 0:34274:34296  "originalDebt > maxDebt"
                        let expr_2243 := gt(cleanup_t_uint256(expr_2241), cleanup_t_uint256(expr_2242))
                        /// @src 0:34219:34296  "postMaturityMode ? block.timestamp > market.maturity : originalDebt > maxDebt"
                        expr_2244 := expr_2243
                    }
                    default {
                        /// @src 0:34238:34253  "block.timestamp"
                        let expr_2237 := timestamp()
                        /// @src 0:34256:34262  "market"
                        let _1127_offset := var_market_2044_offset
                        let expr_2238_offset := _1127_offset
                        /// @src 0:34256:34271  "market.maturity"
                        let _1128 := add(expr_2238_offset, 64)
                        let expr_2239 := read_from_calldatat_uint256(_1128)
                        /// @src 0:34238:34271  "block.timestamp > market.maturity"
                        let expr_2240 := gt(cleanup_t_uint256(expr_2237), cleanup_t_uint256(expr_2239))
                        /// @src 0:34219:34296  "postMaturityMode ? block.timestamp > market.maturity : originalDebt > maxDebt"
                        expr_2244 := expr_2240
                    }
                    /// @src 0:34218:34297  "(postMaturityMode ? block.timestamp > market.maturity : originalDebt > maxDebt)"
                    let expr_2245 := expr_2244
                    /// @src 0:34166:34297  "!liquidationLocked(id, borrower)..."
                    expr_2246 := expr_2245
                }
                /// @src 0:34145:34338  "require(..."
                require_helper_t_error_4306_NotLiquidatable(expr_2246)
                /// @src 0:34353:34360  "badDebt"
                let _1129 := var_badDebt_2141
                let expr_2251 := _1129
                /// @src 0:34363:34364  "0"
                let expr_2252 := 0x00
                /// @src 0:34353:34364  "badDebt > 0"
                let expr_2253 := gt(cleanup_t_uint256(expr_2251), convert_t_rational_0_by_1_to_t_uint256(expr_2252))
                /// @src 0:34349:35215  "if (badDebt > 0) {..."
                if expr_2253 {
                    /// @src 0:34497:34504  "badDebt"
                    let _1130 := var_badDebt_2141
                    let expr_2259 := _1130
                    /// @src 0:34489:34505  "uint128(badDebt)"
                    let expr_2260 := convert_t_uint256_to_t_uint128(expr_2259)
                    /// @src 0:34471:34480  "_position"
                    let _1131_slot := var__position_2082_slot
                    let expr_2254_slot := _1131_slot
                    /// @src 0:34471:34485  "_position.debt"
                    let _1132 := add(expr_2254_slot, 2)
                    /// @src 0:34471:34505  "_position.debt -= uint128(badDebt)"
                    let _1133 := read_from_storage_split_offset_0_t_uint128(_1132)
                    let expr_2261 := checked_sub_t_uint128(_1133, expr_2260)

                    update_storage_value_offset_0_t_uint128_to_t_uint128(_1132, expr_2261)
                    /// @src 0:34541:34553  "_marketState"
                    let _1134_slot := var__marketState_2075_slot
                    let expr_2265_slot := _1134_slot
                    /// @src 0:34541:34564  "_marketState.totalUnits"
                    let _1135 := add(expr_2265_slot, 0)
                    let _1136 := read_from_storage_split_offset_0_t_uint128(_1135)
                    let expr_2266 := _1136
                    /// @src 0:34519:34564  "uint256 _totalUnits = _marketState.totalUnits"
                    let var__totalUnits_2264 := convert_t_uint128_to_t_uint256(expr_2266)
                    /// @src 0:34600:34612  "_marketState"
                    let _1137_slot := var__marketState_2075_slot
                    let expr_2270_slot := _1137_slot
                    /// @src 0:34600:34623  "_marketState.lossFactor"
                    let _1138 := add(expr_2270_slot, 0)
                    let _1139 := read_from_storage_split_offset_16_t_uint128(_1138)
                    let expr_2271 := _1139
                    /// @src 0:34578:34623  "uint256 _lossFactor = _marketState.lossFactor"
                    let var__lossFactor_2269 := convert_t_uint128_to_t_uint256(expr_2271)
                    /// @src 0:34663:34671  "UtilsLib"
                    let expr_2276_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:34699:34716  "type(uint128).max"
                    let expr_2282 := 0xffffffffffffffffffffffffffffffff
                    /// @src 0:34720:34737  "type(uint128).max"
                    let expr_2287 := 0xffffffffffffffffffffffffffffffff
                    /// @src 0:34740:34751  "_lossFactor"
                    let _1140 := var__lossFactor_2269
                    let expr_2288 := _1140
                    /// @src 0:34720:34751  "type(uint128).max - _lossFactor"
                    let expr_2289 := checked_sub_t_uint256(convert_t_uint128_to_t_uint256(expr_2287), expr_2288)

                    /// @src 0:34719:34752  "(type(uint128).max - _lossFactor)"
                    let expr_2290 := expr_2289
                    /// @src 0:34719:34763  "(type(uint128).max - _lossFactor).mulDivDown"
                    let expr_2291_self := expr_2290
                    /// @src 0:34764:34775  "_totalUnits"
                    let _1141 := var__totalUnits_2264
                    let expr_2292 := _1141
                    /// @src 0:34778:34785  "badDebt"
                    let _1142 := var_badDebt_2141
                    let expr_2293 := _1142
                    /// @src 0:34764:34785  "_totalUnits - badDebt"
                    let expr_2294 := checked_sub_t_uint256(expr_2292, expr_2293)

                    /// @src 0:34787:34798  "_totalUnits"
                    let _1143 := var__totalUnits_2264
                    let expr_2295 := _1143
                    /// @src 0:34719:34799  "(type(uint128).max - _lossFactor).mulDivDown(_totalUnits - badDebt, _totalUnits)"
                    let expr_2296 := fun_mulDivDown_5872(expr_2291_self, expr_2294, expr_2295)
                    /// @src 0:34699:34799  "type(uint128).max - (type(uint128).max - _lossFactor).mulDivDown(_totalUnits - badDebt, _totalUnits)"
                    let expr_2297 := checked_sub_t_uint256(convert_t_uint128_to_t_uint256(expr_2282), expr_2296)

                    /// @src 0:34663:34813  "UtilsLib.toUint128(..."
                    let expr_2298 := fun_toUint128_5922(expr_2297)
                    /// @src 0:34637:34649  "_marketState"
                    let _1144_slot := var__marketState_2075_slot
                    let expr_2273_slot := _1144_slot
                    /// @src 0:34637:34660  "_marketState.lossFactor"
                    let _1145 := add(expr_2273_slot, 0)
                    /// @src 0:34637:34813  "_marketState.lossFactor = UtilsLib.toUint128(..."
                    update_storage_value_offset_16_t_uint128_to_t_uint128(_1145, expr_2298)
                    let expr_2299 := expr_2298
                    /// @src 0:34854:34862  "UtilsLib"
                    let expr_2304_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:34873:34880  "badDebt"
                    let _1146 := var_badDebt_2141
                    let expr_2306 := _1146
                    /// @src 0:34854:34881  "UtilsLib.toUint128(badDebt)"
                    let expr_2307 := fun_toUint128_5922(expr_2306)
                    /// @src 0:34827:34839  "_marketState"
                    let _1147_slot := var__marketState_2075_slot
                    let expr_2301_slot := _1147_slot
                    /// @src 0:34827:34850  "_marketState.totalUnits"
                    let _1148 := add(expr_2301_slot, 0)
                    /// @src 0:34827:34881  "_marketState.totalUnits -= UtilsLib.toUint128(badDebt)"
                    let _1149 := read_from_storage_split_offset_0_t_uint128(_1148)
                    let expr_2308 := checked_sub_t_uint128(_1149, expr_2307)

                    update_storage_value_offset_0_t_uint128_to_t_uint128(_1148, expr_2308)
                    /// @src 0:34930:34941  "_lossFactor"
                    let _1150 := var__lossFactor_2269
                    let expr_2313 := _1150
                    /// @src 0:34944:34961  "type(uint128).max"
                    let expr_2318 := 0xffffffffffffffffffffffffffffffff
                    /// @src 0:34930:34961  "_lossFactor < type(uint128).max"
                    let expr_2319 := lt(cleanup_t_uint256(expr_2313), convert_t_uint128_to_t_uint256(expr_2318))
                    /// @src 0:34930:35204  "_lossFactor < type(uint128).max..."
                    let expr_2343
                    switch expr_2319
                    case 0 {
                        /// @src 0:35203:35204  "0"
                        let expr_2342 := 0x00
                        /// @src 0:34930:35204  "_lossFactor < type(uint128).max..."
                        expr_2343 := convert_t_rational_0_by_1_to_t_uint128(expr_2342)
                    }
                    default {
                        /// @src 0:34980:34988  "UtilsLib"
                        let expr_2320_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                        /// @src 0:35020:35032  "_marketState"
                        let _1151_slot := var__marketState_2075_slot
                        let expr_2322_slot := _1151_slot
                        /// @src 0:35020:35052  "_marketState.continuousFeeCredit"
                        let _1152 := add(expr_2322_slot, 1)
                        let _1153 := read_from_storage_split_offset_16_t_uint128(_1152)
                        let expr_2323 := _1153
                        /// @src 0:35020:35088  "_marketState.continuousFeeCredit..."
                        let expr_2324_self := convert_t_uint128_to_t_uint256(expr_2323)
                        /// @src 0:35089:35106  "type(uint128).max"
                        let expr_2329 := 0xffffffffffffffffffffffffffffffff
                        /// @src 0:35109:35121  "_marketState"
                        let _1154_slot := var__marketState_2075_slot
                        let expr_2330_slot := _1154_slot
                        /// @src 0:35109:35132  "_marketState.lossFactor"
                        let _1155 := add(expr_2330_slot, 0)
                        let _1156 := read_from_storage_split_offset_16_t_uint128(_1155)
                        let expr_2331 := _1156
                        /// @src 0:35089:35132  "type(uint128).max - _marketState.lossFactor"
                        let expr_2332 := checked_sub_t_uint128(expr_2329, expr_2331)

                        /// @src 0:35134:35151  "type(uint128).max"
                        let expr_2337 := 0xffffffffffffffffffffffffffffffff
                        /// @src 0:35154:35165  "_lossFactor"
                        let _1157 := var__lossFactor_2269
                        let expr_2338 := _1157
                        /// @src 0:35134:35165  "type(uint128).max - _lossFactor"
                        let expr_2339 := checked_sub_t_uint256(convert_t_uint128_to_t_uint256(expr_2337), expr_2338)

                        /// @src 0:35020:35166  "_marketState.continuousFeeCredit..."
                        let _1158 := convert_t_uint128_to_t_uint256(expr_2332)
                        let expr_2340 := fun_mulDivDown_5872(expr_2324_self, _1158, expr_2339)
                        /// @src 0:34980:35184  "UtilsLib.toUint128(..."
                        let expr_2341 := fun_toUint128_5922(expr_2340)
                        /// @src 0:34930:35204  "_lossFactor < type(uint128).max..."
                        expr_2343 := expr_2341
                    }
                    /// @src 0:34895:34907  "_marketState"
                    let _1159_slot := var__marketState_2075_slot
                    let expr_2310_slot := _1159_slot
                    /// @src 0:34895:34927  "_marketState.continuousFeeCredit"
                    let _1160 := add(expr_2310_slot, 1)
                    /// @src 0:34895:35204  "_marketState.continuousFeeCredit = _lossFactor < type(uint128).max..."
                    update_storage_value_offset_16_t_uint128_to_t_uint128(_1160, expr_2343)
                    let expr_2344 := expr_2343
                    /// @src 0:34349:35215  "if (badDebt > 0) {..."
                }
                /// @src 0:35229:35240  "repaidUnits"
                let _1161 := var_repaidUnits_2050
                let expr_2348 := _1161
                /// @src 0:35243:35244  "0"
                let expr_2349 := 0x00
                /// @src 0:35229:35244  "repaidUnits > 0"
                let expr_2350 := gt(cleanup_t_uint256(expr_2348), convert_t_rational_0_by_1_to_t_uint256(expr_2349))
                /// @src 0:35229:35264  "repaidUnits > 0 || seizedAssets > 0"
                let expr_2354 := expr_2350
                if iszero(expr_2354) {
                    /// @src 0:35248:35260  "seizedAssets"
                    let _1162 := var_seizedAssets_2048
                    let expr_2351 := _1162
                    /// @src 0:35263:35264  "0"
                    let expr_2352 := 0x00
                    /// @src 0:35248:35264  "seizedAssets > 0"
                    let expr_2353 := gt(cleanup_t_uint256(expr_2351), convert_t_rational_0_by_1_to_t_uint256(expr_2352))
                    /// @src 0:35229:35264  "repaidUnits > 0 || seizedAssets > 0"
                    expr_2354 := expr_2353
                }
                /// @src 0:35225:37188  "if (repaidUnits > 0 || seizedAssets > 0) {..."
                if expr_2354 {
                    /// @src 0:35298:35304  "market"
                    let _1163_offset := var_market_2044_offset
                    let expr_2357_offset := _1163_offset
                    /// @src 0:35298:35321  "market.collateralParams"
                    let _1164 := add(expr_2357_offset, 32)
                    let expr_2358_offset, expr_2358_length := access_calldata_tail_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2357_offset, _1164)
                    /// @src 0:35322:35337  "collateralIndex"
                    let _1165 := var_collateralIndex_2046
                    let expr_2359 := _1165
                    /// @src 0:35298:35338  "market.collateralParams[collateralIndex]"
                    let expr_2360_offset := calldata_array_index_access_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2358_offset, expr_2358_length, expr_2359)
                    /// @src 0:35298:35345  "market.collateralParams[collateralIndex].maxLif"
                    let _1166 := add(expr_2360_offset, 64)
                    let expr_2361 := read_from_calldatat_uint256(_1166)
                    /// @src 0:35280:35345  "uint256 _maxLif = market.collateralParams[collateralIndex].maxLif"
                    let var__maxLif_2356 := expr_2361
                    /// @src 0:35373:35389  "postMaturityMode"
                    let _1167 := var_postMaturityMode_2054
                    let expr_2365 := _1167
                    /// @src 0:35373:35534  "postMaturityMode..."
                    let expr_2386
                    switch expr_2365
                    case 0 {
                        /// @src 0:35527:35534  "_maxLif"
                        let _1168 := var__maxLif_2356
                        let expr_2385 := _1168
                        /// @src 0:35373:35534  "postMaturityMode..."
                        expr_2386 := expr_2385
                    }
                    default {
                        /// @src 0:35408:35416  "UtilsLib"
                        let expr_2366_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                        /// @src 0:35421:35428  "_maxLif"
                        let _1169 := var__maxLif_2356
                        let expr_2368 := _1169
                        /// @src 0:35430:35433  "WAD"
                        let expr_2369 := constant_WAD_4917()
                        /// @src 0:35437:35444  "_maxLif"
                        let _1170 := var__maxLif_2356
                        let expr_2370 := _1170
                        /// @src 0:35447:35450  "WAD"
                        let expr_2371 := constant_WAD_4917()
                        /// @src 0:35437:35450  "_maxLif - WAD"
                        let expr_2372 := checked_sub_t_uint256(expr_2370, expr_2371)

                        /// @src 0:35436:35451  "(_maxLif - WAD)"
                        let expr_2373 := expr_2372
                        /// @src 0:35455:35470  "block.timestamp"
                        let expr_2375 := timestamp()
                        /// @src 0:35473:35479  "market"
                        let _1171_offset := var_market_2044_offset
                        let expr_2376_offset := _1171_offset
                        /// @src 0:35473:35488  "market.maturity"
                        let _1172 := add(expr_2376_offset, 64)
                        let expr_2377 := read_from_calldatat_uint256(_1172)
                        /// @src 0:35455:35488  "block.timestamp - market.maturity"
                        let expr_2378 := checked_sub_t_uint256(expr_2375, expr_2377)

                        /// @src 0:35454:35489  "(block.timestamp - market.maturity)"
                        let expr_2379 := expr_2378
                        /// @src 0:35436:35489  "(_maxLif - WAD) * (block.timestamp - market.maturity)"
                        let expr_2380 := checked_mul_t_uint256(expr_2373, expr_2379)

                        /// @src 0:35492:35507  "TIME_TO_MAX_LIF"
                        let expr_2381 := constant_TIME_TO_MAX_LIF_4961()
                        /// @src 0:35436:35507  "(_maxLif - WAD) * (block.timestamp - market.maturity) / TIME_TO_MAX_LIF"
                        let expr_2382 := checked_div_t_uint256(expr_2380, expr_2381)

                        /// @src 0:35430:35507  "WAD + (_maxLif - WAD) * (block.timestamp - market.maturity) / TIME_TO_MAX_LIF"
                        let expr_2383 := checked_add_t_uint256(expr_2369, expr_2382)

                        /// @src 0:35408:35508  "UtilsLib.min(_maxLif, WAD + (_maxLif - WAD) * (block.timestamp - market.maturity) / TIME_TO_MAX_LIF)"
                        let expr_2384 := fun_min_5841(expr_2368, expr_2383)
                        /// @src 0:35373:35534  "postMaturityMode..."
                        expr_2386 := expr_2384
                    }
                    /// @src 0:35359:35534  "uint256 lif = postMaturityMode..."
                    let var_lif_2364 := expr_2386
                    /// @src 0:35553:35565  "seizedAssets"
                    let _1174 := var_seizedAssets_2048
                    let expr_2388 := _1174
                    /// @src 0:35568:35569  "0"
                    let expr_2389 := 0x00
                    /// @src 0:35553:35569  "seizedAssets > 0"
                    let expr_2390 := gt(cleanup_t_uint256(expr_2388), convert_t_rational_0_by_1_to_t_uint256(expr_2389))
                    /// @src 0:35549:35841  "if (seizedAssets > 0) {..."
                    switch expr_2390
                    case 0 {
                        /// @src 0:35740:35751  "repaidUnits"
                        let _1175 := var_repaidUnits_2050
                        let expr_2405 := _1175
                        /// @src 0:35740:35762  "repaidUnits.mulDivDown"
                        let expr_2406_self := expr_2405
                        /// @src 0:35763:35766  "lif"
                        let _1176 := var_lif_2364
                        let expr_2407 := _1176
                        /// @src 0:35768:35771  "WAD"
                        let expr_2408 := constant_WAD_4917()
                        /// @src 0:35740:35772  "repaidUnits.mulDivDown(lif, WAD)"
                        let expr_2409 := fun_mulDivDown_5872(expr_2406_self, expr_2407, expr_2408)
                        /// @src 0:35740:35783  "repaidUnits.mulDivDown(lif, WAD).mulDivDown"
                        let expr_2410_self := expr_2409
                        /// @src 0:35784:35802  "ORACLE_PRICE_SCALE"
                        let expr_2411 := constant_ORACLE_PRICE_SCALE_4920()
                        /// @src 0:35804:35825  "liquidatedCollatPrice"
                        let _1177 := var_liquidatedCollatPrice_2133
                        let expr_2412 := _1177
                        /// @src 0:35740:35826  "repaidUnits.mulDivDown(lif, WAD).mulDivDown(ORACLE_PRICE_SCALE, liquidatedCollatPrice)"
                        let expr_2413 := fun_mulDivDown_5872(expr_2410_self, expr_2411, expr_2412)
                        /// @src 0:35725:35826  "seizedAssets = repaidUnits.mulDivDown(lif, WAD).mulDivDown(ORACLE_PRICE_SCALE, liquidatedCollatPrice)"
                        var_seizedAssets_2048 := expr_2413
                        let expr_2414 := expr_2413
                        /// @src 0:35549:35841  "if (seizedAssets > 0) {..."
                    }
                    default {
                        /// @src 0:35603:35615  "seizedAssets"
                        let _1178 := var_seizedAssets_2048
                        let expr_2392 := _1178
                        /// @src 0:35603:35624  "seizedAssets.mulDivUp"
                        let expr_2393_self := expr_2392
                        /// @src 0:35625:35646  "liquidatedCollatPrice"
                        let _1179 := var_liquidatedCollatPrice_2133
                        let expr_2394 := _1179
                        /// @src 0:35648:35666  "ORACLE_PRICE_SCALE"
                        let expr_2395 := constant_ORACLE_PRICE_SCALE_4920()
                        /// @src 0:35603:35667  "seizedAssets.mulDivUp(liquidatedCollatPrice, ORACLE_PRICE_SCALE)"
                        let expr_2396 := fun_mulDivUp_5897(expr_2393_self, expr_2394, expr_2395)
                        /// @src 0:35603:35676  "seizedAssets.mulDivUp(liquidatedCollatPrice, ORACLE_PRICE_SCALE).mulDivUp"
                        let expr_2397_self := expr_2396
                        /// @src 0:35677:35680  "WAD"
                        let expr_2398 := constant_WAD_4917()
                        /// @src 0:35682:35685  "lif"
                        let _1180 := var_lif_2364
                        let expr_2399 := _1180
                        /// @src 0:35603:35686  "seizedAssets.mulDivUp(liquidatedCollatPrice, ORACLE_PRICE_SCALE).mulDivUp(WAD, lif)"
                        let expr_2400 := fun_mulDivUp_5897(expr_2397_self, expr_2398, expr_2399)
                        /// @src 0:35589:35686  "repaidUnits = seizedAssets.mulDivUp(liquidatedCollatPrice, ORACLE_PRICE_SCALE).mulDivUp(WAD, lif)"
                        var_repaidUnits_2050 := expr_2400
                        let expr_2401 := expr_2400
                        /// @src 0:35549:35841  "if (seizedAssets > 0) {..."
                    }
                    /// @src 0:35860:35876  "postMaturityMode"
                    let _1181 := var_postMaturityMode_2054
                    let expr_2418 := _1181
                    /// @src 0:35859:35876  "!postMaturityMode"
                    let expr_2419 := cleanup_t_bool(iszero(expr_2418))
                    /// @src 0:35855:36692  "if (!postMaturityMode) {..."
                    if expr_2419 {
                        /// @src 0:35911:35917  "market"
                        let _1182_offset := var_market_2044_offset
                        let expr_2422_offset := _1182_offset
                        /// @src 0:35911:35934  "market.collateralParams"
                        let _1183 := add(expr_2422_offset, 32)
                        let expr_2423_offset, expr_2423_length := access_calldata_tail_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2422_offset, _1183)
                        /// @src 0:35935:35950  "collateralIndex"
                        let _1184 := var_collateralIndex_2046
                        let expr_2424 := _1184
                        /// @src 0:35911:35951  "market.collateralParams[collateralIndex]"
                        let expr_2425_offset := calldata_array_index_access_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2423_offset, expr_2423_length, expr_2424)
                        /// @src 0:35911:35956  "market.collateralParams[collateralIndex].lltv"
                        let _1185 := add(expr_2425_offset, 32)
                        let expr_2426 := read_from_calldatat_uint256(_1185)
                        /// @src 0:35896:35956  "uint256 lltv = market.collateralParams[collateralIndex].lltv"
                        let var_lltv_2421 := expr_2426
                        /// @src 0:36169:36173  "lltv"
                        let _1186 := var_lltv_2421
                        let expr_2430 := _1186
                        /// @src 0:36176:36179  "WAD"
                        let expr_2431 := constant_WAD_4917()
                        /// @src 0:36169:36179  "lltv < WAD"
                        let expr_2432 := lt(cleanup_t_uint256(expr_2430), cleanup_t_uint256(expr_2431))
                        /// @src 0:36169:36312  "lltv < WAD..."
                        let expr_2455
                        switch expr_2432
                        case 0 {
                            /// @src 0:36295:36312  "type(uint256).max"
                            let expr_2454 := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                            /// @src 0:36169:36312  "lltv < WAD..."
                            expr_2455 := expr_2454
                        }
                        default {
                            /// @src 0:36203:36212  "_position"
                            let _1187_slot := var__position_2082_slot
                            let expr_2433_slot := _1187_slot
                            /// @src 0:36203:36217  "_position.debt"
                            let _1188 := add(expr_2433_slot, 2)
                            let _1189 := read_from_storage_split_offset_0_t_uint128(_1188)
                            let expr_2434 := _1189
                            /// @src 0:36220:36227  "maxDebt"
                            let _1190 := var_maxDebt_2130
                            let expr_2435 := _1190
                            /// @src 0:36203:36227  "_position.debt - maxDebt"
                            let expr_2436 := checked_sub_t_uint256(convert_t_uint128_to_t_uint256(expr_2434), expr_2435)

                            /// @src 0:36202:36228  "(_position.debt - maxDebt)"
                            let expr_2437 := expr_2436
                            /// @src 0:36202:36237  "(_position.debt - maxDebt).mulDivUp"
                            let expr_2438_self := expr_2437
                            /// @src 0:36238:36241  "WAD"
                            let expr_2439 := constant_WAD_4917()
                            /// @src 0:36244:36247  "WAD"
                            let expr_2440 := constant_WAD_4917()
                            /// @src 0:36238:36247  "WAD * WAD"
                            let expr_2441 := checked_mul_t_uint256(expr_2439, expr_2440)

                            /// @src 0:36249:36252  "WAD"
                            let expr_2442 := constant_WAD_4917()
                            /// @src 0:36255:36258  "WAD"
                            let expr_2443 := constant_WAD_4917()
                            /// @src 0:36249:36258  "WAD * WAD"
                            let expr_2444 := checked_mul_t_uint256(expr_2442, expr_2443)

                            /// @src 0:36261:36264  "lif"
                            let _1191 := var_lif_2364
                            let expr_2445 := _1191
                            /// @src 0:36267:36271  "lltv"
                            let _1192 := var_lltv_2421
                            let expr_2446 := _1192
                            /// @src 0:36261:36271  "lif * lltv"
                            let expr_2447 := checked_mul_t_uint256(expr_2445, expr_2446)

                            /// @src 0:36249:36271  "WAD * WAD - lif * lltv"
                            let expr_2448 := checked_sub_t_uint256(expr_2444, expr_2447)

                            /// @src 0:36202:36272  "(_position.debt - maxDebt).mulDivUp(WAD * WAD, WAD * WAD - lif * lltv)"
                            let expr_2449 := fun_mulDivUp_5897(expr_2438_self, expr_2441, expr_2448)
                            /// @src 0:36169:36312  "lltv < WAD..."
                            expr_2455 := expr_2449
                        }
                        /// @src 0:36149:36312  "uint256 maxRepaid = lltv < WAD..."
                        let var_maxRepaid_2429 := expr_2455
                        /// @src 0:36359:36370  "repaidUnits"
                        let _1193 := var_repaidUnits_2050
                        let expr_2458 := _1193
                        /// @src 0:36374:36383  "maxRepaid"
                        let _1194 := var_maxRepaid_2429
                        let expr_2459 := _1194
                        /// @src 0:36359:36383  "repaidUnits <= maxRepaid"
                        let expr_2460 := iszero(gt(cleanup_t_uint256(expr_2458), cleanup_t_uint256(expr_2459)))
                        /// @src 0:36359:36598  "repaidUnits <= maxRepaid..."
                        let expr_2479 := expr_2460
                        if iszero(expr_2479) {
                            /// @src 0:36411:36420  "_position"
                            let _1195_slot := var__position_2082_slot
                            let expr_2461_slot := _1195_slot
                            /// @src 0:36411:36431  "_position.collateral"
                            let _1196 := add(expr_2461_slot, 3)
                            let _1197_slot := _1196
                            let expr_2462_slot := _1197_slot
                            /// @src 0:36432:36447  "collateralIndex"
                            let _1198 := var_collateralIndex_2046
                            let expr_2463 := _1198
                            /// @src 0:36411:36448  "_position.collateral[collateralIndex]"

                            let _1199, _1200 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_2462_slot, expr_2463)
                            let _1201 := read_from_storage_split_dynamic_t_uint128(_1199, _1200)
                            let expr_2464 := _1201
                            /// @src 0:36411:36459  "_position.collateral[collateralIndex].mulDivDown"
                            let expr_2465_self := convert_t_uint128_to_t_uint256(expr_2464)
                            /// @src 0:36460:36481  "liquidatedCollatPrice"
                            let _1202 := var_liquidatedCollatPrice_2133
                            let expr_2466 := _1202
                            /// @src 0:36483:36501  "ORACLE_PRICE_SCALE"
                            let expr_2467 := constant_ORACLE_PRICE_SCALE_4920()
                            /// @src 0:36411:36502  "_position.collateral[collateralIndex].mulDivDown(liquidatedCollatPrice, ORACLE_PRICE_SCALE)"
                            let expr_2468 := fun_mulDivDown_5872(expr_2465_self, expr_2466, expr_2467)
                            /// @src 0:36411:36542  "_position.collateral[collateralIndex].mulDivDown(liquidatedCollatPrice, ORACLE_PRICE_SCALE)..."
                            let expr_2469_self := expr_2468
                            /// @src 0:36543:36546  "WAD"
                            let expr_2470 := constant_WAD_4917()
                            /// @src 0:36548:36551  "lif"
                            let _1203 := var_lif_2364
                            let expr_2471 := _1203
                            /// @src 0:36411:36552  "_position.collateral[collateralIndex].mulDivDown(liquidatedCollatPrice, ORACLE_PRICE_SCALE)..."
                            let expr_2472 := fun_mulDivDown_5872(expr_2469_self, expr_2470, expr_2471)
                            /// @src 0:36411:36565  "_position.collateral[collateralIndex].mulDivDown(liquidatedCollatPrice, ORACLE_PRICE_SCALE)..."
                            let expr_2473_self := expr_2472
                            /// @src 0:36566:36575  "maxRepaid"
                            let _1204 := var_maxRepaid_2429
                            let expr_2474 := _1204
                            /// @src 0:36411:36576  "_position.collateral[collateralIndex].mulDivDown(liquidatedCollatPrice, ORACLE_PRICE_SCALE)..."
                            let expr_2475 := fun_zeroFloorSub_5852(expr_2473_self, expr_2474)
                            /// @src 0:36579:36585  "market"
                            let _1205_offset := var_market_2044_offset
                            let expr_2476_offset := _1205_offset
                            /// @src 0:36579:36598  "market.rcfThreshold"
                            let _1206 := add(expr_2476_offset, 96)
                            let expr_2477 := read_from_calldatat_uint256(_1206)
                            /// @src 0:36411:36598  "_position.collateral[collateralIndex].mulDivDown(liquidatedCollatPrice, ORACLE_PRICE_SCALE)..."
                            let expr_2478 := lt(cleanup_t_uint256(expr_2475), cleanup_t_uint256(expr_2477))
                            /// @src 0:36359:36598  "repaidUnits <= maxRepaid..."
                            expr_2479 := expr_2478
                        }
                        /// @src 0:36330:36677  "require(..."
                        require_helper_t_error_4328_RecoveryCloseFactorConditionsViolated(expr_2479)
                        /// @src 0:35855:36692  "if (!postMaturityMode) {..."
                    }
                    /// @src 0:36730:36739  "_position"
                    let _1207_slot := var__position_2082_slot
                    let expr_2488_slot := _1207_slot
                    /// @src 0:36730:36750  "_position.collateral"
                    let _1208 := add(expr_2488_slot, 3)
                    let _1209_slot := _1208
                    let expr_2489_slot := _1209_slot
                    /// @src 0:36751:36766  "collateralIndex"
                    let _1210 := var_collateralIndex_2046
                    let expr_2490 := _1210
                    /// @src 0:36730:36767  "_position.collateral[collateralIndex]"

                    let _1211, _1212 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_2489_slot, expr_2490)
                    let _1213 := read_from_storage_split_dynamic_t_uint128(_1211, _1212)
                    let expr_2491 := _1213
                    /// @src 0:36770:36778  "UtilsLib"
                    let expr_2492_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:36789:36801  "seizedAssets"
                    let _1214 := var_seizedAssets_2048
                    let expr_2494 := _1214
                    /// @src 0:36770:36802  "UtilsLib.toUint128(seizedAssets)"
                    let expr_2495 := fun_toUint128_5922(expr_2494)
                    /// @src 0:36730:36802  "_position.collateral[collateralIndex] - UtilsLib.toUint128(seizedAssets)"
                    let expr_2496 := checked_sub_t_uint128(expr_2491, expr_2495)

                    /// @src 0:36706:36802  "uint128 newCollateral = _position.collateral[collateralIndex] - UtilsLib.toUint128(seizedAssets)"
                    let var_newCollateral_2487 := expr_2496
                    /// @src 0:36856:36869  "newCollateral"
                    let _1215 := var_newCollateral_2487
                    let expr_2503 := _1215
                    /// @src 0:36816:36825  "_position"
                    let _1216_slot := var__position_2082_slot
                    let expr_2498_slot := _1216_slot
                    /// @src 0:36816:36836  "_position.collateral"
                    let _1217 := add(expr_2498_slot, 3)
                    let _1218_slot := _1217
                    let expr_2501_slot := _1218_slot
                    /// @src 0:36837:36852  "collateralIndex"
                    let _1219 := var_collateralIndex_2046
                    let expr_2500 := _1219
                    /// @src 0:36816:36853  "_position.collateral[collateralIndex]"

                    let _1220, _1221 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_2501_slot, expr_2500)
                    /// @src 0:36816:36869  "_position.collateral[collateralIndex] = newCollateral"
                    update_storage_value_t_uint128_to_t_uint128(_1220, _1221, expr_2503)
                    let expr_2504 := expr_2503
                    /// @src 0:36887:36900  "newCollateral"
                    let _1222 := var_newCollateral_2487
                    let expr_2506 := _1222
                    /// @src 0:36904:36905  "0"
                    let expr_2507 := 0x00
                    /// @src 0:36887:36905  "newCollateral == 0"
                    let expr_2508 := eq(cleanup_t_uint128(expr_2506), convert_t_rational_0_by_1_to_t_uint128(expr_2507))
                    /// @src 0:36887:36925  "newCollateral == 0 && seizedAssets > 0"
                    let expr_2512 := expr_2508
                    if expr_2512 {
                        /// @src 0:36909:36921  "seizedAssets"
                        let _1223 := var_seizedAssets_2048
                        let expr_2509 := _1223
                        /// @src 0:36924:36925  "0"
                        let expr_2510 := 0x00
                        /// @src 0:36909:36925  "seizedAssets > 0"
                        let expr_2511 := gt(cleanup_t_uint256(expr_2509), convert_t_rational_0_by_1_to_t_uint256(expr_2510))
                        /// @src 0:36887:36925  "newCollateral == 0 && seizedAssets > 0"
                        expr_2512 := expr_2511
                    }
                    /// @src 0:36883:37041  "if (newCollateral == 0 && seizedAssets > 0) {..."
                    if expr_2512 {
                        /// @src 0:36974:36983  "_position"
                        let _1224_slot := var__position_2082_slot
                        let expr_2516_slot := _1224_slot
                        /// @src 0:36974:37000  "_position.collateralBitmap"
                        let _1225 := add(expr_2516_slot, 2)
                        let _1226 := read_from_storage_split_offset_16_t_uint128(_1225)
                        let expr_2517 := _1226
                        /// @src 0:36974:37009  "_position.collateralBitmap.clearBit"
                        let expr_2518_self := expr_2517
                        /// @src 0:37010:37025  "collateralIndex"
                        let _1227 := var_collateralIndex_2046
                        let expr_2519 := _1227
                        /// @src 0:36974:37026  "_position.collateralBitmap.clearBit(collateralIndex)"
                        let expr_2520 := fun_clearBit_6030(expr_2518_self, expr_2519)
                        /// @src 0:36945:36954  "_position"
                        let _1228_slot := var__position_2082_slot
                        let expr_2513_slot := _1228_slot
                        /// @src 0:36945:36971  "_position.collateralBitmap"
                        let _1229 := add(expr_2513_slot, 2)
                        /// @src 0:36945:37026  "_position.collateralBitmap = _position.collateralBitmap.clearBit(collateralIndex)"
                        update_storage_value_offset_16_t_uint128_to_t_uint128(_1229, expr_2520)
                        let expr_2521 := expr_2520
                        /// @src 0:36883:37041  "if (newCollateral == 0 && seizedAssets > 0) {..."
                    }
                    /// @src 0:37083:37091  "UtilsLib"
                    let expr_2528_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:37102:37113  "repaidUnits"
                    let _1230 := var_repaidUnits_2050
                    let expr_2530 := _1230
                    /// @src 0:37083:37114  "UtilsLib.toUint128(repaidUnits)"
                    let expr_2531 := fun_toUint128_5922(expr_2530)
                    /// @src 0:37054:37066  "_marketState"
                    let _1231_slot := var__marketState_2075_slot
                    let expr_2525_slot := _1231_slot
                    /// @src 0:37054:37079  "_marketState.withdrawable"
                    let _1232 := add(expr_2525_slot, 1)
                    /// @src 0:37054:37114  "_marketState.withdrawable += UtilsLib.toUint128(repaidUnits)"
                    let _1233 := read_from_storage_split_offset_0_t_uint128(_1232)
                    let expr_2532 := checked_add_t_uint128(_1233, expr_2531)

                    update_storage_value_offset_0_t_uint128_to_t_uint128(_1232, expr_2532)
                    /// @src 0:37146:37154  "UtilsLib"
                    let expr_2537_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:37165:37176  "repaidUnits"
                    let _1234 := var_repaidUnits_2050
                    let expr_2539 := _1234
                    /// @src 0:37146:37177  "UtilsLib.toUint128(repaidUnits)"
                    let expr_2540 := fun_toUint128_5922(expr_2539)
                    /// @src 0:37128:37137  "_position"
                    let _1235_slot := var__position_2082_slot
                    let expr_2534_slot := _1235_slot
                    /// @src 0:37128:37142  "_position.debt"
                    let _1236 := add(expr_2534_slot, 2)
                    /// @src 0:37128:37177  "_position.debt -= UtilsLib.toUint128(repaidUnits)"
                    let _1237 := read_from_storage_split_offset_0_t_uint128(_1236)
                    let expr_2541 := checked_sub_t_uint128(_1237, expr_2540)

                    update_storage_value_offset_0_t_uint128_to_t_uint128(_1236, expr_2541)
                    /// @src 0:35225:37188  "if (repaidUnits > 0 || seizedAssets > 0) {..."
                }
                /// @src 0:37214:37222  "callback"
                let _1238 := var_callback_2058
                let expr_2547 := _1238
                /// @src 0:37234:37235  "0"
                let expr_2550 := 0x00
                /// @src 0:37226:37236  "address(0)"
                let expr_2551 := convert_t_rational_0_by_1_to_t_address(expr_2550)
                /// @src 0:37214:37236  "callback != address(0)"
                let expr_2552 := iszero(eq(cleanup_t_address(expr_2547), cleanup_t_address(expr_2551)))
                /// @src 0:37214:37260  "callback != address(0) ? callback : msg.sender"
                let expr_2556
                switch expr_2552
                case 0 {
                    /// @src 0:37250:37260  "msg.sender"
                    let expr_2555 := caller()
                    /// @src 0:37214:37260  "callback != address(0) ? callback : msg.sender"
                    expr_2556 := expr_2555
                }
                default {
                    /// @src 0:37239:37247  "callback"
                    let _1239 := var_callback_2058
                    let expr_2553 := _1239
                    /// @src 0:37214:37260  "callback != address(0) ? callback : msg.sender"
                    expr_2556 := expr_2553
                }
                /// @src 0:37198:37260  "address payer = callback != address(0) ? callback : msg.sender"
                let var_payer_2546 := expr_2556
                /// @src 0:37276:37285  "EventsLib"
                let expr_2558_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:37309:37319  "msg.sender"
                let expr_2562 := caller()
                /// @src 0:37333:37335  "id"
                let _1240 := var_id_2068
                let expr_2563 := _1240
                /// @src 0:37349:37355  "market"
                let _1241_offset := var_market_2044_offset
                let expr_2564_offset := _1241_offset
                /// @src 0:37349:37372  "market.collateralParams"
                let _1242 := add(expr_2564_offset, 32)
                let expr_2565_offset, expr_2565_length := access_calldata_tail_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2564_offset, _1242)
                /// @src 0:37373:37388  "collateralIndex"
                let _1243 := var_collateralIndex_2046
                let expr_2566 := _1243
                /// @src 0:37349:37389  "market.collateralParams[collateralIndex]"
                let expr_2567_offset := calldata_array_index_access_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2565_offset, expr_2565_length, expr_2566)
                /// @src 0:37349:37395  "market.collateralParams[collateralIndex].token"
                let _1244 := add(expr_2567_offset, 0)
                let expr_2568 := read_from_calldatat_address(_1244)
                /// @src 0:37409:37421  "seizedAssets"
                let _1245 := var_seizedAssets_2048
                let expr_2569 := _1245
                /// @src 0:37435:37446  "repaidUnits"
                let _1246 := var_repaidUnits_2050
                let expr_2570 := _1246
                /// @src 0:37460:37468  "borrower"
                let _1247 := var_borrower_2052
                let expr_2571 := _1247
                /// @src 0:37482:37498  "postMaturityMode"
                let _1248 := var_postMaturityMode_2054
                let expr_2572 := _1248
                /// @src 0:37512:37520  "receiver"
                let _1249 := var_receiver_2056
                let expr_2573 := _1249
                /// @src 0:37534:37539  "payer"
                let _1250 := var_payer_2546
                let expr_2574 := _1250
                /// @src 0:37553:37560  "badDebt"
                let _1251 := var_badDebt_2141
                let expr_2575 := _1251
                /// @src 0:37574:37586  "_marketState"
                let _1252_slot := var__marketState_2075_slot
                let expr_2576_slot := _1252_slot
                /// @src 0:37574:37597  "_marketState.lossFactor"
                let _1253 := add(expr_2576_slot, 0)
                let _1254 := read_from_storage_split_offset_16_t_uint128(_1253)
                let expr_2577 := _1254
                /// @src 0:37611:37623  "_marketState"
                let _1255_slot := var__marketState_2075_slot
                let expr_2578_slot := _1255_slot
                /// @src 0:37611:37643  "_marketState.continuousFeeCredit"
                let _1256 := add(expr_2578_slot, 1)
                let _1257 := read_from_storage_split_offset_16_t_uint128(_1256)
                let expr_2579 := _1257
                /// @src 0:37276:37653  "EventsLib.Liquidate(..."
                let _1258 := 0xb137b989b9fd54b984273db8f16364f52f383aaca56076a320c1896e9fc2dad9
                let _1259 := convert_t_bytes32_to_t_bytes32(expr_2563)
                let _1260 := convert_t_address_to_t_address(expr_2568)
                let _1261 := convert_t_address_to_t_address(expr_2571)
                {
                    let _1262 := allocate_unbounded()
                    let _1263 := abi_encode_tuple_t_address_t_uint256_t_uint256_t_bool_t_address_t_address_t_uint256_t_uint128_t_uint128__to_t_address_t_uint256_t_uint256_t_bool_t_address_t_address_t_uint256_t_uint256_t_uint256__fromStack(_1262 , expr_2562, expr_2569, expr_2570, expr_2572, expr_2573, expr_2574, expr_2575, expr_2577, expr_2579)
                    log4(_1262, sub(_1263, _1262) , _1258, _1259, _1260, _1261)
                }/// @src 0:37664:37679  "SafeTransferLib"
                let expr_2582_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:37693:37699  "market"
                let _1264_offset := var_market_2044_offset
                let expr_2585_offset := _1264_offset
                /// @src 0:37693:37716  "market.collateralParams"
                let _1265 := add(expr_2585_offset, 32)
                let expr_2586_offset, expr_2586_length := access_calldata_tail_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2585_offset, _1265)
                /// @src 0:37717:37732  "collateralIndex"
                let _1266 := var_collateralIndex_2046
                let expr_2587 := _1266
                /// @src 0:37693:37733  "market.collateralParams[collateralIndex]"
                let expr_2588_offset := calldata_array_index_access_t_array$_t_struct$_CollateralParams_$4180_calldata_ptr_$dyn_calldata_ptr(expr_2586_offset, expr_2586_length, expr_2587)
                /// @src 0:37693:37739  "market.collateralParams[collateralIndex].token"
                let _1267 := add(expr_2588_offset, 0)
                let expr_2589 := read_from_calldatat_address(_1267)
                /// @src 0:37741:37749  "receiver"
                let _1268 := var_receiver_2056
                let expr_2590 := _1268
                /// @src 0:37751:37763  "seizedAssets"
                let _1269 := var_seizedAssets_2048
                let expr_2591 := _1269
                fun_safeTransfer_5503(expr_2589, expr_2590, expr_2591)
                /// @src 0:37779:37787  "callback"
                let _1270 := var_callback_2058
                let expr_2594 := _1270
                /// @src 0:37799:37800  "0"
                let expr_2597 := 0x00
                /// @src 0:37791:37801  "address(0)"
                let expr_2598 := convert_t_rational_0_by_1_to_t_address(expr_2597)
                /// @src 0:37779:37801  "callback != address(0)"
                let expr_2599 := iszero(eq(cleanup_t_address(expr_2594), cleanup_t_address(expr_2598)))
                /// @src 0:37775:38366  "if (callback != address(0)) {..."
                if expr_2599 {
                    /// @src 0:37861:37869  "callback"
                    let _1271 := var_callback_2058
                    let expr_2602 := _1271
                    /// @src 0:37842:37870  "ILiquidateCallback(callback)"
                    let expr_2603_address := convert_t_address_to_t_contract$_ILiquidateCallback_$4048(expr_2602)
                    /// @src 0:37842:37903  "ILiquidateCallback(callback)..."
                    let expr_2604_address := convert_t_contract$_ILiquidateCallback_$4048_to_t_address(expr_2603_address)
                    let expr_2604_functionSelector := 0x6861b795
                    /// @src 0:37929:37939  "msg.sender"
                    let expr_2606 := caller()
                    /// @src 0:37965:37967  "id"
                    let _1272 := var_id_2068
                    let expr_2607 := _1272
                    /// @src 0:37993:37999  "market"
                    let _1273_offset := var_market_2044_offset
                    let expr_2608_offset := _1273_offset
                    /// @src 0:38025:38040  "collateralIndex"
                    let _1274 := var_collateralIndex_2046
                    let expr_2609 := _1274
                    /// @src 0:38066:38078  "seizedAssets"
                    let _1275 := var_seizedAssets_2048
                    let expr_2610 := _1275
                    /// @src 0:38104:38115  "repaidUnits"
                    let _1276 := var_repaidUnits_2050
                    let expr_2611 := _1276
                    /// @src 0:38141:38149  "borrower"
                    let _1277 := var_borrower_2052
                    let expr_2612 := _1277
                    /// @src 0:38175:38183  "receiver"
                    let _1278 := var_receiver_2056
                    let expr_2613 := _1278
                    /// @src 0:38209:38213  "data"
                    let _1279_offset := var_data_2060_offset
                    let _1279_length := var_data_2060_length
                    let expr_2614_offset := _1279_offset
                    let expr_2614_length := _1279_length
                    /// @src 0:38239:38246  "badDebt"
                    let _1280 := var_badDebt_2141
                    let expr_2615 := _1280
                    /// @src 0:37842:38268  "ILiquidateCallback(callback)..."

                    // storage for arguments and returned data
                    let _1281 := allocate_unbounded()
                    mstore(_1281, shift_left_224(expr_2604_functionSelector))
                    let _1282 := abi_encode_tuple_t_address_t_bytes32_t_struct$_Market_$4171_calldata_ptr_t_uint256_t_uint256_t_uint256_t_address_t_address_t_bytes_calldata_ptr_t_uint256__to_t_address_t_bytes32_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_uint256_t_address_t_address_t_bytes_memory_ptr_t_uint256__fromStack(add(_1281, 4) , expr_2606, expr_2607, expr_2608_offset, expr_2609, expr_2610, expr_2611, expr_2612, expr_2613, expr_2614_offset, expr_2614_length, expr_2615)

                    let _1283 := call(gas(), expr_2604_address,  0,  _1281, sub(_1282, _1281), _1281, 32)

                    if iszero(_1283) { revert_forward_1() }

                    let expr_2616
                    if _1283 {

                        let _1284 := 32

                        if gt(_1284, returndatasize()) {
                            _1284 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_1281, _1284)

                        // decode return parameters from external try-call into retVars
                        expr_2616 :=  abi_decode_tuple_t_bytes32_fromMemory(_1281, add(_1281, _1284))
                    }
                    /// @src 0:38272:38288  "CALLBACK_SUCCESS"
                    let expr_2617 := constant_CALLBACK_SUCCESS_4986()
                    /// @src 0:37842:38288  "ILiquidateCallback(callback)..."
                    let expr_2618 := eq(cleanup_t_bytes32(expr_2616), cleanup_t_bytes32(expr_2617))
                    /// @src 0:37817:38355  "require(..."
                    require_helper_t_error_4282_WrongLiquidateCallbackReturnValue(expr_2618)
                    /// @src 0:37775:38366  "if (callback != address(0)) {..."
                }
                /// @src 0:38376:38391  "SafeTransferLib"
                let expr_2625_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:38409:38415  "market"
                let _1285_offset := var_market_2044_offset
                let expr_2628_offset := _1285_offset
                /// @src 0:38409:38425  "market.loanToken"
                let _1286 := add(expr_2628_offset, 0)
                let expr_2629 := read_from_calldatat_address(_1286)
                /// @src 0:38427:38432  "payer"
                let _1287 := var_payer_2546
                let expr_2630 := _1287
                /// @src 0:38442:38446  "this"
                let expr_2633_address := address()
                /// @src 0:38434:38447  "address(this)"
                let expr_2634 := convert_t_contract$_Midnight_$3973_to_t_address(expr_2633_address)
                /// @src 0:38449:38460  "repaidUnits"
                let _1288 := var_repaidUnits_2050
                let expr_2635 := _1288
                fun_safeTransferFrom_5564(expr_2629, expr_2630, expr_2634, expr_2635)
                /// @src 0:38480:38492  "seizedAssets"
                let _1289 := var_seizedAssets_2048
                let expr_2638 := _1289
                /// @src 0:38479:38506  "(seizedAssets, repaidUnits)"
                let expr_2640_component_1 := expr_2638
                /// @src 0:38494:38505  "repaidUnits"
                let _1290 := var_repaidUnits_2050
                let expr_2639 := _1290
                /// @src 0:38479:38506  "(seizedAssets, repaidUnits)"
                let expr_2640_component_2 := expr_2639
                /// @src 0:38472:38506  "return (seizedAssets, repaidUnits)"
                var__2063 := expr_2640_component_1
                var__2065 := expr_2640_component_2
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function cleanup_t_rational_31104000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_31104000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_31104000_by_1(value)))
            }

            function convert_t_uint16_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint16(value)))
            }

            function cleanup_t_rational_86400_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_86400_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_86400_by_1(value)))
            }

            function cleanup_t_rational_604800_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_604800_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_604800_by_1(value)))
            }

            function cleanup_t_rational_2592000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_2592000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_2592000_by_1(value)))
            }

            function cleanup_t_rational_7776000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_7776000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_7776000_by_1(value)))
            }

            function cleanup_t_rational_15552000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_15552000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_15552000_by_1(value)))
            }

            function cleanup_t_uint24(value) -> cleaned {
                cleaned := and(value, 0xffffff)
            }

            function convert_t_rational_15552000_by_1_to_t_uint24(value) -> converted {
                converted := cleanup_t_uint24(identity(cleanup_t_rational_15552000_by_1(value)))
            }

            function convert_t_rational_31104000_by_1_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(identity(cleanup_t_rational_31104000_by_1(value)))
            }

            function convert_t_tuple$_t_rational_15552000_by_1_$_t_rational_31104000_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(value0, value1, value2, value3) -> converted0, converted1, converted2, converted3 {
                converted0 := convert_t_rational_15552000_by_1_to_t_uint24(value0)
                converted1 := convert_t_rational_31104000_by_1_to_t_uint32(value1)
                converted2 := convert_t_uint256_to_t_uint256(value2)
                converted3 := convert_t_uint256_to_t_uint256(value3)

            }

            function convert_t_rational_7776000_by_1_to_t_uint24(value) -> converted {
                converted := cleanup_t_uint24(identity(cleanup_t_rational_7776000_by_1(value)))
            }

            function convert_t_rational_15552000_by_1_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(identity(cleanup_t_rational_15552000_by_1(value)))
            }

            function convert_t_tuple$_t_rational_7776000_by_1_$_t_rational_15552000_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(value0, value1, value2, value3) -> converted0, converted1, converted2, converted3 {
                converted0 := convert_t_rational_7776000_by_1_to_t_uint24(value0)
                converted1 := convert_t_rational_15552000_by_1_to_t_uint32(value1)
                converted2 := convert_t_uint256_to_t_uint256(value2)
                converted3 := convert_t_uint256_to_t_uint256(value3)

            }

            function convert_t_rational_2592000_by_1_to_t_uint24(value) -> converted {
                converted := cleanup_t_uint24(identity(cleanup_t_rational_2592000_by_1(value)))
            }

            function convert_t_rational_7776000_by_1_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(identity(cleanup_t_rational_7776000_by_1(value)))
            }

            function convert_t_tuple$_t_rational_2592000_by_1_$_t_rational_7776000_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(value0, value1, value2, value3) -> converted0, converted1, converted2, converted3 {
                converted0 := convert_t_rational_2592000_by_1_to_t_uint24(value0)
                converted1 := convert_t_rational_7776000_by_1_to_t_uint32(value1)
                converted2 := convert_t_uint256_to_t_uint256(value2)
                converted3 := convert_t_uint256_to_t_uint256(value3)

            }

            function convert_t_rational_604800_by_1_to_t_uint24(value) -> converted {
                converted := cleanup_t_uint24(identity(cleanup_t_rational_604800_by_1(value)))
            }

            function convert_t_rational_2592000_by_1_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(identity(cleanup_t_rational_2592000_by_1(value)))
            }

            function convert_t_tuple$_t_rational_604800_by_1_$_t_rational_2592000_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(value0, value1, value2, value3) -> converted0, converted1, converted2, converted3 {
                converted0 := convert_t_rational_604800_by_1_to_t_uint24(value0)
                converted1 := convert_t_rational_2592000_by_1_to_t_uint32(value1)
                converted2 := convert_t_uint256_to_t_uint256(value2)
                converted3 := convert_t_uint256_to_t_uint256(value3)

            }

            function convert_t_rational_86400_by_1_to_t_uint24(value) -> converted {
                converted := cleanup_t_uint24(identity(cleanup_t_rational_86400_by_1(value)))
            }

            function convert_t_rational_604800_by_1_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(identity(cleanup_t_rational_604800_by_1(value)))
            }

            function convert_t_tuple$_t_rational_86400_by_1_$_t_rational_604800_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(value0, value1, value2, value3) -> converted0, converted1, converted2, converted3 {
                converted0 := convert_t_rational_86400_by_1_to_t_uint24(value0)
                converted1 := convert_t_rational_604800_by_1_to_t_uint32(value1)
                converted2 := convert_t_uint256_to_t_uint256(value2)
                converted3 := convert_t_uint256_to_t_uint256(value3)

            }

            function convert_t_rational_0_by_1_to_t_uint24(value) -> converted {
                converted := cleanup_t_uint24(identity(cleanup_t_rational_0_by_1(value)))
            }

            function convert_t_rational_86400_by_1_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(identity(cleanup_t_rational_86400_by_1(value)))
            }

            function convert_t_tuple$_t_rational_0_by_1_$_t_rational_86400_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(value0, value1, value2, value3) -> converted0, converted1, converted2, converted3 {
                converted0 := convert_t_rational_0_by_1_to_t_uint24(value0)
                converted1 := convert_t_rational_86400_by_1_to_t_uint32(value1)
                converted2 := convert_t_uint256_to_t_uint256(value2)
                converted3 := convert_t_uint256_to_t_uint256(value3)

            }

            function convert_t_uint24_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint24(value)))
            }

            /// @ast-id 3972
            /// @src 0:49975:51368  "function settlementFee(bytes32 id, uint256 timeToMaturity) public view returns (uint256) {..."
            function fun_settlementFee_3972(var_id_3824, var_timeToMaturity_3826) -> var__3829 {
                /// @src 0:50055:50062  "uint256"
                let zero_t_uint256_1291 := zero_value_for_split_t_uint256()
                var__3829 := zero_t_uint256_1291

                /// @src 0:50109:50120  "marketState"
                let _1292_slot := 0x01
                let expr_3834_slot := _1292_slot
                /// @src 0:50121:50123  "id"
                let _1293 := var_id_3824
                let expr_3835 := _1293
                /// @src 0:50109:50124  "marketState[id]"
                let _1294 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3834_slot,expr_3835)
                let _1295_slot := _1294
                let expr_3836_slot := _1295_slot
                /// @src 0:50074:50124  "MarketState storage _marketState = marketState[id]"
                let var__marketState_3833_slot := convert_t_struct$_MarketState_$4238_storage_to_t_struct$_MarketState_$4238_storage_ptr(expr_3836_slot)
                /// @src 0:50142:50154  "_marketState"
                let _1296_slot := var__marketState_3833_slot
                let expr_3839_slot := _1296_slot
                /// @src 0:50142:50166  "_marketState.tickSpacing"
                let _1297 := add(expr_3839_slot, 2)
                let _1298 := read_from_storage_split_offset_18_t_uint8(_1297)
                let expr_3840 := _1298
                /// @src 0:50169:50170  "0"
                let expr_3841 := 0x00
                /// @src 0:50142:50170  "_marketState.tickSpacing > 0"
                let expr_3842 := gt(cleanup_t_uint8(expr_3840), convert_t_rational_0_by_1_to_t_uint8(expr_3841))
                /// @src 0:50134:50191  "require(_marketState.tickSpacing > 0, MarketNotCreated())"
                require_helper_t_error_4310_MarketNotCreated(expr_3842)
                /// @src 0:50206:50220  "timeToMaturity"
                let _1299 := var_timeToMaturity_3826
                let expr_3847 := _1299
                /// @src 0:50224:50232  "360 days"
                let expr_3848 := 0x01da9c00
                /// @src 0:50206:50232  "timeToMaturity >= 360 days"
                let expr_3849 := iszero(lt(cleanup_t_uint256(expr_3847), convert_t_rational_31104000_by_1_to_t_uint256(expr_3848)))
                /// @src 0:50202:50277  "if (timeToMaturity >= 360 days) return _marketState.settlementFeeCbp6 * CBP"
                if expr_3849 {
                    /// @src 0:50241:50253  "_marketState"
                    let _1300_slot := var__marketState_3833_slot
                    let expr_3850_slot := _1300_slot
                    /// @src 0:50241:50271  "_marketState.settlementFeeCbp6"
                    let _1301 := add(expr_3850_slot, 2)
                    let _1302 := read_from_storage_split_offset_12_t_uint16(_1301)
                    let expr_3851 := _1302
                    /// @src 0:50274:50277  "CBP"
                    let expr_3852 := constant_CBP_4923()
                    /// @src 0:50241:50277  "_marketState.settlementFeeCbp6 * CBP"
                    let expr_3853 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3851), expr_3852)

                    /// @src 0:50234:50277  "return _marketState.settlementFeeCbp6 * CBP"
                    var__3829 := expr_3853
                    leave
                    /// @src 0:50202:50277  "if (timeToMaturity >= 360 days) return _marketState.settlementFeeCbp6 * CBP"
                }
                /// @src 0:50402:50416  "timeToMaturity"
                let _1303 := var_timeToMaturity_3826
                let expr_3864 := _1303
                /// @src 0:50419:50425  "1 days"
                let expr_3865 := 0x015180
                /// @src 0:50402:50425  "timeToMaturity < 1 days"
                let expr_3866 := lt(cleanup_t_uint256(expr_3864), convert_t_rational_86400_by_1_to_t_uint256(expr_3865))
                /// @src 0:50402:51221  "timeToMaturity < 1 days   ? (  0 days,   1 days, _marketState.settlementFeeCbp0 * CBP, _marketState.settlementFeeCbp1 * CBP) :..."
                let expr_3949_component_1, expr_3949_component_2, expr_3949_component_3, expr_3949_component_4
                switch expr_3866
                case 0 {
                    /// @src 0:50541:50555  "timeToMaturity"
                    let _1304 := var_timeToMaturity_3826
                    let expr_3878 := _1304
                    /// @src 0:50558:50564  "7 days"
                    let expr_3879 := 0x093a80
                    /// @src 0:50541:50564  "timeToMaturity < 7 days"
                    let expr_3880 := lt(cleanup_t_uint256(expr_3878), convert_t_rational_604800_by_1_to_t_uint256(expr_3879))
                    /// @src 0:50541:51221  "timeToMaturity < 7 days   ? (  1 days,   7 days, _marketState.settlementFeeCbp1 * CBP, _marketState.settlementFeeCbp2 * CBP) :..."
                    let expr_3948_component_1, expr_3948_component_2, expr_3948_component_3, expr_3948_component_4
                    switch expr_3880
                    case 0 {
                        /// @src 0:50680:50694  "timeToMaturity"
                        let _1305 := var_timeToMaturity_3826
                        let expr_3892 := _1305
                        /// @src 0:50697:50704  "30 days"
                        let expr_3893 := 0x278d00
                        /// @src 0:50680:50704  "timeToMaturity < 30 days"
                        let expr_3894 := lt(cleanup_t_uint256(expr_3892), convert_t_rational_2592000_by_1_to_t_uint256(expr_3893))
                        /// @src 0:50680:51221  "timeToMaturity < 30 days  ? (  7 days,  30 days, _marketState.settlementFeeCbp2 * CBP, _marketState.settlementFeeCbp3 * CBP) :..."
                        let expr_3947_component_1, expr_3947_component_2, expr_3947_component_3, expr_3947_component_4
                        switch expr_3894
                        case 0 {
                            /// @src 0:50819:50833  "timeToMaturity"
                            let _1306 := var_timeToMaturity_3826
                            let expr_3906 := _1306
                            /// @src 0:50836:50843  "90 days"
                            let expr_3907 := 0x76a700
                            /// @src 0:50819:50843  "timeToMaturity < 90 days"
                            let expr_3908 := lt(cleanup_t_uint256(expr_3906), convert_t_rational_7776000_by_1_to_t_uint256(expr_3907))
                            /// @src 0:50819:51221  "timeToMaturity < 90 days  ? ( 30 days,  90 days, _marketState.settlementFeeCbp3 * CBP, _marketState.settlementFeeCbp4 * CBP) :..."
                            let expr_3946_component_1, expr_3946_component_2, expr_3946_component_3, expr_3946_component_4
                            switch expr_3908
                            case 0 {
                                /// @src 0:50958:50972  "timeToMaturity"
                                let _1307 := var_timeToMaturity_3826
                                let expr_3920 := _1307
                                /// @src 0:50975:50983  "180 days"
                                let expr_3921 := 0xed4e00
                                /// @src 0:50958:50983  "timeToMaturity < 180 days"
                                let expr_3922 := lt(cleanup_t_uint256(expr_3920), convert_t_rational_15552000_by_1_to_t_uint256(expr_3921))
                                /// @src 0:50958:51221  "timeToMaturity < 180 days ? ( 90 days, 180 days, _marketState.settlementFeeCbp4 * CBP, _marketState.settlementFeeCbp5 * CBP) :..."
                                let expr_3945_component_1, expr_3945_component_2, expr_3945_component_3, expr_3945_component_4
                                switch expr_3922
                                case 0 {
                                    /// @src 0:51126:51134  "180 days"
                                    let expr_3934 := 0xed4e00
                                    /// @src 0:51125:51221  "(180 days, 360 days, _marketState.settlementFeeCbp5 * CBP, _marketState.settlementFeeCbp6 * CBP)"
                                    let expr_3944_component_1 := expr_3934
                                    /// @src 0:51136:51144  "360 days"
                                    let expr_3935 := 0x01da9c00
                                    /// @src 0:51125:51221  "(180 days, 360 days, _marketState.settlementFeeCbp5 * CBP, _marketState.settlementFeeCbp6 * CBP)"
                                    let expr_3944_component_2 := expr_3935
                                    /// @src 0:51146:51158  "_marketState"
                                    let _1308_slot := var__marketState_3833_slot
                                    let expr_3936_slot := _1308_slot
                                    /// @src 0:51146:51176  "_marketState.settlementFeeCbp5"
                                    let _1309 := add(expr_3936_slot, 2)
                                    let _1310 := read_from_storage_split_offset_10_t_uint16(_1309)
                                    let expr_3937 := _1310
                                    /// @src 0:51179:51182  "CBP"
                                    let expr_3938 := constant_CBP_4923()
                                    /// @src 0:51146:51182  "_marketState.settlementFeeCbp5 * CBP"
                                    let expr_3939 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3937), expr_3938)

                                    /// @src 0:51125:51221  "(180 days, 360 days, _marketState.settlementFeeCbp5 * CBP, _marketState.settlementFeeCbp6 * CBP)"
                                    let expr_3944_component_3 := expr_3939
                                    /// @src 0:51184:51196  "_marketState"
                                    let _1311_slot := var__marketState_3833_slot
                                    let expr_3940_slot := _1311_slot
                                    /// @src 0:51184:51214  "_marketState.settlementFeeCbp6"
                                    let _1312 := add(expr_3940_slot, 2)
                                    let _1313 := read_from_storage_split_offset_12_t_uint16(_1312)
                                    let expr_3941 := _1313
                                    /// @src 0:51217:51220  "CBP"
                                    let expr_3942 := constant_CBP_4923()
                                    /// @src 0:51184:51220  "_marketState.settlementFeeCbp6 * CBP"
                                    let expr_3943 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3941), expr_3942)

                                    /// @src 0:51125:51221  "(180 days, 360 days, _marketState.settlementFeeCbp5 * CBP, _marketState.settlementFeeCbp6 * CBP)"
                                    let expr_3944_component_4 := expr_3943
                                    /// @src 0:50958:51221  "timeToMaturity < 180 days ? ( 90 days, 180 days, _marketState.settlementFeeCbp4 * CBP, _marketState.settlementFeeCbp5 * CBP) :..."
                                    expr_3945_component_1, expr_3945_component_2, expr_3945_component_3, expr_3945_component_4 := convert_t_tuple$_t_rational_15552000_by_1_$_t_rational_31104000_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(expr_3944_component_1, expr_3944_component_2, expr_3944_component_3, expr_3944_component_4)
                                }
                                default {
                                    /// @src 0:50988:50995  "90 days"
                                    let expr_3923 := 0x76a700
                                    /// @src 0:50986:51082  "( 90 days, 180 days, _marketState.settlementFeeCbp4 * CBP, _marketState.settlementFeeCbp5 * CBP)"
                                    let expr_3933_component_1 := expr_3923
                                    /// @src 0:50997:51005  "180 days"
                                    let expr_3924 := 0xed4e00
                                    /// @src 0:50986:51082  "( 90 days, 180 days, _marketState.settlementFeeCbp4 * CBP, _marketState.settlementFeeCbp5 * CBP)"
                                    let expr_3933_component_2 := expr_3924
                                    /// @src 0:51007:51019  "_marketState"
                                    let _1314_slot := var__marketState_3833_slot
                                    let expr_3925_slot := _1314_slot
                                    /// @src 0:51007:51037  "_marketState.settlementFeeCbp4"
                                    let _1315 := add(expr_3925_slot, 2)
                                    let _1316 := read_from_storage_split_offset_8_t_uint16(_1315)
                                    let expr_3926 := _1316
                                    /// @src 0:51040:51043  "CBP"
                                    let expr_3927 := constant_CBP_4923()
                                    /// @src 0:51007:51043  "_marketState.settlementFeeCbp4 * CBP"
                                    let expr_3928 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3926), expr_3927)

                                    /// @src 0:50986:51082  "( 90 days, 180 days, _marketState.settlementFeeCbp4 * CBP, _marketState.settlementFeeCbp5 * CBP)"
                                    let expr_3933_component_3 := expr_3928
                                    /// @src 0:51045:51057  "_marketState"
                                    let _1317_slot := var__marketState_3833_slot
                                    let expr_3929_slot := _1317_slot
                                    /// @src 0:51045:51075  "_marketState.settlementFeeCbp5"
                                    let _1318 := add(expr_3929_slot, 2)
                                    let _1319 := read_from_storage_split_offset_10_t_uint16(_1318)
                                    let expr_3930 := _1319
                                    /// @src 0:51078:51081  "CBP"
                                    let expr_3931 := constant_CBP_4923()
                                    /// @src 0:51045:51081  "_marketState.settlementFeeCbp5 * CBP"
                                    let expr_3932 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3930), expr_3931)

                                    /// @src 0:50986:51082  "( 90 days, 180 days, _marketState.settlementFeeCbp4 * CBP, _marketState.settlementFeeCbp5 * CBP)"
                                    let expr_3933_component_4 := expr_3932
                                    /// @src 0:50958:51221  "timeToMaturity < 180 days ? ( 90 days, 180 days, _marketState.settlementFeeCbp4 * CBP, _marketState.settlementFeeCbp5 * CBP) :..."
                                    expr_3945_component_1, expr_3945_component_2, expr_3945_component_3, expr_3945_component_4 := convert_t_tuple$_t_rational_7776000_by_1_$_t_rational_15552000_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(expr_3933_component_1, expr_3933_component_2, expr_3933_component_3, expr_3933_component_4)
                                }
                                /// @src 0:50819:51221  "timeToMaturity < 90 days  ? ( 30 days,  90 days, _marketState.settlementFeeCbp3 * CBP, _marketState.settlementFeeCbp4 * CBP) :..."
                                expr_3946_component_1 := expr_3945_component_1
                                expr_3946_component_2 := expr_3945_component_2
                                expr_3946_component_3 := expr_3945_component_3
                                expr_3946_component_4 := expr_3945_component_4
                            }
                            default {
                                /// @src 0:50849:50856  "30 days"
                                let expr_3909 := 0x278d00
                                /// @src 0:50847:50943  "( 30 days,  90 days, _marketState.settlementFeeCbp3 * CBP, _marketState.settlementFeeCbp4 * CBP)"
                                let expr_3919_component_1 := expr_3909
                                /// @src 0:50859:50866  "90 days"
                                let expr_3910 := 0x76a700
                                /// @src 0:50847:50943  "( 30 days,  90 days, _marketState.settlementFeeCbp3 * CBP, _marketState.settlementFeeCbp4 * CBP)"
                                let expr_3919_component_2 := expr_3910
                                /// @src 0:50868:50880  "_marketState"
                                let _1320_slot := var__marketState_3833_slot
                                let expr_3911_slot := _1320_slot
                                /// @src 0:50868:50898  "_marketState.settlementFeeCbp3"
                                let _1321 := add(expr_3911_slot, 2)
                                let _1322 := read_from_storage_split_offset_6_t_uint16(_1321)
                                let expr_3912 := _1322
                                /// @src 0:50901:50904  "CBP"
                                let expr_3913 := constant_CBP_4923()
                                /// @src 0:50868:50904  "_marketState.settlementFeeCbp3 * CBP"
                                let expr_3914 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3912), expr_3913)

                                /// @src 0:50847:50943  "( 30 days,  90 days, _marketState.settlementFeeCbp3 * CBP, _marketState.settlementFeeCbp4 * CBP)"
                                let expr_3919_component_3 := expr_3914
                                /// @src 0:50906:50918  "_marketState"
                                let _1323_slot := var__marketState_3833_slot
                                let expr_3915_slot := _1323_slot
                                /// @src 0:50906:50936  "_marketState.settlementFeeCbp4"
                                let _1324 := add(expr_3915_slot, 2)
                                let _1325 := read_from_storage_split_offset_8_t_uint16(_1324)
                                let expr_3916 := _1325
                                /// @src 0:50939:50942  "CBP"
                                let expr_3917 := constant_CBP_4923()
                                /// @src 0:50906:50942  "_marketState.settlementFeeCbp4 * CBP"
                                let expr_3918 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3916), expr_3917)

                                /// @src 0:50847:50943  "( 30 days,  90 days, _marketState.settlementFeeCbp3 * CBP, _marketState.settlementFeeCbp4 * CBP)"
                                let expr_3919_component_4 := expr_3918
                                /// @src 0:50819:51221  "timeToMaturity < 90 days  ? ( 30 days,  90 days, _marketState.settlementFeeCbp3 * CBP, _marketState.settlementFeeCbp4 * CBP) :..."
                                expr_3946_component_1, expr_3946_component_2, expr_3946_component_3, expr_3946_component_4 := convert_t_tuple$_t_rational_2592000_by_1_$_t_rational_7776000_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(expr_3919_component_1, expr_3919_component_2, expr_3919_component_3, expr_3919_component_4)
                            }
                            /// @src 0:50680:51221  "timeToMaturity < 30 days  ? (  7 days,  30 days, _marketState.settlementFeeCbp2 * CBP, _marketState.settlementFeeCbp3 * CBP) :..."
                            expr_3947_component_1 := expr_3946_component_1
                            expr_3947_component_2 := expr_3946_component_2
                            expr_3947_component_3 := expr_3946_component_3
                            expr_3947_component_4 := expr_3946_component_4
                        }
                        default {
                            /// @src 0:50711:50717  "7 days"
                            let expr_3895 := 0x093a80
                            /// @src 0:50708:50804  "(  7 days,  30 days, _marketState.settlementFeeCbp2 * CBP, _marketState.settlementFeeCbp3 * CBP)"
                            let expr_3905_component_1 := expr_3895
                            /// @src 0:50720:50727  "30 days"
                            let expr_3896 := 0x278d00
                            /// @src 0:50708:50804  "(  7 days,  30 days, _marketState.settlementFeeCbp2 * CBP, _marketState.settlementFeeCbp3 * CBP)"
                            let expr_3905_component_2 := expr_3896
                            /// @src 0:50729:50741  "_marketState"
                            let _1326_slot := var__marketState_3833_slot
                            let expr_3897_slot := _1326_slot
                            /// @src 0:50729:50759  "_marketState.settlementFeeCbp2"
                            let _1327 := add(expr_3897_slot, 2)
                            let _1328 := read_from_storage_split_offset_4_t_uint16(_1327)
                            let expr_3898 := _1328
                            /// @src 0:50762:50765  "CBP"
                            let expr_3899 := constant_CBP_4923()
                            /// @src 0:50729:50765  "_marketState.settlementFeeCbp2 * CBP"
                            let expr_3900 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3898), expr_3899)

                            /// @src 0:50708:50804  "(  7 days,  30 days, _marketState.settlementFeeCbp2 * CBP, _marketState.settlementFeeCbp3 * CBP)"
                            let expr_3905_component_3 := expr_3900
                            /// @src 0:50767:50779  "_marketState"
                            let _1329_slot := var__marketState_3833_slot
                            let expr_3901_slot := _1329_slot
                            /// @src 0:50767:50797  "_marketState.settlementFeeCbp3"
                            let _1330 := add(expr_3901_slot, 2)
                            let _1331 := read_from_storage_split_offset_6_t_uint16(_1330)
                            let expr_3902 := _1331
                            /// @src 0:50800:50803  "CBP"
                            let expr_3903 := constant_CBP_4923()
                            /// @src 0:50767:50803  "_marketState.settlementFeeCbp3 * CBP"
                            let expr_3904 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3902), expr_3903)

                            /// @src 0:50708:50804  "(  7 days,  30 days, _marketState.settlementFeeCbp2 * CBP, _marketState.settlementFeeCbp3 * CBP)"
                            let expr_3905_component_4 := expr_3904
                            /// @src 0:50680:51221  "timeToMaturity < 30 days  ? (  7 days,  30 days, _marketState.settlementFeeCbp2 * CBP, _marketState.settlementFeeCbp3 * CBP) :..."
                            expr_3947_component_1, expr_3947_component_2, expr_3947_component_3, expr_3947_component_4 := convert_t_tuple$_t_rational_604800_by_1_$_t_rational_2592000_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(expr_3905_component_1, expr_3905_component_2, expr_3905_component_3, expr_3905_component_4)
                        }
                        /// @src 0:50541:51221  "timeToMaturity < 7 days   ? (  1 days,   7 days, _marketState.settlementFeeCbp1 * CBP, _marketState.settlementFeeCbp2 * CBP) :..."
                        expr_3948_component_1 := expr_3947_component_1
                        expr_3948_component_2 := expr_3947_component_2
                        expr_3948_component_3 := expr_3947_component_3
                        expr_3948_component_4 := expr_3947_component_4
                    }
                    default {
                        /// @src 0:50572:50578  "1 days"
                        let expr_3881 := 0x015180
                        /// @src 0:50569:50665  "(  1 days,   7 days, _marketState.settlementFeeCbp1 * CBP, _marketState.settlementFeeCbp2 * CBP)"
                        let expr_3891_component_1 := expr_3881
                        /// @src 0:50582:50588  "7 days"
                        let expr_3882 := 0x093a80
                        /// @src 0:50569:50665  "(  1 days,   7 days, _marketState.settlementFeeCbp1 * CBP, _marketState.settlementFeeCbp2 * CBP)"
                        let expr_3891_component_2 := expr_3882
                        /// @src 0:50590:50602  "_marketState"
                        let _1332_slot := var__marketState_3833_slot
                        let expr_3883_slot := _1332_slot
                        /// @src 0:50590:50620  "_marketState.settlementFeeCbp1"
                        let _1333 := add(expr_3883_slot, 2)
                        let _1334 := read_from_storage_split_offset_2_t_uint16(_1333)
                        let expr_3884 := _1334
                        /// @src 0:50623:50626  "CBP"
                        let expr_3885 := constant_CBP_4923()
                        /// @src 0:50590:50626  "_marketState.settlementFeeCbp1 * CBP"
                        let expr_3886 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3884), expr_3885)

                        /// @src 0:50569:50665  "(  1 days,   7 days, _marketState.settlementFeeCbp1 * CBP, _marketState.settlementFeeCbp2 * CBP)"
                        let expr_3891_component_3 := expr_3886
                        /// @src 0:50628:50640  "_marketState"
                        let _1335_slot := var__marketState_3833_slot
                        let expr_3887_slot := _1335_slot
                        /// @src 0:50628:50658  "_marketState.settlementFeeCbp2"
                        let _1336 := add(expr_3887_slot, 2)
                        let _1337 := read_from_storage_split_offset_4_t_uint16(_1336)
                        let expr_3888 := _1337
                        /// @src 0:50661:50664  "CBP"
                        let expr_3889 := constant_CBP_4923()
                        /// @src 0:50628:50664  "_marketState.settlementFeeCbp2 * CBP"
                        let expr_3890 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3888), expr_3889)

                        /// @src 0:50569:50665  "(  1 days,   7 days, _marketState.settlementFeeCbp1 * CBP, _marketState.settlementFeeCbp2 * CBP)"
                        let expr_3891_component_4 := expr_3890
                        /// @src 0:50541:51221  "timeToMaturity < 7 days   ? (  1 days,   7 days, _marketState.settlementFeeCbp1 * CBP, _marketState.settlementFeeCbp2 * CBP) :..."
                        expr_3948_component_1, expr_3948_component_2, expr_3948_component_3, expr_3948_component_4 := convert_t_tuple$_t_rational_86400_by_1_$_t_rational_604800_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(expr_3891_component_1, expr_3891_component_2, expr_3891_component_3, expr_3891_component_4)
                    }
                    /// @src 0:50402:51221  "timeToMaturity < 1 days   ? (  0 days,   1 days, _marketState.settlementFeeCbp0 * CBP, _marketState.settlementFeeCbp1 * CBP) :..."
                    expr_3949_component_1 := expr_3948_component_1
                    expr_3949_component_2 := expr_3948_component_2
                    expr_3949_component_3 := expr_3948_component_3
                    expr_3949_component_4 := expr_3948_component_4
                }
                default {
                    /// @src 0:50433:50439  "0 days"
                    let expr_3867 := 0x00
                    /// @src 0:50430:50526  "(  0 days,   1 days, _marketState.settlementFeeCbp0 * CBP, _marketState.settlementFeeCbp1 * CBP)"
                    let expr_3877_component_1 := expr_3867
                    /// @src 0:50443:50449  "1 days"
                    let expr_3868 := 0x015180
                    /// @src 0:50430:50526  "(  0 days,   1 days, _marketState.settlementFeeCbp0 * CBP, _marketState.settlementFeeCbp1 * CBP)"
                    let expr_3877_component_2 := expr_3868
                    /// @src 0:50451:50463  "_marketState"
                    let _1338_slot := var__marketState_3833_slot
                    let expr_3869_slot := _1338_slot
                    /// @src 0:50451:50481  "_marketState.settlementFeeCbp0"
                    let _1339 := add(expr_3869_slot, 2)
                    let _1340 := read_from_storage_split_offset_0_t_uint16(_1339)
                    let expr_3870 := _1340
                    /// @src 0:50484:50487  "CBP"
                    let expr_3871 := constant_CBP_4923()
                    /// @src 0:50451:50487  "_marketState.settlementFeeCbp0 * CBP"
                    let expr_3872 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3870), expr_3871)

                    /// @src 0:50430:50526  "(  0 days,   1 days, _marketState.settlementFeeCbp0 * CBP, _marketState.settlementFeeCbp1 * CBP)"
                    let expr_3877_component_3 := expr_3872
                    /// @src 0:50489:50501  "_marketState"
                    let _1341_slot := var__marketState_3833_slot
                    let expr_3873_slot := _1341_slot
                    /// @src 0:50489:50519  "_marketState.settlementFeeCbp1"
                    let _1342 := add(expr_3873_slot, 2)
                    let _1343 := read_from_storage_split_offset_2_t_uint16(_1342)
                    let expr_3874 := _1343
                    /// @src 0:50522:50525  "CBP"
                    let expr_3875 := constant_CBP_4923()
                    /// @src 0:50489:50525  "_marketState.settlementFeeCbp1 * CBP"
                    let expr_3876 := checked_mul_t_uint256(convert_t_uint16_to_t_uint256(expr_3874), expr_3875)

                    /// @src 0:50430:50526  "(  0 days,   1 days, _marketState.settlementFeeCbp0 * CBP, _marketState.settlementFeeCbp1 * CBP)"
                    let expr_3877_component_4 := expr_3876
                    /// @src 0:50402:51221  "timeToMaturity < 1 days   ? (  0 days,   1 days, _marketState.settlementFeeCbp0 * CBP, _marketState.settlementFeeCbp1 * CBP) :..."
                    expr_3949_component_1, expr_3949_component_2, expr_3949_component_3, expr_3949_component_4 := convert_t_tuple$_t_rational_0_by_1_$_t_rational_86400_by_1_$_t_uint256_$_t_uint256_$_to_t_tuple$_t_uint24_$_t_uint32_$_t_uint256_$_t_uint256_$(expr_3877_component_1, expr_3877_component_2, expr_3877_component_3, expr_3877_component_4)
                }
                /// @src 0:50323:51221  "(uint256 start, uint256 end, uint256 feeLower, uint256 feeUpper) =..."
                let var_start_3857 := convert_t_uint24_to_t_uint256(expr_3949_component_1)
                let var_end_3859 := convert_t_uint32_to_t_uint256(expr_3949_component_2)
                let var_feeLower_3861 := expr_3949_component_3
                let var_feeUpper_3863 := expr_3949_component_4
                /// @src 0:51273:51281  "feeLower"
                let _1344 := var_feeLower_3861
                let expr_3951 := _1344
                /// @src 0:51285:51288  "end"
                let _1345 := var_end_3859
                let expr_3952 := _1345
                /// @src 0:51291:51305  "timeToMaturity"
                let _1346 := var_timeToMaturity_3826
                let expr_3953 := _1346
                /// @src 0:51285:51305  "end - timeToMaturity"
                let expr_3954 := checked_sub_t_uint256(expr_3952, expr_3953)

                /// @src 0:51284:51306  "(end - timeToMaturity)"
                let expr_3955 := expr_3954
                /// @src 0:51273:51306  "feeLower * (end - timeToMaturity)"
                let expr_3956 := checked_mul_t_uint256(expr_3951, expr_3955)

                /// @src 0:51309:51317  "feeUpper"
                let _1347 := var_feeUpper_3863
                let expr_3957 := _1347
                /// @src 0:51321:51335  "timeToMaturity"
                let _1348 := var_timeToMaturity_3826
                let expr_3958 := _1348
                /// @src 0:51338:51343  "start"
                let _1349 := var_start_3857
                let expr_3959 := _1349
                /// @src 0:51321:51343  "timeToMaturity - start"
                let expr_3960 := checked_sub_t_uint256(expr_3958, expr_3959)

                /// @src 0:51320:51344  "(timeToMaturity - start)"
                let expr_3961 := expr_3960
                /// @src 0:51309:51344  "feeUpper * (timeToMaturity - start)"
                let expr_3962 := checked_mul_t_uint256(expr_3957, expr_3961)

                /// @src 0:51273:51344  "feeLower * (end - timeToMaturity) + feeUpper * (timeToMaturity - start)"
                let expr_3963 := checked_add_t_uint256(expr_3956, expr_3962)

                /// @src 0:51272:51345  "(feeLower * (end - timeToMaturity) + feeUpper * (timeToMaturity - start))"
                let expr_3964 := expr_3963
                /// @src 0:51349:51352  "end"
                let _1350 := var_end_3859
                let expr_3965 := _1350
                /// @src 0:51355:51360  "start"
                let _1351 := var_start_3857
                let expr_3966 := _1351
                /// @src 0:51349:51360  "end - start"
                let expr_3967 := checked_sub_t_uint256(expr_3965, expr_3966)

                /// @src 0:51348:51361  "(end - start)"
                let expr_3968 := expr_3967
                /// @src 0:51272:51361  "(feeLower * (end - timeToMaturity) + feeUpper * (timeToMaturity - start)) / (end - start)"
                let expr_3969 := checked_div_t_uint256(expr_3964, expr_3968)

                /// @src 0:51265:51361  "return (feeLower * (end - timeToMaturity) + feeUpper * (timeToMaturity - start)) / (end - start)"
                var__3829 := expr_3969
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function array_length_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(value, len) -> length {

                length := len

            }

            function access_calldata_tail_t_bytes_calldata_ptr(base_ref, ptr_to_tail) -> addr, length {
                let rel_offset_of_tail := calldataload(ptr_to_tail)
                if iszero(slt(rel_offset_of_tail, sub(sub(calldatasize(), base_ref), sub(0x20, 1)))) { revert_error_356d538aaf70fba12156cc466564b792649f8f3befb07b071c91142253e175ad() }
                addr := add(base_ref, rel_offset_of_tail)

                length := calldataload(addr)
                if gt(length, 0xffffffffffffffff) { revert_error_1e55d03107e9c4f1b5e21c76a16fba166a461117ab153bcce65e6a4ea8e5fc8a() }
                addr := add(addr, 32)
                if sgt(addr, sub(calldatasize(), mul(length, 0x01))) { revert_error_977805620ff29572292dee35f70b0f3f3f73d3fdd0e9f4d7a901c2e43ab18a2e() }

            }

            function calldata_array_index_access_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(base_ref, length, index) -> addr, len {
                if iszero(lt(index, length)) { panic_error_0x32() }
                addr := add(base_ref, mul(index, 32))

                addr, len := access_calldata_tail_t_bytes_calldata_ptr(base_ref, addr)

            }

            function array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            // bytes -> bytes
            function abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(start, length, pos) -> end {
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length)

                copy_calldata_to_memory_with_cleanup(start, pos, length)
                end := add(pos, length)
            }

            function abi_encode_tuple_packed_t_bytes_calldata_ptr__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(pos , value0, value1) -> end {

                pos := abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(value0, value1,  pos)

                end := pos
            }

            function allocate_memory_array_t_bytes_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_bytes_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

                mstore(memPtr, length)

            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

            function extract_returndata() -> data {

                switch returndatasize()
                case 0 {
                    data := zero_value_for_split_t_bytes_memory_ptr()
                }
                default {
                    data := allocate_memory_array_t_bytes_memory_ptr(returndatasize())
                    returndatacopy(add(data, 0x20), 0, returndatasize())
                }

            }

            /// @ast-id 149
            /// @src 0:13888:14274  "function multicall(bytes[] calldata calls) external {..."
            function fun_multicall_149(var_calls_113_offset, var_calls_113_length) {

                /// @src 0:13950:14268  "for (uint256 i = 0; i < calls.length; i++) {..."
                for {
                    /// @src 0:13967:13968  "0"
                    let expr_118 := 0x00
                    /// @src 0:13955:13968  "uint256 i = 0"
                    let var_i_117 := convert_t_rational_0_by_1_to_t_uint256(expr_118)
                    } 1 {
                    /// @src 0:13988:13991  "i++"
                    let _1353 := var_i_117
                    let _1352 := increment_wrapping_t_uint256(_1353)
                    var_i_117 := _1352
                    let expr_125 := _1353
                }
                {
                    /// @src 0:13970:13971  "i"
                    let _1354 := var_i_117
                    let expr_120 := _1354
                    /// @src 0:13974:13979  "calls"
                    let _1355_offset := var_calls_113_offset
                    let _1355_length := var_calls_113_length
                    let expr_121_offset := _1355_offset
                    let expr_121_length := _1355_length
                    /// @src 0:13974:13986  "calls.length"
                    let expr_122 := array_length_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(expr_121_offset, expr_121_length)
                    /// @src 0:13970:13986  "i < calls.length"
                    let expr_123 := lt(cleanup_t_uint256(expr_120), cleanup_t_uint256(expr_122))
                    if iszero(expr_123) { break }
                    /// @src 0:14057:14061  "this"
                    let expr_133_address := address()
                    /// @src 0:14049:14062  "address(this)"
                    let expr_134 := convert_t_contract$_Midnight_$3973_to_t_address(expr_133_address)
                    /// @src 0:14049:14075  "address(this).delegatecall"
                    let expr_135_address := expr_134
                    /// @src 0:14076:14081  "calls"
                    let _1356_offset := var_calls_113_offset
                    let _1356_length := var_calls_113_length
                    let expr_136_offset := _1356_offset
                    let expr_136_length := _1356_length
                    /// @src 0:14082:14083  "i"
                    let _1357 := var_i_117
                    let expr_137 := _1357
                    /// @src 0:14076:14084  "calls[i]"
                    let expr_138_offset, expr_138_length := calldata_array_index_access_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(expr_136_offset, expr_136_length, expr_137)
                    /// @src 0:14049:14085  "address(this).delegatecall(calls[i])"

                    let _1358 := allocate_unbounded()
                    let _1359 := sub(abi_encode_tuple_packed_t_bytes_calldata_ptr__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_1358 , expr_138_offset, expr_138_length), _1358)

                    let expr_139_component_1 := delegatecall(gas(), expr_135_address,  _1358, _1359, 0, 0)

                    let expr_139_component_2_mpos := extract_returndata()
                    /// @src 0:14007:14085  "(bool success, bytes memory returnData) = address(this).delegatecall(calls[i])"
                    let var_success_128 := expr_139_component_1
                    let var_returnData_130_mpos := expr_139_component_2_mpos
                    /// @src 0:14104:14111  "success"
                    let _1360 := var_success_128
                    let expr_141 := _1360
                    /// @src 0:14103:14111  "!success"
                    let expr_142 := cleanup_t_bool(iszero(expr_141))
                    /// @src 0:14099:14258  "if (!success) {..."
                    if expr_142 {
                        /// @src 0:14131:14244  "assembly (\"memory-safe\") {..."
                        {
                            revert(add(var_returnData_130_mpos, 0x20), mload(var_returnData_130_mpos))
                        }
                        /// @src 0:14099:14258  "if (!success) {..."
                    }
                }

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function require_helper_t_error_4320_OnlyRoleSetter(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x11df3fbd00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0_t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            /// @ast-id 200
            /// @src 0:14527:14733  "function setFeeSetter(address newFeeSetter) external {..."
            function fun_setFeeSetter_200(var_newFeeSetter_177) {

                /// @src 0:14598:14608  "msg.sender"
                let expr_182 := caller()
                /// @src 0:14612:14622  "roleSetter"
                let _1361 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_183 := _1361
                /// @src 0:14598:14622  "msg.sender == roleSetter"
                let expr_184 := eq(cleanup_t_address(expr_182), cleanup_t_address(expr_183))
                /// @src 0:14590:14641  "require(msg.sender == roleSetter, OnlyRoleSetter())"
                require_helper_t_error_4320_OnlyRoleSetter(expr_184)
                /// @src 0:14663:14675  "newFeeSetter"
                let _1362 := var_newFeeSetter_177
                let expr_190 := _1362
                /// @src 0:14651:14675  "feeSetter = newFeeSetter"
                update_storage_value_offset_0_t_address_to_t_address(0x08, expr_190)
                let expr_191 := expr_190
                /// @src 0:14690:14699  "EventsLib"
                let expr_193_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:14713:14725  "newFeeSetter"
                let _1363 := var_newFeeSetter_177
                let expr_196 := _1363
                /// @src 0:14690:14726  "EventsLib.SetFeeSetter(newFeeSetter)"
                let _1364 := 0x9993507f53024702e2de1be66f6c48c8957ac708927b86b3bdf4e335f5869470
                let _1365 := convert_t_address_to_t_address(expr_196)
                {
                    let _1366 := allocate_unbounded()
                    let _1367 := abi_encode_tuple__to__fromStack(_1366 )
                    log2(_1366, sub(_1367, _1366) , _1364, _1365)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3437
            /// @src 0:45846:45989  "function collateralBitmap(bytes32 id, address user) external view returns (uint128) {..."
            function fun_collateralBitmap_3437(var_id_3422, var_user_3424) -> var__3427 {
                /// @src 0:45921:45928  "uint128"
                let zero_t_uint128_1368 := zero_value_for_split_t_uint128()
                var__3427 := zero_t_uint128_1368

                /// @src 0:45947:45955  "position"
                let _1369_slot := 0x00
                let expr_3429_slot := _1369_slot
                /// @src 0:45956:45958  "id"
                let _1370 := var_id_3422
                let expr_3430 := _1370
                /// @src 0:45947:45959  "position[id]"
                let _1371 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3429_slot,expr_3430)
                let _1372_slot := _1371
                let expr_3431_slot := _1372_slot
                /// @src 0:45960:45964  "user"
                let _1373 := var_user_3424
                let expr_3432 := _1373
                /// @src 0:45947:45965  "position[id][user]"
                let _1374 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3431_slot,expr_3432)
                let _1375_slot := _1374
                let expr_3433_slot := _1375_slot
                /// @src 0:45947:45982  "position[id][user].collateralBitmap"
                let _1376 := add(expr_3433_slot, 2)
                let _1377 := read_from_storage_split_offset_16_t_uint128(_1376)
                let expr_3434 := _1377
                /// @src 0:45940:45982  "return position[id][user].collateralBitmap"
                var__3427 := expr_3434
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3536
            /// @src 0:46707:46832  "function creditOf(bytes32 id, address user) external view returns (uint128) {..."
            function fun_creditOf_3536(var_id_3521, var_user_3523) -> var__3526 {
                /// @src 0:46774:46781  "uint128"
                let zero_t_uint128_1378 := zero_value_for_split_t_uint128()
                var__3526 := zero_t_uint128_1378

                /// @src 0:46800:46808  "position"
                let _1379_slot := 0x00
                let expr_3528_slot := _1379_slot
                /// @src 0:46809:46811  "id"
                let _1380 := var_id_3521
                let expr_3529 := _1380
                /// @src 0:46800:46812  "position[id]"
                let _1381 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3528_slot,expr_3529)
                let _1382_slot := _1381
                let expr_3530_slot := _1382_slot
                /// @src 0:46813:46817  "user"
                let _1383 := var_user_3523
                let expr_3531 := _1383
                /// @src 0:46800:46818  "position[id][user]"
                let _1384 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3530_slot,expr_3531)
                let _1385_slot := _1384
                let expr_3532_slot := _1385_slot
                /// @src 0:46800:46825  "position[id][user].credit"
                let _1386 := add(expr_3532_slot, 0)
                let _1387 := read_from_storage_split_offset_0_t_uint128(_1386)
                let expr_3533 := _1387
                /// @src 0:46793:46825  "return position[id][user].credit"
                var__3526 := expr_3533
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function abi_encode_tuple_t_address_t_uint256_t_uint128__to_t_address_t_uint256_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint128_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            /// @ast-id 1664
            /// @src 0:27608:28620  "function withdraw(Market memory market, uint256 units, address onBehalf, address receiver) external {..."
            function fun_withdraw_1664(var_market_1534_mpos, var_units_1536, var_onBehalf_1538, var_receiver_1540) {

                /// @src 0:27726:27734  "onBehalf"
                let _1388 := var_onBehalf_1538
                let expr_1544 := _1388
                /// @src 0:27738:27748  "msg.sender"
                let expr_1546 := caller()
                /// @src 0:27726:27748  "onBehalf == msg.sender"
                let expr_1547 := eq(cleanup_t_address(expr_1544), cleanup_t_address(expr_1546))
                /// @src 0:27726:27786  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                let expr_1554 := expr_1547
                if iszero(expr_1554) {
                    /// @src 0:27752:27764  "isAuthorized"
                    let _1389_slot := 0x03
                    let expr_1548_slot := _1389_slot
                    /// @src 0:27765:27773  "onBehalf"
                    let _1390 := var_onBehalf_1538
                    let expr_1549 := _1390
                    /// @src 0:27752:27774  "isAuthorized[onBehalf]"
                    let _1391 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(expr_1548_slot,expr_1549)
                    let _1392_slot := _1391
                    let expr_1550_slot := _1392_slot
                    /// @src 0:27775:27785  "msg.sender"
                    let expr_1552 := caller()
                    /// @src 0:27752:27786  "isAuthorized[onBehalf][msg.sender]"
                    let _1393 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_1550_slot,expr_1552)
                    let _1394 := read_from_storage_split_offset_0_t_bool(_1393)
                    let expr_1553 := _1394
                    /// @src 0:27726:27786  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                    expr_1554 := expr_1553
                }
                /// @src 0:27718:27803  "require(onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender], Unauthorized())"
                require_helper_t_error_4346_Unauthorized(expr_1554)
                /// @src 0:27838:27844  "market"
                let _1395_mpos := var_market_1534_mpos
                let expr_1562_mpos := _1395_mpos
                /// @src 0:27826:27845  "touchMarket(market)"
                let expr_1563 := fun_touchMarket_3092(expr_1562_mpos)
                /// @src 0:27813:27845  "bytes32 id = touchMarket(market)"
                let var_id_1560 := expr_1563
                /// @src 0:27890:27901  "marketState"
                let _1396_slot := 0x01
                let expr_1568_slot := _1396_slot
                /// @src 0:27902:27904  "id"
                let _1397 := var_id_1560
                let expr_1569 := _1397
                /// @src 0:27890:27905  "marketState[id]"
                let _1398 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_1568_slot,expr_1569)
                let _1399_slot := _1398
                let expr_1570_slot := _1399_slot
                /// @src 0:27855:27905  "MarketState storage _marketState = marketState[id]"
                let var__marketState_1567_slot := convert_t_struct$_MarketState_$4238_storage_to_t_struct$_MarketState_$4238_storage_ptr(expr_1570_slot)
                /// @src 0:27931:27937  "market"
                let _1400_mpos := var_market_1534_mpos
                let expr_1573_mpos := _1400_mpos
                /// @src 0:27939:27941  "id"
                let _1401 := var_id_1560
                let expr_1574 := _1401
                /// @src 0:27943:27951  "onBehalf"
                let _1402 := var_onBehalf_1538
                let expr_1575 := _1402
                /// @src 0:27915:27952  "_updatePosition(market, id, onBehalf)"
                let expr_1576_component_1, expr_1576_component_2, expr_1576_component_3 := fun__updatePosition_3383(expr_1573_mpos, expr_1574, expr_1575)
                /// @src 0:27992:28000  "position"
                let _1403_slot := 0x00
                let expr_1581_slot := _1403_slot
                /// @src 0:28001:28003  "id"
                let _1404 := var_id_1560
                let expr_1582 := _1404
                /// @src 0:27992:28004  "position[id]"
                let _1405 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_1581_slot,expr_1582)
                let _1406_slot := _1405
                let expr_1583_slot := _1406_slot
                /// @src 0:28005:28013  "onBehalf"
                let _1407 := var_onBehalf_1538
                let expr_1584 := _1407
                /// @src 0:27992:28014  "position[id][onBehalf]"
                let _1408 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_1583_slot,expr_1584)
                let _1409_slot := _1408
                let expr_1585_slot := _1409_slot
                /// @src 0:27963:28014  "Position storage _position = position[id][onBehalf]"
                let var__position_1580_slot := convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(expr_1585_slot)
                /// @src 0:28024:28050  "uint128 pendingFeeDecrease"
                let var_pendingFeeDecrease_1588
                let zero_t_uint128_1410 := zero_value_for_split_t_uint128()
                var_pendingFeeDecrease_1588 := zero_t_uint128_1410
                /// @src 0:28064:28073  "_position"
                let _1411_slot := var__position_1580_slot
                let expr_1590_slot := _1411_slot
                /// @src 0:28064:28080  "_position.credit"
                let _1412 := add(expr_1590_slot, 0)
                let _1413 := read_from_storage_split_offset_0_t_uint128(_1412)
                let expr_1591 := _1413
                /// @src 0:28083:28084  "0"
                let expr_1592 := 0x00
                /// @src 0:28064:28084  "_position.credit > 0"
                let expr_1593 := gt(cleanup_t_uint128(expr_1591), convert_t_rational_0_by_1_to_t_uint128(expr_1592))
                /// @src 0:28060:28262  "if (_position.credit > 0) {..."
                if expr_1593 {
                    /// @src 0:28121:28129  "UtilsLib"
                    let expr_1595_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:28140:28149  "_position"
                    let _1414_slot := var__position_1580_slot
                    let expr_1597_slot := _1414_slot
                    /// @src 0:28140:28160  "_position.pendingFee"
                    let _1415 := add(expr_1597_slot, 0)
                    let _1416 := read_from_storage_split_offset_16_t_uint128(_1415)
                    let expr_1598 := _1416
                    /// @src 0:28140:28169  "_position.pendingFee.mulDivUp"
                    let expr_1599_self := convert_t_uint128_to_t_uint256(expr_1598)
                    /// @src 0:28170:28175  "units"
                    let _1417 := var_units_1536
                    let expr_1600 := _1417
                    /// @src 0:28177:28186  "_position"
                    let _1418_slot := var__position_1580_slot
                    let expr_1601_slot := _1418_slot
                    /// @src 0:28177:28193  "_position.credit"
                    let _1419 := add(expr_1601_slot, 0)
                    let _1420 := read_from_storage_split_offset_0_t_uint128(_1419)
                    let expr_1602 := _1420
                    /// @src 0:28140:28194  "_position.pendingFee.mulDivUp(units, _position.credit)"
                    let _1421 := convert_t_uint128_to_t_uint256(expr_1602)
                    let expr_1603 := fun_mulDivUp_5897(expr_1599_self, expr_1600, _1421)
                    /// @src 0:28121:28195  "UtilsLib.toUint128(_position.pendingFee.mulDivUp(units, _position.credit))"
                    let expr_1604 := fun_toUint128_5922(expr_1603)
                    /// @src 0:28100:28195  "pendingFeeDecrease = UtilsLib.toUint128(_position.pendingFee.mulDivUp(units, _position.credit))"
                    var_pendingFeeDecrease_1588 := expr_1604
                    let expr_1605 := expr_1604
                    /// @src 0:28233:28251  "pendingFeeDecrease"
                    let _1422 := var_pendingFeeDecrease_1588
                    let expr_1610 := _1422
                    /// @src 0:28209:28218  "_position"
                    let _1423_slot := var__position_1580_slot
                    let expr_1607_slot := _1423_slot
                    /// @src 0:28209:28229  "_position.pendingFee"
                    let _1424 := add(expr_1607_slot, 0)
                    /// @src 0:28209:28251  "_position.pendingFee -= pendingFeeDecrease"
                    let _1425 := read_from_storage_split_offset_16_t_uint128(_1424)
                    let expr_1611 := checked_sub_t_uint128(_1425, expr_1610)

                    update_storage_value_offset_16_t_uint128_to_t_uint128(_1424, expr_1611)
                    /// @src 0:28060:28262  "if (_position.credit > 0) {..."
                }
                /// @src 0:28291:28299  "UtilsLib"
                let expr_1618_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:28310:28315  "units"
                let _1426 := var_units_1536
                let expr_1620 := _1426
                /// @src 0:28291:28316  "UtilsLib.toUint128(units)"
                let expr_1621 := fun_toUint128_5922(expr_1620)
                /// @src 0:28271:28280  "_position"
                let _1427_slot := var__position_1580_slot
                let expr_1615_slot := _1427_slot
                /// @src 0:28271:28287  "_position.credit"
                let _1428 := add(expr_1615_slot, 0)
                /// @src 0:28271:28316  "_position.credit -= UtilsLib.toUint128(units)"
                let _1429 := read_from_storage_split_offset_0_t_uint128(_1428)
                let expr_1622 := checked_sub_t_uint128(_1429, expr_1621)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_1428, expr_1622)
                /// @src 0:28355:28363  "UtilsLib"
                let expr_1627_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:28374:28379  "units"
                let _1430 := var_units_1536
                let expr_1629 := _1430
                /// @src 0:28355:28380  "UtilsLib.toUint128(units)"
                let expr_1630 := fun_toUint128_5922(expr_1629)
                /// @src 0:28326:28338  "_marketState"
                let _1431_slot := var__marketState_1567_slot
                let expr_1624_slot := _1431_slot
                /// @src 0:28326:28351  "_marketState.withdrawable"
                let _1432 := add(expr_1624_slot, 1)
                /// @src 0:28326:28380  "_marketState.withdrawable -= UtilsLib.toUint128(units)"
                let _1433 := read_from_storage_split_offset_0_t_uint128(_1432)
                let expr_1631 := checked_sub_t_uint128(_1433, expr_1630)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_1432, expr_1631)
                /// @src 0:28417:28425  "UtilsLib"
                let expr_1636_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:28436:28441  "units"
                let _1434 := var_units_1536
                let expr_1638 := _1434
                /// @src 0:28417:28442  "UtilsLib.toUint128(units)"
                let expr_1639 := fun_toUint128_5922(expr_1638)
                /// @src 0:28390:28402  "_marketState"
                let _1435_slot := var__marketState_1567_slot
                let expr_1633_slot := _1435_slot
                /// @src 0:28390:28413  "_marketState.totalUnits"
                let _1436 := add(expr_1633_slot, 0)
                /// @src 0:28390:28442  "_marketState.totalUnits -= UtilsLib.toUint128(units)"
                let _1437 := read_from_storage_split_offset_0_t_uint128(_1436)
                let expr_1640 := checked_sub_t_uint128(_1437, expr_1639)

                update_storage_value_offset_0_t_uint128_to_t_uint128(_1436, expr_1640)
                /// @src 0:28458:28467  "EventsLib"
                let expr_1642_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:28477:28487  "msg.sender"
                let expr_1646 := caller()
                /// @src 0:28489:28491  "id"
                let _1438 := var_id_1560
                let expr_1647 := _1438
                /// @src 0:28493:28498  "units"
                let _1439 := var_units_1536
                let expr_1648 := _1439
                /// @src 0:28500:28508  "onBehalf"
                let _1440 := var_onBehalf_1538
                let expr_1649 := _1440
                /// @src 0:28510:28518  "receiver"
                let _1441 := var_receiver_1540
                let expr_1650 := _1441
                /// @src 0:28520:28538  "pendingFeeDecrease"
                let _1442 := var_pendingFeeDecrease_1588
                let expr_1651 := _1442
                /// @src 0:28458:28539  "EventsLib.Withdraw(msg.sender, id, units, onBehalf, receiver, pendingFeeDecrease)"
                let _1443 := 0x7a5e8e1731f88cf0c25f88fc7d5618e481e87be4d83f614e601850c2ff082fd7
                let _1444 := convert_t_bytes32_to_t_bytes32(expr_1647)
                let _1445 := convert_t_address_to_t_address(expr_1649)
                let _1446 := convert_t_address_to_t_address(expr_1650)
                {
                    let _1447 := allocate_unbounded()
                    let _1448 := abi_encode_tuple_t_address_t_uint256_t_uint128__to_t_address_t_uint256_t_uint256__fromStack(_1447 , expr_1646, expr_1648, expr_1651)
                    log4(_1447, sub(_1448, _1447) , _1443, _1444, _1445, _1446)
                }/// @src 0:28550:28565  "SafeTransferLib"
                let expr_1654_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:28579:28585  "market"
                let _1449_mpos := var_market_1534_mpos
                let expr_1657_mpos := _1449_mpos
                /// @src 0:28579:28595  "market.loanToken"
                let _1450 := add(expr_1657_mpos, 0)
                let _1451 := read_from_memoryt_address(_1450)
                let expr_1658 := _1451
                /// @src 0:28597:28605  "receiver"
                let _1452 := var_receiver_1540
                let expr_1659 := _1452
                /// @src 0:28607:28612  "units"
                let _1453 := var_units_1536
                let expr_1660 := _1453
                fun_safeTransfer_5503(expr_1658, expr_1659, expr_1660)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function update_byte_slice_1_shift_0(value, toInsert) -> result {
                let mask := 255
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0_t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            /// @ast-id 2745
            /// @src 0:39035:39384  "function setIsAuthorized(address authorized, bool newIsAuthorized, address onBehalf) external {..."
            function fun_setIsAuthorized_2745(var_authorized_2703, var_newIsAuthorized_2705, var_onBehalf_2707) {

                /// @src 0:39147:39155  "onBehalf"
                let _1454 := var_onBehalf_2707
                let expr_2711 := _1454
                /// @src 0:39159:39169  "msg.sender"
                let expr_2713 := caller()
                /// @src 0:39147:39169  "onBehalf == msg.sender"
                let expr_2714 := eq(cleanup_t_address(expr_2711), cleanup_t_address(expr_2713))
                /// @src 0:39147:39207  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                let expr_2721 := expr_2714
                if iszero(expr_2721) {
                    /// @src 0:39173:39185  "isAuthorized"
                    let _1455_slot := 0x03
                    let expr_2715_slot := _1455_slot
                    /// @src 0:39186:39194  "onBehalf"
                    let _1456 := var_onBehalf_2707
                    let expr_2716 := _1456
                    /// @src 0:39173:39195  "isAuthorized[onBehalf]"
                    let _1457 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(expr_2715_slot,expr_2716)
                    let _1458_slot := _1457
                    let expr_2717_slot := _1458_slot
                    /// @src 0:39196:39206  "msg.sender"
                    let expr_2719 := caller()
                    /// @src 0:39173:39207  "isAuthorized[onBehalf][msg.sender]"
                    let _1459 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_2717_slot,expr_2719)
                    let _1460 := read_from_storage_split_offset_0_t_bool(_1459)
                    let expr_2720 := _1460
                    /// @src 0:39147:39207  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                    expr_2721 := expr_2720
                }
                /// @src 0:39139:39224  "require(onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender], Unauthorized())"
                require_helper_t_error_4346_Unauthorized(expr_2721)
                /// @src 0:39271:39286  "newIsAuthorized"
                let _1461 := var_newIsAuthorized_2705
                let expr_2731 := _1461
                /// @src 0:39234:39246  "isAuthorized"
                let _1462_slot := 0x03
                let expr_2726_slot := _1462_slot
                /// @src 0:39247:39255  "onBehalf"
                let _1463 := var_onBehalf_2707
                let expr_2727 := _1463
                /// @src 0:39234:39256  "isAuthorized[onBehalf]"
                let _1464 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(expr_2726_slot,expr_2727)
                let _1465_slot := _1464
                let expr_2729_slot := _1465_slot
                /// @src 0:39257:39267  "authorized"
                let _1466 := var_authorized_2703
                let expr_2728 := _1466
                /// @src 0:39234:39268  "isAuthorized[onBehalf][authorized]"
                let _1467 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_2729_slot,expr_2728)
                /// @src 0:39234:39286  "isAuthorized[onBehalf][authorized] = newIsAuthorized"
                update_storage_value_offset_0_t_bool_to_t_bool(_1467, expr_2731)
                let expr_2732 := expr_2731
                /// @src 0:39301:39310  "EventsLib"
                let expr_2734_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:39327:39337  "msg.sender"
                let expr_2738 := caller()
                /// @src 0:39339:39349  "authorized"
                let _1468 := var_authorized_2703
                let expr_2739 := _1468
                /// @src 0:39351:39366  "newIsAuthorized"
                let _1469 := var_newIsAuthorized_2705
                let expr_2740 := _1469
                /// @src 0:39368:39376  "onBehalf"
                let _1470 := var_onBehalf_2707
                let expr_2741 := _1470
                /// @src 0:39301:39377  "EventsLib.SetIsAuthorized(msg.sender, authorized, newIsAuthorized, onBehalf)"
                let _1471 := 0x50b9eb33249282f66c7ee7f45c0e4f22a839f9b8026310efa855ee7abab13827
                let _1472 := convert_t_address_to_t_address(expr_2738)
                let _1473 := convert_t_address_to_t_address(expr_2739)
                let _1474 := convert_t_address_to_t_address(expr_2741)
                {
                    let _1475 := allocate_unbounded()
                    let _1476 := abi_encode_tuple_t_bool__to_t_bool__fromStack(_1475 , expr_2740)
                    log4(_1475, sub(_1476, _1475) , _1471, _1472, _1473, _1474)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function zero_value_for_split_t_uint32() -> ret {
                ret := 0
            }

            /// @ast-id 3660
            /// @src 0:48104:48223  "function continuousFee(bytes32 id) external view returns (uint32) {..."
            function fun_continuousFee_3660(var_id_3649) -> var__3652 {
                /// @src 0:48162:48168  "uint32"
                let zero_t_uint32_1477 := zero_value_for_split_t_uint32()
                var__3652 := zero_t_uint32_1477

                /// @src 0:48187:48198  "marketState"
                let _1478_slot := 0x01
                let expr_3654_slot := _1478_slot
                /// @src 0:48199:48201  "id"
                let _1479 := var_id_3649
                let expr_3655 := _1479
                /// @src 0:48187:48202  "marketState[id]"
                let _1480 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3654_slot,expr_3655)
                let _1481_slot := _1480
                let expr_3656_slot := _1481_slot
                /// @src 0:48187:48216  "marketState[id].continuousFee"
                let _1482 := add(expr_3656_slot, 2)
                let _1483 := read_from_storage_split_offset_14_t_uint32(_1482)
                let expr_3657 := _1483
                /// @src 0:48180:48216  "return marketState[id].continuousFee"
                var__3652 := expr_3657
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 175
            /// @src 0:14309:14521  "function setRoleSetter(address newRoleSetter) external {..."
            function fun_setRoleSetter_175(var_newRoleSetter_152) {

                /// @src 0:14382:14392  "msg.sender"
                let expr_157 := caller()
                /// @src 0:14396:14406  "roleSetter"
                let _1484 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_158 := _1484
                /// @src 0:14382:14406  "msg.sender == roleSetter"
                let expr_159 := eq(cleanup_t_address(expr_157), cleanup_t_address(expr_158))
                /// @src 0:14374:14425  "require(msg.sender == roleSetter, OnlyRoleSetter())"
                require_helper_t_error_4320_OnlyRoleSetter(expr_159)
                /// @src 0:14448:14461  "newRoleSetter"
                let _1485 := var_newRoleSetter_152
                let expr_165 := _1485
                /// @src 0:14435:14461  "roleSetter = newRoleSetter"
                update_storage_value_offset_0_t_address_to_t_address(0x07, expr_165)
                let expr_166 := expr_165
                /// @src 0:14476:14485  "EventsLib"
                let expr_168_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:14500:14513  "newRoleSetter"
                let _1486 := var_newRoleSetter_152
                let expr_171 := _1486
                /// @src 0:14476:14514  "EventsLib.SetRoleSetter(newRoleSetter)"
                let _1487 := 0x358c2e79948268accd81a80fa201c92db9ed2d8361c9c1f53ae7ed3ba11b8edf
                let _1488 := convert_t_address_to_t_address(expr_171)
                {
                    let _1489 := allocate_unbounded()
                    let _1490 := abi_encode_tuple__to__fromStack(_1489 )
                    log2(_1489, sub(_1490, _1489) , _1487, _1488)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 225
            /// @src 0:14739:14951  "function setFeeClaimer(address newFeeClaimer) external {..."
            function fun_setFeeClaimer_225(var_newFeeClaimer_202) {

                /// @src 0:14812:14822  "msg.sender"
                let expr_207 := caller()
                /// @src 0:14826:14836  "roleSetter"
                let _1491 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_208 := _1491
                /// @src 0:14812:14836  "msg.sender == roleSetter"
                let expr_209 := eq(cleanup_t_address(expr_207), cleanup_t_address(expr_208))
                /// @src 0:14804:14855  "require(msg.sender == roleSetter, OnlyRoleSetter())"
                require_helper_t_error_4320_OnlyRoleSetter(expr_209)
                /// @src 0:14878:14891  "newFeeClaimer"
                let _1492 := var_newFeeClaimer_202
                let expr_215 := _1492
                /// @src 0:14865:14891  "feeClaimer = newFeeClaimer"
                update_storage_value_offset_0_t_address_to_t_address(0x09, expr_215)
                let expr_216 := expr_215
                /// @src 0:14906:14915  "EventsLib"
                let expr_218_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:14930:14943  "newFeeClaimer"
                let _1493 := var_newFeeClaimer_202
                let expr_221 := _1493
                /// @src 0:14906:14944  "EventsLib.SetFeeClaimer(newFeeClaimer)"
                let _1494 := 0x95fa75db724442e818e27072c0420043307335fb3e4913b4c371e70cd902c2e2
                let _1495 := convert_t_address_to_t_address(expr_221)
                {
                    let _1496 := allocate_unbounded()
                    let _1497 := abi_encode_tuple__to__fromStack(_1496 )
                    log2(_1496, sub(_1497, _1496) , _1494, _1495)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3690
            /// @src 0:48367:48498  "function pendingFee(bytes32 id, address user) external view returns (uint128) {..."
            function fun_pendingFee_3690(var_id_3675, var_user_3677) -> var__3680 {
                /// @src 0:48436:48443  "uint128"
                let zero_t_uint128_1498 := zero_value_for_split_t_uint128()
                var__3680 := zero_t_uint128_1498

                /// @src 0:48462:48470  "position"
                let _1499_slot := 0x00
                let expr_3682_slot := _1499_slot
                /// @src 0:48471:48473  "id"
                let _1500 := var_id_3675
                let expr_3683 := _1500
                /// @src 0:48462:48474  "position[id]"
                let _1501 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3682_slot,expr_3683)
                let _1502_slot := _1501
                let expr_3684_slot := _1502_slot
                /// @src 0:48475:48479  "user"
                let _1503 := var_user_3677
                let expr_3685 := _1503
                /// @src 0:48462:48480  "position[id][user]"
                let _1504 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3684_slot,expr_3685)
                let _1505_slot := _1504
                let expr_3686_slot := _1505_slot
                /// @src 0:48462:48491  "position[id][user].pendingFee"
                let _1506 := add(expr_3686_slot, 0)
                let _1507 := read_from_storage_split_offset_16_t_uint128(_1506)
                let expr_3687 := _1507
                /// @src 0:48455:48491  "return position[id][user].pendingFee"
                var__3680 := expr_3687
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function require_helper_t_error_4258_AlreadyConsumed(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x6f47ab5f00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 2700
            /// @src 0:38611:38982  "function setConsumed(bytes32 group, uint256 amount, address onBehalf) external {..."
            function fun_setConsumed_2700(var_group_2646, var_amount_2648, var_onBehalf_2650) {

                /// @src 0:38708:38716  "onBehalf"
                let _1508 := var_onBehalf_2650
                let expr_2654 := _1508
                /// @src 0:38720:38730  "msg.sender"
                let expr_2656 := caller()
                /// @src 0:38708:38730  "onBehalf == msg.sender"
                let expr_2657 := eq(cleanup_t_address(expr_2654), cleanup_t_address(expr_2656))
                /// @src 0:38708:38768  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                let expr_2664 := expr_2657
                if iszero(expr_2664) {
                    /// @src 0:38734:38746  "isAuthorized"
                    let _1509_slot := 0x03
                    let expr_2658_slot := _1509_slot
                    /// @src 0:38747:38755  "onBehalf"
                    let _1510 := var_onBehalf_2650
                    let expr_2659 := _1510
                    /// @src 0:38734:38756  "isAuthorized[onBehalf]"
                    let _1511 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(expr_2658_slot,expr_2659)
                    let _1512_slot := _1511
                    let expr_2660_slot := _1512_slot
                    /// @src 0:38757:38767  "msg.sender"
                    let expr_2662 := caller()
                    /// @src 0:38734:38768  "isAuthorized[onBehalf][msg.sender]"
                    let _1513 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_2660_slot,expr_2662)
                    let _1514 := read_from_storage_split_offset_0_t_bool(_1513)
                    let expr_2663 := _1514
                    /// @src 0:38708:38768  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                    expr_2664 := expr_2663
                }
                /// @src 0:38700:38785  "require(onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender], Unauthorized())"
                require_helper_t_error_4346_Unauthorized(expr_2664)
                /// @src 0:38803:38809  "amount"
                let _1515 := var_amount_2648
                let expr_2670 := _1515
                /// @src 0:38813:38821  "consumed"
                let _1516_slot := 0x02
                let expr_2671_slot := _1516_slot
                /// @src 0:38822:38830  "onBehalf"
                let _1517 := var_onBehalf_2650
                let expr_2672 := _1517
                /// @src 0:38813:38831  "consumed[onBehalf]"
                let _1518 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_uint256_$_$_of_t_address(expr_2671_slot,expr_2672)
                let _1519_slot := _1518
                let expr_2673_slot := _1519_slot
                /// @src 0:38832:38837  "group"
                let _1520 := var_group_2646
                let expr_2674 := _1520
                /// @src 0:38813:38838  "consumed[onBehalf][group]"
                let _1521 := mapping_index_access_t_mapping$_t_bytes32_$_t_uint256_$_of_t_bytes32(expr_2673_slot,expr_2674)
                let _1522 := read_from_storage_split_offset_0_t_uint256(_1521)
                let expr_2675 := _1522
                /// @src 0:38803:38838  "amount >= consumed[onBehalf][group]"
                let expr_2676 := iszero(lt(cleanup_t_uint256(expr_2670), cleanup_t_uint256(expr_2675)))
                /// @src 0:38795:38858  "require(amount >= consumed[onBehalf][group], AlreadyConsumed())"
                require_helper_t_error_4258_AlreadyConsumed(expr_2676)
                /// @src 0:38896:38902  "amount"
                let _1523 := var_amount_2648
                let expr_2686 := _1523
                /// @src 0:38868:38876  "consumed"
                let _1524_slot := 0x02
                let expr_2681_slot := _1524_slot
                /// @src 0:38877:38885  "onBehalf"
                let _1525 := var_onBehalf_2650
                let expr_2682 := _1525
                /// @src 0:38868:38886  "consumed[onBehalf]"
                let _1526 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_uint256_$_$_of_t_address(expr_2681_slot,expr_2682)
                let _1527_slot := _1526
                let expr_2684_slot := _1527_slot
                /// @src 0:38887:38892  "group"
                let _1528 := var_group_2646
                let expr_2683 := _1528
                /// @src 0:38868:38893  "consumed[onBehalf][group]"
                let _1529 := mapping_index_access_t_mapping$_t_bytes32_$_t_uint256_$_of_t_bytes32(expr_2684_slot,expr_2683)
                /// @src 0:38868:38902  "consumed[onBehalf][group] = amount"
                update_storage_value_offset_0_t_uint256_to_t_uint256(_1529, expr_2686)
                let expr_2687 := expr_2686
                /// @src 0:38917:38926  "EventsLib"
                let expr_2689_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:38939:38949  "msg.sender"
                let expr_2693 := caller()
                /// @src 0:38951:38956  "group"
                let _1530 := var_group_2646
                let expr_2694 := _1530
                /// @src 0:38958:38964  "amount"
                let _1531 := var_amount_2648
                let expr_2695 := _1531
                /// @src 0:38966:38974  "onBehalf"
                let _1532 := var_onBehalf_2650
                let expr_2696 := _1532
                /// @src 0:38917:38975  "EventsLib.SetConsumed(msg.sender, group, amount, onBehalf)"
                let _1533 := 0xbf9d75f869db3f07b85b277c6ef4c58ee36ec3ec222303658012df26a9420d93
                let _1534 := convert_t_address_to_t_address(expr_2693)
                let _1535 := convert_t_bytes32_to_t_bytes32(expr_2694)
                let _1536 := convert_t_address_to_t_address(expr_2696)
                {
                    let _1537 := allocate_unbounded()
                    let _1538 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_1537 , expr_2695)
                    log4(_1537, sub(_1538, _1537) , _1533, _1534, _1535, _1536)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3553
            /// @src 0:46838:46959  "function debtOf(bytes32 id, address user) external view returns (uint128) {..."
            function fun_debtOf_3553(var_id_3538, var_user_3540) -> var__3543 {
                /// @src 0:46903:46910  "uint128"
                let zero_t_uint128_1539 := zero_value_for_split_t_uint128()
                var__3543 := zero_t_uint128_1539

                /// @src 0:46929:46937  "position"
                let _1540_slot := 0x00
                let expr_3545_slot := _1540_slot
                /// @src 0:46938:46940  "id"
                let _1541 := var_id_3538
                let expr_3546 := _1541
                /// @src 0:46929:46941  "position[id]"
                let _1542 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3545_slot,expr_3546)
                let _1543_slot := _1542
                let expr_3547_slot := _1543_slot
                /// @src 0:46942:46946  "user"
                let _1544 := var_user_3540
                let expr_3548 := _1544
                /// @src 0:46929:46947  "position[id][user]"
                let _1545 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3547_slot,expr_3548)
                let _1546_slot := _1545
                let expr_3549_slot := _1546_slot
                /// @src 0:46929:46952  "position[id][user].debt"
                let _1547 := add(expr_3549_slot, 2)
                let _1548 := read_from_storage_split_offset_0_t_uint128(_1547)
                let expr_3550 := _1548
                /// @src 0:46922:46952  "return position[id][user].debt"
                var__3543 := expr_3550
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function zero_value_for_split_t_uint8() -> ret {
                ret := 0
            }

            /// @ast-id 3592
            /// @src 0:47205:47319  "function tickSpacing(bytes32 id) external view returns (uint8) {..."
            function fun_tickSpacing_3592(var_id_3581) -> var__3584 {
                /// @src 0:47261:47266  "uint8"
                let zero_t_uint8_1549 := zero_value_for_split_t_uint8()
                var__3584 := zero_t_uint8_1549

                /// @src 0:47285:47296  "marketState"
                let _1550_slot := 0x01
                let expr_3586_slot := _1550_slot
                /// @src 0:47297:47299  "id"
                let _1551 := var_id_3581
                let expr_3587 := _1551
                /// @src 0:47285:47300  "marketState[id]"
                let _1552 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3586_slot,expr_3587)
                let _1553_slot := _1552
                let expr_3588_slot := _1553_slot
                /// @src 0:47285:47312  "marketState[id].tickSpacing"
                let _1554 := add(expr_3588_slot, 2)
                let _1555 := read_from_storage_split_offset_18_t_uint8(_1554)
                let expr_3589 := _1555
                /// @src 0:47278:47312  "return marketState[id].tickSpacing"
                var__3584 := expr_3589
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3707
            /// @src 0:48504:48637  "function lastAccrual(bytes32 id, address user) external view returns (uint128) {..."
            function fun_lastAccrual_3707(var_id_3692, var_user_3694) -> var__3697 {
                /// @src 0:48574:48581  "uint128"
                let zero_t_uint128_1556 := zero_value_for_split_t_uint128()
                var__3697 := zero_t_uint128_1556

                /// @src 0:48600:48608  "position"
                let _1557_slot := 0x00
                let expr_3699_slot := _1557_slot
                /// @src 0:48609:48611  "id"
                let _1558 := var_id_3692
                let expr_3700 := _1558
                /// @src 0:48600:48612  "position[id]"
                let _1559 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3699_slot,expr_3700)
                let _1560_slot := _1559
                let expr_3701_slot := _1560_slot
                /// @src 0:48613:48617  "user"
                let _1561 := var_user_3694
                let expr_3702 := _1561
                /// @src 0:48600:48618  "position[id][user]"
                let _1562 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3701_slot,expr_3702)
                let _1563_slot := _1562
                let expr_3703_slot := _1563_slot
                /// @src 0:48600:48630  "position[id][user].lastAccrual"
                let _1564 := add(expr_3703_slot, 1)
                let _1565 := read_from_storage_split_offset_16_t_uint128(_1564)
                let expr_3704 := _1565
                /// @src 0:48593:48630  "return position[id][user].lastAccrual"
                var__3697 := expr_3704
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3458
            /// @src 0:45995:46148  "function collateral(bytes32 id, address user, uint256 index) external view returns (uint128) {..."
            function fun_collateral_3458(var_id_3439, var_user_3441, var_index_3443) -> var__3446 {
                /// @src 0:46079:46086  "uint128"
                let zero_t_uint128_1566 := zero_value_for_split_t_uint128()
                var__3446 := zero_t_uint128_1566

                /// @src 0:46105:46113  "position"
                let _1567_slot := 0x00
                let expr_3448_slot := _1567_slot
                /// @src 0:46114:46116  "id"
                let _1568 := var_id_3439
                let expr_3449 := _1568
                /// @src 0:46105:46117  "position[id]"
                let _1569 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3448_slot,expr_3449)
                let _1570_slot := _1569
                let expr_3450_slot := _1570_slot
                /// @src 0:46118:46122  "user"
                let _1571 := var_user_3441
                let expr_3451 := _1571
                /// @src 0:46105:46123  "position[id][user]"
                let _1572 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3450_slot,expr_3451)
                let _1573_slot := _1572
                let expr_3452_slot := _1573_slot
                /// @src 0:46105:46134  "position[id][user].collateral"
                let _1574 := add(expr_3452_slot, 3)
                let _1575_slot := _1574
                let expr_3453_slot := _1575_slot
                /// @src 0:46135:46140  "index"
                let _1576 := var_index_3443
                let expr_3454 := _1576
                /// @src 0:46105:46141  "position[id][user].collateral[index]"

                let _1577, _1578 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_3453_slot, expr_3454)
                let _1579 := read_from_storage_split_dynamic_t_uint128(_1577, _1578)
                let expr_3455 := _1579
                /// @src 0:46098:46141  "return position[id][user].collateral[index]"
                var__3446 := expr_3455
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function require_helper_t_error_4322_OnlyTickSpacingSetter(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x5533526e00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_4290_InvalidTickSpacing(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x270815a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_uint256_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(identity(cleanup_t_uint256(value)))
            }

            /// @ast-id 313
            /// @src 0:15317:15900  "function setMarketTickSpacing(bytes32 id, uint256 newTickSpacing) external {..."
            function fun_setMarketTickSpacing_313(var_id_253, var_newTickSpacing_255) {

                /// @src 0:15410:15420  "msg.sender"
                let expr_260 := caller()
                /// @src 0:15424:15441  "tickSpacingSetter"
                let _1580 := read_from_storage_split_offset_0_t_address(0x0a)
                let expr_261 := _1580
                /// @src 0:15410:15441  "msg.sender == tickSpacingSetter"
                let expr_262 := eq(cleanup_t_address(expr_260), cleanup_t_address(expr_261))
                /// @src 0:15402:15467  "require(msg.sender == tickSpacingSetter, OnlyTickSpacingSetter())"
                require_helper_t_error_4322_OnlyTickSpacingSetter(expr_262)
                /// @src 0:15485:15496  "marketState"
                let _1581_slot := 0x01
                let expr_268_slot := _1581_slot
                /// @src 0:15497:15499  "id"
                let _1582 := var_id_253
                let expr_269 := _1582
                /// @src 0:15485:15500  "marketState[id]"
                let _1583 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_268_slot,expr_269)
                let _1584_slot := _1583
                let expr_270_slot := _1584_slot
                /// @src 0:15485:15512  "marketState[id].tickSpacing"
                let _1585 := add(expr_270_slot, 2)
                let _1586 := read_from_storage_split_offset_18_t_uint8(_1585)
                let expr_271 := _1586
                /// @src 0:15515:15516  "0"
                let expr_272 := 0x00
                /// @src 0:15485:15516  "marketState[id].tickSpacing > 0"
                let expr_273 := gt(cleanup_t_uint8(expr_271), convert_t_rational_0_by_1_to_t_uint8(expr_272))
                /// @src 0:15477:15537  "require(marketState[id].tickSpacing > 0, MarketNotCreated())"
                require_helper_t_error_4310_MarketNotCreated(expr_273)
                /// @src 0:15555:15569  "newTickSpacing"
                let _1587 := var_newTickSpacing_255
                let expr_279 := _1587
                /// @src 0:15572:15573  "0"
                let expr_280 := 0x00
                /// @src 0:15555:15573  "newTickSpacing > 0"
                let expr_281 := gt(cleanup_t_uint256(expr_279), convert_t_rational_0_by_1_to_t_uint256(expr_280))
                /// @src 0:15555:15626  "newTickSpacing > 0 && marketState[id].tickSpacing % newTickSpacing == 0"
                let expr_290 := expr_281
                if expr_290 {
                    /// @src 0:15577:15588  "marketState"
                    let _1588_slot := 0x01
                    let expr_282_slot := _1588_slot
                    /// @src 0:15589:15591  "id"
                    let _1589 := var_id_253
                    let expr_283 := _1589
                    /// @src 0:15577:15592  "marketState[id]"
                    let _1590 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_282_slot,expr_283)
                    let _1591_slot := _1590
                    let expr_284_slot := _1591_slot
                    /// @src 0:15577:15604  "marketState[id].tickSpacing"
                    let _1592 := add(expr_284_slot, 2)
                    let _1593 := read_from_storage_split_offset_18_t_uint8(_1592)
                    let expr_285 := _1593
                    /// @src 0:15607:15621  "newTickSpacing"
                    let _1594 := var_newTickSpacing_255
                    let expr_286 := _1594
                    /// @src 0:15577:15621  "marketState[id].tickSpacing % newTickSpacing"
                    let expr_287 := mod_t_uint256(convert_t_uint8_to_t_uint256(expr_285), expr_286)

                    /// @src 0:15625:15626  "0"
                    let expr_288 := 0x00
                    /// @src 0:15577:15626  "marketState[id].tickSpacing % newTickSpacing == 0"
                    let expr_289 := eq(cleanup_t_uint256(expr_287), convert_t_rational_0_by_1_to_t_uint256(expr_288))
                    /// @src 0:15555:15626  "newTickSpacing > 0 && marketState[id].tickSpacing % newTickSpacing == 0"
                    expr_290 := expr_289
                }
                /// @src 0:15547:15649  "require(newTickSpacing > 0 && marketState[id].tickSpacing % newTickSpacing == 0, InvalidTickSpacing())"
                require_helper_t_error_4290_InvalidTickSpacing(expr_290)
                /// @src 0:15813:15827  "newTickSpacing"
                let _1595 := var_newTickSpacing_255
                let expr_301 := _1595
                /// @src 0:15807:15828  "uint8(newTickSpacing)"
                let expr_302 := convert_t_uint256_to_t_uint8(expr_301)
                /// @src 0:15777:15788  "marketState"
                let _1596_slot := 0x01
                let expr_295_slot := _1596_slot
                /// @src 0:15789:15791  "id"
                let _1597 := var_id_253
                let expr_296 := _1597
                /// @src 0:15777:15792  "marketState[id]"
                let _1598 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_295_slot,expr_296)
                let _1599_slot := _1598
                let expr_297_slot := _1599_slot
                /// @src 0:15777:15804  "marketState[id].tickSpacing"
                let _1600 := add(expr_297_slot, 2)
                /// @src 0:15777:15828  "marketState[id].tickSpacing = uint8(newTickSpacing)"
                update_storage_value_offset_18_t_uint8_to_t_uint8(_1600, expr_302)
                let expr_303 := expr_302
                /// @src 0:15843:15852  "EventsLib"
                let expr_305_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:15874:15876  "id"
                let _1601 := var_id_253
                let expr_308 := _1601
                /// @src 0:15878:15892  "newTickSpacing"
                let _1602 := var_newTickSpacing_255
                let expr_309 := _1602
                /// @src 0:15843:15893  "EventsLib.SetMarketTickSpacing(id, newTickSpacing)"
                let _1603 := 0x2fdb65e22fe4310a6b7ac73b0733cce84a7b9289fedcef0a7669bb4ea16a5919
                let _1604 := convert_t_bytes32_to_t_bytes32(expr_308)
                {
                    let _1605 := allocate_unbounded()
                    let _1606 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_1605 , expr_309)
                    log2(_1605, sub(_1606, _1605) , _1603, _1604)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 250
            /// @src 0:14957:15211  "function setTickSpacingSetter(address newTickSpacingSetter) external {..."
            function fun_setTickSpacingSetter_250(var_newTickSpacingSetter_227) {

                /// @src 0:15044:15054  "msg.sender"
                let expr_232 := caller()
                /// @src 0:15058:15068  "roleSetter"
                let _1607 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_233 := _1607
                /// @src 0:15044:15068  "msg.sender == roleSetter"
                let expr_234 := eq(cleanup_t_address(expr_232), cleanup_t_address(expr_233))
                /// @src 0:15036:15087  "require(msg.sender == roleSetter, OnlyRoleSetter())"
                require_helper_t_error_4320_OnlyRoleSetter(expr_234)
                /// @src 0:15117:15137  "newTickSpacingSetter"
                let _1608 := var_newTickSpacingSetter_227
                let expr_240 := _1608
                /// @src 0:15097:15137  "tickSpacingSetter = newTickSpacingSetter"
                update_storage_value_offset_0_t_address_to_t_address(0x0a, expr_240)
                let expr_241 := expr_240
                /// @src 0:15152:15161  "EventsLib"
                let expr_243_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:15183:15203  "newTickSpacingSetter"
                let _1609 := var_newTickSpacingSetter_227
                let expr_246 := _1609
                /// @src 0:15152:15204  "EventsLib.SetTickSpacingSetter(newTickSpacingSetter)"
                let _1610 := 0x14bcfba250c945e79a9901378a5d70dbcc7865cac69a6769f3a566efda01aea1
                let _1611 := convert_t_address_to_t_address(expr_246)
                {
                    let _1612 := allocate_unbounded()
                    let _1613 := abi_encode_tuple__to__fromStack(_1612 )
                    log2(_1612, sub(_1613, _1612) , _1610, _1611)
                }
            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function allocate_memory_struct_t_struct$_Market_$4171_memory_ptr() -> memPtr {
                memPtr := allocate_memory(192)
            }

            function zero_value_for_t_address() -> ret {
                ret := 0
            }

            function zero_value_for_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr() -> ret {
                ret := 96
            }

            function zero_value_for_t_uint256() -> ret {
                ret := 0
            }

            function allocate_and_zero_memory_struct_t_struct$_Market_$4171_memory_ptr() -> memPtr {
                memPtr := allocate_memory_struct_t_struct$_Market_$4171_memory_ptr()
                let offset := memPtr

                mstore(offset, zero_value_for_t_address())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_uint256())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_uint256())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_address())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_address())
                offset := add(offset, 32)

            }

            function zero_value_for_split_t_struct$_Market_$4171_memory_ptr() -> ret {
                ret := allocate_and_zero_memory_struct_t_struct$_Market_$4171_memory_ptr()
            }

            function convert_t_uint256_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint256(value)))
            }

            function external_code_at(addr) -> mpos {
                let length := extcodesize(addr)
                mpos := allocate_memory_array_t_bytes_memory_ptr(length)
                extcodecopy(addr, add(mpos, 0x20), 0, length)
            }

            function abi_decode_t_address_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_address(value)
            }

            // struct CollateralParams
            function abi_decode_t_struct$_CollateralParams_$4180_memory_ptr_fromMemory(headStart, end) -> value {
                if slt(sub(end, headStart), 0x80) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0x80)

                {
                    // token

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_address_fromMemory(add(headStart, offset), end))

                }

                {
                    // lltv

                    let offset := 32

                    mstore(add(value, 0x20), abi_decode_t_uint256_fromMemory(add(headStart, offset), end))

                }

                {
                    // maxLif

                    let offset := 64

                    mstore(add(value, 0x40), abi_decode_t_uint256_fromMemory(add(headStart, offset), end))

                }

                {
                    // oracle

                    let offset := 96

                    mstore(add(value, 0x60), abi_decode_t_address_fromMemory(add(headStart, offset), end))

                }

            }

            // struct CollateralParams[]
            function abi_decode_available_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr_fromMemory(offset, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(length))
                let dst := array

                mstore(array, length)
                dst := add(array, 0x20)

                let srcEnd := add(offset, mul(length, 0x80))
                if gt(srcEnd, end) {
                    revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef()
                }
                for { let src := offset } lt(src, srcEnd) { src := add(src, 0x80) }
                {

                    let elementPos := src

                    mstore(dst, abi_decode_t_struct$_CollateralParams_$4180_memory_ptr_fromMemory(elementPos, end))
                    dst := add(dst, 0x20)
                }
            }

            // struct CollateralParams[]
            function abi_decode_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr_fromMemory(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := mload(offset)
                array := abi_decode_available_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr_fromMemory(add(offset, 0x20), length, end)
            }

            // struct Market
            function abi_decode_t_struct$_Market_$4171_memory_ptr_fromMemory(headStart, end) -> value {
                if slt(sub(end, headStart), 0xc0) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0xc0)

                {
                    // loanToken

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_address_fromMemory(add(headStart, offset), end))

                }

                {
                    // collateralParams

                    let offset := mload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert_error_5e8f644817bc4960744f35c15999b6eff64ae702f94b1c46297cfd4e1aec2421() }

                    mstore(add(value, 0x20), abi_decode_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr_fromMemory(add(headStart, offset), end))

                }

                {
                    // maturity

                    let offset := 64

                    mstore(add(value, 0x40), abi_decode_t_uint256_fromMemory(add(headStart, offset), end))

                }

                {
                    // rcfThreshold

                    let offset := 96

                    mstore(add(value, 0x60), abi_decode_t_uint256_fromMemory(add(headStart, offset), end))

                }

                {
                    // enterGate

                    let offset := 128

                    mstore(add(value, 0x80), abi_decode_t_address_fromMemory(add(headStart, offset), end))

                }

                {
                    // liquidatorGate

                    let offset := 160

                    mstore(add(value, 0xa0), abi_decode_t_address_fromMemory(add(headStart, offset), end))

                }

            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptr_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := mload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_struct$_Market_$4171_memory_ptr_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            /// @ast-id 3519
            /// @src 0:46434:46701  "function toMarket(bytes32 id) external view returns (Market memory) {..."
            function fun_toMarket_3519(var_id_3480) -> var__3484_mpos {
                /// @src 0:46487:46500  "Market memory"
                let zero_t_struct$_Market_$4171_memory_ptr_1614_mpos := zero_value_for_split_t_struct$_Market_$4171_memory_ptr()
                var__3484_mpos := zero_t_struct$_Market_$4171_memory_ptr_1614_mpos

                /// @src 0:46520:46531  "marketState"
                let _1615_slot := 0x01
                let expr_3487_slot := _1615_slot
                /// @src 0:46532:46534  "id"
                let _1616 := var_id_3480
                let expr_3488 := _1616
                /// @src 0:46520:46535  "marketState[id]"
                let _1617 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3487_slot,expr_3488)
                let _1618_slot := _1617
                let expr_3489_slot := _1618_slot
                /// @src 0:46520:46547  "marketState[id].tickSpacing"
                let _1619 := add(expr_3489_slot, 2)
                let _1620 := read_from_storage_split_offset_18_t_uint8(_1619)
                let expr_3490 := _1620
                /// @src 0:46550:46551  "0"
                let expr_3491 := 0x00
                /// @src 0:46520:46551  "marketState[id].tickSpacing > 0"
                let expr_3492 := gt(cleanup_t_uint8(expr_3490), convert_t_rational_0_by_1_to_t_uint8(expr_3491))
                /// @src 0:46512:46572  "require(marketState[id].tickSpacing > 0, MarketNotCreated())"
                require_helper_t_error_4310_MarketNotCreated(expr_3492)
                /// @src 0:46631:46633  "id"
                let _1621 := var_id_3480
                let expr_3505 := _1621
                /// @src 0:46623:46634  "uint256(id)"
                let expr_3506 := convert_t_bytes32_to_t_uint256(expr_3505)
                /// @src 0:46615:46635  "uint160(uint256(id))"
                let expr_3507 := convert_t_uint256_to_t_uint160(expr_3506)
                /// @src 0:46607:46636  "address(uint160(uint256(id)))"
                let expr_3508 := convert_t_uint160_to_t_address(expr_3507)
                /// @src 0:46582:46636  "address create2Address = address(uint160(uint256(id)))"
                let var_create2Address_3498 := expr_3508
                /// @src 0:46664:46678  "create2Address"
                let _1622 := var_create2Address_3498
                let expr_3512 := _1622
                /// @src 0:46664:46683  "create2Address.code"
                let expr_3513_mpos := external_code_at(expr_3512)
                /// @src 0:46653:46694  "abi.decode(create2Address.code, (Market))"

                let expr_3516_mpos :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptr_fromMemory(add(expr_3513_mpos, 32), add(add(expr_3513_mpos, 32), array_length_t_bytes_memory_ptr(expr_3513_mpos)))
                /// @src 0:46646:46694  "return abi.decode(create2Address.code, (Market))"
                var__3484_mpos := expr_3516_mpos
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function cleanup_t_rational_16_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_16_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_16_by_1(value)))
            }

            /// @src 7:857:907  "uint256 constant MAX_COLLATERALS_PER_BORROWER = 16"
            function constant_MAX_COLLATERALS_PER_BORROWER_4967() -> ret {
                /// @src 7:905:907  "16"
                let expr_4966 := 0x10
                let _1670 := convert_t_rational_16_by_1_to_t_uint256(expr_4966)

                ret := _1670
            }

            function require_helper_t_error_4340_TooManyActivatedCollaterals(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x73290bb900000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            /// @ast-id 1916
            /// @src 0:29601:30738  "function supplyCollateral(Market memory market, uint256 collateralIndex, uint256 assets, address onBehalf)..."
            function fun_supplyCollateral_1916(var_market_1789_mpos, var_collateralIndex_1791, var_assets_1793, var_onBehalf_1795) {

                /// @src 0:29747:29755  "onBehalf"
                let _1623 := var_onBehalf_1795
                let expr_1799 := _1623
                /// @src 0:29759:29769  "msg.sender"
                let expr_1801 := caller()
                /// @src 0:29747:29769  "onBehalf == msg.sender"
                let expr_1802 := eq(cleanup_t_address(expr_1799), cleanup_t_address(expr_1801))
                /// @src 0:29747:29807  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                let expr_1809 := expr_1802
                if iszero(expr_1809) {
                    /// @src 0:29773:29785  "isAuthorized"
                    let _1624_slot := 0x03
                    let expr_1803_slot := _1624_slot
                    /// @src 0:29786:29794  "onBehalf"
                    let _1625 := var_onBehalf_1795
                    let expr_1804 := _1625
                    /// @src 0:29773:29795  "isAuthorized[onBehalf]"
                    let _1626 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_bool_$_$_of_t_address(expr_1803_slot,expr_1804)
                    let _1627_slot := _1626
                    let expr_1805_slot := _1627_slot
                    /// @src 0:29796:29806  "msg.sender"
                    let expr_1807 := caller()
                    /// @src 0:29773:29807  "isAuthorized[onBehalf][msg.sender]"
                    let _1628 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_1805_slot,expr_1807)
                    let _1629 := read_from_storage_split_offset_0_t_bool(_1628)
                    let expr_1808 := _1629
                    /// @src 0:29747:29807  "onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender]"
                    expr_1809 := expr_1808
                }
                /// @src 0:29739:29824  "require(onBehalf == msg.sender || isAuthorized[onBehalf][msg.sender], Unauthorized())"
                require_helper_t_error_4346_Unauthorized(expr_1809)
                /// @src 0:29859:29865  "market"
                let _1630_mpos := var_market_1789_mpos
                let expr_1817_mpos := _1630_mpos
                /// @src 0:29847:29866  "touchMarket(market)"
                let expr_1818 := fun_touchMarket_3092(expr_1817_mpos)
                /// @src 0:29834:29866  "bytes32 id = touchMarket(market)"
                let var_id_1815 := expr_1818
                /// @src 0:29902:29908  "market"
                let _1631_mpos := var_market_1789_mpos
                let expr_1822_mpos := _1631_mpos
                /// @src 0:29902:29925  "market.collateralParams"
                let _1632 := add(expr_1822_mpos, 32)
                let _1633_mpos := mload(_1632)
                let expr_1823_mpos := _1633_mpos
                /// @src 0:29926:29941  "collateralIndex"
                let _1634 := var_collateralIndex_1791
                let expr_1824 := _1634
                /// @src 0:29902:29942  "market.collateralParams[collateralIndex]"
                let _1635_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_1823_mpos, expr_1824))
                let expr_1825_mpos := _1635_mpos
                /// @src 0:29902:29948  "market.collateralParams[collateralIndex].token"
                let _1636 := add(expr_1825_mpos, 0)
                let _1637 := read_from_memoryt_address(_1636)
                let expr_1826 := _1637
                /// @src 0:29876:29948  "address collateralToken = market.collateralParams[collateralIndex].token"
                let var_collateralToken_1821 := expr_1826
                /// @src 0:29988:29996  "position"
                let _1638_slot := 0x00
                let expr_1831_slot := _1638_slot
                /// @src 0:29997:29999  "id"
                let _1639 := var_id_1815
                let expr_1832 := _1639
                /// @src 0:29988:30000  "position[id]"
                let _1640 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_1831_slot,expr_1832)
                let _1641_slot := _1640
                let expr_1833_slot := _1641_slot
                /// @src 0:30001:30009  "onBehalf"
                let _1642 := var_onBehalf_1795
                let expr_1834 := _1642
                /// @src 0:29988:30010  "position[id][onBehalf]"
                let _1643 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_1833_slot,expr_1834)
                let _1644_slot := _1643
                let expr_1835_slot := _1644_slot
                /// @src 0:29959:30010  "Position storage _position = position[id][onBehalf]"
                let var__position_1830_slot := convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(expr_1835_slot)
                /// @src 0:30044:30053  "_position"
                let _1645_slot := var__position_1830_slot
                let expr_1839_slot := _1645_slot
                /// @src 0:30044:30064  "_position.collateral"
                let _1646 := add(expr_1839_slot, 3)
                let _1647_slot := _1646
                let expr_1840_slot := _1647_slot
                /// @src 0:30065:30080  "collateralIndex"
                let _1648 := var_collateralIndex_1791
                let expr_1841 := _1648
                /// @src 0:30044:30081  "_position.collateral[collateralIndex]"

                let _1649, _1650 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_1840_slot, expr_1841)
                let _1651 := read_from_storage_split_dynamic_t_uint128(_1649, _1650)
                let expr_1842 := _1651
                /// @src 0:30020:30081  "uint256 oldCollateral = _position.collateral[collateralIndex]"
                let var_oldCollateral_1838 := convert_t_uint128_to_t_uint256(expr_1842)
                /// @src 0:30131:30139  "UtilsLib"
                let expr_1849_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:30150:30163  "oldCollateral"
                let _1652 := var_oldCollateral_1838
                let expr_1851 := _1652
                /// @src 0:30166:30172  "assets"
                let _1653 := var_assets_1793
                let expr_1852 := _1653
                /// @src 0:30150:30172  "oldCollateral + assets"
                let expr_1853 := checked_add_t_uint256(expr_1851, expr_1852)

                /// @src 0:30131:30173  "UtilsLib.toUint128(oldCollateral + assets)"
                let expr_1854 := fun_toUint128_5922(expr_1853)
                /// @src 0:30091:30100  "_position"
                let _1654_slot := var__position_1830_slot
                let expr_1844_slot := _1654_slot
                /// @src 0:30091:30111  "_position.collateral"
                let _1655 := add(expr_1844_slot, 3)
                let _1656_slot := _1655
                let expr_1847_slot := _1656_slot
                /// @src 0:30112:30127  "collateralIndex"
                let _1657 := var_collateralIndex_1791
                let expr_1846 := _1657
                /// @src 0:30091:30128  "_position.collateral[collateralIndex]"

                let _1658, _1659 := storage_array_index_access_t_array$_t_uint128_$128_storage(expr_1847_slot, expr_1846)
                /// @src 0:30091:30173  "_position.collateral[collateralIndex] = UtilsLib.toUint128(oldCollateral + assets)"
                update_storage_value_t_uint128_to_t_uint128(_1658, _1659, expr_1854)
                let expr_1855 := expr_1854
                /// @src 0:30188:30201  "oldCollateral"
                let _1660 := var_oldCollateral_1838
                let expr_1857 := _1660
                /// @src 0:30205:30206  "0"
                let expr_1858 := 0x00
                /// @src 0:30188:30206  "oldCollateral == 0"
                let expr_1859 := eq(cleanup_t_uint256(expr_1857), convert_t_rational_0_by_1_to_t_uint256(expr_1858))
                /// @src 0:30188:30220  "oldCollateral == 0 && assets > 0"
                let expr_1863 := expr_1859
                if expr_1863 {
                    /// @src 0:30210:30216  "assets"
                    let _1661 := var_assets_1793
                    let expr_1860 := _1661
                    /// @src 0:30219:30220  "0"
                    let expr_1861 := 0x00
                    /// @src 0:30210:30220  "assets > 0"
                    let expr_1862 := gt(cleanup_t_uint256(expr_1860), convert_t_rational_0_by_1_to_t_uint256(expr_1861))
                    /// @src 0:30188:30220  "oldCollateral == 0 && assets > 0"
                    expr_1863 := expr_1862
                }
                /// @src 0:30184:30544  "if (oldCollateral == 0 && assets > 0) {..."
                if expr_1863 {
                    /// @src 0:30266:30275  "_position"
                    let _1662_slot := var__position_1830_slot
                    let expr_1866_slot := _1662_slot
                    /// @src 0:30266:30292  "_position.collateralBitmap"
                    let _1663 := add(expr_1866_slot, 2)
                    let _1664 := read_from_storage_split_offset_16_t_uint128(_1663)
                    let expr_1867 := _1664
                    /// @src 0:30266:30299  "_position.collateralBitmap.setBit"
                    let expr_1868_self := expr_1867
                    /// @src 0:30300:30315  "collateralIndex"
                    let _1665 := var_collateralIndex_1791
                    let expr_1869 := _1665
                    /// @src 0:30266:30316  "_position.collateralBitmap.setBit(collateralIndex)"
                    let expr_1870 := fun_setBit_6008(expr_1868_self, expr_1869)
                    /// @src 0:30236:30316  "uint128 newCollateralBitmap = _position.collateralBitmap.setBit(collateralIndex)"
                    let var_newCollateralBitmap_1865 := expr_1870
                    /// @src 0:30359:30378  "newCollateralBitmap"
                    let _1666 := var_newCollateralBitmap_1865
                    let expr_1875 := _1666
                    /// @src 0:30330:30339  "_position"
                    let _1667_slot := var__position_1830_slot
                    let expr_1872_slot := _1667_slot
                    /// @src 0:30330:30356  "_position.collateralBitmap"
                    let _1668 := add(expr_1872_slot, 2)
                    /// @src 0:30330:30378  "_position.collateralBitmap = newCollateralBitmap"
                    update_storage_value_offset_16_t_uint128_to_t_uint128(_1668, expr_1875)
                    let expr_1876 := expr_1875
                    /// @src 0:30417:30425  "UtilsLib"
                    let expr_1879_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                    /// @src 0:30436:30455  "newCollateralBitmap"
                    let _1669 := var_newCollateralBitmap_1865
                    let expr_1881 := _1669
                    /// @src 0:30417:30456  "UtilsLib.countBits(newCollateralBitmap)"
                    let expr_1882 := fun_countBits_5977(expr_1881)
                    /// @src 0:30460:30488  "MAX_COLLATERALS_PER_BORROWER"
                    let expr_1883 := constant_MAX_COLLATERALS_PER_BORROWER_4967()
                    /// @src 0:30417:30488  "UtilsLib.countBits(newCollateralBitmap) <= MAX_COLLATERALS_PER_BORROWER"
                    let expr_1884 := iszero(gt(cleanup_t_uint256(expr_1882), cleanup_t_uint256(expr_1883)))
                    /// @src 0:30392:30533  "require(..."
                    require_helper_t_error_4340_TooManyActivatedCollaterals(expr_1884)
                    /// @src 0:30184:30544  "if (oldCollateral == 0 && assets > 0) {..."
                }
                /// @src 0:30559:30568  "EventsLib"
                let expr_1891_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:30586:30596  "msg.sender"
                let expr_1895 := caller()
                /// @src 0:30598:30600  "id"
                let _1671 := var_id_1815
                let expr_1896 := _1671
                /// @src 0:30602:30617  "collateralToken"
                let _1672 := var_collateralToken_1821
                let expr_1897 := _1672
                /// @src 0:30619:30625  "assets"
                let _1673 := var_assets_1793
                let expr_1898 := _1673
                /// @src 0:30627:30635  "onBehalf"
                let _1674 := var_onBehalf_1795
                let expr_1899 := _1674
                /// @src 0:30559:30636  "EventsLib.SupplyCollateral(msg.sender, id, collateralToken, assets, onBehalf)"
                let _1675 := 0x968f3d07613cff19e0b1a7b034a330cfc3c90e73c1112e14495b79f436a4a074
                let _1676 := convert_t_bytes32_to_t_bytes32(expr_1896)
                let _1677 := convert_t_address_to_t_address(expr_1897)
                let _1678 := convert_t_address_to_t_address(expr_1899)
                {
                    let _1679 := allocate_unbounded()
                    let _1680 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(_1679 , expr_1895, expr_1898)
                    log4(_1679, sub(_1680, _1679) , _1675, _1676, _1677, _1678)
                }/// @src 0:30647:30662  "SafeTransferLib"
                let expr_1902_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 0:30680:30695  "collateralToken"
                let _1681 := var_collateralToken_1821
                let expr_1905 := _1681
                /// @src 0:30697:30707  "msg.sender"
                let expr_1907 := caller()
                /// @src 0:30717:30721  "this"
                let expr_1910_address := address()
                /// @src 0:30709:30722  "address(this)"
                let expr_1911 := convert_t_contract$_Midnight_$3973_to_t_address(expr_1910_address)
                /// @src 0:30724:30730  "assets"
                let _1682 := var_assets_1793
                let expr_1912 := _1682
                fun_safeTransferFrom_5564(expr_1905, expr_1907, expr_1911, expr_1912)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3673
            /// @src 0:48229:48361  "function continuousFeeCredit(bytes32 id) external view returns (uint128) {..."
            function fun_continuousFeeCredit_3673(var_id_3662) -> var__3665 {
                /// @src 0:48293:48300  "uint128"
                let zero_t_uint128_1683 := zero_value_for_split_t_uint128()
                var__3665 := zero_t_uint128_1683

                /// @src 0:48319:48330  "marketState"
                let _1684_slot := 0x01
                let expr_3667_slot := _1684_slot
                /// @src 0:48331:48333  "id"
                let _1685 := var_id_3662
                let expr_3668 := _1685
                /// @src 0:48319:48334  "marketState[id]"
                let _1686 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3667_slot,expr_3668)
                let _1687_slot := _1686
                let expr_3669_slot := _1687_slot
                /// @src 0:48319:48354  "marketState[id].continuousFeeCredit"
                let _1688 := add(expr_3669_slot, 1)
                let _1689 := read_from_storage_split_offset_16_t_uint128(_1688)
                let expr_3670 := _1689
                /// @src 0:48312:48354  "return marketState[id].continuousFeeCredit"
                var__3665 := expr_3670
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function abi_encode_tuple_t_uint128_t_uint128_t_uint128__to_t_uint256_t_uint256_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_uint128_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint128_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint128_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            /// @ast-id 3383
            /// @src 0:44637:45528  "function _updatePosition(Market memory market, bytes32 id, address user)..."
            function fun__updatePosition_3383(var_market_3278_mpos, var_id_3280, var_user_3282) -> var__3285, var__3287, var__3289 {
                /// @src 0:44744:44751  "uint128"
                let zero_t_uint128_1690 := zero_value_for_split_t_uint128()
                var__3285 := zero_t_uint128_1690
                /// @src 0:44753:44760  "uint128"
                let zero_t_uint128_1691 := zero_value_for_split_t_uint128()
                var__3287 := zero_t_uint128_1691
                /// @src 0:44762:44769  "uint128"
                let zero_t_uint128_1692 := zero_value_for_split_t_uint128()
                var__3289 := zero_t_uint128_1692

                /// @src 0:44814:44822  "position"
                let _1693_slot := 0x00
                let expr_3294_slot := _1693_slot
                /// @src 0:44823:44825  "id"
                let _1694 := var_id_3280
                let expr_3295 := _1694
                /// @src 0:44814:44826  "position[id]"
                let _1695 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3294_slot,expr_3295)
                let _1696_slot := _1695
                let expr_3296_slot := _1696_slot
                /// @src 0:44827:44831  "user"
                let _1697 := var_user_3282
                let expr_3297 := _1697
                /// @src 0:44814:44832  "position[id][user]"
                let _1698 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3296_slot,expr_3297)
                let _1699_slot := _1698
                let expr_3298_slot := _1699_slot
                /// @src 0:44785:44832  "Position storage _position = position[id][user]"
                let var__position_3293_slot := convert_t_struct$_Position_$4255_storage_to_t_struct$_Position_$4255_storage_ptr(expr_3298_slot)
                /// @src 0:44926:44932  "market"
                let _1700_mpos := var_market_3278_mpos
                let expr_3307_mpos := _1700_mpos
                /// @src 0:44934:44936  "id"
                let _1701 := var_id_3280
                let expr_3308 := _1701
                /// @src 0:44938:44942  "user"
                let _1702 := var_user_3282
                let expr_3309 := _1702
                /// @src 0:44907:44943  "updatePositionView(market, id, user)"
                let expr_3310_component_1, expr_3310_component_2, expr_3310_component_3 := fun_updatePositionView_3235(expr_3307_mpos, expr_3308, expr_3309)
                /// @src 0:44842:44943  "(uint128 newCredit, uint128 newPendingFee, uint128 accruedFee) = updatePositionView(market, id, user)"
                let var_newCredit_3301 := expr_3310_component_1
                let var_newPendingFee_3303 := expr_3310_component_2
                let var_accruedFee_3305 := expr_3310_component_3
                /// @src 0:44979:44988  "_position"
                let _1703_slot := var__position_3293_slot
                let expr_3314_slot := _1703_slot
                /// @src 0:44979:44995  "_position.credit"
                let _1704 := add(expr_3314_slot, 0)
                let _1705 := read_from_storage_split_offset_0_t_uint128(_1704)
                let expr_3315 := _1705
                /// @src 0:44998:45007  "newCredit"
                let _1706 := var_newCredit_3301
                let expr_3316 := _1706
                /// @src 0:44979:45007  "_position.credit - newCredit"
                let expr_3317 := checked_sub_t_uint128(expr_3315, expr_3316)

                /// @src 0:44954:45007  "uint128 creditDecrease = _position.credit - newCredit"
                let var_creditDecrease_3313 := expr_3317
                /// @src 0:45046:45055  "_position"
                let _1707_slot := var__position_3293_slot
                let expr_3321_slot := _1707_slot
                /// @src 0:45046:45066  "_position.pendingFee"
                let _1708 := add(expr_3321_slot, 0)
                let _1709 := read_from_storage_split_offset_16_t_uint128(_1708)
                let expr_3322 := _1709
                /// @src 0:45069:45082  "newPendingFee"
                let _1710 := var_newPendingFee_3303
                let expr_3323 := _1710
                /// @src 0:45046:45082  "_position.pendingFee - newPendingFee"
                let expr_3324 := checked_sub_t_uint128(expr_3322, expr_3323)

                /// @src 0:45017:45082  "uint128 pendingFeeDecrease = _position.pendingFee - newPendingFee"
                let var_pendingFeeDecrease_3320 := expr_3324
                /// @src 0:45112:45121  "newCredit"
                let _1711 := var_newCredit_3301
                let expr_3329 := _1711
                /// @src 0:45093:45102  "_position"
                let _1712_slot := var__position_3293_slot
                let expr_3326_slot := _1712_slot
                /// @src 0:45093:45109  "_position.credit"
                let _1713 := add(expr_3326_slot, 0)
                /// @src 0:45093:45121  "_position.credit = newCredit"
                update_storage_value_offset_0_t_uint128_to_t_uint128(_1713, expr_3329)
                let expr_3330 := expr_3329
                /// @src 0:45158:45169  "marketState"
                let _1714_slot := 0x01
                let expr_3335_slot := _1714_slot
                /// @src 0:45170:45172  "id"
                let _1715 := var_id_3280
                let expr_3336 := _1715
                /// @src 0:45158:45173  "marketState[id]"
                let _1716 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3335_slot,expr_3336)
                let _1717_slot := _1716
                let expr_3337_slot := _1717_slot
                /// @src 0:45158:45184  "marketState[id].lossFactor"
                let _1718 := add(expr_3337_slot, 0)
                let _1719 := read_from_storage_split_offset_16_t_uint128(_1718)
                let expr_3338 := _1719
                /// @src 0:45131:45140  "_position"
                let _1720_slot := var__position_3293_slot
                let expr_3332_slot := _1720_slot
                /// @src 0:45131:45155  "_position.lastLossFactor"
                let _1721 := add(expr_3332_slot, 1)
                /// @src 0:45131:45184  "_position.lastLossFactor = marketState[id].lossFactor"
                update_storage_value_offset_0_t_uint128_to_t_uint128(_1721, expr_3338)
                let expr_3339 := expr_3338
                /// @src 0:45217:45230  "newPendingFee"
                let _1722 := var_newPendingFee_3303
                let expr_3344 := _1722
                /// @src 0:45194:45203  "_position"
                let _1723_slot := var__position_3293_slot
                let expr_3341_slot := _1723_slot
                /// @src 0:45194:45214  "_position.pendingFee"
                let _1724 := add(expr_3341_slot, 0)
                /// @src 0:45194:45230  "_position.pendingFee = newPendingFee"
                update_storage_value_offset_16_t_uint128_to_t_uint128(_1724, expr_3344)
                let expr_3345 := expr_3344
                /// @src 0:45272:45287  "block.timestamp"
                let expr_3353 := timestamp()
                /// @src 0:45264:45288  "uint128(block.timestamp)"
                let expr_3354 := convert_t_uint256_to_t_uint128(expr_3353)
                /// @src 0:45240:45249  "_position"
                let _1725_slot := var__position_3293_slot
                let expr_3347_slot := _1725_slot
                /// @src 0:45240:45261  "_position.lastAccrual"
                let _1726 := add(expr_3347_slot, 1)
                /// @src 0:45240:45288  "_position.lastAccrual = uint128(block.timestamp)"
                update_storage_value_offset_16_t_uint128_to_t_uint128(_1726, expr_3354)
                let expr_3355 := expr_3354
                /// @src 0:45337:45345  "UtilsLib"
                let expr_3361_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 0:45356:45366  "accruedFee"
                let _1727 := var_accruedFee_3305
                let expr_3363 := _1727
                /// @src 0:45337:45367  "UtilsLib.toUint128(accruedFee)"
                let _1728 := convert_t_uint128_to_t_uint256(expr_3363)
                let expr_3364 := fun_toUint128_5922(_1728)
                /// @src 0:45298:45309  "marketState"
                let _1729_slot := 0x01
                let expr_3357_slot := _1729_slot
                /// @src 0:45310:45312  "id"
                let _1730 := var_id_3280
                let expr_3358 := _1730
                /// @src 0:45298:45313  "marketState[id]"
                let _1731 := mapping_index_access_t_mapping$_t_bytes32_$_t_struct$_MarketState_$4238_storage_$_of_t_bytes32(expr_3357_slot,expr_3358)
                let _1732_slot := _1731
                let expr_3359_slot := _1732_slot
                /// @src 0:45298:45333  "marketState[id].continuousFeeCredit"
                let _1733 := add(expr_3359_slot, 1)
                /// @src 0:45298:45367  "marketState[id].continuousFeeCredit += UtilsLib.toUint128(accruedFee)"
                let _1734 := read_from_storage_split_offset_16_t_uint128(_1733)
                let expr_3365 := checked_add_t_uint128(_1734, expr_3364)

                update_storage_value_offset_16_t_uint128_to_t_uint128(_1733, expr_3365)
                /// @src 0:45383:45392  "EventsLib"
                let expr_3367_address := linkersymbol("deps/midnight/src/libraries/EventsLib.sol:EventsLib")
                /// @src 0:45408:45410  "id"
                let _1735 := var_id_3280
                let expr_3370 := _1735
                /// @src 0:45412:45416  "user"
                let _1736 := var_user_3282
                let expr_3371 := _1736
                /// @src 0:45418:45432  "creditDecrease"
                let _1737 := var_creditDecrease_3313
                let expr_3372 := _1737
                /// @src 0:45434:45452  "pendingFeeDecrease"
                let _1738 := var_pendingFeeDecrease_3320
                let expr_3373 := _1738
                /// @src 0:45454:45464  "accruedFee"
                let _1739 := var_accruedFee_3305
                let expr_3374 := _1739
                /// @src 0:45383:45465  "EventsLib.UpdatePosition(id, user, creditDecrease, pendingFeeDecrease, accruedFee)"
                let _1740 := 0x8fd212bc8fa18d807a9b47aa2de07104bf036cfcef8ea259157085a1b618a77c
                let _1741 := convert_t_bytes32_to_t_bytes32(expr_3370)
                let _1742 := convert_t_address_to_t_address(expr_3371)
                {
                    let _1743 := allocate_unbounded()
                    let _1744 := abi_encode_tuple_t_uint128_t_uint128_t_uint128__to_t_uint256_t_uint256_t_uint256__fromStack(_1743 , expr_3372, expr_3373, expr_3374)
                    log3(_1743, sub(_1744, _1743) , _1740, _1741, _1742)
                }/// @src 0:45484:45493  "newCredit"
                let _1745 := var_newCredit_3301
                let expr_3377 := _1745
                /// @src 0:45483:45521  "(newCredit, newPendingFee, accruedFee)"
                let expr_3380_component_1 := expr_3377
                /// @src 0:45495:45508  "newPendingFee"
                let _1746 := var_newPendingFee_3303
                let expr_3378 := _1746
                /// @src 0:45483:45521  "(newCredit, newPendingFee, accruedFee)"
                let expr_3380_component_2 := expr_3378
                /// @src 0:45510:45520  "accruedFee"
                let _1747 := var_accruedFee_3305
                let expr_3379 := _1747
                /// @src 0:45483:45521  "(newCredit, newPendingFee, accruedFee)"
                let expr_3380_component_3 := expr_3379
                /// @src 0:45476:45521  "return (newCredit, newPendingFee, accruedFee)"
                var__3285 := expr_3380_component_1
                var__3287 := expr_3380_component_2
                var__3289 := expr_3380_component_3
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 5987
            /// @src 12:1808:1950  "function msb(uint128 bitmap) internal pure returns (uint256 res) {..."
            function fun_msb_5987(var_bitmap_5980) -> var_res_5983 {
                /// @src 12:1860:1871  "uint256 res"
                let zero_t_uint256_1748 := zero_value_for_split_t_uint256()
                var_res_5983 := zero_t_uint256_1748

                /// @src 12:1883:1944  "assembly {..."
                {
                    var_res_5983 := sub(255, clz(var_bitmap_5980))
                }

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 5872
            /// @src 12:790:910  "function mulDivDown(uint256 x, uint256 y, uint256 d) internal pure returns (uint256) {..."
            function fun_mulDivDown_5872(var_x_5855, var_y_5857, var_d_5859) -> var__5862 {
                /// @src 12:866:873  "uint256"
                let zero_t_uint256_1749 := zero_value_for_split_t_uint256()
                var__5862 := zero_t_uint256_1749

                /// @src 12:893:894  "x"
                let _1750 := var_x_5855
                let expr_5864 := _1750
                /// @src 12:897:898  "y"
                let _1751 := var_y_5857
                let expr_5865 := _1751
                /// @src 12:893:898  "x * y"
                let expr_5866 := checked_mul_t_uint256(expr_5864, expr_5865)

                /// @src 12:892:899  "(x * y)"
                let expr_5867 := expr_5866
                /// @src 12:902:903  "d"
                let _1752 := var_d_5859
                let expr_5868 := _1752
                /// @src 12:892:903  "(x * y) / d"
                let expr_5869 := checked_div_t_uint256(expr_5867, expr_5868)

                /// @src 12:885:903  "return (x * y) / d"
                var__5862 := expr_5869
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function shift_left_t_uint256_t_uint256(value, bits) -> result {
                bits := cleanup_t_uint256(bits)
                result := cleanup_t_uint256(shift_left_dynamic(bits, cleanup_t_uint256(value)))
            }

            /// @ast-id 6030
            /// @src 12:2248:2438  "function clearBit(uint128 bitmap, uint256 bit) internal pure returns (uint128) {..."
            function fun_clearBit_6030(var_bitmap_6011, var_bit_6013) -> var__6016 {
                /// @src 12:2318:2325  "uint128"
                let zero_t_uint128_1753 := zero_value_for_split_t_uint128()
                var__6016 := zero_t_uint128_1753

                /// @src 12:2410:2416  "bitmap"
                let _1754 := var_bitmap_6011
                let expr_6020 := _1754
                /// @src 12:2421:2422  "1"
                let expr_6021 := 0x01
                /// @src 12:2426:2429  "bit"
                let _1755 := var_bit_6013
                let expr_6022 := _1755
                /// @src 12:2421:2429  "1 << bit"
                let _1756 := convert_t_rational_1_by_1_to_t_uint256(expr_6021)
                let expr_6023 :=
                shift_left_t_uint256_t_uint256(_1756, expr_6022)

                /// @src 12:2420:2430  "(1 << bit)"
                let expr_6024 := expr_6023
                /// @src 12:2419:2430  "~(1 << bit)"
                let expr_6025 := cleanup_t_uint256(not(expr_6024))
                /// @src 12:2410:2430  "bitmap & ~(1 << bit)"
                let expr_6026 := and(convert_t_uint128_to_t_uint256(expr_6020), expr_6025)

                /// @src 12:2402:2431  "uint128(bitmap & ~(1 << bit))"
                let expr_6027 := convert_t_uint256_to_t_uint128(expr_6026)
                /// @src 12:2395:2431  "return uint128(bitmap & ~(1 << bit))"
                var__6016 := expr_6027
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function abi_encode_tuple_t_bytes32_t_address_t_uint256__to_t_bytes32_t_address_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            /// @ast-id 6088
            /// @src 12:2990:3247  "function tGet(uint256 baseSlot, bytes32 key1, address key2) internal view returns (bool value) {..."
            function fun_tGet_6088(var_baseSlot_6063, var_key1_6065, var_key2_6067) -> var_value_6070 {
                /// @src 12:3073:3083  "bool value"
                let zero_t_bool_1757 := zero_value_for_split_t_bool()
                var_value_6070 := zero_t_bool_1757

                /// @src 12:3139:3143  "key1"
                let _1758 := var_key1_6065
                let expr_6079 := _1758
                /// @src 12:3145:3149  "key2"
                let _1759 := var_key2_6067
                let expr_6080 := _1759
                /// @src 12:3151:3159  "baseSlot"
                let _1760 := var_baseSlot_6063
                let expr_6081 := _1760
                /// @src 12:3128:3160  "abi.encode(key1, key2, baseSlot)"

                let expr_6082_mpos := allocate_unbounded()
                let _1761 := add(expr_6082_mpos, 0x20)

                let _1762 := abi_encode_tuple_t_bytes32_t_address_t_uint256__to_t_bytes32_t_address_t_uint256__fromStack(_1761, expr_6079, expr_6080, expr_6081)
                mstore(expr_6082_mpos, sub(_1762, add(expr_6082_mpos, 0x20)))
                finalize_allocation(expr_6082_mpos, sub(_1762, expr_6082_mpos))
                /// @src 12:3118:3161  "keccak256(abi.encode(key1, key2, baseSlot))"
                let expr_6083 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_6082_mpos), array_length_t_bytes_memory_ptr(expr_6082_mpos))
                /// @src 12:3110:3162  "uint256(keccak256(abi.encode(key1, key2, baseSlot)))"
                let expr_6084 := convert_t_bytes32_to_t_uint256(expr_6083)
                /// @src 12:3095:3162  "uint256 slot = uint256(keccak256(abi.encode(key1, key2, baseSlot)))"
                let var_slot_6073 := expr_6084
                /// @src 12:3172:3241  "assembly (\"memory-safe\") {..."
                {
                    var_value_6070 := tload(var_slot_6073)
                }

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function require_helper_t_error_5441_NoCode(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xf046a71400000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_5445_TransferReturnedFalse(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x2f0470fc00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 5503
            /// @src 10:286:777  "function safeTransfer(address token, address to, uint256 value) internal {..."
            function fun_safeTransfer_5503(var_token_5447, var_to_5449, var_value_5451) {

                /// @src 10:377:382  "token"
                let _1763 := var_token_5447
                let expr_5455 := _1763
                /// @src 10:377:394  "token.code.length"
                let expr_5457 := extcodesize(expr_5455)
                /// @src 10:397:398  "0"
                let expr_5458 := 0x00
                /// @src 10:377:398  "token.code.length > 0"
                let expr_5459 := gt(cleanup_t_uint256(expr_5457), convert_t_rational_0_by_1_to_t_uint256(expr_5458))
                /// @src 10:369:409  "require(token.code.length > 0, NoCode())"
                require_helper_t_error_5441_NoCode(expr_5459)
                /// @src 10:462:467  "token"
                let _1764 := var_token_5447
                let expr_5468 := _1764
                /// @src 10:462:472  "token.call"
                let expr_5469_address := expr_5468
                /// @src 10:506:508  "to"
                let _1765 := var_to_5449
                let expr_5474 := _1765
                /// @src 10:505:516  "(to, value)"
                let expr_5476_component_1 := expr_5474
                /// @src 10:510:515  "value"
                let _1766 := var_value_5451
                let expr_5475 := _1766
                /// @src 10:505:516  "(to, value)"
                let expr_5476_component_2 := expr_5475
                /// @src 10:473:517  "abi.encodeCall(IERC20.transfer, (to, value))"

                let expr_5477_mpos := allocate_unbounded()
                let _1767 := add(expr_5477_mpos, 0x20)

                mstore(_1767, 0xa9059cbb00000000000000000000000000000000000000000000000000000000)
                _1767 := add(_1767, 4)

                let _1768 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(_1767, expr_5474, expr_5475)
                mstore(expr_5477_mpos, sub(_1768, add(expr_5477_mpos, 0x20)))
                finalize_allocation(expr_5477_mpos, sub(_1768, expr_5477_mpos))
                /// @src 10:462:518  "token.call(abi.encodeCall(IERC20.transfer, (to, value)))"

                let _1769 := add(expr_5477_mpos, 0x20)
                let _1770 := mload(expr_5477_mpos)

                let expr_5478_component_1 := call(gas(), expr_5469_address,  0,  _1769, _1770, 0, 0)

                let expr_5478_component_2_mpos := extract_returndata()
                /// @src 10:420:518  "(bool success, bytes memory returndata) = token.call(abi.encodeCall(IERC20.transfer, (to, value)))"
                let var_success_5465 := expr_5478_component_1
                let var_returndata_5467_mpos := expr_5478_component_2_mpos
                /// @src 10:533:540  "success"
                let _1771 := var_success_5465
                let expr_5480 := _1771
                /// @src 10:532:540  "!success"
                let expr_5481 := cleanup_t_bool(iszero(expr_5480))
                /// @src 10:528:671  "if (!success) {..."
                if expr_5481 {
                    /// @src 10:556:661  "assembly (\"memory-safe\") {..."
                    {
                        revert(add(var_returndata_5467_mpos, 0x20), mload(var_returndata_5467_mpos))
                    }
                    /// @src 10:528:671  "if (!success) {..."
                }
                /// @src 10:688:698  "returndata"
                let _1772_mpos := var_returndata_5467_mpos
                let expr_5486_mpos := _1772_mpos
                /// @src 10:688:705  "returndata.length"
                let expr_5487 := array_length_t_bytes_memory_ptr(expr_5486_mpos)
                /// @src 10:709:710  "0"
                let expr_5488 := 0x00
                /// @src 10:688:710  "returndata.length == 0"
                let expr_5489 := eq(cleanup_t_uint256(expr_5487), convert_t_rational_0_by_1_to_t_uint256(expr_5488))
                /// @src 10:688:744  "returndata.length == 0 || abi.decode(returndata, (bool))"
                let expr_5497 := expr_5489
                if iszero(expr_5497) {
                    /// @src 10:725:735  "returndata"
                    let _1773_mpos := var_returndata_5467_mpos
                    let expr_5492_mpos := _1773_mpos
                    /// @src 10:714:744  "abi.decode(returndata, (bool))"

                    let expr_5496 :=  abi_decode_tuple_t_bool_fromMemory(add(expr_5492_mpos, 32), add(add(expr_5492_mpos, 32), array_length_t_bytes_memory_ptr(expr_5492_mpos)))
                    /// @src 10:688:744  "returndata.length == 0 || abi.decode(returndata, (bool))"
                    expr_5497 := expr_5496
                }
                /// @src 10:680:770  "require(returndata.length == 0 || abi.decode(returndata, (bool)), TransferReturnedFalse())"
                require_helper_t_error_5445_TransferReturnedFalse(expr_5497)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function cleanup_t_rational_385000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_385000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_385000000000000000_by_1(value)))
            }

            /// @src 7:1340:1374  "uint256 constant LLTV_0 = 0.385e18"
            function constant_LLTV_0_4993() -> ret {
                /// @src 7:1366:1374  "0.385e18"
                let expr_4992 := 0x0557cb75ce868000
                let _1776 := convert_t_rational_385000000000000000_by_1_to_t_uint256(expr_4992)

                ret := _1776
            }

            function cleanup_t_rational_625000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_625000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_625000000000000000_by_1(value)))
            }

            /// @src 7:1376:1410  "uint256 constant LLTV_1 = 0.625e18"
            function constant_LLTV_1_4996() -> ret {
                /// @src 7:1402:1410  "0.625e18"
                let expr_4995 := 0x08ac7230489e8000
                let _1778 := convert_t_rational_625000000000000000_by_1_to_t_uint256(expr_4995)

                ret := _1778
            }

            function cleanup_t_rational_770000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_770000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_770000000000000000_by_1(value)))
            }

            /// @src 7:1412:1445  "uint256 constant LLTV_2 = 0.77e18"
            function constant_LLTV_2_4999() -> ret {
                /// @src 7:1438:1445  "0.77e18"
                let expr_4998 := 0x0aaf96eb9d0d0000
                let _1780 := convert_t_rational_770000000000000000_by_1_to_t_uint256(expr_4998)

                ret := _1780
            }

            function cleanup_t_rational_860000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_860000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_860000000000000000_by_1(value)))
            }

            /// @src 7:1447:1480  "uint256 constant LLTV_3 = 0.86e18"
            function constant_LLTV_3_5002() -> ret {
                /// @src 7:1473:1480  "0.86e18"
                let expr_5001 := 0x0bef55718ad60000
                let _1782 := convert_t_rational_860000000000000000_by_1_to_t_uint256(expr_5001)

                ret := _1782
            }

            function cleanup_t_rational_915000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_915000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_915000000000000000_by_1(value)))
            }

            /// @src 7:1482:1516  "uint256 constant LLTV_4 = 0.915e18"
            function constant_LLTV_4_5005() -> ret {
                /// @src 7:1508:1516  "0.915e18"
                let expr_5004 := 0x0cb2bba6f17b8000
                let _1784 := convert_t_rational_915000000000000000_by_1_to_t_uint256(expr_5004)

                ret := _1784
            }

            function cleanup_t_rational_945000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_945000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_945000000000000000_by_1(value)))
            }

            /// @src 7:1518:1552  "uint256 constant LLTV_5 = 0.945e18"
            function constant_LLTV_5_5008() -> ret {
                /// @src 7:1544:1552  "0.945e18"
                let expr_5007 := 0x0d1d507e40be8000
                let _1786 := convert_t_rational_945000000000000000_by_1_to_t_uint256(expr_5007)

                ret := _1786
            }

            function cleanup_t_rational_965000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_965000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_965000000000000000_by_1(value)))
            }

            /// @src 7:1554:1588  "uint256 constant LLTV_6 = 0.965e18"
            function constant_LLTV_6_5011() -> ret {
                /// @src 7:1580:1588  "0.965e18"
                let expr_5010 := 0x0d645e6320408000
                let _1788 := convert_t_rational_965000000000000000_by_1_to_t_uint256(expr_5010)

                ret := _1788
            }

            function cleanup_t_rational_980000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_980000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_980000000000000000_by_1(value)))
            }

            /// @src 7:1590:1623  "uint256 constant LLTV_7 = 0.98e18"
            function constant_LLTV_7_5014() -> ret {
                /// @src 7:1616:1623  "0.98e18"
                let expr_5013 := 0x0d99a8cec7e20000
                let _1790 := convert_t_rational_980000000000000000_by_1_to_t_uint256(expr_5013)

                ret := _1790
            }

            /// @src 7:1625:1655  "uint256 constant LLTV_8 = 1e18"
            function constant_LLTV_8_5017() -> ret {
                /// @src 7:1651:1655  "1e18"
                let expr_5016 := 0x0de0b6b3a7640000
                let _1792 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_5016)

                ret := _1792
            }

            /// @ast-id 5062
            /// @src 7:1722:1953  "function isLltvAllowed(uint256 lltv) pure returns (bool) {..."
            function fun_isLltvAllowed_5062(var_lltv_5020) -> var__5023 {
                /// @src 7:1773:1777  "bool"
                let zero_t_bool_1774 := zero_value_for_split_t_bool()
                var__5023 := zero_t_bool_1774

                /// @src 7:1792:1796  "lltv"
                let _1775 := var_lltv_5020
                let expr_5025 := _1775
                /// @src 7:1800:1806  "LLTV_0"
                let expr_5026 := constant_LLTV_0_4993()
                /// @src 7:1792:1806  "lltv == LLTV_0"
                let expr_5027 := eq(cleanup_t_uint256(expr_5025), cleanup_t_uint256(expr_5026))
                /// @src 7:1792:1824  "lltv == LLTV_0 || lltv == LLTV_1"
                let expr_5031 := expr_5027
                if iszero(expr_5031) {
                    /// @src 7:1810:1814  "lltv"
                    let _1777 := var_lltv_5020
                    let expr_5028 := _1777
                    /// @src 7:1818:1824  "LLTV_1"
                    let expr_5029 := constant_LLTV_1_4996()
                    /// @src 7:1810:1824  "lltv == LLTV_1"
                    let expr_5030 := eq(cleanup_t_uint256(expr_5028), cleanup_t_uint256(expr_5029))
                    /// @src 7:1792:1824  "lltv == LLTV_0 || lltv == LLTV_1"
                    expr_5031 := expr_5030
                }
                /// @src 7:1792:1842  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2"
                let expr_5035 := expr_5031
                if iszero(expr_5035) {
                    /// @src 7:1828:1832  "lltv"
                    let _1779 := var_lltv_5020
                    let expr_5032 := _1779
                    /// @src 7:1836:1842  "LLTV_2"
                    let expr_5033 := constant_LLTV_2_4999()
                    /// @src 7:1828:1842  "lltv == LLTV_2"
                    let expr_5034 := eq(cleanup_t_uint256(expr_5032), cleanup_t_uint256(expr_5033))
                    /// @src 7:1792:1842  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2"
                    expr_5035 := expr_5034
                }
                /// @src 7:1792:1860  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3"
                let expr_5039 := expr_5035
                if iszero(expr_5039) {
                    /// @src 7:1846:1850  "lltv"
                    let _1781 := var_lltv_5020
                    let expr_5036 := _1781
                    /// @src 7:1854:1860  "LLTV_3"
                    let expr_5037 := constant_LLTV_3_5002()
                    /// @src 7:1846:1860  "lltv == LLTV_3"
                    let expr_5038 := eq(cleanup_t_uint256(expr_5036), cleanup_t_uint256(expr_5037))
                    /// @src 7:1792:1860  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3"
                    expr_5039 := expr_5038
                }
                /// @src 7:1792:1878  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4"
                let expr_5043 := expr_5039
                if iszero(expr_5043) {
                    /// @src 7:1864:1868  "lltv"
                    let _1783 := var_lltv_5020
                    let expr_5040 := _1783
                    /// @src 7:1872:1878  "LLTV_4"
                    let expr_5041 := constant_LLTV_4_5005()
                    /// @src 7:1864:1878  "lltv == LLTV_4"
                    let expr_5042 := eq(cleanup_t_uint256(expr_5040), cleanup_t_uint256(expr_5041))
                    /// @src 7:1792:1878  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4"
                    expr_5043 := expr_5042
                }
                /// @src 7:1792:1896  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4 || lltv == LLTV_5"
                let expr_5047 := expr_5043
                if iszero(expr_5047) {
                    /// @src 7:1882:1886  "lltv"
                    let _1785 := var_lltv_5020
                    let expr_5044 := _1785
                    /// @src 7:1890:1896  "LLTV_5"
                    let expr_5045 := constant_LLTV_5_5008()
                    /// @src 7:1882:1896  "lltv == LLTV_5"
                    let expr_5046 := eq(cleanup_t_uint256(expr_5044), cleanup_t_uint256(expr_5045))
                    /// @src 7:1792:1896  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4 || lltv == LLTV_5"
                    expr_5047 := expr_5046
                }
                /// @src 7:1792:1914  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4 || lltv == LLTV_5 || lltv == LLTV_6"
                let expr_5051 := expr_5047
                if iszero(expr_5051) {
                    /// @src 7:1900:1904  "lltv"
                    let _1787 := var_lltv_5020
                    let expr_5048 := _1787
                    /// @src 7:1908:1914  "LLTV_6"
                    let expr_5049 := constant_LLTV_6_5011()
                    /// @src 7:1900:1914  "lltv == LLTV_6"
                    let expr_5050 := eq(cleanup_t_uint256(expr_5048), cleanup_t_uint256(expr_5049))
                    /// @src 7:1792:1914  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4 || lltv == LLTV_5 || lltv == LLTV_6"
                    expr_5051 := expr_5050
                }
                /// @src 7:1792:1932  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4 || lltv == LLTV_5 || lltv == LLTV_6 || lltv == LLTV_7"
                let expr_5055 := expr_5051
                if iszero(expr_5055) {
                    /// @src 7:1918:1922  "lltv"
                    let _1789 := var_lltv_5020
                    let expr_5052 := _1789
                    /// @src 7:1926:1932  "LLTV_7"
                    let expr_5053 := constant_LLTV_7_5014()
                    /// @src 7:1918:1932  "lltv == LLTV_7"
                    let expr_5054 := eq(cleanup_t_uint256(expr_5052), cleanup_t_uint256(expr_5053))
                    /// @src 7:1792:1932  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4 || lltv == LLTV_5 || lltv == LLTV_6 || lltv == LLTV_7"
                    expr_5055 := expr_5054
                }
                /// @src 7:1792:1950  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4 || lltv == LLTV_5 || lltv == LLTV_6 || lltv == LLTV_7 || lltv == LLTV_8"
                let expr_5059 := expr_5055
                if iszero(expr_5059) {
                    /// @src 7:1936:1940  "lltv"
                    let _1791 := var_lltv_5020
                    let expr_5056 := _1791
                    /// @src 7:1944:1950  "LLTV_8"
                    let expr_5057 := constant_LLTV_8_5017()
                    /// @src 7:1936:1950  "lltv == LLTV_8"
                    let expr_5058 := eq(cleanup_t_uint256(expr_5056), cleanup_t_uint256(expr_5057))
                    /// @src 7:1792:1950  "lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4 || lltv == LLTV_5 || lltv == LLTV_6 || lltv == LLTV_7 || lltv == LLTV_8"
                    expr_5059 := expr_5058
                }
                /// @src 7:1785:1950  "return lltv == LLTV_0 || lltv == LLTV_1 || lltv == LLTV_2 || lltv == LLTV_3 || lltv == LLTV_4 || lltv == LLTV_5 || lltv == LLTV_6 || lltv == LLTV_7 || lltv == LLTV_8"
                var__5023 := expr_5059
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 5109
            /// @src 7:2359:2525  "function maxLif(uint256 lltv, uint256 cursor) pure returns (uint256) {..."
            function fun_maxLif_5109(var_lltv_5085, var_cursor_5087) -> var__5090 {
                /// @src 7:2419:2426  "uint256"
                let zero_t_uint256_1793 := zero_value_for_split_t_uint256()
                var__5090 := zero_t_uint256_1793

                /// @src 7:2441:2449  "UtilsLib"
                let expr_5092_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 7:2461:2464  "WAD"
                let expr_5094 := constant_WAD_4917()
                /// @src 7:2466:2469  "WAD"
                let expr_5095 := constant_WAD_4917()
                /// @src 7:2471:2474  "WAD"
                let expr_5096 := constant_WAD_4917()
                /// @src 7:2477:2485  "UtilsLib"
                let expr_5097_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 7:2497:2503  "cursor"
                let _1794 := var_cursor_5087
                let expr_5099 := _1794
                /// @src 7:2505:2508  "WAD"
                let expr_5100 := constant_WAD_4917()
                /// @src 7:2511:2515  "lltv"
                let _1795 := var_lltv_5085
                let expr_5101 := _1795
                /// @src 7:2505:2515  "WAD - lltv"
                let expr_5102 := checked_sub_t_uint256(expr_5100, expr_5101)

                /// @src 7:2517:2520  "WAD"
                let expr_5103 := constant_WAD_4917()
                /// @src 7:2477:2521  "UtilsLib.mulDivDown(cursor, WAD - lltv, WAD)"
                let expr_5104 := fun_mulDivDown_5872(expr_5099, expr_5102, expr_5103)
                /// @src 7:2471:2521  "WAD - UtilsLib.mulDivDown(cursor, WAD - lltv, WAD)"
                let expr_5105 := checked_sub_t_uint256(expr_5096, expr_5104)

                /// @src 7:2441:2522  "UtilsLib.mulDivDown(WAD, WAD, WAD - UtilsLib.mulDivDown(cursor, WAD - lltv, WAD))"
                let expr_5106 := fun_mulDivDown_5872(expr_5094, expr_5095, expr_5105)
                /// @src 7:2434:2522  "return UtilsLib.mulDivDown(WAD, WAD, WAD - UtilsLib.mulDivDown(cursor, WAD - lltv, WAD))"
                var__5090 := expr_5106
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := round_up_to_mul_of_32(length)

                // add length slot
                size := add(size, 0x20)

            }

            function allocate_memory_array_t_string_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_string_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

                mstore(memPtr, length)

            }

            function store_literal_in_memory_a55ffd6cc2b0b507f8827f3c680fa2adb9285b64bf7fb098798ce57c2156693f(memPtr) {

                mstore(add(memPtr, 0), 0x600b380380600b5f395ff3000000000000000000000000000000000000000000)

            }

            function copy_literal_to_memory_a55ffd6cc2b0b507f8827f3c680fa2adb9285b64bf7fb098798ce57c2156693f() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(11)
                store_literal_in_memory_a55ffd6cc2b0b507f8827f3c680fa2adb9285b64bf7fb098798ce57c2156693f(add(memPtr, 32))
            }

            function convert_t_stringliteral_a55ffd6cc2b0b507f8827f3c680fa2adb9285b64bf7fb098798ce57c2156693f_to_t_bytes_memory_ptr() -> converted {
                converted := copy_literal_to_memory_a55ffd6cc2b0b507f8827f3c680fa2adb9285b64bf7fb098798ce57c2156693f()
            }

            /// @src 9:1135:1194  "bytes constant SSTORE2_PREFIX = hex\"600b380380600b5f395ff3\""
            function constant_SSTORE2_PREFIX_5364() -> ret_mpos {
                /// @src 9:1167:1194  "hex\"600b380380600b5f395ff3\""
                let _1797_mpos := convert_t_stringliteral_a55ffd6cc2b0b507f8827f3c680fa2adb9285b64bf7fb098798ce57c2156693f_to_t_bytes_memory_ptr()

                ret_mpos := _1797_mpos
            }

            function abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(value, pos) -> end {
                let length := array_length_t_bytes_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length)
                copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
                end := add(pos, length)
            }

            function abi_encode_tuple_packed_t_bytes_memory_ptr_t_bytes_memory_ptr__to_t_bytes_memory_ptr_t_bytes_memory_ptr__nonPadded_inplace_fromStack(pos , value0, value1) -> end {

                pos := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(value0,  pos)

                pos := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(value1,  pos)

                end := pos
            }

            function require_helper_t_error_5360_SStore2DeploymentFailed(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x8365997e00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 5434
            /// @src 9:1635:2049  "function storeInCode(Market memory market, uint256 chainId) internal returns (address create2Address) {..."
            function fun_storeInCode_5434(var_market_5403_mpos, var_chainId_5405) -> var_create2Address_5408 {
                /// @src 9:1713:1735  "address create2Address"
                let zero_t_address_1796 := zero_value_for_split_t_address()
                var_create2Address_5408 := zero_t_address_1796

                /// @src 9:1792:1806  "SSTORE2_PREFIX"
                let expr_5414_mpos := constant_SSTORE2_PREFIX_5364()
                /// @src 9:1819:1825  "market"
                let _1798_mpos := var_market_5403_mpos
                let expr_5417_mpos := _1798_mpos
                /// @src 9:1808:1826  "abi.encode(market)"

                let expr_5418_mpos := allocate_unbounded()
                let _1799 := add(expr_5418_mpos, 0x20)

                let _1800 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(_1799, expr_5417_mpos)
                mstore(expr_5418_mpos, sub(_1800, add(expr_5418_mpos, 0x20)))
                finalize_allocation(expr_5418_mpos, sub(_1800, expr_5418_mpos))
                /// @src 9:1775:1827  "abi.encodePacked(SSTORE2_PREFIX, abi.encode(market))"

                let expr_5419_mpos := allocate_unbounded()
                let _1801 := add(expr_5419_mpos, 0x20)

                let _1802 := abi_encode_tuple_packed_t_bytes_memory_ptr_t_bytes_memory_ptr__to_t_bytes_memory_ptr_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_1801, expr_5414_mpos, expr_5418_mpos)
                mstore(expr_5419_mpos, sub(_1802, add(expr_5419_mpos, 0x20)))
                finalize_allocation(expr_5419_mpos, sub(_1802, expr_5419_mpos))
                /// @src 9:1747:1827  "bytes memory creationCode = abi.encodePacked(SSTORE2_PREFIX, abi.encode(market))"
                let var_creationCode_5411_mpos := expr_5419_mpos
                /// @src 9:1837:1969  "assembly (\"memory-safe\") {..."
                {
                    var_create2Address_5408 := create2(0, add(var_creationCode_5411_mpos, 0x20), mload(var_creationCode_5411_mpos), var_chainId_5405)
                }
                /// @src 9:1986:2000  "create2Address"
                let _1803 := var_create2Address_5408
                let expr_5423 := _1803
                /// @src 9:2012:2013  "0"
                let expr_5426 := 0x00
                /// @src 9:2004:2014  "address(0)"
                let expr_5427 := convert_t_rational_0_by_1_to_t_address(expr_5426)
                /// @src 9:1986:2014  "create2Address != address(0)"
                let expr_5428 := iszero(eq(cleanup_t_address(expr_5423), cleanup_t_address(expr_5427)))
                /// @src 9:1978:2042  "require(create2Address != address(0), SStore2DeploymentFailed())"
                require_helper_t_error_5360_SStore2DeploymentFailed(expr_5428)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function cleanup_t_rational_255_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_255_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(identity(cleanup_t_rational_255_by_1(value)))
            }

            function shift_left_248(value) -> newValue {
                newValue :=

                shl(248, value)

            }

            function leftAlign_t_uint8(value) -> aligned {
                aligned := shift_left_248(value)
            }

            function abi_encode_t_uint8_to_t_uint8_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_uint8(cleanup_t_uint8(value)))
            }

            function leftAlign_t_uint160(value) -> aligned {
                aligned := shift_left_96(value)
            }

            function leftAlign_t_address(value) -> aligned {
                aligned := leftAlign_t_uint160(value)
            }

            function abi_encode_t_address_to_t_address_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_address(cleanup_t_address(value)))
            }

            function leftAlign_t_uint256(value) -> aligned {
                aligned := value
            }

            function abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_uint256(cleanup_t_uint256(value)))
            }

            function leftAlign_t_bytes32(value) -> aligned {
                aligned := value
            }

            function abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_bytes32(cleanup_t_bytes32(value)))
            }

            function abi_encode_tuple_packed_t_uint8_t_address_t_uint256_t_bytes32__to_t_uint8_t_address_t_uint256_t_bytes32__nonPadded_inplace_fromStack(pos , value0, value1, value2, value3) -> end {

                abi_encode_t_uint8_to_t_uint8_nonPadded_inplace_fromStack(value0,  pos)
                pos := add(pos, 1)

                abi_encode_t_address_to_t_address_nonPadded_inplace_fromStack(value1,  pos)
                pos := add(pos, 20)

                abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value2,  pos)
                pos := add(pos, 32)

                abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value3,  pos)
                pos := add(pos, 32)

                end := pos
            }

            /// @ast-id 5399
            /// @src 9:1201:1504  "function toId(Market memory market, uint256 chainId, address midnight) internal pure returns (bytes32) {..."
            function fun_toId_5399(var_market_5367_mpos, var_chainId_5369, var_midnight_5371) -> var__5374 {
                /// @src 9:1295:1302  "bytes32"
                let zero_t_bytes32_1804 := zero_value_for_split_t_bytes32()
                var__5374 := zero_t_bytes32_1804

                /// @src 9:1384:1388  "0xff"
                let expr_5381 := 0xff
                /// @src 9:1378:1389  "uint8(0xff)"
                let expr_5382 := convert_t_rational_255_by_1_to_t_uint8(expr_5381)
                /// @src 9:1391:1399  "midnight"
                let _1805 := var_midnight_5371
                let expr_5383 := _1805
                /// @src 9:1401:1408  "chainId"
                let _1806 := var_chainId_5369
                let expr_5384 := _1806
                /// @src 9:1437:1451  "SSTORE2_PREFIX"
                let expr_5388_mpos := constant_SSTORE2_PREFIX_5364()
                /// @src 9:1464:1470  "market"
                let _1807_mpos := var_market_5367_mpos
                let expr_5391_mpos := _1807_mpos
                /// @src 9:1453:1471  "abi.encode(market)"

                let expr_5392_mpos := allocate_unbounded()
                let _1808 := add(expr_5392_mpos, 0x20)

                let _1809 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(_1808, expr_5391_mpos)
                mstore(expr_5392_mpos, sub(_1809, add(expr_5392_mpos, 0x20)))
                finalize_allocation(expr_5392_mpos, sub(_1809, expr_5392_mpos))
                /// @src 9:1420:1472  "abi.encodePacked(SSTORE2_PREFIX, abi.encode(market))"

                let expr_5393_mpos := allocate_unbounded()
                let _1810 := add(expr_5393_mpos, 0x20)

                let _1811 := abi_encode_tuple_packed_t_bytes_memory_ptr_t_bytes_memory_ptr__to_t_bytes_memory_ptr_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_1810, expr_5388_mpos, expr_5392_mpos)
                mstore(expr_5393_mpos, sub(_1811, add(expr_5393_mpos, 0x20)))
                finalize_allocation(expr_5393_mpos, sub(_1811, expr_5393_mpos))
                /// @src 9:1410:1473  "keccak256(abi.encodePacked(SSTORE2_PREFIX, abi.encode(market)))"
                let expr_5394 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_5393_mpos), array_length_t_bytes_memory_ptr(expr_5393_mpos))
                /// @src 9:1344:1487  "abi.encodePacked(..."

                let expr_5395_mpos := allocate_unbounded()
                let _1812 := add(expr_5395_mpos, 0x20)

                let _1813 := abi_encode_tuple_packed_t_uint8_t_address_t_uint256_t_bytes32__to_t_uint8_t_address_t_uint256_t_bytes32__nonPadded_inplace_fromStack(_1812, expr_5382, expr_5383, expr_5384, expr_5394)
                mstore(expr_5395_mpos, sub(_1813, add(expr_5395_mpos, 0x20)))
                finalize_allocation(expr_5395_mpos, sub(_1813, expr_5395_mpos))
                /// @src 9:1321:1497  "keccak256(..."
                let expr_5396 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_5395_mpos), array_length_t_bytes_memory_ptr(expr_5395_mpos))
                /// @src 9:1314:1497  "return keccak256(..."
                var__5374 := expr_5396
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function require_helper_t_error_5817_CastOverflow(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xe58d471800000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 5922
            /// @src 12:1095:1342  "function toUint128(uint256 x) internal pure returns (uint128) {..."
            function fun_toUint128_5922(var_x_5899) -> var__5902 {
                /// @src 12:1148:1155  "uint128"
                let zero_t_uint128_1814 := zero_value_for_split_t_uint128()
                var__5902 := zero_t_uint128_1814

                /// @src 12:1175:1176  "x"
                let _1815 := var_x_5899
                let expr_5905 := _1815
                /// @src 12:1180:1197  "type(uint128).max"
                let expr_5910 := 0xffffffffffffffffffffffffffffffff
                /// @src 12:1175:1197  "x <= type(uint128).max"
                let expr_5911 := iszero(gt(cleanup_t_uint256(expr_5905), convert_t_uint128_to_t_uint256(expr_5910)))
                /// @src 12:1167:1214  "require(x <= type(uint128).max, CastOverflow())"
                require_helper_t_error_5817_CastOverflow(expr_5911)
                /// @src 12:1333:1334  "x"
                let _1816 := var_x_5899
                let expr_5918 := _1816
                /// @src 12:1325:1335  "uint128(x)"
                let expr_5919 := convert_t_uint256_to_t_uint128(expr_5918)
                /// @src 12:1318:1335  "return uint128(x)"
                var__5902 := expr_5919
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            function require_helper_t_error_5443_TransferFromReturnedFalse(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x1eded19c00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 5564
            /// @src 10:783:1306  "function safeTransferFrom(address token, address from, address to, uint256 value) internal {..."
            function fun_safeTransferFrom_5564(var_token_5505, var_from_5507, var_to_5509, var_value_5511) {

                /// @src 10:892:897  "token"
                let _1817 := var_token_5505
                let expr_5515 := _1817
                /// @src 10:892:909  "token.code.length"
                let expr_5517 := extcodesize(expr_5515)
                /// @src 10:912:913  "0"
                let expr_5518 := 0x00
                /// @src 10:892:913  "token.code.length > 0"
                let expr_5519 := gt(cleanup_t_uint256(expr_5517), convert_t_rational_0_by_1_to_t_uint256(expr_5518))
                /// @src 10:884:924  "require(token.code.length > 0, NoCode())"
                require_helper_t_error_5441_NoCode(expr_5519)
                /// @src 10:977:982  "token"
                let _1818 := var_token_5505
                let expr_5528 := _1818
                /// @src 10:977:987  "token.call"
                let expr_5529_address := expr_5528
                /// @src 10:1025:1029  "from"
                let _1819 := var_from_5507
                let expr_5534 := _1819
                /// @src 10:1024:1041  "(from, to, value)"
                let expr_5537_component_1 := expr_5534
                /// @src 10:1031:1033  "to"
                let _1820 := var_to_5509
                let expr_5535 := _1820
                /// @src 10:1024:1041  "(from, to, value)"
                let expr_5537_component_2 := expr_5535
                /// @src 10:1035:1040  "value"
                let _1821 := var_value_5511
                let expr_5536 := _1821
                /// @src 10:1024:1041  "(from, to, value)"
                let expr_5537_component_3 := expr_5536
                /// @src 10:988:1042  "abi.encodeCall(IERC20.transferFrom, (from, to, value))"

                let expr_5538_mpos := allocate_unbounded()
                let _1822 := add(expr_5538_mpos, 0x20)

                mstore(_1822, 0x23b872dd00000000000000000000000000000000000000000000000000000000)
                _1822 := add(_1822, 4)

                let _1823 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(_1822, expr_5534, expr_5535, expr_5536)
                mstore(expr_5538_mpos, sub(_1823, add(expr_5538_mpos, 0x20)))
                finalize_allocation(expr_5538_mpos, sub(_1823, expr_5538_mpos))
                /// @src 10:977:1043  "token.call(abi.encodeCall(IERC20.transferFrom, (from, to, value)))"

                let _1824 := add(expr_5538_mpos, 0x20)
                let _1825 := mload(expr_5538_mpos)

                let expr_5539_component_1 := call(gas(), expr_5529_address,  0,  _1824, _1825, 0, 0)

                let expr_5539_component_2_mpos := extract_returndata()
                /// @src 10:935:1043  "(bool success, bytes memory returndata) = token.call(abi.encodeCall(IERC20.transferFrom, (from, to, value)))"
                let var_success_5525 := expr_5539_component_1
                let var_returndata_5527_mpos := expr_5539_component_2_mpos
                /// @src 10:1058:1065  "success"
                let _1826 := var_success_5525
                let expr_5541 := _1826
                /// @src 10:1057:1065  "!success"
                let expr_5542 := cleanup_t_bool(iszero(expr_5541))
                /// @src 10:1053:1196  "if (!success) {..."
                if expr_5542 {
                    /// @src 10:1081:1186  "assembly (\"memory-safe\") {..."
                    {
                        revert(add(var_returndata_5527_mpos, 0x20), mload(var_returndata_5527_mpos))
                    }
                    /// @src 10:1053:1196  "if (!success) {..."
                }
                /// @src 10:1213:1223  "returndata"
                let _1827_mpos := var_returndata_5527_mpos
                let expr_5547_mpos := _1827_mpos
                /// @src 10:1213:1230  "returndata.length"
                let expr_5548 := array_length_t_bytes_memory_ptr(expr_5547_mpos)
                /// @src 10:1234:1235  "0"
                let expr_5549 := 0x00
                /// @src 10:1213:1235  "returndata.length == 0"
                let expr_5550 := eq(cleanup_t_uint256(expr_5548), convert_t_rational_0_by_1_to_t_uint256(expr_5549))
                /// @src 10:1213:1269  "returndata.length == 0 || abi.decode(returndata, (bool))"
                let expr_5558 := expr_5550
                if iszero(expr_5558) {
                    /// @src 10:1250:1260  "returndata"
                    let _1828_mpos := var_returndata_5527_mpos
                    let expr_5553_mpos := _1828_mpos
                    /// @src 10:1239:1269  "abi.decode(returndata, (bool))"

                    let expr_5557 :=  abi_decode_tuple_t_bool_fromMemory(add(expr_5553_mpos, 32), add(add(expr_5553_mpos, 32), array_length_t_bytes_memory_ptr(expr_5553_mpos)))
                    /// @src 10:1213:1269  "returndata.length == 0 || abi.decode(returndata, (bool))"
                    expr_5558 := expr_5557
                }
                /// @src 10:1205:1299  "require(returndata.length == 0 || abi.decode(returndata, (bool)), TransferFromReturnedFalse())"
                require_helper_t_error_5443_TransferFromReturnedFalse(expr_5558)

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 5897
            /// @src 12:961:1089  "function mulDivUp(uint256 x, uint256 y, uint256 d) internal pure returns (uint256) {..."
            function fun_mulDivUp_5897(var_x_5875, var_y_5877, var_d_5879) -> var__5882 {
                /// @src 12:1035:1042  "uint256"
                let zero_t_uint256_1829 := zero_value_for_split_t_uint256()
                var__5882 := zero_t_uint256_1829

                /// @src 12:1062:1063  "x"
                let _1830 := var_x_5875
                let expr_5884 := _1830
                /// @src 12:1066:1067  "y"
                let _1831 := var_y_5877
                let expr_5885 := _1831
                /// @src 12:1062:1067  "x * y"
                let expr_5886 := checked_mul_t_uint256(expr_5884, expr_5885)

                /// @src 12:1071:1072  "d"
                let _1832 := var_d_5879
                let expr_5887 := _1832
                /// @src 12:1075:1076  "1"
                let expr_5888 := 0x01
                /// @src 12:1071:1076  "d - 1"
                let expr_5889 := checked_sub_t_uint256(expr_5887, convert_t_rational_1_by_1_to_t_uint256(expr_5888))

                /// @src 12:1070:1077  "(d - 1)"
                let expr_5890 := expr_5889
                /// @src 12:1062:1077  "x * y + (d - 1)"
                let expr_5891 := checked_add_t_uint256(expr_5886, expr_5890)

                /// @src 12:1061:1078  "(x * y + (d - 1))"
                let expr_5892 := expr_5891
                /// @src 12:1081:1082  "d"
                let _1833 := var_d_5879
                let expr_5893 := _1833
                /// @src 12:1061:1082  "(x * y + (d - 1)) / d"
                let expr_5894 := checked_div_t_uint256(expr_5892, expr_5893)

                /// @src 12:1054:1082  "return (x * y + (d - 1)) / d"
                var__5882 := expr_5894
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 5841
            /// @src 12:420:575  "function min(uint256 x, uint256 y) internal pure returns (uint256 z) {..."
            function fun_min_5841(var_x_5832, var_y_5834) -> var_z_5837 {
                /// @src 12:478:487  "uint256 z"
                let zero_t_uint256_1834 := zero_value_for_split_t_uint256()
                var_z_5837 := zero_t_uint256_1834

                /// @src 12:499:569  "assembly {..."
                {
                    var_z_5837 := xor(var_x_5832, mul(xor(var_x_5832, var_y_5834), lt(var_y_5834, var_x_5832)))
                }

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function array_allocation_size_t_array$_t_uint256_$7_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

            }

            function allocate_memory_array_t_array$_t_uint256_$7_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_array$_t_uint256_$7_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

            }

            function cleanup_t_rational_14000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_14000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_14000000000000_by_1(value)))
            }

            /// @src 7:282:338  "uint256 constant MAX_SETTLEMENT_FEE_0_DAYS = 0.000014e18"
            function constant_MAX_SETTLEMENT_FEE_0_DAYS_4926() -> ret {
                /// @src 7:327:338  "0.000014e18"
                let expr_4925 := 0x0cbba106e000
                let _1836 := convert_t_rational_14000000000000_by_1_to_t_uint256(expr_4925)

                ret := _1836
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

            /// @src 7:340:395  "uint256 constant MAX_SETTLEMENT_FEE_1_DAY = 0.000014e18"
            function constant_MAX_SETTLEMENT_FEE_1_DAY_4929() -> ret {
                /// @src 7:384:395  "0.000014e18"
                let expr_4928 := 0x0cbba106e000
                let _1837 := convert_t_rational_14000000000000_by_1_to_t_uint256(expr_4928)

                ret := _1837
            }

            function cleanup_t_rational_98000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_98000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_98000000000000_by_1(value)))
            }

            /// @src 7:397:453  "uint256 constant MAX_SETTLEMENT_FEE_7_DAYS = 0.000098e18"
            function constant_MAX_SETTLEMENT_FEE_7_DAYS_4932() -> ret {
                /// @src 7:442:453  "0.000098e18"
                let expr_4931 := 0x592167302000
                let _1838 := convert_t_rational_98000000000000_by_1_to_t_uint256(expr_4931)

                ret := _1838
            }

            function cleanup_t_rational_417000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_417000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_417000000000000_by_1(value)))
            }

            /// @src 7:455:512  "uint256 constant MAX_SETTLEMENT_FEE_30_DAYS = 0.000417e18"
            function constant_MAX_SETTLEMENT_FEE_30_DAYS_4935() -> ret {
                /// @src 7:501:512  "0.000417e18"
                let expr_4934 := 0x017b4260df1000
                let _1839 := convert_t_rational_417000000000000_by_1_to_t_uint256(expr_4934)

                ret := _1839
            }

            function cleanup_t_rational_1250000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1250000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1250000000000000_by_1(value)))
            }

            /// @src 7:514:570  "uint256 constant MAX_SETTLEMENT_FEE_90_DAYS = 0.00125e18"
            function constant_MAX_SETTLEMENT_FEE_90_DAYS_4938() -> ret {
                /// @src 7:560:570  "0.00125e18"
                let expr_4937 := 0x0470de4df82000
                let _1840 := convert_t_rational_1250000000000000_by_1_to_t_uint256(expr_4937)

                ret := _1840
            }

            function cleanup_t_rational_2500000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_2500000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_2500000000000000_by_1(value)))
            }

            /// @src 7:572:628  "uint256 constant MAX_SETTLEMENT_FEE_180_DAYS = 0.0025e18"
            function constant_MAX_SETTLEMENT_FEE_180_DAYS_4941() -> ret {
                /// @src 7:619:628  "0.0025e18"
                let expr_4940 := 0x08e1bc9bf04000
                let _1841 := convert_t_rational_2500000000000000_by_1_to_t_uint256(expr_4940)

                ret := _1841
            }

            function cleanup_t_rational_5000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_5000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_5000000000000000_by_1(value)))
            }

            /// @src 7:630:685  "uint256 constant MAX_SETTLEMENT_FEE_360_DAYS = 0.005e18"
            function constant_MAX_SETTLEMENT_FEE_360_DAYS_4944() -> ret {
                /// @src 7:677:685  "0.005e18"
                let expr_4943 := 0x11c37937e08000
                let _1842 := convert_t_rational_5000000000000000_by_1_to_t_uint256(expr_4943)

                ret := _1842
            }

            function array_length_t_array$_t_uint256_$7_memory_ptr(value) -> length {

                length := 0x07

            }

            function memory_array_index_access_t_array$_t_uint256_$7_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_uint256_$7_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                addr := add(baseRef, offset)
            }

            /// @ast-id 5082
            /// @src 7:2016:2297  "function maxSettlementFee(uint256 index) pure returns (uint256) {..."
            function fun_maxSettlementFee_5082(var_index_5065) -> var__5068 {
                /// @src 7:2071:2078  "uint256"
                let zero_t_uint256_1835 := zero_value_for_split_t_uint256()
                var__5068 := zero_t_uint256_1835

                /// @src 7:2093:2287  "[MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS]"
                let expr_5077_mpos := allocate_memory_array_t_array$_t_uint256_$7_memory_ptr(7)
                /// @src 7:2094:2119  "MAX_SETTLEMENT_FEE_0_DAYS"
                let expr_5070 := constant_MAX_SETTLEMENT_FEE_0_DAYS_4926()
                /// @src 7:2093:2287  "[MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS]"
                write_to_memory_t_uint256(add(expr_5077_mpos, 0), expr_5070)
                /// @src 7:2121:2145  "MAX_SETTLEMENT_FEE_1_DAY"
                let expr_5071 := constant_MAX_SETTLEMENT_FEE_1_DAY_4929()
                /// @src 7:2093:2287  "[MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS]"
                write_to_memory_t_uint256(add(expr_5077_mpos, 32), expr_5071)
                /// @src 7:2147:2172  "MAX_SETTLEMENT_FEE_7_DAYS"
                let expr_5072 := constant_MAX_SETTLEMENT_FEE_7_DAYS_4932()
                /// @src 7:2093:2287  "[MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS]"
                write_to_memory_t_uint256(add(expr_5077_mpos, 64), expr_5072)
                /// @src 7:2174:2200  "MAX_SETTLEMENT_FEE_30_DAYS"
                let expr_5073 := constant_MAX_SETTLEMENT_FEE_30_DAYS_4935()
                /// @src 7:2093:2287  "[MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS]"
                write_to_memory_t_uint256(add(expr_5077_mpos, 96), expr_5073)
                /// @src 7:2202:2228  "MAX_SETTLEMENT_FEE_90_DAYS"
                let expr_5074 := constant_MAX_SETTLEMENT_FEE_90_DAYS_4938()
                /// @src 7:2093:2287  "[MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS]"
                write_to_memory_t_uint256(add(expr_5077_mpos, 128), expr_5074)
                /// @src 7:2230:2257  "MAX_SETTLEMENT_FEE_180_DAYS"
                let expr_5075 := constant_MAX_SETTLEMENT_FEE_180_DAYS_4941()
                /// @src 7:2093:2287  "[MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS]"
                write_to_memory_t_uint256(add(expr_5077_mpos, 160), expr_5075)
                /// @src 7:2259:2286  "MAX_SETTLEMENT_FEE_360_DAYS"
                let expr_5076 := constant_MAX_SETTLEMENT_FEE_360_DAYS_4944()
                /// @src 7:2093:2287  "[MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS]"
                write_to_memory_t_uint256(add(expr_5077_mpos, 192), expr_5076)
                /// @src 7:2288:2293  "index"
                let _1843 := var_index_5065
                let expr_5078 := _1843
                /// @src 7:2093:2294  "[MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS][index]"
                let _1844 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$7_memory_ptr(expr_5077_mpos, expr_5078))
                let expr_5079 := _1844
                /// @src 7:2086:2294  "return [MAX_SETTLEMENT_FEE_0_DAYS, MAX_SETTLEMENT_FEE_1_DAY, MAX_SETTLEMENT_FEE_7_DAYS, MAX_SETTLEMENT_FEE_30_DAYS, MAX_SETTLEMENT_FEE_90_DAYS, MAX_SETTLEMENT_FEE_180_DAYS, MAX_SETTLEMENT_FEE_360_DAYS][index]"
                var__5068 := expr_5079
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 5829
            /// @src 12:225:382  "function atMostOneNonZero(uint256 x, uint256 y) internal pure returns (bool z) {..."
            function fun_atMostOneNonZero_5829(var_x_5820, var_y_5822) -> var_z_5825 {
                /// @src 12:296:302  "bool z"
                let zero_t_bool_1845 := zero_value_for_split_t_bool()
                var_z_5825 := zero_t_bool_1845

                /// @src 12:314:376  "assembly {..."
                {
                    var_z_5825 := or(iszero(var_x_5820), iszero(var_y_5822))
                }

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function cleanup_t_rational_5820_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_5820_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_5820_by_1(value)))
            }

            /// @src 11:199:231  "uint256 constant MAX_TICK = 5820"
            function constant_MAX_TICK_5573() -> ret {
                /// @src 11:227:231  "5820"
                let expr_5572 := 0x16bc
                let _1848 := convert_t_rational_5820_by_1_to_t_uint256(expr_5572)

                ret := _1848
            }

            function require_helper_t_error_5583_TickOutOfRange(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xc7e13a0100000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function cleanup_t_rational_4987541511039073_by_1(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_int256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_4987541511039073_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(identity(cleanup_t_rational_4987541511039073_by_1(value)))
            }

            /// @src 11:111:170  "int256 constant LN_ONE_PLUS_DELTA = 0.004987541511039073e18"
            function constant_LN_ONE_PLUS_DELTA_5570() -> ret {
                /// @src 11:147:170  "0.004987541511039073e18"
                let expr_5569 := 0x11b82480116861
                let _1849 := convert_t_rational_4987541511039073_by_1_to_t_int256(expr_5569)

                ret := _1849
            }

            function wrapping_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error_0x12() }
                r := div(x, y)
            }

            function convert_t_uint256_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(identity(cleanup_t_uint256(value)))
            }

            function wrapping_sub_t_int256(x, y) -> diff {
                diff := cleanup_t_int256(sub(x, y))
            }

            function wrapping_mul_t_int256(x, y) -> product {
                product := cleanup_t_int256(mul(x, y))
            }

            function wrapping_add_t_uint256(x, y) -> sum {
                sum := cleanup_t_uint256(add(x, y))
            }

            /// @src 11:345:388  "uint256 constant PRICE_ROUNDING_STEP = 1e12"
            function constant_PRICE_ROUNDING_STEP_5576() -> ret {
                /// @src 11:384:388  "1e12"
                let expr_5575 := 0xe8d4a51000
                let _1851 := convert_t_rational_1000000000000_by_1_to_t_uint256(expr_5575)

                ret := _1851
            }

            function wrapping_mul_t_uint256(x, y) -> product {
                product := cleanup_t_uint256(mul(x, y))
            }

            /// @ast-id 5743
            /// @src 11:1803:2255  "function tickToPrice(uint256 tick) internal pure returns (uint256) {..."
            function fun_tickToPrice_5743(var_tick_5698) -> var__5701 {
                /// @src 11:1861:1868  "uint256"
                let zero_t_uint256_1846 := zero_value_for_split_t_uint256()
                var__5701 := zero_t_uint256_1846

                /// @src 11:1888:1892  "tick"
                let _1847 := var_tick_5698
                let expr_5704 := _1847
                /// @src 11:1896:1904  "MAX_TICK"
                let expr_5705 := constant_MAX_TICK_5573()
                /// @src 11:1888:1904  "tick <= MAX_TICK"
                let expr_5706 := iszero(gt(cleanup_t_uint256(expr_5704), cleanup_t_uint256(expr_5705)))
                /// @src 11:1880:1923  "require(tick <= MAX_TICK, TickOutOfRange())"
                require_helper_t_error_5583_TickOutOfRange(expr_5706)
                /// @src 11:2034:2038  "1e36"
                let expr_5713 := 0xc097ce7bc90715b34b9f1000000000
                /// @src 11:2026:2039  "uint256(1e36)"
                let expr_5714 := convert_t_rational_1000000000000000000000000000000000000_by_1_to_t_uint256(expr_5713)
                /// @src 11:2026:2081  "uint256(1e36)..."
                let expr_5715_self := expr_5714
                /// @src 11:2082:2086  "1e18"
                let expr_5716 := 0x0de0b6b3a7640000
                /// @src 11:2094:2111  "LN_ONE_PLUS_DELTA"
                let expr_5718 := constant_LN_ONE_PLUS_DELTA_5570()
                /// @src 11:2122:2130  "MAX_TICK"
                let expr_5721 := constant_MAX_TICK_5573()
                /// @src 11:2133:2134  "2"
                let expr_5722 := 0x02
                /// @src 11:2122:2134  "MAX_TICK / 2"
                let expr_5723 := wrapping_div_t_uint256(expr_5721, convert_t_rational_2_by_1_to_t_uint256(expr_5722))

                /// @src 11:2115:2135  "int256(MAX_TICK / 2)"
                let expr_5724 := convert_t_uint256_to_t_int256(expr_5723)
                /// @src 11:2145:2149  "tick"
                let _1850 := var_tick_5698
                let expr_5727 := _1850
                /// @src 11:2138:2150  "int256(tick)"
                let expr_5728 := convert_t_uint256_to_t_int256(expr_5727)
                /// @src 11:2115:2150  "int256(MAX_TICK / 2) - int256(tick)"
                let expr_5729 := wrapping_sub_t_int256(expr_5724, expr_5728)

                /// @src 11:2114:2151  "(int256(MAX_TICK / 2) - int256(tick))"
                let expr_5730 := expr_5729
                /// @src 11:2094:2151  "LN_ONE_PLUS_DELTA * (int256(MAX_TICK / 2) - int256(tick))"
                let expr_5731 := wrapping_mul_t_int256(expr_5718, expr_5730)

                /// @src 11:2089:2152  "wExp(LN_ONE_PLUS_DELTA * (int256(MAX_TICK / 2) - int256(tick)))"
                let expr_5732 := fun_wExp_5696(expr_5731)
                /// @src 11:2082:2152  "1e18 + wExp(LN_ONE_PLUS_DELTA * (int256(MAX_TICK / 2) - int256(tick)))"
                let expr_5733 := wrapping_add_t_uint256(convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_5716), expr_5732)

                /// @src 11:2026:2153  "uint256(1e36)..."
                let expr_5734 := fun_divHalfDownUnchecked_5607(expr_5715_self, expr_5733)
                /// @src 11:2026:2195  "uint256(1e36)..."
                let expr_5735_self := expr_5734
                /// @src 11:2196:2215  "PRICE_ROUNDING_STEP"
                let expr_5736 := constant_PRICE_ROUNDING_STEP_5576()
                /// @src 11:2026:2216  "uint256(1e36)..."
                let expr_5737 := fun_divHalfDownUnchecked_5607(expr_5735_self, expr_5736)
                /// @src 11:2219:2238  "PRICE_ROUNDING_STEP"
                let expr_5738 := constant_PRICE_ROUNDING_STEP_5576()
                /// @src 11:2026:2238  "uint256(1e36)..."
                let expr_5739 := wrapping_mul_t_uint256(expr_5737, expr_5738)

                /// @src 11:2019:2238  "return uint256(1e36)..."
                var__5701 := expr_5739
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 5852
            /// @src 12:581:737  "function zeroFloorSub(uint256 x, uint256 y) internal pure returns (uint256 z) {..."
            function fun_zeroFloorSub_5852(var_x_5843, var_y_5845) -> var_z_5848 {
                /// @src 12:648:657  "uint256 z"
                let zero_t_uint256_1852 := zero_value_for_split_t_uint256()
                var_z_5848 := zero_t_uint256_1852

                /// @src 12:669:731  "assembly {..."
                {
                    var_z_5848 := mul(gt(var_x_5843, var_y_5845), sub(var_x_5843, var_y_5845))
                }

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 3402
            /// @src 0:45534:45661  "function hasCredit(bytes32 id, address user) internal view returns (bool) {..."
            function fun_hasCredit_3402(var_id_3385, var_user_3387) -> var__3390 {
                /// @src 0:45602:45606  "bool"
                let zero_t_bool_1853 := zero_value_for_split_t_bool()
                var__3390 := zero_t_bool_1853

                /// @src 0:45625:45633  "position"
                let _1854_slot := 0x00
                let expr_3392_slot := _1854_slot
                /// @src 0:45634:45636  "id"
                let _1855 := var_id_3385
                let expr_3393 := _1855
                /// @src 0:45625:45637  "position[id]"
                let _1856 := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_$_of_t_bytes32(expr_3392_slot,expr_3393)
                let _1857_slot := _1856
                let expr_3394_slot := _1857_slot
                /// @src 0:45638:45642  "user"
                let _1858 := var_user_3387
                let expr_3395 := _1858
                /// @src 0:45625:45643  "position[id][user]"
                let _1859 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Position_$4255_storage_$_of_t_address(expr_3394_slot,expr_3395)
                let _1860_slot := _1859
                let expr_3396_slot := _1860_slot
                /// @src 0:45625:45650  "position[id][user].credit"
                let _1861 := add(expr_3396_slot, 0)
                let _1862 := read_from_storage_split_offset_0_t_uint128(_1861)
                let expr_3397 := _1862
                /// @src 0:45653:45654  "0"
                let expr_3398 := 0x00
                /// @src 0:45625:45654  "position[id][user].credit > 0"
                let expr_3399 := gt(cleanup_t_uint128(expr_3397), convert_t_rational_0_by_1_to_t_uint128(expr_3398))
                /// @src 0:45618:45654  "return position[id][user].credit > 0"
                var__3390 := expr_3399
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 6060
            /// @src 12:2590:2897  "function tExchange(uint256 baseSlot, bytes32 key1, address key2, bool value) internal returns (bool previous) {..."
            function fun_tExchange_6060(var_baseSlot_6033, var_key1_6035, var_key2_6037, var_value_6039) -> var_previous_6042 {
                /// @src 12:2685:2698  "bool previous"
                let zero_t_bool_1863 := zero_value_for_split_t_bool()
                var_previous_6042 := zero_t_bool_1863

                /// @src 12:2754:2758  "key1"
                let _1864 := var_key1_6035
                let expr_6051 := _1864
                /// @src 12:2760:2764  "key2"
                let _1865 := var_key2_6037
                let expr_6052 := _1865
                /// @src 12:2766:2774  "baseSlot"
                let _1866 := var_baseSlot_6033
                let expr_6053 := _1866
                /// @src 12:2743:2775  "abi.encode(key1, key2, baseSlot)"

                let expr_6054_mpos := allocate_unbounded()
                let _1867 := add(expr_6054_mpos, 0x20)

                let _1868 := abi_encode_tuple_t_bytes32_t_address_t_uint256__to_t_bytes32_t_address_t_uint256__fromStack(_1867, expr_6051, expr_6052, expr_6053)
                mstore(expr_6054_mpos, sub(_1868, add(expr_6054_mpos, 0x20)))
                finalize_allocation(expr_6054_mpos, sub(_1868, expr_6054_mpos))
                /// @src 12:2733:2776  "keccak256(abi.encode(key1, key2, baseSlot))"
                let expr_6055 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_6054_mpos), array_length_t_bytes_memory_ptr(expr_6054_mpos))
                /// @src 12:2725:2777  "uint256(keccak256(abi.encode(key1, key2, baseSlot)))"
                let expr_6056 := convert_t_bytes32_to_t_uint256(expr_6055)
                /// @src 12:2710:2777  "uint256 slot = uint256(keccak256(abi.encode(key1, key2, baseSlot)))"
                let var_slot_6045 := expr_6056
                /// @src 12:2787:2891  "assembly (\"memory-safe\") {..."
                {
                    var_previous_6042 := tload(var_slot_6045)
                    tstore(var_slot_6045, var_value_6039)
                }

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            /// @ast-id 6008
            /// @src 12:1999:2199  "function setBit(uint128 bitmap, uint256 bit) internal pure returns (uint128) {..."
            function fun_setBit_6008(var_bitmap_5990, var_bit_5992) -> var__5995 {
                /// @src 12:2067:2074  "uint128"
                let zero_t_uint128_1869 := zero_value_for_split_t_uint128()
                var__5995 := zero_t_uint128_1869

                /// @src 12:2172:2178  "bitmap"
                let _1870 := var_bitmap_5990
                let expr_5999 := _1870
                /// @src 12:2182:2183  "1"
                let expr_6000 := 0x01
                /// @src 12:2187:2190  "bit"
                let _1871 := var_bit_5992
                let expr_6001 := _1871
                /// @src 12:2182:2190  "1 << bit"
                let _1872 := convert_t_rational_1_by_1_to_t_uint256(expr_6000)
                let expr_6002 :=
                shift_left_t_uint256_t_uint256(_1872, expr_6001)

                /// @src 12:2181:2191  "(1 << bit)"
                let expr_6003 := expr_6002
                /// @src 12:2172:2191  "bitmap | (1 << bit)"
                let expr_6004 := or(convert_t_uint128_to_t_uint256(expr_5999), expr_6003)

                /// @src 12:2164:2192  "uint128(bitmap | (1 << bit))"
                let expr_6005 := convert_t_uint256_to_t_uint128(expr_6004)
                /// @src 12:2157:2192  "return uint128(bitmap | (1 << bit))"
                var__5995 := expr_6005
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function convert_t_rational_1_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(identity(cleanup_t_rational_1_by_1(value)))
            }

            function shift_right_t_uint128_t_uint8(value, bits) -> result {
                bits := cleanup_t_uint8(bits)
                result := cleanup_t_uint128(shift_right_unsigned_dynamic(bits, cleanup_t_uint128(value)))
            }

            function cleanup_t_rational_113427455640312821154458202477256070485_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_113427455640312821154458202477256070485_by_1_to_t_uint128(value) -> converted {
                converted := cleanup_t_uint128(identity(cleanup_t_rational_113427455640312821154458202477256070485_by_1(value)))
            }

            function wrapping_sub_t_uint128(x, y) -> diff {
                diff := cleanup_t_uint128(sub(x, y))
            }

            function cleanup_t_rational_68056473384187692692674921486353642291_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_68056473384187692692674921486353642291_by_1_to_t_uint128(value) -> converted {
                converted := cleanup_t_uint128(identity(cleanup_t_rational_68056473384187692692674921486353642291_by_1(value)))
            }

            function convert_t_rational_2_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(identity(cleanup_t_rational_2_by_1(value)))
            }

            function wrapping_add_t_uint128(x, y) -> sum {
                sum := cleanup_t_uint128(add(x, y))
            }

            function cleanup_t_rational_20016609818878733144904388672456953615_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_20016609818878733144904388672456953615_by_1_to_t_uint128(value) -> converted {
                converted := cleanup_t_uint128(identity(cleanup_t_rational_20016609818878733144904388672456953615_by_1(value)))
            }

            function cleanup_t_rational_1334440654591915542993625911497130241_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1334440654591915542993625911497130241_by_1_to_t_uint128(value) -> converted {
                converted := cleanup_t_uint128(identity(cleanup_t_rational_1334440654591915542993625911497130241_by_1(value)))
            }

            function wrapping_mul_t_uint128(x, y) -> product {
                product := cleanup_t_uint128(mul(x, y))
            }

            function cleanup_t_rational_120_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_120_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(identity(cleanup_t_rational_120_by_1(value)))
            }

            /// @ast-id 5977
            /// @src 12:1348:1761  "function countBits(uint128 x) internal pure returns (uint256) {..."
            function fun_countBits_5977(var_x_5924) -> var__5927 {
                /// @src 12:1401:1408  "uint256"
                let zero_t_uint256_1873 := zero_value_for_split_t_uint256()
                var__5927 := zero_t_uint256_1873

                /// @src 12:1448:1449  "x"
                let _1874 := var_x_5924
                let expr_5930 := _1874
                /// @src 12:1454:1455  "x"
                let _1875 := var_x_5924
                let expr_5931 := _1875
                /// @src 12:1459:1460  "1"
                let expr_5932 := 0x01
                /// @src 12:1454:1460  "x >> 1"
                let _1876 := convert_t_rational_1_by_1_to_t_uint8(expr_5932)
                let expr_5933 :=
                shift_right_t_uint128_t_uint8(expr_5931, _1876)

                /// @src 12:1453:1461  "(x >> 1)"
                let expr_5934 := expr_5933
                /// @src 12:1464:1498  "0x55555555555555555555555555555555"
                let expr_5935 := 0x55555555555555555555555555555555
                /// @src 12:1453:1498  "(x >> 1) & 0x55555555555555555555555555555555"
                let expr_5936 := and(expr_5934, convert_t_rational_113427455640312821154458202477256070485_by_1_to_t_uint128(expr_5935))

                /// @src 12:1452:1499  "((x >> 1) & 0x55555555555555555555555555555555)"
                let expr_5937 := expr_5936
                /// @src 12:1448:1499  "x - ((x >> 1) & 0x55555555555555555555555555555555)"
                let expr_5938 := wrapping_sub_t_uint128(expr_5930, expr_5937)

                /// @src 12:1444:1499  "x = x - ((x >> 1) & 0x55555555555555555555555555555555)"
                var_x_5924 := expr_5938
                let expr_5939 := expr_5938
                /// @src 12:1518:1519  "x"
                let _1877 := var_x_5924
                let expr_5942 := _1877
                /// @src 12:1522:1556  "0x33333333333333333333333333333333"
                let expr_5943 := 0x33333333333333333333333333333333
                /// @src 12:1518:1556  "x & 0x33333333333333333333333333333333"
                let expr_5944 := and(expr_5942, convert_t_rational_68056473384187692692674921486353642291_by_1_to_t_uint128(expr_5943))

                /// @src 12:1517:1557  "(x & 0x33333333333333333333333333333333)"
                let expr_5945 := expr_5944
                /// @src 12:1562:1563  "x"
                let _1878 := var_x_5924
                let expr_5946 := _1878
                /// @src 12:1567:1568  "2"
                let expr_5947 := 0x02
                /// @src 12:1562:1568  "x >> 2"
                let _1879 := convert_t_rational_2_by_1_to_t_uint8(expr_5947)
                let expr_5948 :=
                shift_right_t_uint128_t_uint8(expr_5946, _1879)

                /// @src 12:1561:1569  "(x >> 2)"
                let expr_5949 := expr_5948
                /// @src 12:1572:1606  "0x33333333333333333333333333333333"
                let expr_5950 := 0x33333333333333333333333333333333
                /// @src 12:1561:1606  "(x >> 2) & 0x33333333333333333333333333333333"
                let expr_5951 := and(expr_5949, convert_t_rational_68056473384187692692674921486353642291_by_1_to_t_uint128(expr_5950))

                /// @src 12:1560:1607  "((x >> 2) & 0x33333333333333333333333333333333)"
                let expr_5952 := expr_5951
                /// @src 12:1517:1607  "(x & 0x33333333333333333333333333333333) + ((x >> 2) & 0x33333333333333333333333333333333)"
                let expr_5953 := wrapping_add_t_uint128(expr_5945, expr_5952)

                /// @src 12:1513:1607  "x = (x & 0x33333333333333333333333333333333) + ((x >> 2) & 0x33333333333333333333333333333333)"
                var_x_5924 := expr_5953
                let expr_5954 := expr_5953
                /// @src 12:1626:1627  "x"
                let _1880 := var_x_5924
                let expr_5957 := _1880
                /// @src 12:1631:1632  "x"
                let _1881 := var_x_5924
                let expr_5958 := _1881
                /// @src 12:1636:1637  "4"
                let expr_5959 := 0x04
                /// @src 12:1631:1637  "x >> 4"
                let _1882 := convert_t_rational_4_by_1_to_t_uint8(expr_5959)
                let expr_5960 :=
                shift_right_t_uint128_t_uint8(expr_5958, _1882)

                /// @src 12:1630:1638  "(x >> 4)"
                let expr_5961 := expr_5960
                /// @src 12:1626:1638  "x + (x >> 4)"
                let expr_5962 := wrapping_add_t_uint128(expr_5957, expr_5961)

                /// @src 12:1625:1639  "(x + (x >> 4))"
                let expr_5963 := expr_5962
                /// @src 12:1642:1676  "0x0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f"
                let expr_5964 := 0x0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f
                /// @src 12:1625:1676  "(x + (x >> 4)) & 0x0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f"
                let expr_5965 := and(expr_5963, convert_t_rational_20016609818878733144904388672456953615_by_1_to_t_uint128(expr_5964))

                /// @src 12:1621:1676  "x = (x + (x >> 4)) & 0x0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f"
                var_x_5924 := expr_5965
                let expr_5966 := expr_5965
                /// @src 12:1698:1699  "x"
                let _1883 := var_x_5924
                let expr_5968 := _1883
                /// @src 12:1702:1736  "0x01010101010101010101010101010101"
                let expr_5969 := 0x01010101010101010101010101010101
                /// @src 12:1698:1736  "x * 0x01010101010101010101010101010101"
                let expr_5970 := wrapping_mul_t_uint128(expr_5968, convert_t_rational_1334440654591915542993625911497130241_by_1_to_t_uint128(expr_5969))

                /// @src 12:1697:1737  "(x * 0x01010101010101010101010101010101)"
                let expr_5971 := expr_5970
                /// @src 12:1741:1744  "120"
                let expr_5972 := 0x78
                /// @src 12:1697:1744  "(x * 0x01010101010101010101010101010101) >> 120"
                let _1884 := convert_t_rational_120_by_1_to_t_uint8(expr_5972)
                let expr_5973 :=
                shift_right_t_uint128_t_uint8(expr_5971, _1884)

                /// @src 12:1690:1744  "return (x * 0x01010101010101010101010101010101) >> 120"
                var__5927 := convert_t_uint128_to_t_uint256(expr_5973)
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function convert_t_rational_0_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function cleanup_t_rational_693147180559945309_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_693147180559945309_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(identity(cleanup_t_rational_693147180559945309_by_1(value)))
            }

            function cleanup_t_rational_322611214989459870_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_322611214989459870_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(identity(cleanup_t_rational_322611214989459870_by_1(value)))
            }

            function wrapping_add_t_int256(x, y) -> sum {
                sum := cleanup_t_int256(add(x, y))
            }

            function wrapping_div_t_int256(x, y) -> r {
                x := cleanup_t_int256(x)
                y := cleanup_t_int256(y)
                if iszero(y) { panic_error_0x12() }
                r := sdiv(x, y)
            }

            function cleanup_t_rational_2000000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_2000000000000000000_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(identity(cleanup_t_rational_2000000000000000000_by_1(value)))
            }

            function cleanup_t_rational_3000000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_3000000000000000000_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(identity(cleanup_t_rational_3000000000000000000_by_1(value)))
            }

            function convert_t_rational_1000000000000000000_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(identity(cleanup_t_rational_1000000000000000000_by_1(value)))
            }

            function convert_t_int256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_int256(value)))
            }

            function negate_wrapping_t_int256(value) -> ret {
                ret := cleanup_t_int256(sub(0, value))
            }

            /// @ast-id 5696
            /// @src 11:789:1797  "function wExp(int256 x) internal pure returns (uint256) {..."
            function fun_wExp_5696(var_x_5609) -> var__5612 {
                /// @src 11:836:843  "uint256"
                let zero_t_uint256_1885 := zero_value_for_split_t_uint256()
                var__5612 := zero_t_uint256_1885

                /// @src 11:883:884  "x"
                let _1886 := var_x_5609
                let expr_5614 := _1886
                /// @src 11:887:888  "0"
                let expr_5615 := 0x00
                /// @src 11:883:888  "x < 0"
                let expr_5616 := slt(cleanup_t_int256(expr_5614), convert_t_rational_0_by_1_to_t_int256(expr_5615))
                /// @src 11:879:1781  "if (x < 0) {..."
                switch expr_5616
                case 0 {
                    /// @src 11:982:1005  "0.693147180559945309e18"
                    let expr_5627 := 0x099e8db03256ce5d
                    /// @src 11:969:1005  "int256 ln2 = 0.693147180559945309e18"
                    let var_ln2_5626 := convert_t_rational_693147180559945309_by_1_to_t_int256(expr_5627)
                    /// @src 11:1180:1202  "0.32261121498945987e18"
                    let expr_5631 := 0x047a2530d601019e
                    /// @src 11:1164:1202  "int256 offset = 0.32261121498945987e18"
                    let var_offset_5630 := convert_t_rational_322611214989459870_by_1_to_t_int256(expr_5631)
                    /// @src 11:1232:1233  "x"
                    let _1887 := var_x_5609
                    let expr_5635 := _1887
                    /// @src 11:1236:1242  "offset"
                    let _1888 := var_offset_5630
                    let expr_5636 := _1888
                    /// @src 11:1232:1242  "x + offset"
                    let expr_5637 := wrapping_add_t_int256(expr_5635, expr_5636)

                    /// @src 11:1231:1243  "(x + offset)"
                    let expr_5638 := expr_5637
                    /// @src 11:1246:1249  "ln2"
                    let _1889 := var_ln2_5626
                    let expr_5639 := _1889
                    /// @src 11:1231:1249  "(x + offset) / ln2"
                    let expr_5640 := wrapping_div_t_int256(expr_5638, expr_5639)

                    /// @src 11:1220:1249  "int256 q = (x + offset) / ln2"
                    let var_q_5634 := expr_5640
                    /// @src 11:1278:1279  "x"
                    let _1890 := var_x_5609
                    let expr_5644 := _1890
                    /// @src 11:1282:1283  "q"
                    let _1891 := var_q_5634
                    let expr_5645 := _1891
                    /// @src 11:1286:1289  "ln2"
                    let _1892 := var_ln2_5626
                    let expr_5646 := _1892
                    /// @src 11:1282:1289  "q * ln2"
                    let expr_5647 := wrapping_mul_t_int256(expr_5645, expr_5646)

                    /// @src 11:1278:1289  "x - q * ln2"
                    let expr_5648 := wrapping_sub_t_int256(expr_5644, expr_5647)

                    /// @src 11:1267:1289  "int256 r = x - q * ln2"
                    let var_r_5643 := expr_5648
                    /// @src 11:1327:1328  "r"
                    let _1893 := var_r_5643
                    let expr_5652 := _1893
                    /// @src 11:1331:1332  "r"
                    let _1894 := var_r_5643
                    let expr_5653 := _1894
                    /// @src 11:1327:1332  "r * r"
                    let expr_5654 := wrapping_mul_t_int256(expr_5652, expr_5653)

                    /// @src 11:1336:1344  "2 * 1e18"
                    let expr_5657 := 0x1bc16d674ec80000
                    /// @src 11:1335:1345  "(2 * 1e18)"
                    let expr_5658 := expr_5657
                    /// @src 11:1327:1345  "r * r / (2 * 1e18)"
                    let expr_5659 := wrapping_div_t_int256(expr_5654, convert_t_rational_2000000000000000000_by_1_to_t_int256(expr_5658))

                    /// @src 11:1307:1345  "int256 secondTerm = r * r / (2 * 1e18)"
                    let var_secondTerm_5651 := expr_5659
                    /// @src 11:1382:1392  "secondTerm"
                    let _1895 := var_secondTerm_5651
                    let expr_5663 := _1895
                    /// @src 11:1395:1396  "r"
                    let _1896 := var_r_5643
                    let expr_5664 := _1896
                    /// @src 11:1382:1396  "secondTerm * r"
                    let expr_5665 := wrapping_mul_t_int256(expr_5663, expr_5664)

                    /// @src 11:1400:1408  "3 * 1e18"
                    let expr_5668 := 0x29a2241af62c0000
                    /// @src 11:1399:1409  "(3 * 1e18)"
                    let expr_5669 := expr_5668
                    /// @src 11:1382:1409  "secondTerm * r / (3 * 1e18)"
                    let expr_5670 := wrapping_div_t_int256(expr_5665, convert_t_rational_3000000000000000000_by_1_to_t_int256(expr_5669))

                    /// @src 11:1363:1409  "int256 thirdTerm = secondTerm * r / (3 * 1e18)"
                    let var_thirdTerm_5662 := expr_5670
                    /// @src 11:1441:1445  "1e18"
                    let expr_5674 := 0x0de0b6b3a7640000
                    /// @src 11:1448:1449  "r"
                    let _1897 := var_r_5643
                    let expr_5675 := _1897
                    /// @src 11:1441:1449  "1e18 + r"
                    let expr_5676 := wrapping_add_t_int256(convert_t_rational_1000000000000000000_by_1_to_t_int256(expr_5674), expr_5675)

                    /// @src 11:1452:1462  "secondTerm"
                    let _1898 := var_secondTerm_5651
                    let expr_5677 := _1898
                    /// @src 11:1441:1462  "1e18 + r + secondTerm"
                    let expr_5678 := wrapping_add_t_int256(expr_5676, expr_5677)

                    /// @src 11:1465:1474  "thirdTerm"
                    let _1899 := var_thirdTerm_5662
                    let expr_5679 := _1899
                    /// @src 11:1441:1474  "1e18 + r + secondTerm + thirdTerm"
                    let expr_5680 := wrapping_add_t_int256(expr_5678, expr_5679)

                    /// @src 11:1427:1474  "int256 expR = 1e18 + r + secondTerm + thirdTerm"
                    let var_expR_5673 := expr_5680
                    /// @src 11:1747:1751  "expR"
                    let _1900 := var_expR_5673
                    let expr_5684 := _1900
                    /// @src 11:1739:1752  "uint256(expR)"
                    let expr_5685 := convert_t_int256_to_t_uint256(expr_5684)
                    /// @src 11:1764:1765  "q"
                    let _1901 := var_q_5634
                    let expr_5688 := _1901
                    /// @src 11:1756:1766  "uint256(q)"
                    let expr_5689 := convert_t_int256_to_t_uint256(expr_5688)
                    /// @src 11:1739:1766  "uint256(expR) << uint256(q)"
                    let expr_5690 :=
                    shift_left_t_uint256_t_uint256(expr_5685, expr_5689)

                    /// @src 11:1732:1766  "return uint256(expR) << uint256(q)"
                    var__5612 := expr_5690
                    leave
                    /// @src 11:879:1781  "if (x < 0) {..."
                }
                default {
                    /// @src 11:915:919  "1e36"
                    let expr_5617 := 0xc097ce7bc90715b34b9f1000000000
                    /// @src 11:928:929  "x"
                    let _1902 := var_x_5609
                    let expr_5619 := _1902
                    /// @src 11:927:929  "-x"
                    let expr_5620 := negate_wrapping_t_int256(expr_5619)
                    /// @src 11:922:930  "wExp(-x)"
                    let expr_5621 := fun_wExp_5696(expr_5620)
                    /// @src 11:915:930  "1e36 / wExp(-x)"
                    let expr_5622 := wrapping_div_t_uint256(convert_t_rational_1000000000000000000000000000000000000_by_1_to_t_uint256(expr_5617), expr_5621)

                    /// @src 11:908:930  "return 1e36 / wExp(-x)"
                    var__5612 := expr_5622
                    leave
                    /// @src 11:879:1781  "if (x < 0) {..."
                }

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

            function wrapping_sub_t_uint256(x, y) -> diff {
                diff := cleanup_t_uint256(sub(x, y))
            }

            /// @ast-id 5607
            /// @src 11:620:783  "function divHalfDownUnchecked(uint256 x, uint256 d) internal pure returns (uint256) {..."
            function fun_divHalfDownUnchecked_5607(var_x_5586, var_d_5588) -> var__5591 {
                /// @src 11:695:702  "uint256"
                let zero_t_uint256_1903 := zero_value_for_split_t_uint256()
                var__5591 := zero_t_uint256_1903

                /// @src 11:746:747  "x"
                let _1904 := var_x_5586
                let expr_5593 := _1904
                /// @src 11:751:752  "d"
                let _1905 := var_d_5588
                let expr_5594 := _1905
                /// @src 11:755:756  "1"
                let expr_5595 := 0x01
                /// @src 11:751:756  "d - 1"
                let expr_5596 := wrapping_sub_t_uint256(expr_5594, convert_t_rational_1_by_1_to_t_uint256(expr_5595))

                /// @src 11:750:757  "(d - 1)"
                let expr_5597 := expr_5596
                /// @src 11:760:761  "2"
                let expr_5598 := 0x02
                /// @src 11:750:761  "(d - 1) / 2"
                let expr_5599 := wrapping_div_t_uint256(expr_5597, convert_t_rational_2_by_1_to_t_uint256(expr_5598))

                /// @src 11:746:761  "x + (d - 1) / 2"
                let expr_5600 := wrapping_add_t_uint256(expr_5593, expr_5599)

                /// @src 11:745:762  "(x + (d - 1) / 2)"
                let expr_5601 := expr_5600
                /// @src 11:765:766  "d"
                let _1906 := var_d_5588
                let expr_5602 := _1906
                /// @src 11:745:766  "(x + (d - 1) / 2) / d"
                let expr_5603 := wrapping_div_t_uint256(expr_5601, expr_5602)

                /// @src 11:738:766  "return (x + (d - 1) / 2) / d"
                var__5591 := expr_5603
                leave

            }
            /// @src 0:12822:51370  "contract Midnight is IMidnight {..."

        }

        data ".metadata" hex"a2646970667358221220eb85002599703e0a0ffe7403a3b3c66198991442a4d48afcd0fccb05c506888e64736f6c63430008220033"
    }

}

