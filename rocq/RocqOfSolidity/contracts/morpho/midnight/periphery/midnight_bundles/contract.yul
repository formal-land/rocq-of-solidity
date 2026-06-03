
/// @use-src 15:"deps/midnight/src/periphery/MidnightBundles.sol", 19:"deps/midnight/src/periphery/interfaces/IMidnightBundles.sol"
object "MidnightBundles_7969" {
    code {
        /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."
        mstore(64, memoryguard(160))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := copy_arguments_for_constructor_6385_object_MidnightBundles_7969()
        constructor_MidnightBundles_7969(_1)

        let _2 := allocate_unbounded()
        codecopy(_2, dataoffset("MidnightBundles_7969_deployed"), datasize("MidnightBundles_7969_deployed"))

        setimmutable(_2, "6375", mload(128))

        return(_2, datasize("MidnightBundles_7969_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
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

        function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
            revert(0, 0)
        }

        function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
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

        function abi_decode_t_address_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_address(value)
        }

        function abi_decode_tuple_t_address_fromMemory(headStart, dataEnd) -> value0 {
            if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            {

                let offset := 0

                value0 := abi_decode_t_address_fromMemory(add(headStart, offset), dataEnd)
            }

        }

        function copy_arguments_for_constructor_6385_object_MidnightBundles_7969() -> ret_param_0 {

            let programSize := datasize("MidnightBundles_7969")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0 := abi_decode_tuple_t_address_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }

        /// @ast-id 6385
        /// @src 15:1273:1341  "constructor(address _midnight) {..."
        function constructor_MidnightBundles_7969(var__midnight_6377) {

            /// @src 15:1273:1341  "constructor(address _midnight) {..."
            constructor_IMidnightBundles_8412()

            /// @src 15:1325:1334  "_midnight"
            let _3 := var__midnight_6377
            let expr_6381 := _3
            /// @src 15:1314:1334  "MIDNIGHT = _midnight"
            let _4 := expr_6381
            mstore(128, _4)
            let expr_6382 := expr_6381

        }
        /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

        /// @src 19:553:2545  "interface IMidnightBundles {..."
        function constructor_IMidnightBundles_8412() {

            /// @src 19:553:2545  "interface IMidnightBundles {..."

        }
        /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

    }
    /// @use-src 7:"deps/midnight/src/libraries/ConstantsLib.sol", 10:"deps/midnight/src/libraries/SafeTransferLib.sol", 11:"deps/midnight/src/libraries/TickLib.sol", 12:"deps/midnight/src/libraries/UtilsLib.sol", 13:"deps/midnight/src/periphery/ConsumableUnitsLib.sol", 15:"deps/midnight/src/periphery/MidnightBundles.sol", 16:"deps/midnight/src/periphery/TakeAmountsLib.sol"
    object "MidnightBundles_7969_deployed" {
        code {
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x4d6e21e9
                {
                    // buyWithUnitsTargetAndWithdrawCollateral(uint256,uint256,address,(uint8,bytes),(uint256,((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),bool,address,uint256,uint256,uint256,bytes32,address,bytes,address,address,bool,uint256,uint256),bytes)[],(uint256,uint256)[],address,uint256,address)

                    external_fun_buyWithUnitsTargetAndWithdrawCollateral_6668()
                }

                case 0x6afdd850
                {
                    // PERMIT2()

                    external_fun_PERMIT2_6373()
                }

                case 0x81a0a956
                {
                    // buyWithAssetsTargetAndWithdrawCollateral(uint256,uint256,address,(uint8,bytes),(uint256,((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),bool,address,uint256,uint256,uint256,bytes32,address,bytes,address,address,bool,uint256,uint256),bytes)[],(uint256,uint256)[],address,uint256,address)

                    external_fun_buyWithAssetsTargetAndWithdrawCollateral_7259()
                }

                case 0x8432c5e1
                {
                    // supplyCollateralAndSellWithUnitsTarget(uint256,uint256,address,address,(uint256,uint256,(uint8,bytes))[],(uint256,((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),bool,address,uint256,uint256,uint256,bytes32,address,bytes,address,address,bool,uint256,uint256),bytes)[],uint256,address)

                    external_fun_supplyCollateralAndSellWithUnitsTarget_6968()
                }

                case 0x8c4206e9
                {
                    // repayAndWithdrawCollateral((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),uint256,address,(uint8,bytes),(uint256,uint256)[],address,uint256,address)

                    external_fun_repayAndWithdrawCollateral_7710()
                }

                case 0xdc400c12
                {
                    // MIDNIGHT()

                    external_fun_MIDNIGHT_6375()
                }

                case 0xfb7ed8c2
                {
                    // supplyCollateralAndSellWithAssetsTarget(uint256,uint256,address,address,(uint256,uint256,(uint8,bytes))[],(uint256,((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),bool,address,uint256,uint256,uint256,bytes32,address,bytes,address,address,bool,uint256,uint256),bytes)[],uint256,address)

                    external_fun_supplyCollateralAndSellWithAssetsTarget_7572()
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

            function validator_revert_t_enum$_PermitKind_$8240(value) {
                if iszero(lt(value, 3)) { revert(0, 0) }
            }

            function abi_decode_t_enum$_PermitKind_$8240(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_enum$_PermitKind_$8240(value)
            }

            function revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() {
                revert(0, 0)
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

            // struct TokenPermit
            function abi_decode_t_struct$_TokenPermit_$8246_memory_ptr(headStart, end) -> value {
                if slt(sub(end, headStart), 0x40) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0x40)

                {
                    // kind

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_enum$_PermitKind_$8240(add(headStart, offset), end))

                }

                {
                    // data

                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert_error_5e8f644817bc4960744f35c15999b6eff64ae702f94b1c46297cfd4e1aec2421() }

                    mstore(add(value, 0x20), abi_decode_t_bytes_memory_ptr(add(headStart, offset), end))

                }

            }

            function array_allocation_size_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() {
                revert(0, 0)
            }

            function array_allocation_size_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

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

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function abi_decode_t_bool(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bool(value)
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

            // struct Take
            function abi_decode_t_struct$_Take_$8236_memory_ptr(headStart, end) -> value {
                if slt(sub(end, headStart), 0x60) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0x60)

                {
                    // units

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // offer

                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert_error_5e8f644817bc4960744f35c15999b6eff64ae702f94b1c46297cfd4e1aec2421() }

                    mstore(add(value, 0x20), abi_decode_t_struct$_Offer_$4210_memory_ptr(add(headStart, offset), end))

                }

                {
                    // ratifierData

                    let offset := calldataload(add(headStart, 64))
                    if gt(offset, 0xffffffffffffffff) { revert_error_5e8f644817bc4960744f35c15999b6eff64ae702f94b1c46297cfd4e1aec2421() }

                    mstore(add(value, 0x40), abi_decode_t_bytes_memory_ptr(add(headStart, offset), end))

                }

            }

            // struct Take[]
            function abi_decode_available_length_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(offset, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(length))
                let dst := array

                mstore(array, length)
                dst := add(array, 0x20)

                let srcEnd := add(offset, mul(length, 0x20))
                if gt(srcEnd, end) {
                    revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef()
                }
                for { let src := offset } lt(src, srcEnd) { src := add(src, 0x20) }
                {

                    let innerOffset := calldataload(src)
                    if gt(innerOffset, 0xffffffffffffffff) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                    let elementPos := add(offset, innerOffset)

                    mstore(dst, abi_decode_t_struct$_Take_$8236_memory_ptr(elementPos, end))
                    dst := add(dst, 0x20)
                }
            }

            // struct Take[]
            function abi_decode_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(add(offset, 0x20), length, end)
            }

            function array_allocation_size_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            // struct CollateralWithdrawal
            function abi_decode_t_struct$_CollateralWithdrawal_$8251_memory_ptr(headStart, end) -> value {
                if slt(sub(end, headStart), 0x40) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0x40)

                {
                    // collateralIndex

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // assets

                    let offset := 32

                    mstore(add(value, 0x20), abi_decode_t_uint256(add(headStart, offset), end))

                }

            }

            // struct CollateralWithdrawal[]
            function abi_decode_available_length_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(offset, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(length))
                let dst := array

                mstore(array, length)
                dst := add(array, 0x20)

                let srcEnd := add(offset, mul(length, 0x40))
                if gt(srcEnd, end) {
                    revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef()
                }
                for { let src := offset } lt(src, srcEnd) { src := add(src, 0x40) }
                {

                    let elementPos := src

                    mstore(dst, abi_decode_t_struct$_CollateralWithdrawal_$8251_memory_ptr(elementPos, end))
                    dst := add(dst, 0x20)
                }
            }

            // struct CollateralWithdrawal[]
            function abi_decode_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(add(offset, 0x20), length, end)
            }

            function abi_decode_tuple_t_uint256t_uint256t_addresst_struct$_TokenPermit_$8246_memory_ptrt_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptrt_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptrt_addresst_uint256t_address(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5, value6, value7, value8 {
                if slt(sub(dataEnd, headStart), 288) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
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

                    let offset := calldataload(add(headStart, 96))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value3 := abi_decode_t_struct$_TokenPermit_$8246_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 128))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value4 := abi_decode_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 160))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value5 := abi_decode_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 192

                    value6 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 224

                    value7 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 256

                    value8 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_buyWithUnitsTargetAndWithdrawCollateral_6668() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7, param_8 :=  abi_decode_tuple_t_uint256t_uint256t_addresst_struct$_TokenPermit_$8246_memory_ptrt_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptrt_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptrt_addresst_uint256t_address(4, calldatasize())
                fun_buyWithUnitsTargetAndWithdrawCollateral_6668(param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7, param_8)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            /// @src 15:1151:1227  "address public constant PERMIT2 = 0x000000000022D473030F116dDEE9F6B43aC78BA3"
            function constant_PERMIT2_6373() -> ret {
                /// @src 15:1185:1227  "0x000000000022D473030F116dDEE9F6B43aC78BA3"
                let expr_6372 := 0x22d473030f116ddee9f6b43ac78ba3
                let _1 := expr_6372

                ret := _1
            }

            /// @ast-id 6373
            /// @src 15:1151:1227  "address public constant PERMIT2 = 0x000000000022D473030F116dDEE9F6B43aC78BA3"
            function getter_fun_PERMIT2_6373() -> ret_0 {
                ret_0 := constant_PERMIT2_6373()
            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_PERMIT2_6373() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_PERMIT2_6373()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_buyWithAssetsTargetAndWithdrawCollateral_7259() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7, param_8 :=  abi_decode_tuple_t_uint256t_uint256t_addresst_struct$_TokenPermit_$8246_memory_ptrt_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptrt_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptrt_addresst_uint256t_address(4, calldatasize())
                fun_buyWithAssetsTargetAndWithdrawCollateral_7259(param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7, param_8)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function array_allocation_size_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            // struct CollateralSupply
            function abi_decode_t_struct$_CollateralSupply_$8259_memory_ptr(headStart, end) -> value {
                if slt(sub(end, headStart), 0x60) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0x60)

                {
                    // collateralIndex

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // assets

                    let offset := 32

                    mstore(add(value, 0x20), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // permit

                    let offset := calldataload(add(headStart, 64))
                    if gt(offset, 0xffffffffffffffff) { revert_error_5e8f644817bc4960744f35c15999b6eff64ae702f94b1c46297cfd4e1aec2421() }

                    mstore(add(value, 0x40), abi_decode_t_struct$_TokenPermit_$8246_memory_ptr(add(headStart, offset), end))

                }

            }

            // struct CollateralSupply[]
            function abi_decode_available_length_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(offset, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(length))
                let dst := array

                mstore(array, length)
                dst := add(array, 0x20)

                let srcEnd := add(offset, mul(length, 0x20))
                if gt(srcEnd, end) {
                    revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef()
                }
                for { let src := offset } lt(src, srcEnd) { src := add(src, 0x20) }
                {

                    let innerOffset := calldataload(src)
                    if gt(innerOffset, 0xffffffffffffffff) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                    let elementPos := add(offset, innerOffset)

                    mstore(dst, abi_decode_t_struct$_CollateralSupply_$8259_memory_ptr(elementPos, end))
                    dst := add(dst, 0x20)
                }
            }

            // struct CollateralSupply[]
            function abi_decode_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(add(offset, 0x20), length, end)
            }

            function abi_decode_tuple_t_uint256t_uint256t_addresst_addresst_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptrt_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptrt_uint256t_address(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5, value6, value7 {
                if slt(sub(dataEnd, headStart), 256) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
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

                    value4 := abi_decode_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 160))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value5 := abi_decode_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 192

                    value6 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 224

                    value7 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_supplyCollateralAndSellWithUnitsTarget_6968() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7 :=  abi_decode_tuple_t_uint256t_uint256t_addresst_addresst_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptrt_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptrt_uint256t_address(4, calldatasize())
                fun_supplyCollateralAndSellWithUnitsTarget_6968(param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_addresst_struct$_TokenPermit_$8246_memory_ptrt_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptrt_addresst_uint256t_address(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5, value6, value7 {
                if slt(sub(dataEnd, headStart), 256) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

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

                    let offset := calldataload(add(headStart, 96))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value3 := abi_decode_t_struct$_TokenPermit_$8246_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 128))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value4 := abi_decode_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 160

                    value5 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 192

                    value6 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 224

                    value7 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_repayAndWithdrawCollateral_7710() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7 :=  abi_decode_tuple_t_struct$_Market_$4171_memory_ptrt_uint256t_addresst_struct$_TokenPermit_$8246_memory_ptrt_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptrt_addresst_uint256t_address(4, calldatasize())
                fun_repayAndWithdrawCollateral_7710(param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            /// @ast-id 6375
            /// @src 15:1233:1266  "address public immutable MIDNIGHT"
            function getter_fun_MIDNIGHT_6375() -> rval {

                rval := loadimmutable("6375")

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function external_fun_MIDNIGHT_6375() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_MIDNIGHT_6375()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_supplyCollateralAndSellWithAssetsTarget_7572() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7 :=  abi_decode_tuple_t_uint256t_uint256t_addresst_addresst_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptrt_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptrt_uint256t_address(4, calldatasize())
                fun_supplyCollateralAndSellWithAssetsTarget_7572(param_0, param_1, param_2, param_3, param_4, param_5, param_6, param_7)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_contract$_IMidnight_$4887(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IMidnight_$4887(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IMidnight_$4887(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_contract$_IMidnight_$4887_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() {
                revert(0, 0)
            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

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

            function abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            function require_helper_t_error_8274_Unauthorized(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x82b4290000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
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
                let _10 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_4916)

                ret := _10
            }

            function require_helper_t_error_8270_PctExceeded(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x48e51cfd00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function panic_error_0x32() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x32)
                revert(0, 0x24)
            }

            function array_length_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function read_from_memoryt_address(ptr) -> returnValue {

                let value := cleanup_t_address(mload(ptr))

                returnValue :=

                value

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

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
                ret := add(value, 1)
            }

            function read_from_memoryt_bool(ptr) -> returnValue {

                let value := cleanup_t_bool(mload(ptr))

                returnValue :=

                value

            }

            function require_helper_t_error_8266_InconsistentSide(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x9902ca0800000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function require_helper_t_error_8264_InconsistentMarket(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x8e09c4bb00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                diff := sub(x, y)

                if gt(diff, x) { panic_error_0x11() }

            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_rational_0_by_1(value)))
            }

            function convert_t_rational_0_by_1_to_t_address(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function abi_decode_t_uint256_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256t_uint256_fromMemory(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

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

            function array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value, pos) -> end {
                let length := array_length_t_bytes_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, length)
                copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function store_literal_in_memory_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470(memPtr) {

            }

            function abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, 0)
                store_literal_in_memory_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470(pos)
                end := add(pos, 0)
            }

            function abi_encode_tuple_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_bytes_memory_ptr__fromStack(headStart , value0, value1, value2, value3, value4, value5) -> tail {
                tail := add(headStart, 224)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_struct$_Offer_$4210_memory_ptr_to_t_struct$_Offer_$4210_memory_ptr_fromStack(value0,  tail)

                mstore(add(headStart, 32), sub(tail, headStart))
                tail := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value1,  tail)

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_address_to_t_address_fromStack(value3,  add(headStart, 96))

                abi_encode_t_address_to_t_address_fromStack(value4,  add(headStart, 128))

                abi_encode_t_address_to_t_address_fromStack(value5,  add(headStart, 160))

                mstore(add(headStart, 192), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_fromStack( tail)

            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                sum := add(x, y)

                if gt(x, sum) { panic_error_0x11() }

            }

            function require_helper_t_error_8268_OutOfOffers(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x5e71e7fb00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function increment_wrapping_t_uint256(value) -> ret {
                ret := cleanup_t_uint256(add(value, 1))
            }

            function array_length_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function memory_array_index_access_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function abi_decode_tuple__fromMemory(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function abi_encode_tuple_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address_t_address__to_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address_t_address__fromStack(headStart , value0, value1, value2, value3, value4) -> tail {
                tail := add(headStart, 160)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value0,  tail)

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_address_to_t_address_fromStack(value3,  add(headStart, 96))

                abi_encode_t_address_to_t_address_fromStack(value4,  add(headStart, 128))

            }

            /// @ast-id 6668
            /// @src 15:2220:4787  "function buyWithUnitsTargetAndWithdrawCollateral(..."
            function fun_buyWithUnitsTargetAndWithdrawCollateral_6668(var_targetUnits_6388, var_maxBuyerAssets_6390, var_taker_6392, var_loanTokenPermit_6395_mpos, var_takes_6399_mpos, var_collateralWithdrawals_6403_mpos, var_collateralReceiver_6405, var_referralFeePct_6407, var_referralFeeRecipient_6409) {

                /// @src 15:2626:2631  "taker"
                let _2 := var_taker_6392
                let expr_6413 := _2
                /// @src 15:2635:2645  "msg.sender"
                let expr_6415 := caller()
                /// @src 15:2626:2645  "taker == msg.sender"
                let expr_6416 := eq(cleanup_t_address(expr_6413), cleanup_t_address(expr_6415))
                /// @src 15:2626:2700  "taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"
                let expr_6425 := expr_6416
                if iszero(expr_6425) {
                    /// @src 15:2659:2667  "MIDNIGHT"
                    let _3 := loadimmutable("6375")
                    let expr_6418 := _3
                    /// @src 15:2649:2668  "IMidnight(MIDNIGHT)"
                    let expr_6419_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6418)
                    /// @src 15:2649:2681  "IMidnight(MIDNIGHT).isAuthorized"
                    let expr_6420_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6419_address)
                    let expr_6420_functionSelector := 0x65e4ad9e
                    /// @src 15:2682:2687  "taker"
                    let _4 := var_taker_6392
                    let expr_6421 := _4
                    /// @src 15:2689:2699  "msg.sender"
                    let expr_6423 := caller()
                    /// @src 15:2649:2700  "IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"

                    // storage for arguments and returned data
                    let _5 := allocate_unbounded()
                    mstore(_5, shift_left_224(expr_6420_functionSelector))
                    let _6 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_5, 4) , expr_6421, expr_6423)

                    let _7 := staticcall(gas(), expr_6420_address,  _5, sub(_6, _5), _5, 32)

                    if iszero(_7) { revert_forward_1() }

                    let expr_6424
                    if _7 {

                        let _8 := 32

                        if gt(_8, returndatasize()) {
                            _8 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_5, _8)

                        // decode return parameters from external try-call into retVars
                        expr_6424 :=  abi_decode_tuple_t_bool_fromMemory(_5, add(_5, _8))
                    }
                    /// @src 15:2626:2700  "taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"
                    expr_6425 := expr_6424
                }
                /// @src 15:2618:2717  "require(taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender), Unauthorized())"
                require_helper_t_error_8274_Unauthorized(expr_6425)
                /// @src 15:2735:2749  "referralFeePct"
                let _9 := var_referralFeePct_6407
                let expr_6431 := _9
                /// @src 15:2752:2755  "WAD"
                let expr_6432 := constant_WAD_4917()
                /// @src 15:2735:2755  "referralFeePct < WAD"
                let expr_6433 := lt(cleanup_t_uint256(expr_6431), cleanup_t_uint256(expr_6432))
                /// @src 15:2727:2771  "require(referralFeePct < WAD, PctExceeded())"
                require_helper_t_error_8270_PctExceeded(expr_6433)
                /// @src 15:2801:2806  "takes"
                let _11_mpos := var_takes_6399_mpos
                let expr_6440_mpos := _11_mpos
                /// @src 15:2807:2808  "0"
                let expr_6441 := 0x00
                /// @src 15:2801:2809  "takes[0]"
                let _12_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6440_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_6441)))
                let expr_6442_mpos := _12_mpos
                /// @src 15:2801:2815  "takes[0].offer"
                let _13 := add(expr_6442_mpos, 32)
                let _14_mpos := mload(_13)
                let expr_6443_mpos := _14_mpos
                /// @src 15:2801:2822  "takes[0].offer.market"
                let _15 := add(expr_6443_mpos, 0)
                let _16_mpos := mload(_15)
                let expr_6444_mpos := _16_mpos
                /// @src 15:2801:2832  "takes[0].offer.market.loanToken"
                let _17 := add(expr_6444_mpos, 0)
                let _18 := read_from_memoryt_address(_17)
                let expr_6445 := _18
                /// @src 15:2781:2832  "address loanToken = takes[0].offer.market.loanToken"
                let var_loanToken_6439 := expr_6445
                /// @src 15:2925:2933  "MIDNIGHT"
                let _19 := loadimmutable("6375")
                let expr_6450 := _19
                /// @src 15:2915:2934  "IMidnight(MIDNIGHT)"
                let expr_6451_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6450)
                /// @src 15:2915:2946  "IMidnight(MIDNIGHT).touchMarket"
                let expr_6452_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6451_address)
                let expr_6452_functionSelector := 0x2bfb98ac
                /// @src 15:2947:2952  "takes"
                let _20_mpos := var_takes_6399_mpos
                let expr_6453_mpos := _20_mpos
                /// @src 15:2953:2954  "0"
                let expr_6454 := 0x00
                /// @src 15:2947:2955  "takes[0]"
                let _21_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6453_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_6454)))
                let expr_6455_mpos := _21_mpos
                /// @src 15:2947:2961  "takes[0].offer"
                let _22 := add(expr_6455_mpos, 32)
                let _23_mpos := mload(_22)
                let expr_6456_mpos := _23_mpos
                /// @src 15:2947:2968  "takes[0].offer.market"
                let _24 := add(expr_6456_mpos, 0)
                let _25_mpos := mload(_24)
                let expr_6457_mpos := _25_mpos
                /// @src 15:2915:2969  "IMidnight(MIDNIGHT).touchMarket(takes[0].offer.market)"

                // storage for arguments and returned data
                let _26 := allocate_unbounded()
                mstore(_26, shift_left_224(expr_6452_functionSelector))
                let _27 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(add(_26, 4) , expr_6457_mpos)

                let _28 := call(gas(), expr_6452_address,  0,  _26, sub(_27, _26), _26, 32)

                if iszero(_28) { revert_forward_1() }

                let expr_6458
                if _28 {

                    let _29 := 32

                    if gt(_29, returndatasize()) {
                        _29 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_26, _29)

                    // decode return parameters from external try-call into retVars
                    expr_6458 :=  abi_decode_tuple_t_bytes32_fromMemory(_26, add(_26, _29))
                }
                /// @src 15:2902:2969  "bytes32 id = IMidnight(MIDNIGHT).touchMarket(takes[0].offer.market)"
                let var_id_6448 := expr_6458
                /// @src 15:2990:2999  "loanToken"
                let _30 := var_loanToken_6439
                let expr_6461 := _30
                /// @src 15:3001:3011  "msg.sender"
                let expr_6463 := caller()
                /// @src 15:3013:3027  "maxBuyerAssets"
                let _31 := var_maxBuyerAssets_6390
                let expr_6464 := _31
                /// @src 15:3029:3044  "loanTokenPermit"
                let _32_mpos := var_loanTokenPermit_6395_mpos
                let expr_6465_mpos := _32_mpos
                fun_pullToken_7968(expr_6461, expr_6463, expr_6464, expr_6465_mpos)
                /// @src 15:3071:3080  "loanToken"
                let _33 := var_loanToken_6439
                let expr_6469 := _33
                /// @src 15:3082:3090  "MIDNIGHT"
                let _34 := loadimmutable("6375")
                let expr_6470 := _34
                fun_forceApproveMax_7827(expr_6469, expr_6470)
                /// @src 15:3102:3121  "uint256 filledUnits"
                let var_filledUnits_6474
                let zero_t_uint256_35 := zero_value_for_split_t_uint256()
                var_filledUnits_6474 := zero_t_uint256_35
                /// @src 15:3131:3156  "uint256 filledBuyerAssets"
                let var_filledBuyerAssets_6477
                let zero_t_uint256_36 := zero_value_for_split_t_uint256()
                var_filledBuyerAssets_6477 := zero_t_uint256_36
                /// @src 15:3166:3954  "for (uint256 i; i < takes.length && filledUnits < targetUnits; i++) {..."
                for {
                    /// @src 15:3171:3180  "uint256 i"
                    let var_i_6480
                    let zero_t_uint256_37 := zero_value_for_split_t_uint256()
                    var_i_6480 := zero_t_uint256_37
                    } 1 {
                    /// @src 15:3229:3232  "i++"
                    let _39 := var_i_6480
                    let _38 := increment_t_uint256(_39)
                    var_i_6480 := _38
                    let expr_6491 := _39
                }
                {
                    /// @src 15:3182:3183  "i"
                    let _40 := var_i_6480
                    let expr_6482 := _40
                    /// @src 15:3186:3191  "takes"
                    let _41_mpos := var_takes_6399_mpos
                    let expr_6483_mpos := _41_mpos
                    /// @src 15:3186:3198  "takes.length"
                    let expr_6484 := array_length_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6483_mpos)
                    /// @src 15:3182:3198  "i < takes.length"
                    let expr_6485 := lt(cleanup_t_uint256(expr_6482), cleanup_t_uint256(expr_6484))
                    /// @src 15:3182:3227  "i < takes.length && filledUnits < targetUnits"
                    let expr_6489 := expr_6485
                    if expr_6489 {
                        /// @src 15:3202:3213  "filledUnits"
                        let _42 := var_filledUnits_6474
                        let expr_6486 := _42
                        /// @src 15:3216:3227  "targetUnits"
                        let _43 := var_targetUnits_6388
                        let expr_6487 := _43
                        /// @src 15:3202:3227  "filledUnits < targetUnits"
                        let expr_6488 := lt(cleanup_t_uint256(expr_6486), cleanup_t_uint256(expr_6487))
                        /// @src 15:3182:3227  "i < takes.length && filledUnits < targetUnits"
                        expr_6489 := expr_6488
                    }
                    if iszero(expr_6489) { break }
                    /// @src 15:3257:3262  "takes"
                    let _44_mpos := var_takes_6399_mpos
                    let expr_6494_mpos := _44_mpos
                    /// @src 15:3263:3264  "i"
                    let _45 := var_i_6480
                    let expr_6495 := _45
                    /// @src 15:3257:3265  "takes[i]"
                    let _46_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6494_mpos, expr_6495))
                    let expr_6496_mpos := _46_mpos
                    /// @src 15:3257:3271  "takes[i].offer"
                    let _47 := add(expr_6496_mpos, 32)
                    let _48_mpos := mload(_47)
                    let expr_6497_mpos := _48_mpos
                    /// @src 15:3257:3275  "takes[i].offer.buy"
                    let _49 := add(expr_6497_mpos, 32)
                    let _50 := read_from_memoryt_bool(_49)
                    let expr_6498 := _50
                    /// @src 15:3256:3275  "!takes[i].offer.buy"
                    let expr_6499 := cleanup_t_bool(iszero(expr_6498))
                    /// @src 15:3248:3296  "require(!takes[i].offer.buy, InconsistentSide())"
                    require_helper_t_error_8266_InconsistentSide(expr_6499)
                    /// @src 15:3328:3336  "MIDNIGHT"
                    let _51 := loadimmutable("6375")
                    let expr_6506 := _51
                    /// @src 15:3318:3337  "IMidnight(MIDNIGHT)"
                    let expr_6507_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6506)
                    /// @src 15:3318:3342  "IMidnight(MIDNIGHT).toId"
                    let expr_6508_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6507_address)
                    let expr_6508_functionSelector := 0x355986fa
                    /// @src 15:3343:3348  "takes"
                    let _52_mpos := var_takes_6399_mpos
                    let expr_6509_mpos := _52_mpos
                    /// @src 15:3349:3350  "i"
                    let _53 := var_i_6480
                    let expr_6510 := _53
                    /// @src 15:3343:3351  "takes[i]"
                    let _54_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6509_mpos, expr_6510))
                    let expr_6511_mpos := _54_mpos
                    /// @src 15:3343:3357  "takes[i].offer"
                    let _55 := add(expr_6511_mpos, 32)
                    let _56_mpos := mload(_55)
                    let expr_6512_mpos := _56_mpos
                    /// @src 15:3343:3364  "takes[i].offer.market"
                    let _57 := add(expr_6512_mpos, 0)
                    let _58_mpos := mload(_57)
                    let expr_6513_mpos := _58_mpos
                    /// @src 15:3318:3365  "IMidnight(MIDNIGHT).toId(takes[i].offer.market)"

                    // storage for arguments and returned data
                    let _59 := allocate_unbounded()
                    mstore(_59, shift_left_224(expr_6508_functionSelector))
                    let _60 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(add(_59, 4) , expr_6513_mpos)

                    let _61 := staticcall(gas(), expr_6508_address,  _59, sub(_60, _59), _59, 32)

                    if iszero(_61) { revert_forward_1() }

                    let expr_6514
                    if _61 {

                        let _62 := 32

                        if gt(_62, returndatasize()) {
                            _62 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_59, _62)

                        // decode return parameters from external try-call into retVars
                        expr_6514 :=  abi_decode_tuple_t_bytes32_fromMemory(_59, add(_59, _62))
                    }
                    /// @src 15:3369:3371  "id"
                    let _63 := var_id_6448
                    let expr_6515 := _63
                    /// @src 15:3318:3371  "IMidnight(MIDNIGHT).toId(takes[i].offer.market) == id"
                    let expr_6516 := eq(cleanup_t_bytes32(expr_6514), cleanup_t_bytes32(expr_6515))
                    /// @src 15:3310:3394  "require(IMidnight(MIDNIGHT).toId(takes[i].offer.market) == id, InconsistentMarket())"
                    require_helper_t_error_8264_InconsistentMarket(expr_6516)
                    /// @src 15:3451:3462  "targetUnits"
                    let _64 := var_targetUnits_6388
                    let expr_6524 := _64
                    /// @src 15:3465:3476  "filledUnits"
                    let _65 := var_filledUnits_6474
                    let expr_6525 := _65
                    /// @src 15:3451:3476  "targetUnits - filledUnits"
                    let expr_6526 := checked_sub_t_uint256(expr_6524, expr_6525)

                    /// @src 15:3494:3499  "takes"
                    let _66_mpos := var_takes_6399_mpos
                    let expr_6527_mpos := _66_mpos
                    /// @src 15:3500:3501  "i"
                    let _67 := var_i_6480
                    let expr_6528 := _67
                    /// @src 15:3494:3502  "takes[i]"
                    let _68_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6527_mpos, expr_6528))
                    let expr_6529_mpos := _68_mpos
                    /// @src 15:3494:3508  "takes[i].units"
                    let _69 := add(expr_6529_mpos, 0)
                    let _70 := read_from_memoryt_uint256(_69)
                    let expr_6530 := _70
                    /// @src 15:3526:3544  "ConsumableUnitsLib"
                    let expr_6531_address := linkersymbol("deps/midnight/src/periphery/ConsumableUnitsLib.sol:ConsumableUnitsLib")
                    /// @src 15:3561:3569  "MIDNIGHT"
                    let _71 := loadimmutable("6375")
                    let expr_6533 := _71
                    /// @src 15:3571:3573  "id"
                    let _72 := var_id_6448
                    let expr_6534 := _72
                    /// @src 15:3575:3580  "takes"
                    let _73_mpos := var_takes_6399_mpos
                    let expr_6535_mpos := _73_mpos
                    /// @src 15:3581:3582  "i"
                    let _74 := var_i_6480
                    let expr_6536 := _74
                    /// @src 15:3575:3583  "takes[i]"
                    let _75_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6535_mpos, expr_6536))
                    let expr_6537_mpos := _75_mpos
                    /// @src 15:3575:3589  "takes[i].offer"
                    let _76 := add(expr_6537_mpos, 32)
                    let _77_mpos := mload(_76)
                    let expr_6538_mpos := _77_mpos
                    /// @src 15:3526:3590  "ConsumableUnitsLib.consumableUnits(MIDNIGHT, id, takes[i].offer)"
                    let expr_6539 := fun_consumableUnits_6168(expr_6533, expr_6534, expr_6538_mpos)
                    /// @src 15:3430:3604  "min(..."
                    let expr_6540 := fun_min_7733(expr_6526, expr_6530, expr_6539)
                    /// @src 15:3408:3604  "uint256 unitsToTake = min(..."
                    let var_unitsToTake_6522 := expr_6540
                    /// @src 15:3632:3640  "MIDNIGHT"
                    let _78 := loadimmutable("6375")
                    let expr_6543 := _78
                    /// @src 15:3622:3641  "IMidnight(MIDNIGHT)"
                    let expr_6544_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6543)
                    /// @src 15:3622:3663  "IMidnight(MIDNIGHT)..."
                    let expr_6545_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6544_address)
                    let expr_6545_functionSelector := 0x81a01d33
                    /// @src 15:3664:3669  "takes"
                    let _79_mpos := var_takes_6399_mpos
                    let expr_6546_mpos := _79_mpos
                    /// @src 15:3670:3671  "i"
                    let _80 := var_i_6480
                    let expr_6547 := _80
                    /// @src 15:3664:3672  "takes[i]"
                    let _81_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6546_mpos, expr_6547))
                    let expr_6548_mpos := _81_mpos
                    /// @src 15:3664:3678  "takes[i].offer"
                    let _82 := add(expr_6548_mpos, 32)
                    let _83_mpos := mload(_82)
                    let expr_6549_mpos := _83_mpos
                    /// @src 15:3680:3685  "takes"
                    let _84_mpos := var_takes_6399_mpos
                    let expr_6550_mpos := _84_mpos
                    /// @src 15:3686:3687  "i"
                    let _85 := var_i_6480
                    let expr_6551 := _85
                    /// @src 15:3680:3688  "takes[i]"
                    let _86_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6550_mpos, expr_6551))
                    let expr_6552_mpos := _86_mpos
                    /// @src 15:3680:3701  "takes[i].ratifierData"
                    let _87 := add(expr_6552_mpos, 64)
                    let _88_mpos := mload(_87)
                    let expr_6553_mpos := _88_mpos
                    /// @src 15:3703:3714  "unitsToTake"
                    let _89 := var_unitsToTake_6522
                    let expr_6554 := _89
                    /// @src 15:3716:3721  "taker"
                    let _90 := var_taker_6392
                    let expr_6555 := _90
                    /// @src 15:3731:3732  "0"
                    let expr_6558 := 0x00
                    /// @src 15:3723:3733  "address(0)"
                    let expr_6559 := convert_t_rational_0_by_1_to_t_address(expr_6558)
                    /// @src 15:3743:3744  "0"
                    let expr_6562 := 0x00
                    /// @src 15:3735:3745  "address(0)"
                    let expr_6563 := convert_t_rational_0_by_1_to_t_address(expr_6562)
                    /// @src 15:3622:3750  "IMidnight(MIDNIGHT)..."

                    // storage for arguments and returned data
                    let _91 := allocate_unbounded()
                    mstore(_91, shift_left_224(expr_6545_functionSelector))
                    let _92 := abi_encode_tuple_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_bytes_memory_ptr__fromStack(add(_91, 4) , expr_6549_mpos, expr_6553_mpos, expr_6554, expr_6555, expr_6559, expr_6563)

                    let trySuccessCondition_6565 := call(gas(), expr_6545_address,  0,  _91, sub(_92, _91), _91, 64)

                    let expr_6565_component_1, expr_6565_component_2
                    if trySuccessCondition_6565 {

                        let _93 := 64

                        if gt(_93, returndatasize()) {
                            _93 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_91, _93)

                        // decode return parameters from external try-call into retVars
                        expr_6565_component_1, expr_6565_component_2 :=  abi_decode_tuple_t_uint256t_uint256_fromMemory(_91, add(_91, _93))
                    }
                    /// @src 15:3618:3944  "try IMidnight(MIDNIGHT)..."
                    switch iszero(trySuccessCondition_6565)
                    case 0 { // success case
                        let var_resBuyerAssets_6567 := expr_6565_component_1
                        let var__6569 := expr_6565_component_2
                        /// @src 15:3856:3867  "unitsToTake"
                        let _94 := var_unitsToTake_6522
                        let expr_6572 := _94
                        /// @src 15:3841:3867  "filledUnits += unitsToTake"
                        let _95 := var_filledUnits_6474
                        let expr_6573 := checked_add_t_uint256(_95, expr_6572)

                        var_filledUnits_6474 := expr_6573
                        /// @src 15:3906:3920  "resBuyerAssets"
                        let _96 := var_resBuyerAssets_6567
                        let expr_6576 := _96
                        /// @src 15:3885:3920  "filledBuyerAssets += resBuyerAssets"
                        let _97 := var_filledBuyerAssets_6477
                        let expr_6577 := checked_add_t_uint256(_97, expr_6576)

                        var_filledBuyerAssets_6477 := expr_6577
                        /// @src 15:3618:3944  "try IMidnight(MIDNIGHT)..."
                    }
                    default { // failure case
                        let _98 := 1
                        if _98 {
                        }
                    }
                }
                /// @src 15:3972:3983  "filledUnits"
                let _99 := var_filledUnits_6474
                let expr_6587 := _99
                /// @src 15:3987:3998  "targetUnits"
                let _100 := var_targetUnits_6388
                let expr_6588 := _100
                /// @src 15:3972:3998  "filledUnits == targetUnits"
                let expr_6589 := eq(cleanup_t_uint256(expr_6587), cleanup_t_uint256(expr_6588))
                /// @src 15:3964:4014  "require(filledUnits == targetUnits, OutOfOffers())"
                require_helper_t_error_8268_OutOfOffers(expr_6589)
                /// @src 15:4048:4053  "takes"
                let _101_mpos := var_takes_6399_mpos
                let expr_6597_mpos := _101_mpos
                /// @src 15:4054:4055  "0"
                let expr_6598 := 0x00
                /// @src 15:4048:4056  "takes[0]"
                let _102_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6597_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_6598)))
                let expr_6599_mpos := _102_mpos
                /// @src 15:4048:4062  "takes[0].offer"
                let _103 := add(expr_6599_mpos, 32)
                let _104_mpos := mload(_103)
                let expr_6600_mpos := _104_mpos
                /// @src 15:4048:4069  "takes[0].offer.market"
                let _105 := add(expr_6600_mpos, 0)
                let _106_mpos := mload(_105)
                let expr_6601_mpos := _106_mpos
                /// @src 15:4025:4069  "Market memory market = takes[0].offer.market"
                let var_market_6596_mpos := expr_6601_mpos
                /// @src 15:4079:4442  "for (uint256 i; i < collateralWithdrawals.length; i++) {..."
                for {
                    /// @src 15:4084:4093  "uint256 i"
                    let var_i_6604
                    let zero_t_uint256_107 := zero_value_for_split_t_uint256()
                    var_i_6604 := zero_t_uint256_107
                    } 1 {
                    /// @src 15:4129:4132  "i++"
                    let _109 := var_i_6604
                    let _108 := increment_wrapping_t_uint256(_109)
                    var_i_6604 := _108
                    let expr_6611 := _109
                }
                {
                    /// @src 15:4095:4096  "i"
                    let _110 := var_i_6604
                    let expr_6606 := _110
                    /// @src 15:4099:4120  "collateralWithdrawals"
                    let _111_mpos := var_collateralWithdrawals_6403_mpos
                    let expr_6607_mpos := _111_mpos
                    /// @src 15:4099:4127  "collateralWithdrawals.length"
                    let expr_6608 := array_length_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(expr_6607_mpos)
                    /// @src 15:4095:4127  "i < collateralWithdrawals.length"
                    let expr_6609 := lt(cleanup_t_uint256(expr_6606), cleanup_t_uint256(expr_6608))
                    if iszero(expr_6609) { break }
                    /// @src 15:4158:4166  "MIDNIGHT"
                    let _112 := loadimmutable("6375")
                    let expr_6614 := _112
                    /// @src 15:4148:4167  "IMidnight(MIDNIGHT)"
                    let expr_6615_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6614)
                    /// @src 15:4148:4203  "IMidnight(MIDNIGHT)..."
                    let expr_6616_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6615_address)
                    let expr_6616_functionSelector := 0x564b55d9
                    /// @src 15:4225:4231  "market"
                    let _113_mpos := var_market_6596_mpos
                    let expr_6617_mpos := _113_mpos
                    /// @src 15:4253:4274  "collateralWithdrawals"
                    let _114_mpos := var_collateralWithdrawals_6403_mpos
                    let expr_6618_mpos := _114_mpos
                    /// @src 15:4275:4276  "i"
                    let _115 := var_i_6604
                    let expr_6619 := _115
                    /// @src 15:4253:4277  "collateralWithdrawals[i]"
                    let _116_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(expr_6618_mpos, expr_6619))
                    let expr_6620_mpos := _116_mpos
                    /// @src 15:4253:4293  "collateralWithdrawals[i].collateralIndex"
                    let _117 := add(expr_6620_mpos, 0)
                    let _118 := read_from_memoryt_uint256(_117)
                    let expr_6621 := _118
                    /// @src 15:4315:4336  "collateralWithdrawals"
                    let _119_mpos := var_collateralWithdrawals_6403_mpos
                    let expr_6622_mpos := _119_mpos
                    /// @src 15:4337:4338  "i"
                    let _120 := var_i_6604
                    let expr_6623 := _120
                    /// @src 15:4315:4339  "collateralWithdrawals[i]"
                    let _121_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(expr_6622_mpos, expr_6623))
                    let expr_6624_mpos := _121_mpos
                    /// @src 15:4315:4346  "collateralWithdrawals[i].assets"
                    let _122 := add(expr_6624_mpos, 32)
                    let _123 := read_from_memoryt_uint256(_122)
                    let expr_6625 := _123
                    /// @src 15:4368:4373  "taker"
                    let _124 := var_taker_6392
                    let expr_6626 := _124
                    /// @src 15:4395:4413  "collateralReceiver"
                    let _125 := var_collateralReceiver_6405
                    let expr_6627 := _125
                    /// @src 15:4148:4431  "IMidnight(MIDNIGHT)..."

                    if iszero(extcodesize(expr_6616_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                    // storage for arguments and returned data
                    let _126 := allocate_unbounded()
                    mstore(_126, shift_left_224(expr_6616_functionSelector))
                    let _127 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address_t_address__to_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address_t_address__fromStack(add(_126, 4) , expr_6617_mpos, expr_6621, expr_6625, expr_6626, expr_6627)

                    let _128 := call(gas(), expr_6616_address,  0,  _126, sub(_127, _126), _126, 0)

                    if iszero(_128) { revert_forward_1() }

                    if _128 {

                        let _129 := 0

                        if gt(_129, returndatasize()) {
                            _129 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_126, _129)

                        // decode return parameters from external try-call into retVars
                        abi_decode_tuple__fromMemory(_126, add(_126, _129))
                    }
                }
                /// @src 15:4480:4497  "filledBuyerAssets"
                let _130 := var_filledBuyerAssets_6477
                let expr_6634 := _130
                /// @src 15:4480:4508  "filledBuyerAssets.mulDivDown"
                let expr_6635_self := expr_6634
                /// @src 15:4509:4523  "referralFeePct"
                let _131 := var_referralFeePct_6407
                let expr_6636 := _131
                /// @src 15:4525:4528  "WAD"
                let expr_6637 := constant_WAD_4917()
                /// @src 15:4531:4545  "referralFeePct"
                let _132 := var_referralFeePct_6407
                let expr_6638 := _132
                /// @src 15:4525:4545  "WAD - referralFeePct"
                let expr_6639 := checked_sub_t_uint256(expr_6637, expr_6638)

                /// @src 15:4480:4546  "filledBuyerAssets.mulDivDown(referralFeePct, WAD - referralFeePct)"
                let expr_6640 := fun_mulDivDown_5872(expr_6635_self, expr_6636, expr_6639)
                /// @src 15:4452:4546  "uint256 referralFeeAssets = filledBuyerAssets.mulDivDown(referralFeePct, WAD - referralFeePct)"
                let var_referralFeeAssets_6633 := expr_6640
                /// @src 15:4560:4577  "referralFeeAssets"
                let _133 := var_referralFeeAssets_6633
                let expr_6642 := _133
                /// @src 15:4580:4581  "0"
                let expr_6643 := 0x00
                /// @src 15:4560:4581  "referralFeeAssets > 0"
                let expr_6644 := gt(cleanup_t_uint256(expr_6642), convert_t_rational_0_by_1_to_t_uint256(expr_6643))
                /// @src 15:4556:4663  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                if expr_6644 {
                    /// @src 15:4583:4598  "SafeTransferLib"
                    let expr_6645_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                    /// @src 15:4612:4621  "loanToken"
                    let _134 := var_loanToken_6439
                    let expr_6648 := _134
                    /// @src 15:4623:4643  "referralFeeRecipient"
                    let _135 := var_referralFeeRecipient_6409
                    let expr_6649 := _135
                    /// @src 15:4645:4662  "referralFeeAssets"
                    let _136 := var_referralFeeAssets_6633
                    let expr_6650 := _136
                    fun_safeTransfer_5503(expr_6648, expr_6649, expr_6650)
                    /// @src 15:4556:4663  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                }
                /// @src 15:4673:4688  "SafeTransferLib"
                let expr_6654_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 15:4702:4711  "loanToken"
                let _137 := var_loanToken_6439
                let expr_6657 := _137
                /// @src 15:4713:4723  "msg.sender"
                let expr_6659 := caller()
                /// @src 15:4725:4739  "maxBuyerAssets"
                let _138 := var_maxBuyerAssets_6390
                let expr_6660 := _138
                /// @src 15:4742:4759  "filledBuyerAssets"
                let _139 := var_filledBuyerAssets_6477
                let expr_6661 := _139
                /// @src 15:4725:4759  "maxBuyerAssets - filledBuyerAssets"
                let expr_6662 := checked_sub_t_uint256(expr_6660, expr_6661)

                /// @src 15:4762:4779  "referralFeeAssets"
                let _140 := var_referralFeeAssets_6633
                let expr_6663 := _140
                /// @src 15:4725:4779  "maxBuyerAssets - filledBuyerAssets - referralFeeAssets"
                let expr_6664 := checked_sub_t_uint256(expr_6662, expr_6663)

                fun_safeTransfer_5503(expr_6657, expr_6659, expr_6664)

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function require_helper_t_error_8278_UnitsTooLow(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x7b4cb71a00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 7259
            /// @src 15:8978:11711  "function buyWithAssetsTargetAndWithdrawCollateral(..."
            function fun_buyWithAssetsTargetAndWithdrawCollateral_7259(var_targetBuyerAssets_6971, var_minUnits_6973, var_taker_6975, var_loanTokenPermit_6978_mpos, var_takes_6982_mpos, var_collateralWithdrawals_6986_mpos, var_collateralReceiver_6988, var_referralFeePct_6990, var_referralFeeRecipient_6992) {

                /// @src 15:9385:9390  "taker"
                let _141 := var_taker_6975
                let expr_6996 := _141
                /// @src 15:9394:9404  "msg.sender"
                let expr_6998 := caller()
                /// @src 15:9385:9404  "taker == msg.sender"
                let expr_6999 := eq(cleanup_t_address(expr_6996), cleanup_t_address(expr_6998))
                /// @src 15:9385:9459  "taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"
                let expr_7008 := expr_6999
                if iszero(expr_7008) {
                    /// @src 15:9418:9426  "MIDNIGHT"
                    let _142 := loadimmutable("6375")
                    let expr_7001 := _142
                    /// @src 15:9408:9427  "IMidnight(MIDNIGHT)"
                    let expr_7002_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7001)
                    /// @src 15:9408:9440  "IMidnight(MIDNIGHT).isAuthorized"
                    let expr_7003_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7002_address)
                    let expr_7003_functionSelector := 0x65e4ad9e
                    /// @src 15:9441:9446  "taker"
                    let _143 := var_taker_6975
                    let expr_7004 := _143
                    /// @src 15:9448:9458  "msg.sender"
                    let expr_7006 := caller()
                    /// @src 15:9408:9459  "IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"

                    // storage for arguments and returned data
                    let _144 := allocate_unbounded()
                    mstore(_144, shift_left_224(expr_7003_functionSelector))
                    let _145 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_144, 4) , expr_7004, expr_7006)

                    let _146 := staticcall(gas(), expr_7003_address,  _144, sub(_145, _144), _144, 32)

                    if iszero(_146) { revert_forward_1() }

                    let expr_7007
                    if _146 {

                        let _147 := 32

                        if gt(_147, returndatasize()) {
                            _147 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_144, _147)

                        // decode return parameters from external try-call into retVars
                        expr_7007 :=  abi_decode_tuple_t_bool_fromMemory(_144, add(_144, _147))
                    }
                    /// @src 15:9385:9459  "taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"
                    expr_7008 := expr_7007
                }
                /// @src 15:9377:9476  "require(taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender), Unauthorized())"
                require_helper_t_error_8274_Unauthorized(expr_7008)
                /// @src 15:9494:9508  "referralFeePct"
                let _148 := var_referralFeePct_6990
                let expr_7014 := _148
                /// @src 15:9511:9514  "WAD"
                let expr_7015 := constant_WAD_4917()
                /// @src 15:9494:9514  "referralFeePct < WAD"
                let expr_7016 := lt(cleanup_t_uint256(expr_7014), cleanup_t_uint256(expr_7015))
                /// @src 15:9486:9530  "require(referralFeePct < WAD, PctExceeded())"
                require_helper_t_error_8270_PctExceeded(expr_7016)
                /// @src 15:9560:9565  "takes"
                let _149_mpos := var_takes_6982_mpos
                let expr_7023_mpos := _149_mpos
                /// @src 15:9566:9567  "0"
                let expr_7024 := 0x00
                /// @src 15:9560:9568  "takes[0]"
                let _150_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7023_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_7024)))
                let expr_7025_mpos := _150_mpos
                /// @src 15:9560:9574  "takes[0].offer"
                let _151 := add(expr_7025_mpos, 32)
                let _152_mpos := mload(_151)
                let expr_7026_mpos := _152_mpos
                /// @src 15:9560:9581  "takes[0].offer.market"
                let _153 := add(expr_7026_mpos, 0)
                let _154_mpos := mload(_153)
                let expr_7027_mpos := _154_mpos
                /// @src 15:9560:9591  "takes[0].offer.market.loanToken"
                let _155 := add(expr_7027_mpos, 0)
                let _156 := read_from_memoryt_address(_155)
                let expr_7028 := _156
                /// @src 15:9540:9591  "address loanToken = takes[0].offer.market.loanToken"
                let var_loanToken_7022 := expr_7028
                /// @src 15:9684:9692  "MIDNIGHT"
                let _157 := loadimmutable("6375")
                let expr_7033 := _157
                /// @src 15:9674:9693  "IMidnight(MIDNIGHT)"
                let expr_7034_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7033)
                /// @src 15:9674:9705  "IMidnight(MIDNIGHT).touchMarket"
                let expr_7035_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7034_address)
                let expr_7035_functionSelector := 0x2bfb98ac
                /// @src 15:9706:9711  "takes"
                let _158_mpos := var_takes_6982_mpos
                let expr_7036_mpos := _158_mpos
                /// @src 15:9712:9713  "0"
                let expr_7037 := 0x00
                /// @src 15:9706:9714  "takes[0]"
                let _159_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7036_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_7037)))
                let expr_7038_mpos := _159_mpos
                /// @src 15:9706:9720  "takes[0].offer"
                let _160 := add(expr_7038_mpos, 32)
                let _161_mpos := mload(_160)
                let expr_7039_mpos := _161_mpos
                /// @src 15:9706:9727  "takes[0].offer.market"
                let _162 := add(expr_7039_mpos, 0)
                let _163_mpos := mload(_162)
                let expr_7040_mpos := _163_mpos
                /// @src 15:9674:9728  "IMidnight(MIDNIGHT).touchMarket(takes[0].offer.market)"

                // storage for arguments and returned data
                let _164 := allocate_unbounded()
                mstore(_164, shift_left_224(expr_7035_functionSelector))
                let _165 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(add(_164, 4) , expr_7040_mpos)

                let _166 := call(gas(), expr_7035_address,  0,  _164, sub(_165, _164), _164, 32)

                if iszero(_166) { revert_forward_1() }

                let expr_7041
                if _166 {

                    let _167 := 32

                    if gt(_167, returndatasize()) {
                        _167 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_164, _167)

                    // decode return parameters from external try-call into retVars
                    expr_7041 :=  abi_decode_tuple_t_bytes32_fromMemory(_164, add(_164, _167))
                }
                /// @src 15:9661:9728  "bytes32 id = IMidnight(MIDNIGHT).touchMarket(takes[0].offer.market)"
                let var_id_7031 := expr_7041
                /// @src 15:9749:9758  "loanToken"
                let _168 := var_loanToken_7022
                let expr_7044 := _168
                /// @src 15:9760:9770  "msg.sender"
                let expr_7046 := caller()
                /// @src 15:9772:9789  "targetBuyerAssets"
                let _169 := var_targetBuyerAssets_6971
                let expr_7047 := _169
                /// @src 15:9791:9806  "loanTokenPermit"
                let _170_mpos := var_loanTokenPermit_6978_mpos
                let expr_7048_mpos := _170_mpos
                fun_pullToken_7968(expr_7044, expr_7046, expr_7047, expr_7048_mpos)
                /// @src 15:9833:9842  "loanToken"
                let _171 := var_loanToken_7022
                let expr_7052 := _171
                /// @src 15:9844:9852  "MIDNIGHT"
                let _172 := loadimmutable("6375")
                let expr_7053 := _172
                fun_forceApproveMax_7827(expr_7052, expr_7053)
                /// @src 15:9892:9909  "targetBuyerAssets"
                let _173 := var_targetBuyerAssets_6971
                let expr_7058 := _173
                /// @src 15:9892:9920  "targetBuyerAssets.mulDivDown"
                let expr_7059_self := expr_7058
                /// @src 15:9921:9935  "referralFeePct"
                let _174 := var_referralFeePct_6990
                let expr_7060 := _174
                /// @src 15:9937:9940  "WAD"
                let expr_7061 := constant_WAD_4917()
                /// @src 15:9892:9941  "targetBuyerAssets.mulDivDown(referralFeePct, WAD)"
                let expr_7062 := fun_mulDivDown_5872(expr_7059_self, expr_7060, expr_7061)
                /// @src 15:9864:9941  "uint256 referralFeeAssets = targetBuyerAssets.mulDivDown(referralFeePct, WAD)"
                let var_referralFeeAssets_7057 := expr_7062
                /// @src 15:9985:10002  "targetBuyerAssets"
                let _175 := var_targetBuyerAssets_6971
                let expr_7066 := _175
                /// @src 15:10005:10022  "referralFeeAssets"
                let _176 := var_referralFeeAssets_7057
                let expr_7067 := _176
                /// @src 15:9985:10022  "targetBuyerAssets - referralFeeAssets"
                let expr_7068 := checked_sub_t_uint256(expr_7066, expr_7067)

                /// @src 15:9951:10022  "uint256 targetFilledBuyerAssets = targetBuyerAssets - referralFeeAssets"
                let var_targetFilledBuyerAssets_7065 := expr_7068
                /// @src 15:10033:10052  "uint256 filledUnits"
                let var_filledUnits_7071
                let zero_t_uint256_177 := zero_value_for_split_t_uint256()
                var_filledUnits_7071 := zero_t_uint256_177
                /// @src 15:10062:10087  "uint256 filledBuyerAssets"
                let var_filledBuyerAssets_7074
                let zero_t_uint256_178 := zero_value_for_split_t_uint256()
                var_filledBuyerAssets_7074 := zero_t_uint256_178
                /// @src 15:10097:11024  "for (uint256 i; i < takes.length && filledBuyerAssets < targetFilledBuyerAssets; i++) {..."
                for {
                    /// @src 15:10102:10111  "uint256 i"
                    let var_i_7077
                    let zero_t_uint256_179 := zero_value_for_split_t_uint256()
                    var_i_7077 := zero_t_uint256_179
                    } 1 {
                    /// @src 15:10178:10181  "i++"
                    let _181 := var_i_7077
                    let _180 := increment_t_uint256(_181)
                    var_i_7077 := _180
                    let expr_7088 := _181
                }
                {
                    /// @src 15:10113:10114  "i"
                    let _182 := var_i_7077
                    let expr_7079 := _182
                    /// @src 15:10117:10122  "takes"
                    let _183_mpos := var_takes_6982_mpos
                    let expr_7080_mpos := _183_mpos
                    /// @src 15:10117:10129  "takes.length"
                    let expr_7081 := array_length_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7080_mpos)
                    /// @src 15:10113:10129  "i < takes.length"
                    let expr_7082 := lt(cleanup_t_uint256(expr_7079), cleanup_t_uint256(expr_7081))
                    /// @src 15:10113:10176  "i < takes.length && filledBuyerAssets < targetFilledBuyerAssets"
                    let expr_7086 := expr_7082
                    if expr_7086 {
                        /// @src 15:10133:10150  "filledBuyerAssets"
                        let _184 := var_filledBuyerAssets_7074
                        let expr_7083 := _184
                        /// @src 15:10153:10176  "targetFilledBuyerAssets"
                        let _185 := var_targetFilledBuyerAssets_7065
                        let expr_7084 := _185
                        /// @src 15:10133:10176  "filledBuyerAssets < targetFilledBuyerAssets"
                        let expr_7085 := lt(cleanup_t_uint256(expr_7083), cleanup_t_uint256(expr_7084))
                        /// @src 15:10113:10176  "i < takes.length && filledBuyerAssets < targetFilledBuyerAssets"
                        expr_7086 := expr_7085
                    }
                    if iszero(expr_7086) { break }
                    /// @src 15:10206:10211  "takes"
                    let _186_mpos := var_takes_6982_mpos
                    let expr_7091_mpos := _186_mpos
                    /// @src 15:10212:10213  "i"
                    let _187 := var_i_7077
                    let expr_7092 := _187
                    /// @src 15:10206:10214  "takes[i]"
                    let _188_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7091_mpos, expr_7092))
                    let expr_7093_mpos := _188_mpos
                    /// @src 15:10206:10220  "takes[i].offer"
                    let _189 := add(expr_7093_mpos, 32)
                    let _190_mpos := mload(_189)
                    let expr_7094_mpos := _190_mpos
                    /// @src 15:10206:10224  "takes[i].offer.buy"
                    let _191 := add(expr_7094_mpos, 32)
                    let _192 := read_from_memoryt_bool(_191)
                    let expr_7095 := _192
                    /// @src 15:10205:10224  "!takes[i].offer.buy"
                    let expr_7096 := cleanup_t_bool(iszero(expr_7095))
                    /// @src 15:10197:10245  "require(!takes[i].offer.buy, InconsistentSide())"
                    require_helper_t_error_8266_InconsistentSide(expr_7096)
                    /// @src 15:10277:10285  "MIDNIGHT"
                    let _193 := loadimmutable("6375")
                    let expr_7103 := _193
                    /// @src 15:10267:10286  "IMidnight(MIDNIGHT)"
                    let expr_7104_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7103)
                    /// @src 15:10267:10291  "IMidnight(MIDNIGHT).toId"
                    let expr_7105_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7104_address)
                    let expr_7105_functionSelector := 0x355986fa
                    /// @src 15:10292:10297  "takes"
                    let _194_mpos := var_takes_6982_mpos
                    let expr_7106_mpos := _194_mpos
                    /// @src 15:10298:10299  "i"
                    let _195 := var_i_7077
                    let expr_7107 := _195
                    /// @src 15:10292:10300  "takes[i]"
                    let _196_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7106_mpos, expr_7107))
                    let expr_7108_mpos := _196_mpos
                    /// @src 15:10292:10306  "takes[i].offer"
                    let _197 := add(expr_7108_mpos, 32)
                    let _198_mpos := mload(_197)
                    let expr_7109_mpos := _198_mpos
                    /// @src 15:10292:10313  "takes[i].offer.market"
                    let _199 := add(expr_7109_mpos, 0)
                    let _200_mpos := mload(_199)
                    let expr_7110_mpos := _200_mpos
                    /// @src 15:10267:10314  "IMidnight(MIDNIGHT).toId(takes[i].offer.market)"

                    // storage for arguments and returned data
                    let _201 := allocate_unbounded()
                    mstore(_201, shift_left_224(expr_7105_functionSelector))
                    let _202 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(add(_201, 4) , expr_7110_mpos)

                    let _203 := staticcall(gas(), expr_7105_address,  _201, sub(_202, _201), _201, 32)

                    if iszero(_203) { revert_forward_1() }

                    let expr_7111
                    if _203 {

                        let _204 := 32

                        if gt(_204, returndatasize()) {
                            _204 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_201, _204)

                        // decode return parameters from external try-call into retVars
                        expr_7111 :=  abi_decode_tuple_t_bytes32_fromMemory(_201, add(_201, _204))
                    }
                    /// @src 15:10318:10320  "id"
                    let _205 := var_id_7031
                    let expr_7112 := _205
                    /// @src 15:10267:10320  "IMidnight(MIDNIGHT).toId(takes[i].offer.market) == id"
                    let expr_7113 := eq(cleanup_t_bytes32(expr_7111), cleanup_t_bytes32(expr_7112))
                    /// @src 15:10259:10343  "require(IMidnight(MIDNIGHT).toId(takes[i].offer.market) == id, InconsistentMarket())"
                    require_helper_t_error_8264_InconsistentMarket(expr_7113)
                    /// @src 15:10400:10414  "TakeAmountsLib"
                    let expr_7121_address := linkersymbol("deps/midnight/src/periphery/TakeAmountsLib.sol:TakeAmountsLib")
                    /// @src 15:10455:10463  "MIDNIGHT"
                    let _206 := loadimmutable("6375")
                    let expr_7123 := _206
                    /// @src 15:10465:10467  "id"
                    let _207 := var_id_7031
                    let expr_7124 := _207
                    /// @src 15:10469:10474  "takes"
                    let _208_mpos := var_takes_6982_mpos
                    let expr_7125_mpos := _208_mpos
                    /// @src 15:10475:10476  "i"
                    let _209 := var_i_7077
                    let expr_7126 := _209
                    /// @src 15:10469:10477  "takes[i]"
                    let _210_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7125_mpos, expr_7126))
                    let expr_7127_mpos := _210_mpos
                    /// @src 15:10469:10483  "takes[i].offer"
                    let _211 := add(expr_7127_mpos, 32)
                    let _212_mpos := mload(_211)
                    let expr_7128_mpos := _212_mpos
                    /// @src 15:10485:10508  "targetFilledBuyerAssets"
                    let _213 := var_targetFilledBuyerAssets_7065
                    let expr_7129 := _213
                    /// @src 15:10511:10528  "filledBuyerAssets"
                    let _214 := var_filledBuyerAssets_7074
                    let expr_7130 := _214
                    /// @src 15:10485:10528  "targetFilledBuyerAssets - filledBuyerAssets"
                    let expr_7131 := checked_sub_t_uint256(expr_7129, expr_7130)

                    /// @src 15:10400:10546  "TakeAmountsLib.buyerAssetsToUnits(..."
                    let expr_7132 := fun_buyerAssetsToUnits_8063(expr_7123, expr_7124, expr_7128_mpos, expr_7131)
                    /// @src 15:10564:10569  "takes"
                    let _215_mpos := var_takes_6982_mpos
                    let expr_7133_mpos := _215_mpos
                    /// @src 15:10570:10571  "i"
                    let _216 := var_i_7077
                    let expr_7134 := _216
                    /// @src 15:10564:10572  "takes[i]"
                    let _217_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7133_mpos, expr_7134))
                    let expr_7135_mpos := _217_mpos
                    /// @src 15:10564:10578  "takes[i].units"
                    let _218 := add(expr_7135_mpos, 0)
                    let _219 := read_from_memoryt_uint256(_218)
                    let expr_7136 := _219
                    /// @src 15:10596:10614  "ConsumableUnitsLib"
                    let expr_7137_address := linkersymbol("deps/midnight/src/periphery/ConsumableUnitsLib.sol:ConsumableUnitsLib")
                    /// @src 15:10631:10639  "MIDNIGHT"
                    let _220 := loadimmutable("6375")
                    let expr_7139 := _220
                    /// @src 15:10641:10643  "id"
                    let _221 := var_id_7031
                    let expr_7140 := _221
                    /// @src 15:10645:10650  "takes"
                    let _222_mpos := var_takes_6982_mpos
                    let expr_7141_mpos := _222_mpos
                    /// @src 15:10651:10652  "i"
                    let _223 := var_i_7077
                    let expr_7142 := _223
                    /// @src 15:10645:10653  "takes[i]"
                    let _224_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7141_mpos, expr_7142))
                    let expr_7143_mpos := _224_mpos
                    /// @src 15:10645:10659  "takes[i].offer"
                    let _225 := add(expr_7143_mpos, 32)
                    let _226_mpos := mload(_225)
                    let expr_7144_mpos := _226_mpos
                    /// @src 15:10596:10660  "ConsumableUnitsLib.consumableUnits(MIDNIGHT, id, takes[i].offer)"
                    let expr_7145 := fun_consumableUnits_6168(expr_7139, expr_7140, expr_7144_mpos)
                    /// @src 15:10379:10674  "min(..."
                    let expr_7146 := fun_min_7733(expr_7132, expr_7136, expr_7145)
                    /// @src 15:10357:10674  "uint256 unitsToTake = min(..."
                    let var_unitsToTake_7119 := expr_7146
                    /// @src 15:10702:10710  "MIDNIGHT"
                    let _227 := loadimmutable("6375")
                    let expr_7149 := _227
                    /// @src 15:10692:10711  "IMidnight(MIDNIGHT)"
                    let expr_7150_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7149)
                    /// @src 15:10692:10733  "IMidnight(MIDNIGHT)..."
                    let expr_7151_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7150_address)
                    let expr_7151_functionSelector := 0x81a01d33
                    /// @src 15:10734:10739  "takes"
                    let _228_mpos := var_takes_6982_mpos
                    let expr_7152_mpos := _228_mpos
                    /// @src 15:10740:10741  "i"
                    let _229 := var_i_7077
                    let expr_7153 := _229
                    /// @src 15:10734:10742  "takes[i]"
                    let _230_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7152_mpos, expr_7153))
                    let expr_7154_mpos := _230_mpos
                    /// @src 15:10734:10748  "takes[i].offer"
                    let _231 := add(expr_7154_mpos, 32)
                    let _232_mpos := mload(_231)
                    let expr_7155_mpos := _232_mpos
                    /// @src 15:10750:10755  "takes"
                    let _233_mpos := var_takes_6982_mpos
                    let expr_7156_mpos := _233_mpos
                    /// @src 15:10756:10757  "i"
                    let _234 := var_i_7077
                    let expr_7157 := _234
                    /// @src 15:10750:10758  "takes[i]"
                    let _235_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7156_mpos, expr_7157))
                    let expr_7158_mpos := _235_mpos
                    /// @src 15:10750:10771  "takes[i].ratifierData"
                    let _236 := add(expr_7158_mpos, 64)
                    let _237_mpos := mload(_236)
                    let expr_7159_mpos := _237_mpos
                    /// @src 15:10773:10784  "unitsToTake"
                    let _238 := var_unitsToTake_7119
                    let expr_7160 := _238
                    /// @src 15:10786:10791  "taker"
                    let _239 := var_taker_6975
                    let expr_7161 := _239
                    /// @src 15:10801:10802  "0"
                    let expr_7164 := 0x00
                    /// @src 15:10793:10803  "address(0)"
                    let expr_7165 := convert_t_rational_0_by_1_to_t_address(expr_7164)
                    /// @src 15:10813:10814  "0"
                    let expr_7168 := 0x00
                    /// @src 15:10805:10815  "address(0)"
                    let expr_7169 := convert_t_rational_0_by_1_to_t_address(expr_7168)
                    /// @src 15:10692:10820  "IMidnight(MIDNIGHT)..."

                    // storage for arguments and returned data
                    let _240 := allocate_unbounded()
                    mstore(_240, shift_left_224(expr_7151_functionSelector))
                    let _241 := abi_encode_tuple_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_bytes_memory_ptr__fromStack(add(_240, 4) , expr_7155_mpos, expr_7159_mpos, expr_7160, expr_7161, expr_7165, expr_7169)

                    let trySuccessCondition_7171 := call(gas(), expr_7151_address,  0,  _240, sub(_241, _240), _240, 64)

                    let expr_7171_component_1, expr_7171_component_2
                    if trySuccessCondition_7171 {

                        let _242 := 64

                        if gt(_242, returndatasize()) {
                            _242 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_240, _242)

                        // decode return parameters from external try-call into retVars
                        expr_7171_component_1, expr_7171_component_2 :=  abi_decode_tuple_t_uint256t_uint256_fromMemory(_240, add(_240, _242))
                    }
                    /// @src 15:10688:11014  "try IMidnight(MIDNIGHT)..."
                    switch iszero(trySuccessCondition_7171)
                    case 0 { // success case
                        let var_resBuyerAssets_7173 := expr_7171_component_1
                        let var__7175 := expr_7171_component_2
                        /// @src 15:10926:10937  "unitsToTake"
                        let _243 := var_unitsToTake_7119
                        let expr_7178 := _243
                        /// @src 15:10911:10937  "filledUnits += unitsToTake"
                        let _244 := var_filledUnits_7071
                        let expr_7179 := checked_add_t_uint256(_244, expr_7178)

                        var_filledUnits_7071 := expr_7179
                        /// @src 15:10976:10990  "resBuyerAssets"
                        let _245 := var_resBuyerAssets_7173
                        let expr_7182 := _245
                        /// @src 15:10955:10990  "filledBuyerAssets += resBuyerAssets"
                        let _246 := var_filledBuyerAssets_7074
                        let expr_7183 := checked_add_t_uint256(_246, expr_7182)

                        var_filledBuyerAssets_7074 := expr_7183
                        /// @src 15:10688:11014  "try IMidnight(MIDNIGHT)..."
                    }
                    default { // failure case
                        let _247 := 1
                        if _247 {
                        }
                    }
                }
                /// @src 15:11042:11059  "filledBuyerAssets"
                let _248 := var_filledBuyerAssets_7074
                let expr_7193 := _248
                /// @src 15:11063:11086  "targetFilledBuyerAssets"
                let _249 := var_targetFilledBuyerAssets_7065
                let expr_7194 := _249
                /// @src 15:11042:11086  "filledBuyerAssets == targetFilledBuyerAssets"
                let expr_7195 := eq(cleanup_t_uint256(expr_7193), cleanup_t_uint256(expr_7194))
                /// @src 15:11034:11102  "require(filledBuyerAssets == targetFilledBuyerAssets, OutOfOffers())"
                require_helper_t_error_8268_OutOfOffers(expr_7195)
                /// @src 15:11120:11131  "filledUnits"
                let _250 := var_filledUnits_7071
                let expr_7201 := _250
                /// @src 15:11135:11143  "minUnits"
                let _251 := var_minUnits_6973
                let expr_7202 := _251
                /// @src 15:11120:11143  "filledUnits >= minUnits"
                let expr_7203 := iszero(lt(cleanup_t_uint256(expr_7201), cleanup_t_uint256(expr_7202)))
                /// @src 15:11112:11159  "require(filledUnits >= minUnits, UnitsTooLow())"
                require_helper_t_error_8278_UnitsTooLow(expr_7203)
                /// @src 15:11193:11198  "takes"
                let _252_mpos := var_takes_6982_mpos
                let expr_7211_mpos := _252_mpos
                /// @src 15:11199:11200  "0"
                let expr_7212 := 0x00
                /// @src 15:11193:11201  "takes[0]"
                let _253_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7211_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_7212)))
                let expr_7213_mpos := _253_mpos
                /// @src 15:11193:11207  "takes[0].offer"
                let _254 := add(expr_7213_mpos, 32)
                let _255_mpos := mload(_254)
                let expr_7214_mpos := _255_mpos
                /// @src 15:11193:11214  "takes[0].offer.market"
                let _256 := add(expr_7214_mpos, 0)
                let _257_mpos := mload(_256)
                let expr_7215_mpos := _257_mpos
                /// @src 15:11170:11214  "Market memory market = takes[0].offer.market"
                let var_market_7210_mpos := expr_7215_mpos
                /// @src 15:11224:11587  "for (uint256 i; i < collateralWithdrawals.length; i++) {..."
                for {
                    /// @src 15:11229:11238  "uint256 i"
                    let var_i_7218
                    let zero_t_uint256_258 := zero_value_for_split_t_uint256()
                    var_i_7218 := zero_t_uint256_258
                    } 1 {
                    /// @src 15:11274:11277  "i++"
                    let _260 := var_i_7218
                    let _259 := increment_wrapping_t_uint256(_260)
                    var_i_7218 := _259
                    let expr_7225 := _260
                }
                {
                    /// @src 15:11240:11241  "i"
                    let _261 := var_i_7218
                    let expr_7220 := _261
                    /// @src 15:11244:11265  "collateralWithdrawals"
                    let _262_mpos := var_collateralWithdrawals_6986_mpos
                    let expr_7221_mpos := _262_mpos
                    /// @src 15:11244:11272  "collateralWithdrawals.length"
                    let expr_7222 := array_length_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(expr_7221_mpos)
                    /// @src 15:11240:11272  "i < collateralWithdrawals.length"
                    let expr_7223 := lt(cleanup_t_uint256(expr_7220), cleanup_t_uint256(expr_7222))
                    if iszero(expr_7223) { break }
                    /// @src 15:11303:11311  "MIDNIGHT"
                    let _263 := loadimmutable("6375")
                    let expr_7228 := _263
                    /// @src 15:11293:11312  "IMidnight(MIDNIGHT)"
                    let expr_7229_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7228)
                    /// @src 15:11293:11348  "IMidnight(MIDNIGHT)..."
                    let expr_7230_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7229_address)
                    let expr_7230_functionSelector := 0x564b55d9
                    /// @src 15:11370:11376  "market"
                    let _264_mpos := var_market_7210_mpos
                    let expr_7231_mpos := _264_mpos
                    /// @src 15:11398:11419  "collateralWithdrawals"
                    let _265_mpos := var_collateralWithdrawals_6986_mpos
                    let expr_7232_mpos := _265_mpos
                    /// @src 15:11420:11421  "i"
                    let _266 := var_i_7218
                    let expr_7233 := _266
                    /// @src 15:11398:11422  "collateralWithdrawals[i]"
                    let _267_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(expr_7232_mpos, expr_7233))
                    let expr_7234_mpos := _267_mpos
                    /// @src 15:11398:11438  "collateralWithdrawals[i].collateralIndex"
                    let _268 := add(expr_7234_mpos, 0)
                    let _269 := read_from_memoryt_uint256(_268)
                    let expr_7235 := _269
                    /// @src 15:11460:11481  "collateralWithdrawals"
                    let _270_mpos := var_collateralWithdrawals_6986_mpos
                    let expr_7236_mpos := _270_mpos
                    /// @src 15:11482:11483  "i"
                    let _271 := var_i_7218
                    let expr_7237 := _271
                    /// @src 15:11460:11484  "collateralWithdrawals[i]"
                    let _272_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(expr_7236_mpos, expr_7237))
                    let expr_7238_mpos := _272_mpos
                    /// @src 15:11460:11491  "collateralWithdrawals[i].assets"
                    let _273 := add(expr_7238_mpos, 32)
                    let _274 := read_from_memoryt_uint256(_273)
                    let expr_7239 := _274
                    /// @src 15:11513:11518  "taker"
                    let _275 := var_taker_6975
                    let expr_7240 := _275
                    /// @src 15:11540:11558  "collateralReceiver"
                    let _276 := var_collateralReceiver_6988
                    let expr_7241 := _276
                    /// @src 15:11293:11576  "IMidnight(MIDNIGHT)..."

                    if iszero(extcodesize(expr_7230_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                    // storage for arguments and returned data
                    let _277 := allocate_unbounded()
                    mstore(_277, shift_left_224(expr_7230_functionSelector))
                    let _278 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address_t_address__to_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address_t_address__fromStack(add(_277, 4) , expr_7231_mpos, expr_7235, expr_7239, expr_7240, expr_7241)

                    let _279 := call(gas(), expr_7230_address,  0,  _277, sub(_278, _277), _277, 0)

                    if iszero(_279) { revert_forward_1() }

                    if _279 {

                        let _280 := 0

                        if gt(_280, returndatasize()) {
                            _280 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_277, _280)

                        // decode return parameters from external try-call into retVars
                        abi_decode_tuple__fromMemory(_277, add(_277, _280))
                    }
                }
                /// @src 15:11601:11618  "referralFeeAssets"
                let _281 := var_referralFeeAssets_7057
                let expr_7246 := _281
                /// @src 15:11621:11622  "0"
                let expr_7247 := 0x00
                /// @src 15:11601:11622  "referralFeeAssets > 0"
                let expr_7248 := gt(cleanup_t_uint256(expr_7246), convert_t_rational_0_by_1_to_t_uint256(expr_7247))
                /// @src 15:11597:11704  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                if expr_7248 {
                    /// @src 15:11624:11639  "SafeTransferLib"
                    let expr_7249_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                    /// @src 15:11653:11662  "loanToken"
                    let _282 := var_loanToken_7022
                    let expr_7252 := _282
                    /// @src 15:11664:11684  "referralFeeRecipient"
                    let _283 := var_referralFeeRecipient_6992
                    let expr_7253 := _283
                    /// @src 15:11686:11703  "referralFeeAssets"
                    let _284 := var_referralFeeAssets_7057
                    let expr_7254 := _284
                    fun_safeTransfer_5503(expr_7252, expr_7253, expr_7254)
                    /// @src 15:11597:11704  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                }

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function array_length_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function abi_encode_tuple_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address__to_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 128)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value0,  tail)

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_address_to_t_address_fromStack(value3,  add(headStart, 96))

            }

            function convert_t_contract$_MidnightBundles_$7969_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function require_helper_t_error_8272_SellerAssetsTooLow(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xd85a26bf00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 6968
            /// @src 15:5600:8189  "function supplyCollateralAndSellWithUnitsTarget(..."
            function fun_supplyCollateralAndSellWithUnitsTarget_6968(var_targetUnits_6671, var_minSellerAssets_6673, var_taker_6675, var_receiver_6677, var_collateralSupplies_6681_mpos, var_takes_6685_mpos, var_referralFeePct_6687, var_referralFeeRecipient_6689) {

                /// @src 15:5945:5950  "taker"
                let _285 := var_taker_6675
                let expr_6693 := _285
                /// @src 15:5954:5964  "msg.sender"
                let expr_6695 := caller()
                /// @src 15:5945:5964  "taker == msg.sender"
                let expr_6696 := eq(cleanup_t_address(expr_6693), cleanup_t_address(expr_6695))
                /// @src 15:5945:6019  "taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"
                let expr_6705 := expr_6696
                if iszero(expr_6705) {
                    /// @src 15:5978:5986  "MIDNIGHT"
                    let _286 := loadimmutable("6375")
                    let expr_6698 := _286
                    /// @src 15:5968:5987  "IMidnight(MIDNIGHT)"
                    let expr_6699_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6698)
                    /// @src 15:5968:6000  "IMidnight(MIDNIGHT).isAuthorized"
                    let expr_6700_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6699_address)
                    let expr_6700_functionSelector := 0x65e4ad9e
                    /// @src 15:6001:6006  "taker"
                    let _287 := var_taker_6675
                    let expr_6701 := _287
                    /// @src 15:6008:6018  "msg.sender"
                    let expr_6703 := caller()
                    /// @src 15:5968:6019  "IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"

                    // storage for arguments and returned data
                    let _288 := allocate_unbounded()
                    mstore(_288, shift_left_224(expr_6700_functionSelector))
                    let _289 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_288, 4) , expr_6701, expr_6703)

                    let _290 := staticcall(gas(), expr_6700_address,  _288, sub(_289, _288), _288, 32)

                    if iszero(_290) { revert_forward_1() }

                    let expr_6704
                    if _290 {

                        let _291 := 32

                        if gt(_291, returndatasize()) {
                            _291 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_288, _291)

                        // decode return parameters from external try-call into retVars
                        expr_6704 :=  abi_decode_tuple_t_bool_fromMemory(_288, add(_288, _291))
                    }
                    /// @src 15:5945:6019  "taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"
                    expr_6705 := expr_6704
                }
                /// @src 15:5937:6036  "require(taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender), Unauthorized())"
                require_helper_t_error_8274_Unauthorized(expr_6705)
                /// @src 15:6054:6068  "referralFeePct"
                let _292 := var_referralFeePct_6687
                let expr_6711 := _292
                /// @src 15:6071:6074  "WAD"
                let expr_6712 := constant_WAD_4917()
                /// @src 15:6054:6074  "referralFeePct < WAD"
                let expr_6713 := lt(cleanup_t_uint256(expr_6711), cleanup_t_uint256(expr_6712))
                /// @src 15:6046:6090  "require(referralFeePct < WAD, PctExceeded())"
                require_helper_t_error_8270_PctExceeded(expr_6713)
                /// @src 15:6120:6125  "takes"
                let _293_mpos := var_takes_6685_mpos
                let expr_6720_mpos := _293_mpos
                /// @src 15:6126:6127  "0"
                let expr_6721 := 0x00
                /// @src 15:6120:6128  "takes[0]"
                let _294_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6720_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_6721)))
                let expr_6722_mpos := _294_mpos
                /// @src 15:6120:6134  "takes[0].offer"
                let _295 := add(expr_6722_mpos, 32)
                let _296_mpos := mload(_295)
                let expr_6723_mpos := _296_mpos
                /// @src 15:6120:6141  "takes[0].offer.market"
                let _297 := add(expr_6723_mpos, 0)
                let _298_mpos := mload(_297)
                let expr_6724_mpos := _298_mpos
                /// @src 15:6120:6151  "takes[0].offer.market.loanToken"
                let _299 := add(expr_6724_mpos, 0)
                let _300 := read_from_memoryt_address(_299)
                let expr_6725 := _300
                /// @src 15:6100:6151  "address loanToken = takes[0].offer.market.loanToken"
                let var_loanToken_6719 := expr_6725
                /// @src 15:6244:6252  "MIDNIGHT"
                let _301 := loadimmutable("6375")
                let expr_6730 := _301
                /// @src 15:6234:6253  "IMidnight(MIDNIGHT)"
                let expr_6731_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6730)
                /// @src 15:6234:6265  "IMidnight(MIDNIGHT).touchMarket"
                let expr_6732_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6731_address)
                let expr_6732_functionSelector := 0x2bfb98ac
                /// @src 15:6266:6271  "takes"
                let _302_mpos := var_takes_6685_mpos
                let expr_6733_mpos := _302_mpos
                /// @src 15:6272:6273  "0"
                let expr_6734 := 0x00
                /// @src 15:6266:6274  "takes[0]"
                let _303_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6733_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_6734)))
                let expr_6735_mpos := _303_mpos
                /// @src 15:6266:6280  "takes[0].offer"
                let _304 := add(expr_6735_mpos, 32)
                let _305_mpos := mload(_304)
                let expr_6736_mpos := _305_mpos
                /// @src 15:6266:6287  "takes[0].offer.market"
                let _306 := add(expr_6736_mpos, 0)
                let _307_mpos := mload(_306)
                let expr_6737_mpos := _307_mpos
                /// @src 15:6234:6288  "IMidnight(MIDNIGHT).touchMarket(takes[0].offer.market)"

                // storage for arguments and returned data
                let _308 := allocate_unbounded()
                mstore(_308, shift_left_224(expr_6732_functionSelector))
                let _309 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(add(_308, 4) , expr_6737_mpos)

                let _310 := call(gas(), expr_6732_address,  0,  _308, sub(_309, _308), _308, 32)

                if iszero(_310) { revert_forward_1() }

                let expr_6738
                if _310 {

                    let _311 := 32

                    if gt(_311, returndatasize()) {
                        _311 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_308, _311)

                    // decode return parameters from external try-call into retVars
                    expr_6738 :=  abi_decode_tuple_t_bytes32_fromMemory(_308, add(_308, _311))
                }
                /// @src 15:6221:6288  "bytes32 id = IMidnight(MIDNIGHT).touchMarket(takes[0].offer.market)"
                let var_id_6728 := expr_6738
                /// @src 15:6322:6327  "takes"
                let _312_mpos := var_takes_6685_mpos
                let expr_6743_mpos := _312_mpos
                /// @src 15:6328:6329  "0"
                let expr_6744 := 0x00
                /// @src 15:6322:6330  "takes[0]"
                let _313_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6743_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_6744)))
                let expr_6745_mpos := _313_mpos
                /// @src 15:6322:6336  "takes[0].offer"
                let _314 := add(expr_6745_mpos, 32)
                let _315_mpos := mload(_314)
                let expr_6746_mpos := _315_mpos
                /// @src 15:6322:6343  "takes[0].offer.market"
                let _316 := add(expr_6746_mpos, 0)
                let _317_mpos := mload(_316)
                let expr_6747_mpos := _317_mpos
                /// @src 15:6299:6343  "Market memory market = takes[0].offer.market"
                let var_market_6742_mpos := expr_6747_mpos
                /// @src 15:6353:6813  "for (uint256 i; i < collateralSupplies.length; i++) {..."
                for {
                    /// @src 15:6358:6367  "uint256 i"
                    let var_i_6750
                    let zero_t_uint256_318 := zero_value_for_split_t_uint256()
                    var_i_6750 := zero_t_uint256_318
                    } 1 {
                    /// @src 15:6400:6403  "i++"
                    let _320 := var_i_6750
                    let _319 := increment_wrapping_t_uint256(_320)
                    var_i_6750 := _319
                    let expr_6757 := _320
                }
                {
                    /// @src 15:6369:6370  "i"
                    let _321 := var_i_6750
                    let expr_6752 := _321
                    /// @src 15:6373:6391  "collateralSupplies"
                    let _322_mpos := var_collateralSupplies_6681_mpos
                    let expr_6753_mpos := _322_mpos
                    /// @src 15:6373:6398  "collateralSupplies.length"
                    let expr_6754 := array_length_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_6753_mpos)
                    /// @src 15:6369:6398  "i < collateralSupplies.length"
                    let expr_6755 := lt(cleanup_t_uint256(expr_6752), cleanup_t_uint256(expr_6754))
                    if iszero(expr_6755) { break }
                    /// @src 15:6435:6441  "market"
                    let _323_mpos := var_market_6742_mpos
                    let expr_6761_mpos := _323_mpos
                    /// @src 15:6435:6458  "market.collateralParams"
                    let _324 := add(expr_6761_mpos, 32)
                    let _325_mpos := mload(_324)
                    let expr_6762_mpos := _325_mpos
                    /// @src 15:6459:6477  "collateralSupplies"
                    let _326_mpos := var_collateralSupplies_6681_mpos
                    let expr_6763_mpos := _326_mpos
                    /// @src 15:6478:6479  "i"
                    let _327 := var_i_6750
                    let expr_6764 := _327
                    /// @src 15:6459:6480  "collateralSupplies[i]"
                    let _328_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_6763_mpos, expr_6764))
                    let expr_6765_mpos := _328_mpos
                    /// @src 15:6459:6496  "collateralSupplies[i].collateralIndex"
                    let _329 := add(expr_6765_mpos, 0)
                    let _330 := read_from_memoryt_uint256(_329)
                    let expr_6766 := _330
                    /// @src 15:6435:6497  "market.collateralParams[collateralSupplies[i].collateralIndex]"
                    let _331_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_6762_mpos, expr_6766))
                    let expr_6767_mpos := _331_mpos
                    /// @src 15:6435:6503  "market.collateralParams[collateralSupplies[i].collateralIndex].token"
                    let _332 := add(expr_6767_mpos, 0)
                    let _333 := read_from_memoryt_address(_332)
                    let expr_6768 := _333
                    /// @src 15:6419:6503  "address token = market.collateralParams[collateralSupplies[i].collateralIndex].token"
                    let var_token_6760 := expr_6768
                    /// @src 15:6527:6532  "token"
                    let _334 := var_token_6760
                    let expr_6771 := _334
                    /// @src 15:6534:6544  "msg.sender"
                    let expr_6773 := caller()
                    /// @src 15:6546:6564  "collateralSupplies"
                    let _335_mpos := var_collateralSupplies_6681_mpos
                    let expr_6774_mpos := _335_mpos
                    /// @src 15:6565:6566  "i"
                    let _336 := var_i_6750
                    let expr_6775 := _336
                    /// @src 15:6546:6567  "collateralSupplies[i]"
                    let _337_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_6774_mpos, expr_6775))
                    let expr_6776_mpos := _337_mpos
                    /// @src 15:6546:6574  "collateralSupplies[i].assets"
                    let _338 := add(expr_6776_mpos, 32)
                    let _339 := read_from_memoryt_uint256(_338)
                    let expr_6777 := _339
                    /// @src 15:6576:6594  "collateralSupplies"
                    let _340_mpos := var_collateralSupplies_6681_mpos
                    let expr_6778_mpos := _340_mpos
                    /// @src 15:6595:6596  "i"
                    let _341 := var_i_6750
                    let expr_6779 := _341
                    /// @src 15:6576:6597  "collateralSupplies[i]"
                    let _342_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_6778_mpos, expr_6779))
                    let expr_6780_mpos := _342_mpos
                    /// @src 15:6576:6604  "collateralSupplies[i].permit"
                    let _343 := add(expr_6780_mpos, 64)
                    let _344_mpos := mload(_343)
                    let expr_6781_mpos := _344_mpos
                    fun_pullToken_7968(expr_6771, expr_6773, expr_6777, expr_6781_mpos)
                    /// @src 15:6635:6640  "token"
                    let _345 := var_token_6760
                    let expr_6785 := _345
                    /// @src 15:6642:6650  "MIDNIGHT"
                    let _346 := loadimmutable("6375")
                    let expr_6786 := _346
                    fun_forceApproveMax_7827(expr_6785, expr_6786)
                    /// @src 15:6675:6683  "MIDNIGHT"
                    let _347 := loadimmutable("6375")
                    let expr_6790 := _347
                    /// @src 15:6665:6684  "IMidnight(MIDNIGHT)"
                    let expr_6791_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6790)
                    /// @src 15:6665:6718  "IMidnight(MIDNIGHT)..."
                    let expr_6792_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6791_address)
                    let expr_6792_functionSelector := 0xfd1b2036
                    /// @src 15:6719:6725  "market"
                    let _348_mpos := var_market_6742_mpos
                    let expr_6793_mpos := _348_mpos
                    /// @src 15:6727:6745  "collateralSupplies"
                    let _349_mpos := var_collateralSupplies_6681_mpos
                    let expr_6794_mpos := _349_mpos
                    /// @src 15:6746:6747  "i"
                    let _350 := var_i_6750
                    let expr_6795 := _350
                    /// @src 15:6727:6748  "collateralSupplies[i]"
                    let _351_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_6794_mpos, expr_6795))
                    let expr_6796_mpos := _351_mpos
                    /// @src 15:6727:6764  "collateralSupplies[i].collateralIndex"
                    let _352 := add(expr_6796_mpos, 0)
                    let _353 := read_from_memoryt_uint256(_352)
                    let expr_6797 := _353
                    /// @src 15:6766:6784  "collateralSupplies"
                    let _354_mpos := var_collateralSupplies_6681_mpos
                    let expr_6798_mpos := _354_mpos
                    /// @src 15:6785:6786  "i"
                    let _355 := var_i_6750
                    let expr_6799 := _355
                    /// @src 15:6766:6787  "collateralSupplies[i]"
                    let _356_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_6798_mpos, expr_6799))
                    let expr_6800_mpos := _356_mpos
                    /// @src 15:6766:6794  "collateralSupplies[i].assets"
                    let _357 := add(expr_6800_mpos, 32)
                    let _358 := read_from_memoryt_uint256(_357)
                    let expr_6801 := _358
                    /// @src 15:6796:6801  "taker"
                    let _359 := var_taker_6675
                    let expr_6802 := _359
                    /// @src 15:6665:6802  "IMidnight(MIDNIGHT)..."

                    if iszero(extcodesize(expr_6792_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                    // storage for arguments and returned data
                    let _360 := allocate_unbounded()
                    mstore(_360, shift_left_224(expr_6792_functionSelector))
                    let _361 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address__to_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address__fromStack(add(_360, 4) , expr_6793_mpos, expr_6797, expr_6801, expr_6802)

                    let _362 := call(gas(), expr_6792_address,  0,  _360, sub(_361, _360), _360, 0)

                    if iszero(_362) { revert_forward_1() }

                    if _362 {

                        let _363 := 0

                        if gt(_363, returndatasize()) {
                            _363 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_360, _363)

                        // decode return parameters from external try-call into retVars
                        abi_decode_tuple__fromMemory(_360, add(_360, _363))
                    }
                }
                /// @src 15:6823:6842  "uint256 filledUnits"
                let var_filledUnits_6808
                let zero_t_uint256_364 := zero_value_for_split_t_uint256()
                var_filledUnits_6808 := zero_t_uint256_364
                /// @src 15:6852:6878  "uint256 filledSellerAssets"
                let var_filledSellerAssets_6811
                let zero_t_uint256_365 := zero_value_for_split_t_uint256()
                var_filledSellerAssets_6811 := zero_t_uint256_365
                /// @src 15:6888:7719  "for (uint256 i; i < takes.length && filledUnits < targetUnits; i++) {..."
                for {
                    /// @src 15:6893:6902  "uint256 i"
                    let var_i_6814
                    let zero_t_uint256_366 := zero_value_for_split_t_uint256()
                    var_i_6814 := zero_t_uint256_366
                    } 1 {
                    /// @src 15:6951:6954  "i++"
                    let _368 := var_i_6814
                    let _367 := increment_t_uint256(_368)
                    var_i_6814 := _367
                    let expr_6825 := _368
                }
                {
                    /// @src 15:6904:6905  "i"
                    let _369 := var_i_6814
                    let expr_6816 := _369
                    /// @src 15:6908:6913  "takes"
                    let _370_mpos := var_takes_6685_mpos
                    let expr_6817_mpos := _370_mpos
                    /// @src 15:6908:6920  "takes.length"
                    let expr_6818 := array_length_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6817_mpos)
                    /// @src 15:6904:6920  "i < takes.length"
                    let expr_6819 := lt(cleanup_t_uint256(expr_6816), cleanup_t_uint256(expr_6818))
                    /// @src 15:6904:6949  "i < takes.length && filledUnits < targetUnits"
                    let expr_6823 := expr_6819
                    if expr_6823 {
                        /// @src 15:6924:6935  "filledUnits"
                        let _371 := var_filledUnits_6808
                        let expr_6820 := _371
                        /// @src 15:6938:6949  "targetUnits"
                        let _372 := var_targetUnits_6671
                        let expr_6821 := _372
                        /// @src 15:6924:6949  "filledUnits < targetUnits"
                        let expr_6822 := lt(cleanup_t_uint256(expr_6820), cleanup_t_uint256(expr_6821))
                        /// @src 15:6904:6949  "i < takes.length && filledUnits < targetUnits"
                        expr_6823 := expr_6822
                    }
                    if iszero(expr_6823) { break }
                    /// @src 15:6978:6983  "takes"
                    let _373_mpos := var_takes_6685_mpos
                    let expr_6828_mpos := _373_mpos
                    /// @src 15:6984:6985  "i"
                    let _374 := var_i_6814
                    let expr_6829 := _374
                    /// @src 15:6978:6986  "takes[i]"
                    let _375_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6828_mpos, expr_6829))
                    let expr_6830_mpos := _375_mpos
                    /// @src 15:6978:6992  "takes[i].offer"
                    let _376 := add(expr_6830_mpos, 32)
                    let _377_mpos := mload(_376)
                    let expr_6831_mpos := _377_mpos
                    /// @src 15:6978:6996  "takes[i].offer.buy"
                    let _378 := add(expr_6831_mpos, 32)
                    let _379 := read_from_memoryt_bool(_378)
                    let expr_6832 := _379
                    /// @src 15:6970:7017  "require(takes[i].offer.buy, InconsistentSide())"
                    require_helper_t_error_8266_InconsistentSide(expr_6832)
                    /// @src 15:7049:7057  "MIDNIGHT"
                    let _380 := loadimmutable("6375")
                    let expr_6839 := _380
                    /// @src 15:7039:7058  "IMidnight(MIDNIGHT)"
                    let expr_6840_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6839)
                    /// @src 15:7039:7063  "IMidnight(MIDNIGHT).toId"
                    let expr_6841_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6840_address)
                    let expr_6841_functionSelector := 0x355986fa
                    /// @src 15:7064:7069  "takes"
                    let _381_mpos := var_takes_6685_mpos
                    let expr_6842_mpos := _381_mpos
                    /// @src 15:7070:7071  "i"
                    let _382 := var_i_6814
                    let expr_6843 := _382
                    /// @src 15:7064:7072  "takes[i]"
                    let _383_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6842_mpos, expr_6843))
                    let expr_6844_mpos := _383_mpos
                    /// @src 15:7064:7078  "takes[i].offer"
                    let _384 := add(expr_6844_mpos, 32)
                    let _385_mpos := mload(_384)
                    let expr_6845_mpos := _385_mpos
                    /// @src 15:7064:7085  "takes[i].offer.market"
                    let _386 := add(expr_6845_mpos, 0)
                    let _387_mpos := mload(_386)
                    let expr_6846_mpos := _387_mpos
                    /// @src 15:7039:7086  "IMidnight(MIDNIGHT).toId(takes[i].offer.market)"

                    // storage for arguments and returned data
                    let _388 := allocate_unbounded()
                    mstore(_388, shift_left_224(expr_6841_functionSelector))
                    let _389 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(add(_388, 4) , expr_6846_mpos)

                    let _390 := staticcall(gas(), expr_6841_address,  _388, sub(_389, _388), _388, 32)

                    if iszero(_390) { revert_forward_1() }

                    let expr_6847
                    if _390 {

                        let _391 := 32

                        if gt(_391, returndatasize()) {
                            _391 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_388, _391)

                        // decode return parameters from external try-call into retVars
                        expr_6847 :=  abi_decode_tuple_t_bytes32_fromMemory(_388, add(_388, _391))
                    }
                    /// @src 15:7090:7092  "id"
                    let _392 := var_id_6728
                    let expr_6848 := _392
                    /// @src 15:7039:7092  "IMidnight(MIDNIGHT).toId(takes[i].offer.market) == id"
                    let expr_6849 := eq(cleanup_t_bytes32(expr_6847), cleanup_t_bytes32(expr_6848))
                    /// @src 15:7031:7115  "require(IMidnight(MIDNIGHT).toId(takes[i].offer.market) == id, InconsistentMarket())"
                    require_helper_t_error_8264_InconsistentMarket(expr_6849)
                    /// @src 15:7172:7183  "targetUnits"
                    let _393 := var_targetUnits_6671
                    let expr_6857 := _393
                    /// @src 15:7186:7197  "filledUnits"
                    let _394 := var_filledUnits_6808
                    let expr_6858 := _394
                    /// @src 15:7172:7197  "targetUnits - filledUnits"
                    let expr_6859 := checked_sub_t_uint256(expr_6857, expr_6858)

                    /// @src 15:7215:7220  "takes"
                    let _395_mpos := var_takes_6685_mpos
                    let expr_6860_mpos := _395_mpos
                    /// @src 15:7221:7222  "i"
                    let _396 := var_i_6814
                    let expr_6861 := _396
                    /// @src 15:7215:7223  "takes[i]"
                    let _397_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6860_mpos, expr_6861))
                    let expr_6862_mpos := _397_mpos
                    /// @src 15:7215:7229  "takes[i].units"
                    let _398 := add(expr_6862_mpos, 0)
                    let _399 := read_from_memoryt_uint256(_398)
                    let expr_6863 := _399
                    /// @src 15:7247:7265  "ConsumableUnitsLib"
                    let expr_6864_address := linkersymbol("deps/midnight/src/periphery/ConsumableUnitsLib.sol:ConsumableUnitsLib")
                    /// @src 15:7282:7290  "MIDNIGHT"
                    let _400 := loadimmutable("6375")
                    let expr_6866 := _400
                    /// @src 15:7292:7294  "id"
                    let _401 := var_id_6728
                    let expr_6867 := _401
                    /// @src 15:7296:7301  "takes"
                    let _402_mpos := var_takes_6685_mpos
                    let expr_6868_mpos := _402_mpos
                    /// @src 15:7302:7303  "i"
                    let _403 := var_i_6814
                    let expr_6869 := _403
                    /// @src 15:7296:7304  "takes[i]"
                    let _404_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6868_mpos, expr_6869))
                    let expr_6870_mpos := _404_mpos
                    /// @src 15:7296:7310  "takes[i].offer"
                    let _405 := add(expr_6870_mpos, 32)
                    let _406_mpos := mload(_405)
                    let expr_6871_mpos := _406_mpos
                    /// @src 15:7247:7311  "ConsumableUnitsLib.consumableUnits(MIDNIGHT, id, takes[i].offer)"
                    let expr_6872 := fun_consumableUnits_6168(expr_6866, expr_6867, expr_6871_mpos)
                    /// @src 15:7151:7325  "min(..."
                    let expr_6873 := fun_min_7733(expr_6859, expr_6863, expr_6872)
                    /// @src 15:7129:7325  "uint256 unitsToTake = min(..."
                    let var_unitsToTake_6855 := expr_6873
                    /// @src 15:7353:7361  "MIDNIGHT"
                    let _407 := loadimmutable("6375")
                    let expr_6876 := _407
                    /// @src 15:7343:7362  "IMidnight(MIDNIGHT)"
                    let expr_6877_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6876)
                    /// @src 15:7343:7384  "IMidnight(MIDNIGHT)..."
                    let expr_6878_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6877_address)
                    let expr_6878_functionSelector := 0x81a01d33
                    /// @src 15:7406:7411  "takes"
                    let _408_mpos := var_takes_6685_mpos
                    let expr_6879_mpos := _408_mpos
                    /// @src 15:7412:7413  "i"
                    let _409 := var_i_6814
                    let expr_6880 := _409
                    /// @src 15:7406:7414  "takes[i]"
                    let _410_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6879_mpos, expr_6880))
                    let expr_6881_mpos := _410_mpos
                    /// @src 15:7406:7420  "takes[i].offer"
                    let _411 := add(expr_6881_mpos, 32)
                    let _412_mpos := mload(_411)
                    let expr_6882_mpos := _412_mpos
                    /// @src 15:7422:7427  "takes"
                    let _413_mpos := var_takes_6685_mpos
                    let expr_6883_mpos := _413_mpos
                    /// @src 15:7428:7429  "i"
                    let _414 := var_i_6814
                    let expr_6884 := _414
                    /// @src 15:7422:7430  "takes[i]"
                    let _415_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_6883_mpos, expr_6884))
                    let expr_6885_mpos := _415_mpos
                    /// @src 15:7422:7443  "takes[i].ratifierData"
                    let _416 := add(expr_6885_mpos, 64)
                    let _417_mpos := mload(_416)
                    let expr_6886_mpos := _417_mpos
                    /// @src 15:7445:7456  "unitsToTake"
                    let _418 := var_unitsToTake_6855
                    let expr_6887 := _418
                    /// @src 15:7458:7463  "taker"
                    let _419 := var_taker_6675
                    let expr_6888 := _419
                    /// @src 15:7473:7477  "this"
                    let expr_6891_address := address()
                    /// @src 15:7465:7478  "address(this)"
                    let expr_6892 := convert_t_contract$_MidnightBundles_$7969_to_t_address(expr_6891_address)
                    /// @src 15:7488:7489  "0"
                    let expr_6895 := 0x00
                    /// @src 15:7480:7490  "address(0)"
                    let expr_6896 := convert_t_rational_0_by_1_to_t_address(expr_6895)
                    /// @src 15:7343:7512  "IMidnight(MIDNIGHT)..."

                    // storage for arguments and returned data
                    let _420 := allocate_unbounded()
                    mstore(_420, shift_left_224(expr_6878_functionSelector))
                    let _421 := abi_encode_tuple_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_bytes_memory_ptr__fromStack(add(_420, 4) , expr_6882_mpos, expr_6886_mpos, expr_6887, expr_6888, expr_6892, expr_6896)

                    let trySuccessCondition_6898 := call(gas(), expr_6878_address,  0,  _420, sub(_421, _420), _420, 64)

                    let expr_6898_component_1, expr_6898_component_2
                    if trySuccessCondition_6898 {

                        let _422 := 64

                        if gt(_422, returndatasize()) {
                            _422 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_420, _422)

                        // decode return parameters from external try-call into retVars
                        expr_6898_component_1, expr_6898_component_2 :=  abi_decode_tuple_t_uint256t_uint256_fromMemory(_420, add(_420, _422))
                    }
                    /// @src 15:7339:7709  "try IMidnight(MIDNIGHT)..."
                    switch iszero(trySuccessCondition_6898)
                    case 0 { // success case
                        let var__6900 := expr_6898_component_1
                        let var_resSellerAssets_6902 := expr_6898_component_2
                        /// @src 15:7619:7630  "unitsToTake"
                        let _423 := var_unitsToTake_6855
                        let expr_6905 := _423
                        /// @src 15:7604:7630  "filledUnits += unitsToTake"
                        let _424 := var_filledUnits_6808
                        let expr_6906 := checked_add_t_uint256(_424, expr_6905)

                        var_filledUnits_6808 := expr_6906
                        /// @src 15:7670:7685  "resSellerAssets"
                        let _425 := var_resSellerAssets_6902
                        let expr_6909 := _425
                        /// @src 15:7648:7685  "filledSellerAssets += resSellerAssets"
                        let _426 := var_filledSellerAssets_6811
                        let expr_6910 := checked_add_t_uint256(_426, expr_6909)

                        var_filledSellerAssets_6811 := expr_6910
                        /// @src 15:7339:7709  "try IMidnight(MIDNIGHT)..."
                    }
                    default { // failure case
                        let _427 := 1
                        if _427 {
                        }
                    }
                }
                /// @src 15:7737:7748  "filledUnits"
                let _428 := var_filledUnits_6808
                let expr_6920 := _428
                /// @src 15:7752:7763  "targetUnits"
                let _429 := var_targetUnits_6671
                let expr_6921 := _429
                /// @src 15:7737:7763  "filledUnits == targetUnits"
                let expr_6922 := eq(cleanup_t_uint256(expr_6920), cleanup_t_uint256(expr_6921))
                /// @src 15:7729:7779  "require(filledUnits == targetUnits, OutOfOffers())"
                require_helper_t_error_8268_OutOfOffers(expr_6922)
                /// @src 15:7818:7836  "filledSellerAssets"
                let _430 := var_filledSellerAssets_6811
                let expr_6929 := _430
                /// @src 15:7818:7847  "filledSellerAssets.mulDivDown"
                let expr_6930_self := expr_6929
                /// @src 15:7848:7862  "referralFeePct"
                let _431 := var_referralFeePct_6687
                let expr_6931 := _431
                /// @src 15:7864:7867  "WAD"
                let expr_6932 := constant_WAD_4917()
                /// @src 15:7818:7868  "filledSellerAssets.mulDivDown(referralFeePct, WAD)"
                let expr_6933 := fun_mulDivDown_5872(expr_6930_self, expr_6931, expr_6932)
                /// @src 15:7790:7868  "uint256 referralFeeAssets = filledSellerAssets.mulDivDown(referralFeePct, WAD)"
                let var_referralFeeAssets_6928 := expr_6933
                /// @src 15:7886:7904  "filledSellerAssets"
                let _432 := var_filledSellerAssets_6811
                let expr_6936 := _432
                /// @src 15:7907:7924  "referralFeeAssets"
                let _433 := var_referralFeeAssets_6928
                let expr_6937 := _433
                /// @src 15:7886:7924  "filledSellerAssets - referralFeeAssets"
                let expr_6938 := checked_sub_t_uint256(expr_6936, expr_6937)

                /// @src 15:7928:7943  "minSellerAssets"
                let _434 := var_minSellerAssets_6673
                let expr_6939 := _434
                /// @src 15:7886:7943  "filledSellerAssets - referralFeeAssets >= minSellerAssets"
                let expr_6940 := iszero(lt(cleanup_t_uint256(expr_6938), cleanup_t_uint256(expr_6939)))
                /// @src 15:7878:7966  "require(filledSellerAssets - referralFeeAssets >= minSellerAssets, SellerAssetsTooLow())"
                require_helper_t_error_8272_SellerAssetsTooLow(expr_6940)
                /// @src 15:7980:7997  "referralFeeAssets"
                let _435 := var_referralFeeAssets_6928
                let expr_6945 := _435
                /// @src 15:8000:8001  "0"
                let expr_6946 := 0x00
                /// @src 15:7980:8001  "referralFeeAssets > 0"
                let expr_6947 := gt(cleanup_t_uint256(expr_6945), convert_t_rational_0_by_1_to_t_uint256(expr_6946))
                /// @src 15:7976:8083  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                if expr_6947 {
                    /// @src 15:8003:8018  "SafeTransferLib"
                    let expr_6948_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                    /// @src 15:8032:8041  "loanToken"
                    let _436 := var_loanToken_6719
                    let expr_6951 := _436
                    /// @src 15:8043:8063  "referralFeeRecipient"
                    let _437 := var_referralFeeRecipient_6689
                    let expr_6952 := _437
                    /// @src 15:8065:8082  "referralFeeAssets"
                    let _438 := var_referralFeeAssets_6928
                    let expr_6953 := _438
                    fun_safeTransfer_5503(expr_6951, expr_6952, expr_6953)
                    /// @src 15:7976:8083  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                }
                /// @src 15:8093:8108  "SafeTransferLib"
                let expr_6957_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 15:8122:8131  "loanToken"
                let _439 := var_loanToken_6719
                let expr_6960 := _439
                /// @src 15:8133:8141  "receiver"
                let _440 := var_receiver_6677
                let expr_6961 := _440
                /// @src 15:8143:8161  "filledSellerAssets"
                let _441 := var_filledSellerAssets_6811
                let expr_6962 := _441
                /// @src 15:8164:8181  "referralFeeAssets"
                let _442 := var_referralFeeAssets_6928
                let expr_6963 := _442
                /// @src 15:8143:8181  "filledSellerAssets - referralFeeAssets"
                let expr_6964 := checked_sub_t_uint256(expr_6962, expr_6963)

                fun_safeTransfer_5503(expr_6960, expr_6961, expr_6964)

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function abi_encode_tuple_t_struct$_Market_$4171_memory_ptr_t_uint256_t_address_t_address_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_struct$_Market_$4171_memory_ptr_t_uint256_t_address_t_address_t_bytes_memory_ptr__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 160)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_struct$_Market_$4171_memory_ptr_to_t_struct$_Market_$4171_memory_ptr_fromStack(value0,  tail)

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_address_to_t_address_fromStack(value2,  add(headStart, 64))

                abi_encode_t_address_to_t_address_fromStack(value3,  add(headStart, 96))

                mstore(add(headStart, 128), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_fromStack( tail)

            }

            /// @ast-id 7710
            /// @src 15:15777:17154  "function repayAndWithdrawCollateral(..."
            function fun_repayAndWithdrawCollateral_7710(var_market_7576_mpos, var_assets_7578, var_onBehalf_7580, var_loanTokenPermit_7583_mpos, var_collateralWithdrawals_7587_mpos, var_collateralReceiver_7589, var_referralFeePct_7591, var_referralFeeRecipient_7593) {

                /// @src 15:16137:16145  "onBehalf"
                let _443 := var_onBehalf_7580
                let expr_7597 := _443
                /// @src 15:16149:16159  "msg.sender"
                let expr_7599 := caller()
                /// @src 15:16137:16159  "onBehalf == msg.sender"
                let expr_7600 := eq(cleanup_t_address(expr_7597), cleanup_t_address(expr_7599))
                /// @src 15:16137:16217  "onBehalf == msg.sender || IMidnight(MIDNIGHT).isAuthorized(onBehalf, msg.sender)"
                let expr_7609 := expr_7600
                if iszero(expr_7609) {
                    /// @src 15:16173:16181  "MIDNIGHT"
                    let _444 := loadimmutable("6375")
                    let expr_7602 := _444
                    /// @src 15:16163:16182  "IMidnight(MIDNIGHT)"
                    let expr_7603_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7602)
                    /// @src 15:16163:16195  "IMidnight(MIDNIGHT).isAuthorized"
                    let expr_7604_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7603_address)
                    let expr_7604_functionSelector := 0x65e4ad9e
                    /// @src 15:16196:16204  "onBehalf"
                    let _445 := var_onBehalf_7580
                    let expr_7605 := _445
                    /// @src 15:16206:16216  "msg.sender"
                    let expr_7607 := caller()
                    /// @src 15:16163:16217  "IMidnight(MIDNIGHT).isAuthorized(onBehalf, msg.sender)"

                    // storage for arguments and returned data
                    let _446 := allocate_unbounded()
                    mstore(_446, shift_left_224(expr_7604_functionSelector))
                    let _447 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_446, 4) , expr_7605, expr_7607)

                    let _448 := staticcall(gas(), expr_7604_address,  _446, sub(_447, _446), _446, 32)

                    if iszero(_448) { revert_forward_1() }

                    let expr_7608
                    if _448 {

                        let _449 := 32

                        if gt(_449, returndatasize()) {
                            _449 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_446, _449)

                        // decode return parameters from external try-call into retVars
                        expr_7608 :=  abi_decode_tuple_t_bool_fromMemory(_446, add(_446, _449))
                    }
                    /// @src 15:16137:16217  "onBehalf == msg.sender || IMidnight(MIDNIGHT).isAuthorized(onBehalf, msg.sender)"
                    expr_7609 := expr_7608
                }
                /// @src 15:16129:16234  "require(onBehalf == msg.sender || IMidnight(MIDNIGHT).isAuthorized(onBehalf, msg.sender), Unauthorized())"
                require_helper_t_error_8274_Unauthorized(expr_7609)
                /// @src 15:16252:16266  "referralFeePct"
                let _450 := var_referralFeePct_7591
                let expr_7615 := _450
                /// @src 15:16269:16272  "WAD"
                let expr_7616 := constant_WAD_4917()
                /// @src 15:16252:16272  "referralFeePct < WAD"
                let expr_7617 := lt(cleanup_t_uint256(expr_7615), cleanup_t_uint256(expr_7616))
                /// @src 15:16244:16288  "require(referralFeePct < WAD, PctExceeded())"
                require_helper_t_error_8270_PctExceeded(expr_7617)
                /// @src 15:16319:16325  "market"
                let _451_mpos := var_market_7576_mpos
                let expr_7624_mpos := _451_mpos
                /// @src 15:16319:16335  "market.loanToken"
                let _452 := add(expr_7624_mpos, 0)
                let _453 := read_from_memoryt_address(_452)
                let expr_7625 := _453
                /// @src 15:16299:16335  "address loanToken = market.loanToken"
                let var_loanToken_7623 := expr_7625
                /// @src 15:16373:16379  "assets"
                let _454 := var_assets_7578
                let expr_7629 := _454
                /// @src 15:16373:16390  "assets.mulDivDown"
                let expr_7630_self := expr_7629
                /// @src 15:16391:16405  "referralFeePct"
                let _455 := var_referralFeePct_7591
                let expr_7631 := _455
                /// @src 15:16407:16410  "WAD"
                let expr_7632 := constant_WAD_4917()
                /// @src 15:16373:16411  "assets.mulDivDown(referralFeePct, WAD)"
                let expr_7633 := fun_mulDivDown_5872(expr_7630_self, expr_7631, expr_7632)
                /// @src 15:16345:16411  "uint256 referralFeeAssets = assets.mulDivDown(referralFeePct, WAD)"
                let var_referralFeeAssets_7628 := expr_7633
                /// @src 15:16437:16443  "assets"
                let _456 := var_assets_7578
                let expr_7637 := _456
                /// @src 15:16446:16463  "referralFeeAssets"
                let _457 := var_referralFeeAssets_7628
                let expr_7638 := _457
                /// @src 15:16437:16463  "assets - referralFeeAssets"
                let expr_7639 := checked_sub_t_uint256(expr_7637, expr_7638)

                /// @src 15:16421:16463  "uint256 units = assets - referralFeeAssets"
                let var_units_7636 := expr_7639
                /// @src 15:16483:16492  "loanToken"
                let _458 := var_loanToken_7623
                let expr_7642 := _458
                /// @src 15:16494:16504  "msg.sender"
                let expr_7644 := caller()
                /// @src 15:16506:16512  "assets"
                let _459 := var_assets_7578
                let expr_7645 := _459
                /// @src 15:16514:16529  "loanTokenPermit"
                let _460_mpos := var_loanTokenPermit_7583_mpos
                let expr_7646_mpos := _460_mpos
                fun_pullToken_7968(expr_7642, expr_7644, expr_7645, expr_7646_mpos)
                /// @src 15:16556:16565  "loanToken"
                let _461 := var_loanToken_7623
                let expr_7650 := _461
                /// @src 15:16567:16575  "MIDNIGHT"
                let _462 := loadimmutable("6375")
                let expr_7651 := _462
                fun_forceApproveMax_7827(expr_7650, expr_7651)
                /// @src 15:16597:16605  "MIDNIGHT"
                let _463 := loadimmutable("6375")
                let expr_7655 := _463
                /// @src 15:16587:16606  "IMidnight(MIDNIGHT)"
                let expr_7656_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7655)
                /// @src 15:16587:16612  "IMidnight(MIDNIGHT).repay"
                let expr_7657_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7656_address)
                let expr_7657_functionSelector := 0x4ae30a91
                /// @src 15:16613:16619  "market"
                let _464_mpos := var_market_7576_mpos
                let expr_7658_mpos := _464_mpos
                /// @src 15:16621:16626  "units"
                let _465 := var_units_7636
                let expr_7659 := _465
                /// @src 15:16628:16636  "onBehalf"
                let _466 := var_onBehalf_7580
                let expr_7660 := _466
                /// @src 15:16646:16647  "0"
                let expr_7663 := 0x00
                /// @src 15:16638:16648  "address(0)"
                let expr_7664 := convert_t_rational_0_by_1_to_t_address(expr_7663)
                /// @src 15:16587:16653  "IMidnight(MIDNIGHT).repay(market, units, onBehalf, address(0), \"\")"

                if iszero(extcodesize(expr_7657_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _467 := allocate_unbounded()
                mstore(_467, shift_left_224(expr_7657_functionSelector))
                let _468 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr_t_uint256_t_address_t_address_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_struct$_Market_$4171_memory_ptr_t_uint256_t_address_t_address_t_bytes_memory_ptr__fromStack(add(_467, 4) , expr_7658_mpos, expr_7659, expr_7660, expr_7664)

                let _469 := call(gas(), expr_7657_address,  0,  _467, sub(_468, _467), _467, 0)

                if iszero(_469) { revert_forward_1() }

                if _469 {

                    let _470 := 0

                    if gt(_470, returndatasize()) {
                        _470 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_467, _470)

                    // decode return parameters from external try-call into retVars
                    abi_decode_tuple__fromMemory(_467, add(_467, _470))
                }
                /// @src 15:16664:17030  "for (uint256 i; i < collateralWithdrawals.length; i++) {..."
                for {
                    /// @src 15:16669:16678  "uint256 i"
                    let var_i_7669
                    let zero_t_uint256_471 := zero_value_for_split_t_uint256()
                    var_i_7669 := zero_t_uint256_471
                    } 1 {
                    /// @src 15:16714:16717  "i++"
                    let _473 := var_i_7669
                    let _472 := increment_wrapping_t_uint256(_473)
                    var_i_7669 := _472
                    let expr_7676 := _473
                }
                {
                    /// @src 15:16680:16681  "i"
                    let _474 := var_i_7669
                    let expr_7671 := _474
                    /// @src 15:16684:16705  "collateralWithdrawals"
                    let _475_mpos := var_collateralWithdrawals_7587_mpos
                    let expr_7672_mpos := _475_mpos
                    /// @src 15:16684:16712  "collateralWithdrawals.length"
                    let expr_7673 := array_length_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(expr_7672_mpos)
                    /// @src 15:16680:16712  "i < collateralWithdrawals.length"
                    let expr_7674 := lt(cleanup_t_uint256(expr_7671), cleanup_t_uint256(expr_7673))
                    if iszero(expr_7674) { break }
                    /// @src 15:16743:16751  "MIDNIGHT"
                    let _476 := loadimmutable("6375")
                    let expr_7679 := _476
                    /// @src 15:16733:16752  "IMidnight(MIDNIGHT)"
                    let expr_7680_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7679)
                    /// @src 15:16733:16788  "IMidnight(MIDNIGHT)..."
                    let expr_7681_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7680_address)
                    let expr_7681_functionSelector := 0x564b55d9
                    /// @src 15:16810:16816  "market"
                    let _477_mpos := var_market_7576_mpos
                    let expr_7682_mpos := _477_mpos
                    /// @src 15:16838:16859  "collateralWithdrawals"
                    let _478_mpos := var_collateralWithdrawals_7587_mpos
                    let expr_7683_mpos := _478_mpos
                    /// @src 15:16860:16861  "i"
                    let _479 := var_i_7669
                    let expr_7684 := _479
                    /// @src 15:16838:16862  "collateralWithdrawals[i]"
                    let _480_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(expr_7683_mpos, expr_7684))
                    let expr_7685_mpos := _480_mpos
                    /// @src 15:16838:16878  "collateralWithdrawals[i].collateralIndex"
                    let _481 := add(expr_7685_mpos, 0)
                    let _482 := read_from_memoryt_uint256(_481)
                    let expr_7686 := _482
                    /// @src 15:16900:16921  "collateralWithdrawals"
                    let _483_mpos := var_collateralWithdrawals_7587_mpos
                    let expr_7687_mpos := _483_mpos
                    /// @src 15:16922:16923  "i"
                    let _484 := var_i_7669
                    let expr_7688 := _484
                    /// @src 15:16900:16924  "collateralWithdrawals[i]"
                    let _485_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralWithdrawal_$8251_memory_ptr_$dyn_memory_ptr(expr_7687_mpos, expr_7688))
                    let expr_7689_mpos := _485_mpos
                    /// @src 15:16900:16931  "collateralWithdrawals[i].assets"
                    let _486 := add(expr_7689_mpos, 32)
                    let _487 := read_from_memoryt_uint256(_486)
                    let expr_7690 := _487
                    /// @src 15:16953:16961  "onBehalf"
                    let _488 := var_onBehalf_7580
                    let expr_7691 := _488
                    /// @src 15:16983:17001  "collateralReceiver"
                    let _489 := var_collateralReceiver_7589
                    let expr_7692 := _489
                    /// @src 15:16733:17019  "IMidnight(MIDNIGHT)..."

                    if iszero(extcodesize(expr_7681_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                    // storage for arguments and returned data
                    let _490 := allocate_unbounded()
                    mstore(_490, shift_left_224(expr_7681_functionSelector))
                    let _491 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address_t_address__to_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address_t_address__fromStack(add(_490, 4) , expr_7682_mpos, expr_7686, expr_7690, expr_7691, expr_7692)

                    let _492 := call(gas(), expr_7681_address,  0,  _490, sub(_491, _490), _490, 0)

                    if iszero(_492) { revert_forward_1() }

                    if _492 {

                        let _493 := 0

                        if gt(_493, returndatasize()) {
                            _493 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_490, _493)

                        // decode return parameters from external try-call into retVars
                        abi_decode_tuple__fromMemory(_490, add(_490, _493))
                    }
                }
                /// @src 15:17044:17061  "referralFeeAssets"
                let _494 := var_referralFeeAssets_7628
                let expr_7697 := _494
                /// @src 15:17064:17065  "0"
                let expr_7698 := 0x00
                /// @src 15:17044:17065  "referralFeeAssets > 0"
                let expr_7699 := gt(cleanup_t_uint256(expr_7697), convert_t_rational_0_by_1_to_t_uint256(expr_7698))
                /// @src 15:17040:17147  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                if expr_7699 {
                    /// @src 15:17067:17082  "SafeTransferLib"
                    let expr_7700_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                    /// @src 15:17096:17105  "loanToken"
                    let _495 := var_loanToken_7623
                    let expr_7703 := _495
                    /// @src 15:17107:17127  "referralFeeRecipient"
                    let _496 := var_referralFeeRecipient_7593
                    let expr_7704 := _496
                    /// @src 15:17129:17146  "referralFeeAssets"
                    let _497 := var_referralFeeAssets_7628
                    let expr_7705 := _497
                    fun_safeTransfer_5503(expr_7703, expr_7704, expr_7705)
                    /// @src 15:17040:17147  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                }

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function require_helper_t_error_8276_UnitsTooHigh(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x3aff647400000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 7572
            /// @src 15:12589:15384  "function supplyCollateralAndSellWithAssetsTarget(..."
            function fun_supplyCollateralAndSellWithAssetsTarget_7572(var_targetSellerAssets_7262, var_maxUnits_7264, var_taker_7266, var_receiver_7268, var_collateralSupplies_7272_mpos, var_takes_7276_mpos, var_referralFeePct_7278, var_referralFeeRecipient_7280) {

                /// @src 15:12935:12940  "taker"
                let _498 := var_taker_7266
                let expr_7284 := _498
                /// @src 15:12944:12954  "msg.sender"
                let expr_7286 := caller()
                /// @src 15:12935:12954  "taker == msg.sender"
                let expr_7287 := eq(cleanup_t_address(expr_7284), cleanup_t_address(expr_7286))
                /// @src 15:12935:13009  "taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"
                let expr_7296 := expr_7287
                if iszero(expr_7296) {
                    /// @src 15:12968:12976  "MIDNIGHT"
                    let _499 := loadimmutable("6375")
                    let expr_7289 := _499
                    /// @src 15:12958:12977  "IMidnight(MIDNIGHT)"
                    let expr_7290_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7289)
                    /// @src 15:12958:12990  "IMidnight(MIDNIGHT).isAuthorized"
                    let expr_7291_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7290_address)
                    let expr_7291_functionSelector := 0x65e4ad9e
                    /// @src 15:12991:12996  "taker"
                    let _500 := var_taker_7266
                    let expr_7292 := _500
                    /// @src 15:12998:13008  "msg.sender"
                    let expr_7294 := caller()
                    /// @src 15:12958:13009  "IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"

                    // storage for arguments and returned data
                    let _501 := allocate_unbounded()
                    mstore(_501, shift_left_224(expr_7291_functionSelector))
                    let _502 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_501, 4) , expr_7292, expr_7294)

                    let _503 := staticcall(gas(), expr_7291_address,  _501, sub(_502, _501), _501, 32)

                    if iszero(_503) { revert_forward_1() }

                    let expr_7295
                    if _503 {

                        let _504 := 32

                        if gt(_504, returndatasize()) {
                            _504 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_501, _504)

                        // decode return parameters from external try-call into retVars
                        expr_7295 :=  abi_decode_tuple_t_bool_fromMemory(_501, add(_501, _504))
                    }
                    /// @src 15:12935:13009  "taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender)"
                    expr_7296 := expr_7295
                }
                /// @src 15:12927:13026  "require(taker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(taker, msg.sender), Unauthorized())"
                require_helper_t_error_8274_Unauthorized(expr_7296)
                /// @src 15:13044:13058  "referralFeePct"
                let _505 := var_referralFeePct_7278
                let expr_7302 := _505
                /// @src 15:13061:13064  "WAD"
                let expr_7303 := constant_WAD_4917()
                /// @src 15:13044:13064  "referralFeePct < WAD"
                let expr_7304 := lt(cleanup_t_uint256(expr_7302), cleanup_t_uint256(expr_7303))
                /// @src 15:13036:13080  "require(referralFeePct < WAD, PctExceeded())"
                require_helper_t_error_8270_PctExceeded(expr_7304)
                /// @src 15:13110:13115  "takes"
                let _506_mpos := var_takes_7276_mpos
                let expr_7311_mpos := _506_mpos
                /// @src 15:13116:13117  "0"
                let expr_7312 := 0x00
                /// @src 15:13110:13118  "takes[0]"
                let _507_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7311_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_7312)))
                let expr_7313_mpos := _507_mpos
                /// @src 15:13110:13124  "takes[0].offer"
                let _508 := add(expr_7313_mpos, 32)
                let _509_mpos := mload(_508)
                let expr_7314_mpos := _509_mpos
                /// @src 15:13110:13131  "takes[0].offer.market"
                let _510 := add(expr_7314_mpos, 0)
                let _511_mpos := mload(_510)
                let expr_7315_mpos := _511_mpos
                /// @src 15:13110:13141  "takes[0].offer.market.loanToken"
                let _512 := add(expr_7315_mpos, 0)
                let _513 := read_from_memoryt_address(_512)
                let expr_7316 := _513
                /// @src 15:13090:13141  "address loanToken = takes[0].offer.market.loanToken"
                let var_loanToken_7310 := expr_7316
                /// @src 15:13234:13242  "MIDNIGHT"
                let _514 := loadimmutable("6375")
                let expr_7321 := _514
                /// @src 15:13224:13243  "IMidnight(MIDNIGHT)"
                let expr_7322_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7321)
                /// @src 15:13224:13255  "IMidnight(MIDNIGHT).touchMarket"
                let expr_7323_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7322_address)
                let expr_7323_functionSelector := 0x2bfb98ac
                /// @src 15:13256:13261  "takes"
                let _515_mpos := var_takes_7276_mpos
                let expr_7324_mpos := _515_mpos
                /// @src 15:13262:13263  "0"
                let expr_7325 := 0x00
                /// @src 15:13256:13264  "takes[0]"
                let _516_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7324_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_7325)))
                let expr_7326_mpos := _516_mpos
                /// @src 15:13256:13270  "takes[0].offer"
                let _517 := add(expr_7326_mpos, 32)
                let _518_mpos := mload(_517)
                let expr_7327_mpos := _518_mpos
                /// @src 15:13256:13277  "takes[0].offer.market"
                let _519 := add(expr_7327_mpos, 0)
                let _520_mpos := mload(_519)
                let expr_7328_mpos := _520_mpos
                /// @src 15:13224:13278  "IMidnight(MIDNIGHT).touchMarket(takes[0].offer.market)"

                // storage for arguments and returned data
                let _521 := allocate_unbounded()
                mstore(_521, shift_left_224(expr_7323_functionSelector))
                let _522 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(add(_521, 4) , expr_7328_mpos)

                let _523 := call(gas(), expr_7323_address,  0,  _521, sub(_522, _521), _521, 32)

                if iszero(_523) { revert_forward_1() }

                let expr_7329
                if _523 {

                    let _524 := 32

                    if gt(_524, returndatasize()) {
                        _524 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_521, _524)

                    // decode return parameters from external try-call into retVars
                    expr_7329 :=  abi_decode_tuple_t_bytes32_fromMemory(_521, add(_521, _524))
                }
                /// @src 15:13211:13278  "bytes32 id = IMidnight(MIDNIGHT).touchMarket(takes[0].offer.market)"
                let var_id_7319 := expr_7329
                /// @src 15:13312:13317  "takes"
                let _525_mpos := var_takes_7276_mpos
                let expr_7334_mpos := _525_mpos
                /// @src 15:13318:13319  "0"
                let expr_7335 := 0x00
                /// @src 15:13312:13320  "takes[0]"
                let _526_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7334_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_7335)))
                let expr_7336_mpos := _526_mpos
                /// @src 15:13312:13326  "takes[0].offer"
                let _527 := add(expr_7336_mpos, 32)
                let _528_mpos := mload(_527)
                let expr_7337_mpos := _528_mpos
                /// @src 15:13312:13333  "takes[0].offer.market"
                let _529 := add(expr_7337_mpos, 0)
                let _530_mpos := mload(_529)
                let expr_7338_mpos := _530_mpos
                /// @src 15:13289:13333  "Market memory market = takes[0].offer.market"
                let var_market_7333_mpos := expr_7338_mpos
                /// @src 15:13343:13803  "for (uint256 i; i < collateralSupplies.length; i++) {..."
                for {
                    /// @src 15:13348:13357  "uint256 i"
                    let var_i_7341
                    let zero_t_uint256_531 := zero_value_for_split_t_uint256()
                    var_i_7341 := zero_t_uint256_531
                    } 1 {
                    /// @src 15:13390:13393  "i++"
                    let _533 := var_i_7341
                    let _532 := increment_wrapping_t_uint256(_533)
                    var_i_7341 := _532
                    let expr_7348 := _533
                }
                {
                    /// @src 15:13359:13360  "i"
                    let _534 := var_i_7341
                    let expr_7343 := _534
                    /// @src 15:13363:13381  "collateralSupplies"
                    let _535_mpos := var_collateralSupplies_7272_mpos
                    let expr_7344_mpos := _535_mpos
                    /// @src 15:13363:13388  "collateralSupplies.length"
                    let expr_7345 := array_length_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_7344_mpos)
                    /// @src 15:13359:13388  "i < collateralSupplies.length"
                    let expr_7346 := lt(cleanup_t_uint256(expr_7343), cleanup_t_uint256(expr_7345))
                    if iszero(expr_7346) { break }
                    /// @src 15:13425:13431  "market"
                    let _536_mpos := var_market_7333_mpos
                    let expr_7352_mpos := _536_mpos
                    /// @src 15:13425:13448  "market.collateralParams"
                    let _537 := add(expr_7352_mpos, 32)
                    let _538_mpos := mload(_537)
                    let expr_7353_mpos := _538_mpos
                    /// @src 15:13449:13467  "collateralSupplies"
                    let _539_mpos := var_collateralSupplies_7272_mpos
                    let expr_7354_mpos := _539_mpos
                    /// @src 15:13468:13469  "i"
                    let _540 := var_i_7341
                    let expr_7355 := _540
                    /// @src 15:13449:13470  "collateralSupplies[i]"
                    let _541_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_7354_mpos, expr_7355))
                    let expr_7356_mpos := _541_mpos
                    /// @src 15:13449:13486  "collateralSupplies[i].collateralIndex"
                    let _542 := add(expr_7356_mpos, 0)
                    let _543 := read_from_memoryt_uint256(_542)
                    let expr_7357 := _543
                    /// @src 15:13425:13487  "market.collateralParams[collateralSupplies[i].collateralIndex]"
                    let _544_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_7353_mpos, expr_7357))
                    let expr_7358_mpos := _544_mpos
                    /// @src 15:13425:13493  "market.collateralParams[collateralSupplies[i].collateralIndex].token"
                    let _545 := add(expr_7358_mpos, 0)
                    let _546 := read_from_memoryt_address(_545)
                    let expr_7359 := _546
                    /// @src 15:13409:13493  "address token = market.collateralParams[collateralSupplies[i].collateralIndex].token"
                    let var_token_7351 := expr_7359
                    /// @src 15:13517:13522  "token"
                    let _547 := var_token_7351
                    let expr_7362 := _547
                    /// @src 15:13524:13534  "msg.sender"
                    let expr_7364 := caller()
                    /// @src 15:13536:13554  "collateralSupplies"
                    let _548_mpos := var_collateralSupplies_7272_mpos
                    let expr_7365_mpos := _548_mpos
                    /// @src 15:13555:13556  "i"
                    let _549 := var_i_7341
                    let expr_7366 := _549
                    /// @src 15:13536:13557  "collateralSupplies[i]"
                    let _550_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_7365_mpos, expr_7366))
                    let expr_7367_mpos := _550_mpos
                    /// @src 15:13536:13564  "collateralSupplies[i].assets"
                    let _551 := add(expr_7367_mpos, 32)
                    let _552 := read_from_memoryt_uint256(_551)
                    let expr_7368 := _552
                    /// @src 15:13566:13584  "collateralSupplies"
                    let _553_mpos := var_collateralSupplies_7272_mpos
                    let expr_7369_mpos := _553_mpos
                    /// @src 15:13585:13586  "i"
                    let _554 := var_i_7341
                    let expr_7370 := _554
                    /// @src 15:13566:13587  "collateralSupplies[i]"
                    let _555_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_7369_mpos, expr_7370))
                    let expr_7371_mpos := _555_mpos
                    /// @src 15:13566:13594  "collateralSupplies[i].permit"
                    let _556 := add(expr_7371_mpos, 64)
                    let _557_mpos := mload(_556)
                    let expr_7372_mpos := _557_mpos
                    fun_pullToken_7968(expr_7362, expr_7364, expr_7368, expr_7372_mpos)
                    /// @src 15:13625:13630  "token"
                    let _558 := var_token_7351
                    let expr_7376 := _558
                    /// @src 15:13632:13640  "MIDNIGHT"
                    let _559 := loadimmutable("6375")
                    let expr_7377 := _559
                    fun_forceApproveMax_7827(expr_7376, expr_7377)
                    /// @src 15:13665:13673  "MIDNIGHT"
                    let _560 := loadimmutable("6375")
                    let expr_7381 := _560
                    /// @src 15:13655:13674  "IMidnight(MIDNIGHT)"
                    let expr_7382_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7381)
                    /// @src 15:13655:13708  "IMidnight(MIDNIGHT)..."
                    let expr_7383_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7382_address)
                    let expr_7383_functionSelector := 0xfd1b2036
                    /// @src 15:13709:13715  "market"
                    let _561_mpos := var_market_7333_mpos
                    let expr_7384_mpos := _561_mpos
                    /// @src 15:13717:13735  "collateralSupplies"
                    let _562_mpos := var_collateralSupplies_7272_mpos
                    let expr_7385_mpos := _562_mpos
                    /// @src 15:13736:13737  "i"
                    let _563 := var_i_7341
                    let expr_7386 := _563
                    /// @src 15:13717:13738  "collateralSupplies[i]"
                    let _564_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_7385_mpos, expr_7386))
                    let expr_7387_mpos := _564_mpos
                    /// @src 15:13717:13754  "collateralSupplies[i].collateralIndex"
                    let _565 := add(expr_7387_mpos, 0)
                    let _566 := read_from_memoryt_uint256(_565)
                    let expr_7388 := _566
                    /// @src 15:13756:13774  "collateralSupplies"
                    let _567_mpos := var_collateralSupplies_7272_mpos
                    let expr_7389_mpos := _567_mpos
                    /// @src 15:13775:13776  "i"
                    let _568 := var_i_7341
                    let expr_7390 := _568
                    /// @src 15:13756:13777  "collateralSupplies[i]"
                    let _569_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralSupply_$8259_memory_ptr_$dyn_memory_ptr(expr_7389_mpos, expr_7390))
                    let expr_7391_mpos := _569_mpos
                    /// @src 15:13756:13784  "collateralSupplies[i].assets"
                    let _570 := add(expr_7391_mpos, 32)
                    let _571 := read_from_memoryt_uint256(_570)
                    let expr_7392 := _571
                    /// @src 15:13786:13791  "taker"
                    let _572 := var_taker_7266
                    let expr_7393 := _572
                    /// @src 15:13655:13792  "IMidnight(MIDNIGHT)..."

                    if iszero(extcodesize(expr_7383_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                    // storage for arguments and returned data
                    let _573 := allocate_unbounded()
                    mstore(_573, shift_left_224(expr_7383_functionSelector))
                    let _574 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address__to_t_struct$_Market_$4171_memory_ptr_t_uint256_t_uint256_t_address__fromStack(add(_573, 4) , expr_7384_mpos, expr_7388, expr_7392, expr_7393)

                    let _575 := call(gas(), expr_7383_address,  0,  _573, sub(_574, _573), _573, 0)

                    if iszero(_575) { revert_forward_1() }

                    if _575 {

                        let _576 := 0

                        if gt(_576, returndatasize()) {
                            _576 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_573, _576)

                        // decode return parameters from external try-call into retVars
                        abi_decode_tuple__fromMemory(_573, add(_573, _576))
                    }
                }
                /// @src 15:13841:13859  "targetSellerAssets"
                let _577 := var_targetSellerAssets_7262
                let expr_7400 := _577
                /// @src 15:13841:13870  "targetSellerAssets.mulDivDown"
                let expr_7401_self := expr_7400
                /// @src 15:13871:13885  "referralFeePct"
                let _578 := var_referralFeePct_7278
                let expr_7402 := _578
                /// @src 15:13887:13890  "WAD"
                let expr_7403 := constant_WAD_4917()
                /// @src 15:13893:13907  "referralFeePct"
                let _579 := var_referralFeePct_7278
                let expr_7404 := _579
                /// @src 15:13887:13907  "WAD - referralFeePct"
                let expr_7405 := checked_sub_t_uint256(expr_7403, expr_7404)

                /// @src 15:13841:13908  "targetSellerAssets.mulDivDown(referralFeePct, WAD - referralFeePct)"
                let expr_7406 := fun_mulDivDown_5872(expr_7401_self, expr_7402, expr_7405)
                /// @src 15:13813:13908  "uint256 referralFeeAssets = targetSellerAssets.mulDivDown(referralFeePct, WAD - referralFeePct)"
                let var_referralFeeAssets_7399 := expr_7406
                /// @src 15:13953:13971  "targetSellerAssets"
                let _580 := var_targetSellerAssets_7262
                let expr_7410 := _580
                /// @src 15:13974:13991  "referralFeeAssets"
                let _581 := var_referralFeeAssets_7399
                let expr_7411 := _581
                /// @src 15:13953:13991  "targetSellerAssets + referralFeeAssets"
                let expr_7412 := checked_add_t_uint256(expr_7410, expr_7411)

                /// @src 15:13918:13991  "uint256 targetFilledSellerAssets = targetSellerAssets + referralFeeAssets"
                let var_targetFilledSellerAssets_7409 := expr_7412
                /// @src 15:14002:14021  "uint256 filledUnits"
                let var_filledUnits_7415
                let zero_t_uint256_582 := zero_value_for_split_t_uint256()
                var_filledUnits_7415 := zero_t_uint256_582
                /// @src 15:14031:14057  "uint256 filledSellerAssets"
                let var_filledSellerAssets_7418
                let zero_t_uint256_583 := zero_value_for_split_t_uint256()
                var_filledSellerAssets_7418 := zero_t_uint256_583
                /// @src 15:14067:15042  "for (uint256 i; i < takes.length && filledSellerAssets < targetFilledSellerAssets; i++) {..."
                for {
                    /// @src 15:14072:14081  "uint256 i"
                    let var_i_7421
                    let zero_t_uint256_584 := zero_value_for_split_t_uint256()
                    var_i_7421 := zero_t_uint256_584
                    } 1 {
                    /// @src 15:14150:14153  "i++"
                    let _586 := var_i_7421
                    let _585 := increment_t_uint256(_586)
                    var_i_7421 := _585
                    let expr_7432 := _586
                }
                {
                    /// @src 15:14083:14084  "i"
                    let _587 := var_i_7421
                    let expr_7423 := _587
                    /// @src 15:14087:14092  "takes"
                    let _588_mpos := var_takes_7276_mpos
                    let expr_7424_mpos := _588_mpos
                    /// @src 15:14087:14099  "takes.length"
                    let expr_7425 := array_length_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7424_mpos)
                    /// @src 15:14083:14099  "i < takes.length"
                    let expr_7426 := lt(cleanup_t_uint256(expr_7423), cleanup_t_uint256(expr_7425))
                    /// @src 15:14083:14148  "i < takes.length && filledSellerAssets < targetFilledSellerAssets"
                    let expr_7430 := expr_7426
                    if expr_7430 {
                        /// @src 15:14103:14121  "filledSellerAssets"
                        let _589 := var_filledSellerAssets_7418
                        let expr_7427 := _589
                        /// @src 15:14124:14148  "targetFilledSellerAssets"
                        let _590 := var_targetFilledSellerAssets_7409
                        let expr_7428 := _590
                        /// @src 15:14103:14148  "filledSellerAssets < targetFilledSellerAssets"
                        let expr_7429 := lt(cleanup_t_uint256(expr_7427), cleanup_t_uint256(expr_7428))
                        /// @src 15:14083:14148  "i < takes.length && filledSellerAssets < targetFilledSellerAssets"
                        expr_7430 := expr_7429
                    }
                    if iszero(expr_7430) { break }
                    /// @src 15:14177:14182  "takes"
                    let _591_mpos := var_takes_7276_mpos
                    let expr_7435_mpos := _591_mpos
                    /// @src 15:14183:14184  "i"
                    let _592 := var_i_7421
                    let expr_7436 := _592
                    /// @src 15:14177:14185  "takes[i]"
                    let _593_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7435_mpos, expr_7436))
                    let expr_7437_mpos := _593_mpos
                    /// @src 15:14177:14191  "takes[i].offer"
                    let _594 := add(expr_7437_mpos, 32)
                    let _595_mpos := mload(_594)
                    let expr_7438_mpos := _595_mpos
                    /// @src 15:14177:14195  "takes[i].offer.buy"
                    let _596 := add(expr_7438_mpos, 32)
                    let _597 := read_from_memoryt_bool(_596)
                    let expr_7439 := _597
                    /// @src 15:14169:14216  "require(takes[i].offer.buy, InconsistentSide())"
                    require_helper_t_error_8266_InconsistentSide(expr_7439)
                    /// @src 15:14248:14256  "MIDNIGHT"
                    let _598 := loadimmutable("6375")
                    let expr_7446 := _598
                    /// @src 15:14238:14257  "IMidnight(MIDNIGHT)"
                    let expr_7447_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7446)
                    /// @src 15:14238:14262  "IMidnight(MIDNIGHT).toId"
                    let expr_7448_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7447_address)
                    let expr_7448_functionSelector := 0x355986fa
                    /// @src 15:14263:14268  "takes"
                    let _599_mpos := var_takes_7276_mpos
                    let expr_7449_mpos := _599_mpos
                    /// @src 15:14269:14270  "i"
                    let _600 := var_i_7421
                    let expr_7450 := _600
                    /// @src 15:14263:14271  "takes[i]"
                    let _601_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7449_mpos, expr_7450))
                    let expr_7451_mpos := _601_mpos
                    /// @src 15:14263:14277  "takes[i].offer"
                    let _602 := add(expr_7451_mpos, 32)
                    let _603_mpos := mload(_602)
                    let expr_7452_mpos := _603_mpos
                    /// @src 15:14263:14284  "takes[i].offer.market"
                    let _604 := add(expr_7452_mpos, 0)
                    let _605_mpos := mload(_604)
                    let expr_7453_mpos := _605_mpos
                    /// @src 15:14238:14285  "IMidnight(MIDNIGHT).toId(takes[i].offer.market)"

                    // storage for arguments and returned data
                    let _606 := allocate_unbounded()
                    mstore(_606, shift_left_224(expr_7448_functionSelector))
                    let _607 := abi_encode_tuple_t_struct$_Market_$4171_memory_ptr__to_t_struct$_Market_$4171_memory_ptr__fromStack(add(_606, 4) , expr_7453_mpos)

                    let _608 := staticcall(gas(), expr_7448_address,  _606, sub(_607, _606), _606, 32)

                    if iszero(_608) { revert_forward_1() }

                    let expr_7454
                    if _608 {

                        let _609 := 32

                        if gt(_609, returndatasize()) {
                            _609 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_606, _609)

                        // decode return parameters from external try-call into retVars
                        expr_7454 :=  abi_decode_tuple_t_bytes32_fromMemory(_606, add(_606, _609))
                    }
                    /// @src 15:14289:14291  "id"
                    let _610 := var_id_7319
                    let expr_7455 := _610
                    /// @src 15:14238:14291  "IMidnight(MIDNIGHT).toId(takes[i].offer.market) == id"
                    let expr_7456 := eq(cleanup_t_bytes32(expr_7454), cleanup_t_bytes32(expr_7455))
                    /// @src 15:14230:14314  "require(IMidnight(MIDNIGHT).toId(takes[i].offer.market) == id, InconsistentMarket())"
                    require_helper_t_error_8264_InconsistentMarket(expr_7456)
                    /// @src 15:14371:14385  "TakeAmountsLib"
                    let expr_7464_address := linkersymbol("deps/midnight/src/periphery/TakeAmountsLib.sol:TakeAmountsLib")
                    /// @src 15:14427:14435  "MIDNIGHT"
                    let _611 := loadimmutable("6375")
                    let expr_7466 := _611
                    /// @src 15:14437:14439  "id"
                    let _612 := var_id_7319
                    let expr_7467 := _612
                    /// @src 15:14441:14446  "takes"
                    let _613_mpos := var_takes_7276_mpos
                    let expr_7468_mpos := _613_mpos
                    /// @src 15:14447:14448  "i"
                    let _614 := var_i_7421
                    let expr_7469 := _614
                    /// @src 15:14441:14449  "takes[i]"
                    let _615_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7468_mpos, expr_7469))
                    let expr_7470_mpos := _615_mpos
                    /// @src 15:14441:14455  "takes[i].offer"
                    let _616 := add(expr_7470_mpos, 32)
                    let _617_mpos := mload(_616)
                    let expr_7471_mpos := _617_mpos
                    /// @src 15:14457:14481  "targetFilledSellerAssets"
                    let _618 := var_targetFilledSellerAssets_7409
                    let expr_7472 := _618
                    /// @src 15:14484:14502  "filledSellerAssets"
                    let _619 := var_filledSellerAssets_7418
                    let expr_7473 := _619
                    /// @src 15:14457:14502  "targetFilledSellerAssets - filledSellerAssets"
                    let expr_7474 := checked_sub_t_uint256(expr_7472, expr_7473)

                    /// @src 15:14371:14520  "TakeAmountsLib.sellerAssetsToUnits(..."
                    let expr_7475 := fun_sellerAssetsToUnits_8128(expr_7466, expr_7467, expr_7471_mpos, expr_7474)
                    /// @src 15:14538:14543  "takes"
                    let _620_mpos := var_takes_7276_mpos
                    let expr_7476_mpos := _620_mpos
                    /// @src 15:14544:14545  "i"
                    let _621 := var_i_7421
                    let expr_7477 := _621
                    /// @src 15:14538:14546  "takes[i]"
                    let _622_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7476_mpos, expr_7477))
                    let expr_7478_mpos := _622_mpos
                    /// @src 15:14538:14552  "takes[i].units"
                    let _623 := add(expr_7478_mpos, 0)
                    let _624 := read_from_memoryt_uint256(_623)
                    let expr_7479 := _624
                    /// @src 15:14570:14588  "ConsumableUnitsLib"
                    let expr_7480_address := linkersymbol("deps/midnight/src/periphery/ConsumableUnitsLib.sol:ConsumableUnitsLib")
                    /// @src 15:14605:14613  "MIDNIGHT"
                    let _625 := loadimmutable("6375")
                    let expr_7482 := _625
                    /// @src 15:14615:14617  "id"
                    let _626 := var_id_7319
                    let expr_7483 := _626
                    /// @src 15:14619:14624  "takes"
                    let _627_mpos := var_takes_7276_mpos
                    let expr_7484_mpos := _627_mpos
                    /// @src 15:14625:14626  "i"
                    let _628 := var_i_7421
                    let expr_7485 := _628
                    /// @src 15:14619:14627  "takes[i]"
                    let _629_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7484_mpos, expr_7485))
                    let expr_7486_mpos := _629_mpos
                    /// @src 15:14619:14633  "takes[i].offer"
                    let _630 := add(expr_7486_mpos, 32)
                    let _631_mpos := mload(_630)
                    let expr_7487_mpos := _631_mpos
                    /// @src 15:14570:14634  "ConsumableUnitsLib.consumableUnits(MIDNIGHT, id, takes[i].offer)"
                    let expr_7488 := fun_consumableUnits_6168(expr_7482, expr_7483, expr_7487_mpos)
                    /// @src 15:14350:14648  "min(..."
                    let expr_7489 := fun_min_7733(expr_7475, expr_7479, expr_7488)
                    /// @src 15:14328:14648  "uint256 unitsToTake = min(..."
                    let var_unitsToTake_7462 := expr_7489
                    /// @src 15:14676:14684  "MIDNIGHT"
                    let _632 := loadimmutable("6375")
                    let expr_7492 := _632
                    /// @src 15:14666:14685  "IMidnight(MIDNIGHT)"
                    let expr_7493_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_7492)
                    /// @src 15:14666:14707  "IMidnight(MIDNIGHT)..."
                    let expr_7494_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_7493_address)
                    let expr_7494_functionSelector := 0x81a01d33
                    /// @src 15:14729:14734  "takes"
                    let _633_mpos := var_takes_7276_mpos
                    let expr_7495_mpos := _633_mpos
                    /// @src 15:14735:14736  "i"
                    let _634 := var_i_7421
                    let expr_7496 := _634
                    /// @src 15:14729:14737  "takes[i]"
                    let _635_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7495_mpos, expr_7496))
                    let expr_7497_mpos := _635_mpos
                    /// @src 15:14729:14743  "takes[i].offer"
                    let _636 := add(expr_7497_mpos, 32)
                    let _637_mpos := mload(_636)
                    let expr_7498_mpos := _637_mpos
                    /// @src 15:14745:14750  "takes"
                    let _638_mpos := var_takes_7276_mpos
                    let expr_7499_mpos := _638_mpos
                    /// @src 15:14751:14752  "i"
                    let _639 := var_i_7421
                    let expr_7500 := _639
                    /// @src 15:14745:14753  "takes[i]"
                    let _640_mpos := mload(memory_array_index_access_t_array$_t_struct$_Take_$8236_memory_ptr_$dyn_memory_ptr(expr_7499_mpos, expr_7500))
                    let expr_7501_mpos := _640_mpos
                    /// @src 15:14745:14766  "takes[i].ratifierData"
                    let _641 := add(expr_7501_mpos, 64)
                    let _642_mpos := mload(_641)
                    let expr_7502_mpos := _642_mpos
                    /// @src 15:14768:14779  "unitsToTake"
                    let _643 := var_unitsToTake_7462
                    let expr_7503 := _643
                    /// @src 15:14781:14786  "taker"
                    let _644 := var_taker_7266
                    let expr_7504 := _644
                    /// @src 15:14796:14800  "this"
                    let expr_7507_address := address()
                    /// @src 15:14788:14801  "address(this)"
                    let expr_7508 := convert_t_contract$_MidnightBundles_$7969_to_t_address(expr_7507_address)
                    /// @src 15:14811:14812  "0"
                    let expr_7511 := 0x00
                    /// @src 15:14803:14813  "address(0)"
                    let expr_7512 := convert_t_rational_0_by_1_to_t_address(expr_7511)
                    /// @src 15:14666:14835  "IMidnight(MIDNIGHT)..."

                    // storage for arguments and returned data
                    let _645 := allocate_unbounded()
                    mstore(_645, shift_left_224(expr_7494_functionSelector))
                    let _646 := abi_encode_tuple_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_struct$_Offer_$4210_memory_ptr_t_bytes_memory_ptr_t_uint256_t_address_t_address_t_address_t_bytes_memory_ptr__fromStack(add(_645, 4) , expr_7498_mpos, expr_7502_mpos, expr_7503, expr_7504, expr_7508, expr_7512)

                    let trySuccessCondition_7514 := call(gas(), expr_7494_address,  0,  _645, sub(_646, _645), _645, 64)

                    let expr_7514_component_1, expr_7514_component_2
                    if trySuccessCondition_7514 {

                        let _647 := 64

                        if gt(_647, returndatasize()) {
                            _647 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_645, _647)

                        // decode return parameters from external try-call into retVars
                        expr_7514_component_1, expr_7514_component_2 :=  abi_decode_tuple_t_uint256t_uint256_fromMemory(_645, add(_645, _647))
                    }
                    /// @src 15:14662:15032  "try IMidnight(MIDNIGHT)..."
                    switch iszero(trySuccessCondition_7514)
                    case 0 { // success case
                        let var__7516 := expr_7514_component_1
                        let var_resSellerAssets_7518 := expr_7514_component_2
                        /// @src 15:14942:14953  "unitsToTake"
                        let _648 := var_unitsToTake_7462
                        let expr_7521 := _648
                        /// @src 15:14927:14953  "filledUnits += unitsToTake"
                        let _649 := var_filledUnits_7415
                        let expr_7522 := checked_add_t_uint256(_649, expr_7521)

                        var_filledUnits_7415 := expr_7522
                        /// @src 15:14993:15008  "resSellerAssets"
                        let _650 := var_resSellerAssets_7518
                        let expr_7525 := _650
                        /// @src 15:14971:15008  "filledSellerAssets += resSellerAssets"
                        let _651 := var_filledSellerAssets_7418
                        let expr_7526 := checked_add_t_uint256(_651, expr_7525)

                        var_filledSellerAssets_7418 := expr_7526
                        /// @src 15:14662:15032  "try IMidnight(MIDNIGHT)..."
                    }
                    default { // failure case
                        let _652 := 1
                        if _652 {
                        }
                    }
                }
                /// @src 15:15060:15078  "filledSellerAssets"
                let _653 := var_filledSellerAssets_7418
                let expr_7536 := _653
                /// @src 15:15082:15106  "targetFilledSellerAssets"
                let _654 := var_targetFilledSellerAssets_7409
                let expr_7537 := _654
                /// @src 15:15060:15106  "filledSellerAssets == targetFilledSellerAssets"
                let expr_7538 := eq(cleanup_t_uint256(expr_7536), cleanup_t_uint256(expr_7537))
                /// @src 15:15052:15122  "require(filledSellerAssets == targetFilledSellerAssets, OutOfOffers())"
                require_helper_t_error_8268_OutOfOffers(expr_7538)
                /// @src 15:15140:15151  "filledUnits"
                let _655 := var_filledUnits_7415
                let expr_7544 := _655
                /// @src 15:15155:15163  "maxUnits"
                let _656 := var_maxUnits_7264
                let expr_7545 := _656
                /// @src 15:15140:15163  "filledUnits <= maxUnits"
                let expr_7546 := iszero(gt(cleanup_t_uint256(expr_7544), cleanup_t_uint256(expr_7545)))
                /// @src 15:15132:15180  "require(filledUnits <= maxUnits, UnitsTooHigh())"
                require_helper_t_error_8276_UnitsTooHigh(expr_7546)
                /// @src 15:15195:15212  "referralFeeAssets"
                let _657 := var_referralFeeAssets_7399
                let expr_7551 := _657
                /// @src 15:15215:15216  "0"
                let expr_7552 := 0x00
                /// @src 15:15195:15216  "referralFeeAssets > 0"
                let expr_7553 := gt(cleanup_t_uint256(expr_7551), convert_t_rational_0_by_1_to_t_uint256(expr_7552))
                /// @src 15:15191:15298  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                if expr_7553 {
                    /// @src 15:15218:15233  "SafeTransferLib"
                    let expr_7554_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                    /// @src 15:15247:15256  "loanToken"
                    let _658 := var_loanToken_7310
                    let expr_7557 := _658
                    /// @src 15:15258:15278  "referralFeeRecipient"
                    let _659 := var_referralFeeRecipient_7280
                    let expr_7558 := _659
                    /// @src 15:15280:15297  "referralFeeAssets"
                    let _660 := var_referralFeeAssets_7399
                    let expr_7559 := _660
                    fun_safeTransfer_5503(expr_7557, expr_7558, expr_7559)
                    /// @src 15:15191:15298  "if (referralFeeAssets > 0) SafeTransferLib.safeTransfer(loanToken, referralFeeRecipient, referralFeeAssets)"
                }
                /// @src 15:15308:15323  "SafeTransferLib"
                let expr_7563_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                /// @src 15:15337:15346  "loanToken"
                let _661 := var_loanToken_7310
                let expr_7566 := _661
                /// @src 15:15348:15356  "receiver"
                let _662 := var_receiver_7268
                let expr_7567 := _662
                /// @src 15:15358:15376  "targetSellerAssets"
                let _663 := var_targetSellerAssets_7262
                let expr_7568 := _663
                fun_safeTransfer_5503(expr_7566, expr_7567, expr_7568)

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function panic_error_0x21() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x21)
                revert(0, 0x24)
            }

            function validator_assert_t_enum$_PermitKind_$8240(value) {
                if iszero(lt(value, 3)) { panic_error_0x21() }
            }

            function cleanup_t_enum$_PermitKind_$8240(value) -> cleaned {
                cleaned := value validator_assert_t_enum$_PermitKind_$8240(value)
            }

            function read_from_memoryt_enum$_PermitKind_$8240(ptr) -> returnValue {

                let value := cleanup_t_enum$_PermitKind_$8240(mload(ptr))

                returnValue :=

                value

            }

            function abi_decode_available_length_t_bytes_memory_ptr_fromMemory(src, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_bytes_memory_ptr(length))
                mstore(array, length)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() }
                copy_memory_to_memory_with_cleanup(src, dst, length)
            }

            // bytes
            function abi_decode_t_bytes_memory_ptr_fromMemory(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := mload(offset)
                array := abi_decode_available_length_t_bytes_memory_ptr_fromMemory(add(offset, 0x20), length, end)
            }

            function abi_decode_tuple_t_uint256t_uint256t_bytes_memory_ptr_fromMemory(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := mload(add(headStart, 64))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value2 := abi_decode_t_bytes_memory_ptr_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function convert_t_uint160_to_t_contract$_IPermit2_$8446(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IPermit2_$8446(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IPermit2_$8446(value)
            }

            function convert_t_contract$_IPermit2_$8446_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function allocate_memory_struct_t_struct$_TokenPermissions_$8419_storage_ptr() -> memPtr {
                memPtr := allocate_memory(64)
            }

            function write_to_memory_t_address(memPtr, value) {
                mstore(memPtr, cleanup_t_address(value))
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

            function allocate_memory_struct_t_struct$_PermitTransferFrom_$8427_storage_ptr() -> memPtr {
                memPtr := allocate_memory(96)
            }

            function write_to_memory_t_struct$_TokenPermissions_$8419_memory_ptr(memPtr, value) {
                mstore(memPtr, value)
            }

            function allocate_memory_struct_t_struct$_SignatureTransferDetails_$8432_storage_ptr() -> memPtr {
                memPtr := allocate_memory(64)
            }

            // struct IPermit2.TokenPermissions -> struct IPermit2.TokenPermissions
            function abi_encode_t_struct$_TokenPermissions_$8419_memory_ptr_to_t_struct$_TokenPermissions_$8419_memory_ptr(value, pos)  {
                let tail := add(pos, 0x40)

                {
                    // token

                    let memberValue0 := mload(add(value, 0x00))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x00))
                }

                {
                    // amount

                    let memberValue0 := mload(add(value, 0x20))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x20))
                }

            }

            // struct IPermit2.PermitTransferFrom -> struct IPermit2.PermitTransferFrom
            function abi_encode_t_struct$_PermitTransferFrom_$8427_memory_ptr_to_t_struct$_PermitTransferFrom_$8427_memory_ptr_fromStack(value, pos)  {
                let tail := add(pos, 0x80)

                {
                    // permitted

                    let memberValue0 := mload(add(value, 0x00))
                    abi_encode_t_struct$_TokenPermissions_$8419_memory_ptr_to_t_struct$_TokenPermissions_$8419_memory_ptr(memberValue0, add(pos, 0x00))
                }

                {
                    // nonce

                    let memberValue0 := mload(add(value, 0x20))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x40))
                }

                {
                    // deadline

                    let memberValue0 := mload(add(value, 0x40))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x60))
                }

            }

            // struct IPermit2.SignatureTransferDetails -> struct IPermit2.SignatureTransferDetails
            function abi_encode_t_struct$_SignatureTransferDetails_$8432_memory_ptr_to_t_struct$_SignatureTransferDetails_$8432_memory_ptr_fromStack(value, pos)  {
                let tail := add(pos, 0x40)

                {
                    // to

                    let memberValue0 := mload(add(value, 0x00))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x00))
                }

                {
                    // requestedAmount

                    let memberValue0 := mload(add(value, 0x20))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x20))
                }

            }

            function abi_encode_tuple_t_struct$_PermitTransferFrom_$8427_memory_ptr_t_struct$_SignatureTransferDetails_$8432_memory_ptr_t_address_t_bytes_memory_ptr__to_t_struct$_PermitTransferFrom_$8427_memory_ptr_t_struct$_SignatureTransferDetails_$8432_memory_ptr_t_address_t_bytes_memory_ptr__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 256)

                abi_encode_t_struct$_PermitTransferFrom_$8427_memory_ptr_to_t_struct$_PermitTransferFrom_$8427_memory_ptr_fromStack(value0,  add(headStart, 0))

                abi_encode_t_struct$_SignatureTransferDetails_$8432_memory_ptr_to_t_struct$_SignatureTransferDetails_$8432_memory_ptr_fromStack(value1,  add(headStart, 128))

                abi_encode_t_address_to_t_address_fromStack(value2,  add(headStart, 192))

                mstore(add(headStart, 224), sub(tail, headStart))
                tail := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value3,  tail)

            }

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function validator_revert_t_uint8(value) {
                if iszero(eq(value, cleanup_t_uint8(value))) { revert(0, 0) }
            }

            function abi_decode_t_uint8_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_uint8(value)
            }

            function abi_decode_tuple_t_uint256t_uint8t_bytes32t_bytes32_fromMemory(headStart, dataEnd) -> value0, value1, value2, value3 {
                if slt(sub(dataEnd, headStart), 128) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint8_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_bytes32_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 96

                    value3 := abi_decode_t_bytes32_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function convert_t_uint160_to_t_contract$_IERC20Permit_$8149(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IERC20Permit_$8149(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IERC20Permit_$8149(value)
            }

            function convert_t_contract$_IERC20Permit_$8149_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_tuple_t_address_t_address_t_uint256_t_uint256_t_uint8_t_bytes32_t_bytes32__to_t_address_t_address_t_uint256_t_uint256_t_uint8_t_bytes32_t_bytes32__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6) -> tail {
                tail := add(headStart, 224)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint8_to_t_uint8_fromStack(value4,  add(headStart, 128))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value5,  add(headStart, 160))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value6,  add(headStart, 192))

            }

            /// @ast-id 7968
            /// @src 15:18590:19789  "function pullToken(address token, address from, uint256 amount, TokenPermit memory permit) internal {..."
            function fun_pullToken_7968(var_token_7830, var_from_7832, var_amount_7834, var_permit_7837_mpos) {

                /// @src 15:18704:18710  "permit"
                let _664_mpos := var_permit_7837_mpos
                let expr_7840_mpos := _664_mpos
                /// @src 15:18704:18715  "permit.kind"
                let _665 := add(expr_7840_mpos, 0)
                let _666 := read_from_memoryt_enum$_PermitKind_$8240(_665)
                let expr_7841 := _666
                /// @src 15:18719:18737  "PermitKind.ERC2612"
                let expr_7843 := 1
                /// @src 15:18704:18737  "permit.kind == PermitKind.ERC2612"
                let expr_7844 := eq(cleanup_t_enum$_PermitKind_$8240(expr_7841), cleanup_t_enum$_PermitKind_$8240(expr_7843))
                /// @src 15:18700:19783  "if (permit.kind == PermitKind.ERC2612) {..."
                switch expr_7844
                case 0 {
                    /// @src 15:19170:19176  "permit"
                    let _667_mpos := var_permit_7837_mpos
                    let expr_7901_mpos := _667_mpos
                    /// @src 15:19170:19181  "permit.kind"
                    let _668 := add(expr_7901_mpos, 0)
                    let _669 := read_from_memoryt_enum$_PermitKind_$8240(_668)
                    let expr_7902 := _669
                    /// @src 15:19185:19203  "PermitKind.Permit2"
                    let expr_7904 := 2
                    /// @src 15:19170:19203  "permit.kind == PermitKind.Permit2"
                    let expr_7905 := eq(cleanup_t_enum$_PermitKind_$8240(expr_7902), cleanup_t_enum$_PermitKind_$8240(expr_7904))
                    /// @src 15:19166:19783  "if (permit.kind == PermitKind.Permit2) {..."
                    switch expr_7905
                    case 0 {
                        /// @src 15:19704:19719  "SafeTransferLib"
                        let expr_7952_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                        /// @src 15:19737:19742  "token"
                        let _670 := var_token_7830
                        let expr_7955 := _670
                        /// @src 15:19744:19748  "from"
                        let _671 := var_from_7832
                        let expr_7956 := _671
                        /// @src 15:19758:19762  "this"
                        let expr_7959_address := address()
                        /// @src 15:19750:19763  "address(this)"
                        let expr_7960 := convert_t_contract$_MidnightBundles_$7969_to_t_address(expr_7959_address)
                        /// @src 15:19765:19771  "amount"
                        let _672 := var_amount_7834
                        let expr_7961 := _672
                        fun_safeTransferFrom_5564(expr_7955, expr_7956, expr_7960, expr_7961)
                        /// @src 15:19166:19783  "if (permit.kind == PermitKind.Permit2) {..."
                    }
                    default {
                        /// @src 15:19306:19312  "permit"
                        let _673_mpos := var_permit_7837_mpos
                        let expr_7914_mpos := _673_mpos
                        /// @src 15:19306:19317  "permit.data"
                        let _674 := add(expr_7914_mpos, 32)
                        let _675_mpos := mload(_674)
                        let expr_7915_mpos := _675_mpos
                        /// @src 15:19295:19345  "abi.decode(permit.data, (uint256, uint256, bytes))"

                        let expr_7923_component_1, expr_7923_component_2, expr_7923_component_3_mpos :=  abi_decode_tuple_t_uint256t_uint256t_bytes_memory_ptr_fromMemory(add(expr_7915_mpos, 32), add(add(expr_7915_mpos, 32), array_length_t_bytes_memory_ptr(expr_7915_mpos)))
                        /// @src 15:19219:19345  "(uint256 nonce, uint256 deadline, bytes memory signature) =..."
                        let var_nonce_7907 := expr_7923_component_1
                        let var_deadline_7909 := expr_7923_component_2
                        let var_signature_7911_mpos := expr_7923_component_3_mpos
                        /// @src 15:19368:19375  "PERMIT2"
                        let expr_7926 := constant_PERMIT2_6373()
                        /// @src 15:19359:19376  "IPermit2(PERMIT2)"
                        let expr_7927_address := convert_t_address_to_t_contract$_IPermit2_$8446(expr_7926)
                        /// @src 15:19359:19412  "IPermit2(PERMIT2)..."
                        let expr_7928_address := convert_t_contract$_IPermit2_$8446_to_t_address(expr_7927_address)
                        let expr_7928_functionSelector := 0x30f28b7a
                        /// @src 15:19488:19493  "token"
                        let _676 := var_token_7830
                        let expr_7933 := _676
                        /// @src 15:19495:19501  "amount"
                        let _677 := var_amount_7834
                        let expr_7934 := _677
                        /// @src 15:19462:19502  "IPermit2.TokenPermissions(token, amount)"
                        let expr_7935_mpos := allocate_memory_struct_t_struct$_TokenPermissions_$8419_storage_ptr()
                        write_to_memory_t_address(add(expr_7935_mpos, 0), expr_7933)
                        write_to_memory_t_uint256(add(expr_7935_mpos, 32), expr_7934)
                        /// @src 15:19504:19509  "nonce"
                        let _678 := var_nonce_7907
                        let expr_7936 := _678
                        /// @src 15:19511:19519  "deadline"
                        let _679 := var_deadline_7909
                        let expr_7937 := _679
                        /// @src 15:19434:19520  "IPermit2.PermitTransferFrom(IPermit2.TokenPermissions(token, amount), nonce, deadline)"
                        let expr_7938_mpos := allocate_memory_struct_t_struct$_PermitTransferFrom_$8427_storage_ptr()
                        write_to_memory_t_struct$_TokenPermissions_$8419_memory_ptr(add(expr_7938_mpos, 0), expr_7935_mpos)
                        write_to_memory_t_uint256(add(expr_7938_mpos, 32), expr_7936)
                        write_to_memory_t_uint256(add(expr_7938_mpos, 64), expr_7937)
                        /// @src 15:19584:19588  "this"
                        let expr_7943_address := address()
                        /// @src 15:19576:19589  "address(this)"
                        let expr_7944 := convert_t_contract$_MidnightBundles_$7969_to_t_address(expr_7943_address)
                        /// @src 15:19591:19597  "amount"
                        let _680 := var_amount_7834
                        let expr_7945 := _680
                        /// @src 15:19542:19598  "IPermit2.SignatureTransferDetails(address(this), amount)"
                        let expr_7946_mpos := allocate_memory_struct_t_struct$_SignatureTransferDetails_$8432_storage_ptr()
                        write_to_memory_t_address(add(expr_7946_mpos, 0), expr_7944)
                        write_to_memory_t_uint256(add(expr_7946_mpos, 32), expr_7945)
                        /// @src 15:19620:19624  "from"
                        let _681 := var_from_7832
                        let expr_7947 := _681
                        /// @src 15:19646:19655  "signature"
                        let _682_mpos := var_signature_7911_mpos
                        let expr_7948_mpos := _682_mpos
                        /// @src 15:19359:19673  "IPermit2(PERMIT2)..."

                        if iszero(extcodesize(expr_7928_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                        // storage for arguments and returned data
                        let _683 := allocate_unbounded()
                        mstore(_683, shift_left_224(expr_7928_functionSelector))
                        let _684 := abi_encode_tuple_t_struct$_PermitTransferFrom_$8427_memory_ptr_t_struct$_SignatureTransferDetails_$8432_memory_ptr_t_address_t_bytes_memory_ptr__to_t_struct$_PermitTransferFrom_$8427_memory_ptr_t_struct$_SignatureTransferDetails_$8432_memory_ptr_t_address_t_bytes_memory_ptr__fromStack(add(_683, 4) , expr_7938_mpos, expr_7946_mpos, expr_7947, expr_7948_mpos)

                        let _685 := call(gas(), expr_7928_address,  0,  _683, sub(_684, _683), _683, 0)

                        if iszero(_685) { revert_forward_1() }

                        if _685 {

                            let _686 := 0

                            if gt(_686, returndatasize()) {
                                _686 := returndatasize()
                            }

                            // update freeMemoryPointer according to dynamic return size
                            finalize_allocation(_683, _686)

                            // decode return parameters from external try-call into retVars
                            abi_decode_tuple__fromMemory(_683, add(_683, _686))
                        }
                        /// @src 15:19166:19783  "if (permit.kind == PermitKind.Permit2) {..."
                    }
                    /// @src 15:18700:19783  "if (permit.kind == PermitKind.ERC2612) {..."
                }
                default {
                    /// @src 15:18832:18838  "permit"
                    let _687_mpos := var_permit_7837_mpos
                    let expr_7855_mpos := _687_mpos
                    /// @src 15:18832:18843  "permit.data"
                    let _688 := add(expr_7855_mpos, 32)
                    let _689_mpos := mload(_688)
                    let expr_7856_mpos := _689_mpos
                    /// @src 15:18821:18880  "abi.decode(permit.data, (uint256, uint8, bytes32, bytes32))"

                    let expr_7866_component_1, expr_7866_component_2, expr_7866_component_3, expr_7866_component_4 :=  abi_decode_tuple_t_uint256t_uint8t_bytes32t_bytes32_fromMemory(add(expr_7856_mpos, 32), add(add(expr_7856_mpos, 32), array_length_t_bytes_memory_ptr(expr_7856_mpos)))
                    /// @src 15:18753:18880  "(uint256 deadline, uint8 v, bytes32 r, bytes32 s) =..."
                    let var_deadline_7846 := expr_7866_component_1
                    let var_v_7848 := expr_7866_component_2
                    let var_r_7850 := expr_7866_component_3
                    let var_s_7852 := expr_7866_component_4
                    /// @src 15:18995:19000  "token"
                    let _690 := var_token_7830
                    let expr_7869 := _690
                    /// @src 15:18982:19001  "IERC20Permit(token)"
                    let expr_7870_address := convert_t_address_to_t_contract$_IERC20Permit_$8149(expr_7869)
                    /// @src 15:18982:19008  "IERC20Permit(token).permit"
                    let expr_7871_address := convert_t_contract$_IERC20Permit_$8149_to_t_address(expr_7870_address)
                    let expr_7871_functionSelector := 0xd505accf
                    /// @src 15:19009:19013  "from"
                    let _691 := var_from_7832
                    let expr_7872 := _691
                    /// @src 15:19023:19027  "this"
                    let expr_7875_address := address()
                    /// @src 15:19015:19028  "address(this)"
                    let expr_7876 := convert_t_contract$_MidnightBundles_$7969_to_t_address(expr_7875_address)
                    /// @src 15:19030:19036  "amount"
                    let _692 := var_amount_7834
                    let expr_7877 := _692
                    /// @src 15:19038:19046  "deadline"
                    let _693 := var_deadline_7846
                    let expr_7878 := _693
                    /// @src 15:19048:19049  "v"
                    let _694 := var_v_7848
                    let expr_7879 := _694
                    /// @src 15:19051:19052  "r"
                    let _695 := var_r_7850
                    let expr_7880 := _695
                    /// @src 15:19054:19055  "s"
                    let _696 := var_s_7852
                    let expr_7881 := _696
                    /// @src 15:18982:19056  "IERC20Permit(token).permit(from, address(this), amount, deadline, v, r, s)"

                    if iszero(extcodesize(expr_7871_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                    // storage for arguments and returned data
                    let _697 := allocate_unbounded()
                    mstore(_697, shift_left_224(expr_7871_functionSelector))
                    let _698 := abi_encode_tuple_t_address_t_address_t_uint256_t_uint256_t_uint8_t_bytes32_t_bytes32__to_t_address_t_address_t_uint256_t_uint256_t_uint8_t_bytes32_t_bytes32__fromStack(add(_697, 4) , expr_7872, expr_7876, expr_7877, expr_7878, expr_7879, expr_7880, expr_7881)

                    let trySuccessCondition_7882 := call(gas(), expr_7871_address,  0,  _697, sub(_698, _697), _697, 0)

                    if trySuccessCondition_7882 {

                        let _699 := 0

                        if gt(_699, returndatasize()) {
                            _699 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_697, _699)

                        // decode return parameters from external try-call into retVars
                        abi_decode_tuple__fromMemory(_697, add(_697, _699))
                    }
                    /// @src 15:18978:19068  "try IERC20Permit(token).permit(from, address(this), amount, deadline, v, r, s) {} catch {}"
                    switch iszero(trySuccessCondition_7882)
                    case 0 { // success case
                    }
                    default { // failure case
                        let _700 := 1
                        if _700 {
                        }
                    }
                    /// @src 15:19081:19096  "SafeTransferLib"
                    let expr_7888_address := linkersymbol("deps/midnight/src/libraries/SafeTransferLib.sol:SafeTransferLib")
                    /// @src 15:19114:19119  "token"
                    let _701 := var_token_7830
                    let expr_7891 := _701
                    /// @src 15:19121:19125  "from"
                    let _702 := var_from_7832
                    let expr_7892 := _702
                    /// @src 15:19135:19139  "this"
                    let expr_7895_address := address()
                    /// @src 15:19127:19140  "address(this)"
                    let expr_7896 := convert_t_contract$_MidnightBundles_$7969_to_t_address(expr_7895_address)
                    /// @src 15:19142:19148  "amount"
                    let _703 := var_amount_7834
                    let expr_7897 := _703
                    fun_safeTransferFrom_5564(expr_7891, expr_7892, expr_7896, expr_7897)
                    /// @src 15:18700:19783  "if (permit.kind == PermitKind.ERC2612) {..."
                }

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function convert_t_uint160_to_t_contract$_IERC20_$4129(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IERC20_$4129(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IERC20_$4129(value)
            }

            function convert_t_contract$_IERC20_$4129_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function cleanup_t_rational_2_by_1(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint96(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffff)
            }

            function convert_t_rational_2_by_1_to_t_uint96(value) -> converted {
                converted := cleanup_t_uint96(identity(cleanup_t_rational_2_by_1(value)))
            }

            function panic_error_0x12() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x12)
                revert(0, 0x24)
            }

            function checked_div_t_uint96(x, y) -> r {
                x := cleanup_t_uint96(x)
                y := cleanup_t_uint96(y)
                if iszero(y) { panic_error_0x12() }

                r := div(x, y)
            }

            function convert_t_uint96_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint96(value)))
            }

            /// @ast-id 7827
            /// @src 15:18217:18479  "function forceApproveMax(address token, address spender) internal {..."
            function fun_forceApproveMax_7827(var_token_7785, var_spender_7787) {

                /// @src 15:18304:18309  "token"
                let _704 := var_token_7785
                let expr_7791 := _704
                /// @src 15:18297:18310  "IERC20(token)"
                let expr_7792_address := convert_t_address_to_t_contract$_IERC20_$4129(expr_7791)
                /// @src 15:18297:18320  "IERC20(token).allowance"
                let expr_7793_address := convert_t_contract$_IERC20_$4129_to_t_address(expr_7792_address)
                let expr_7793_functionSelector := 0xdd62ed3e
                /// @src 15:18329:18333  "this"
                let expr_7796_address := address()
                /// @src 15:18321:18334  "address(this)"
                let expr_7797 := convert_t_contract$_MidnightBundles_$7969_to_t_address(expr_7796_address)
                /// @src 15:18336:18343  "spender"
                let _705 := var_spender_7787
                let expr_7798 := _705
                /// @src 15:18297:18344  "IERC20(token).allowance(address(this), spender)"

                // storage for arguments and returned data
                let _706 := allocate_unbounded()
                mstore(_706, shift_left_224(expr_7793_functionSelector))
                let _707 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_706, 4) , expr_7797, expr_7798)

                let _708 := staticcall(gas(), expr_7793_address,  _706, sub(_707, _706), _706, 32)

                if iszero(_708) { revert_forward_1() }

                let expr_7799
                if _708 {

                    let _709 := 32

                    if gt(_709, returndatasize()) {
                        _709 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_706, _709)

                    // decode return parameters from external try-call into retVars
                    expr_7799 :=  abi_decode_tuple_t_uint256_fromMemory(_706, add(_706, _709))
                }
                /// @src 15:18348:18364  "type(uint96).max"
                let expr_7804 := 0xffffffffffffffffffffffff
                /// @src 15:18367:18368  "2"
                let expr_7805 := 0x02
                /// @src 15:18348:18368  "type(uint96).max / 2"
                let expr_7806 := checked_div_t_uint96(expr_7804, convert_t_rational_2_by_1_to_t_uint96(expr_7805))

                /// @src 15:18297:18368  "IERC20(token).allowance(address(this), spender) >= type(uint96).max / 2"
                let expr_7807 := iszero(lt(cleanup_t_uint256(expr_7799), convert_t_uint96_to_t_uint256(expr_7806)))
                /// @src 15:18293:18377  "if (IERC20(token).allowance(address(this), spender) >= type(uint96).max / 2) return;"
                if expr_7807 {
                    /// @src 15:18370:18377  "return;"
                    leave
                    /// @src 15:18293:18377  "if (IERC20(token).allowance(address(this), spender) >= type(uint96).max / 2) return;"
                }
                /// @src 15:18398:18403  "token"
                let _710 := var_token_7785
                let expr_7811 := _710
                /// @src 15:18405:18412  "spender"
                let _711 := var_spender_7787
                let expr_7812 := _711
                /// @src 15:18414:18415  "0"
                let expr_7813 := 0x00
                /// @src 15:18386:18416  "safeApprove(token, spender, 0)"
                let _712 := convert_t_rational_0_by_1_to_t_uint256(expr_7813)
                fun_safeApprove_7782(expr_7811, expr_7812, _712)
                /// @src 15:18438:18443  "token"
                let _713 := var_token_7785
                let expr_7817 := _713
                /// @src 15:18445:18452  "spender"
                let _714 := var_spender_7787
                let expr_7818 := _714
                /// @src 15:18454:18471  "type(uint256).max"
                let expr_7823 := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                fun_safeApprove_7782(expr_7817, expr_7818, expr_7823)

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function read_from_memoryt_bytes32(ptr) -> returnValue {

                let value := cleanup_t_bytes32(mload(ptr))

                returnValue :=

                value

            }

            function abi_encode_tuple_t_address_t_bytes32__to_t_address_t_bytes32__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value1,  add(headStart, 32))

            }

            /// @ast-id 6168
            /// @src 13:478:1057  "function consumableUnits(address midnight, bytes32 id, Offer memory offer) internal view returns (uint256) {..."
            function fun_consumableUnits_6168(var_midnight_6104, var_id_6106, var_offer_6109_mpos) -> var__6112 {
                /// @src 13:576:583  "uint256"
                let zero_t_uint256_715 := zero_value_for_split_t_uint256()
                var__6112 := zero_t_uint256_715

                /// @src 13:624:632  "midnight"
                let _716 := var_midnight_6104
                let expr_6117 := _716
                /// @src 13:614:633  "IMidnight(midnight)"
                let expr_6118_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6117)
                /// @src 13:614:642  "IMidnight(midnight).consumed"
                let expr_6119_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6118_address)
                let expr_6119_functionSelector := 0xe29dfba8
                /// @src 13:643:648  "offer"
                let _717_mpos := var_offer_6109_mpos
                let expr_6120_mpos := _717_mpos
                /// @src 13:643:654  "offer.maker"
                let _718 := add(expr_6120_mpos, 64)
                let _719 := read_from_memoryt_address(_718)
                let expr_6121 := _719
                /// @src 13:656:661  "offer"
                let _720_mpos := var_offer_6109_mpos
                let expr_6122_mpos := _720_mpos
                /// @src 13:656:667  "offer.group"
                let _721 := add(expr_6122_mpos, 192)
                let _722 := read_from_memoryt_bytes32(_721)
                let expr_6123 := _722
                /// @src 13:614:668  "IMidnight(midnight).consumed(offer.maker, offer.group)"

                // storage for arguments and returned data
                let _723 := allocate_unbounded()
                mstore(_723, shift_left_224(expr_6119_functionSelector))
                let _724 := abi_encode_tuple_t_address_t_bytes32__to_t_address_t_bytes32__fromStack(add(_723, 4) , expr_6121, expr_6123)

                let _725 := staticcall(gas(), expr_6119_address,  _723, sub(_724, _723), _723, 32)

                if iszero(_725) { revert_forward_1() }

                let expr_6124
                if _725 {

                    let _726 := 32

                    if gt(_726, returndatasize()) {
                        _726 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_723, _726)

                    // decode return parameters from external try-call into retVars
                    expr_6124 :=  abi_decode_tuple_t_uint256_fromMemory(_723, add(_723, _726))
                }
                /// @src 13:595:668  "uint256 consumed = IMidnight(midnight).consumed(offer.maker, offer.group)"
                let var_consumed_6115 := expr_6124
                /// @src 13:682:687  "offer"
                let _727_mpos := var_offer_6109_mpos
                let expr_6126_mpos := _727_mpos
                /// @src 13:682:696  "offer.maxUnits"
                let _728 := add(expr_6126_mpos, 384)
                let _729 := read_from_memoryt_uint256(_728)
                let expr_6127 := _729
                /// @src 13:699:700  "0"
                let expr_6128 := 0x00
                /// @src 13:682:700  "offer.maxUnits > 0"
                let expr_6129 := gt(cleanup_t_uint256(expr_6127), convert_t_rational_0_by_1_to_t_uint256(expr_6128))
                /// @src 13:678:1051  "if (offer.maxUnits > 0) {..."
                switch expr_6129
                case 0 {
                    /// @src 13:781:786  "offer"
                    let _730_mpos := var_offer_6109_mpos
                    let expr_6137_mpos := _730_mpos
                    /// @src 13:781:790  "offer.buy"
                    let _731 := add(expr_6137_mpos, 32)
                    let _732 := read_from_memoryt_bool(_731)
                    let expr_6138 := _732
                    /// @src 13:777:1051  "if (offer.buy) {..."
                    switch expr_6138
                    case 0 {
                        /// @src 13:945:959  "TakeAmountsLib"
                        let expr_6152_address := linkersymbol("deps/midnight/src/periphery/TakeAmountsLib.sol:TakeAmountsLib")
                        /// @src 13:980:988  "midnight"
                        let _733 := var_midnight_6104
                        let expr_6154 := _733
                        /// @src 13:990:992  "id"
                        let _734 := var_id_6106
                        let expr_6155 := _734
                        /// @src 13:994:999  "offer"
                        let _735_mpos := var_offer_6109_mpos
                        let expr_6156_mpos := _735_mpos
                        /// @src 13:1001:1006  "offer"
                        let _736_mpos := var_offer_6109_mpos
                        let expr_6157_mpos := _736_mpos
                        /// @src 13:1001:1016  "offer.maxAssets"
                        let _737 := add(expr_6157_mpos, 416)
                        let _738 := read_from_memoryt_uint256(_737)
                        let expr_6158 := _738
                        /// @src 13:1001:1029  "offer.maxAssets.zeroFloorSub"
                        let expr_6159_self := expr_6158
                        /// @src 13:1030:1038  "consumed"
                        let _739 := var_consumed_6115
                        let expr_6160 := _739
                        /// @src 13:1001:1039  "offer.maxAssets.zeroFloorSub(consumed)"
                        let expr_6161 := fun_zeroFloorSub_5852(expr_6159_self, expr_6160)
                        /// @src 13:945:1040  "TakeAmountsLib.sellerAssetsToUnits(midnight, id, offer, offer.maxAssets.zeroFloorSub(consumed))"
                        let expr_6162 := fun_sellerAssetsToUnits_8128(expr_6154, expr_6155, expr_6156_mpos, expr_6161)
                        /// @src 13:938:1040  "return TakeAmountsLib.sellerAssetsToUnits(midnight, id, offer, offer.maxAssets.zeroFloorSub(consumed))"
                        var__6112 := expr_6162
                        leave
                        /// @src 13:777:1051  "if (offer.buy) {..."
                    }
                    default {
                        /// @src 13:813:827  "TakeAmountsLib"
                        let expr_6139_address := linkersymbol("deps/midnight/src/periphery/TakeAmountsLib.sol:TakeAmountsLib")
                        /// @src 13:847:855  "midnight"
                        let _740 := var_midnight_6104
                        let expr_6141 := _740
                        /// @src 13:857:859  "id"
                        let _741 := var_id_6106
                        let expr_6142 := _741
                        /// @src 13:861:866  "offer"
                        let _742_mpos := var_offer_6109_mpos
                        let expr_6143_mpos := _742_mpos
                        /// @src 13:868:873  "offer"
                        let _743_mpos := var_offer_6109_mpos
                        let expr_6144_mpos := _743_mpos
                        /// @src 13:868:883  "offer.maxAssets"
                        let _744 := add(expr_6144_mpos, 416)
                        let _745 := read_from_memoryt_uint256(_744)
                        let expr_6145 := _745
                        /// @src 13:868:896  "offer.maxAssets.zeroFloorSub"
                        let expr_6146_self := expr_6145
                        /// @src 13:897:905  "consumed"
                        let _746 := var_consumed_6115
                        let expr_6147 := _746
                        /// @src 13:868:906  "offer.maxAssets.zeroFloorSub(consumed)"
                        let expr_6148 := fun_zeroFloorSub_5852(expr_6146_self, expr_6147)
                        /// @src 13:813:907  "TakeAmountsLib.buyerAssetsToUnits(midnight, id, offer, offer.maxAssets.zeroFloorSub(consumed))"
                        let expr_6149 := fun_buyerAssetsToUnits_8063(expr_6141, expr_6142, expr_6143_mpos, expr_6148)
                        /// @src 13:806:907  "return TakeAmountsLib.buyerAssetsToUnits(midnight, id, offer, offer.maxAssets.zeroFloorSub(consumed))"
                        var__6112 := expr_6149
                        leave
                        /// @src 13:777:1051  "if (offer.buy) {..."
                    }
                    /// @src 13:678:1051  "if (offer.maxUnits > 0) {..."
                }
                default {
                    /// @src 13:723:728  "offer"
                    let _747_mpos := var_offer_6109_mpos
                    let expr_6130_mpos := _747_mpos
                    /// @src 13:723:737  "offer.maxUnits"
                    let _748 := add(expr_6130_mpos, 384)
                    let _749 := read_from_memoryt_uint256(_748)
                    let expr_6131 := _749
                    /// @src 13:723:750  "offer.maxUnits.zeroFloorSub"
                    let expr_6132_self := expr_6131
                    /// @src 13:751:759  "consumed"
                    let _750 := var_consumed_6115
                    let expr_6133 := _750
                    /// @src 13:723:760  "offer.maxUnits.zeroFloorSub(consumed)"
                    let expr_6134 := fun_zeroFloorSub_5852(expr_6132_self, expr_6133)
                    /// @src 13:716:760  "return offer.maxUnits.zeroFloorSub(consumed)"
                    var__6112 := expr_6134
                    leave
                    /// @src 13:678:1051  "if (offer.maxUnits > 0) {..."
                }

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            /// @ast-id 7733
            /// @src 15:17195:17332  "function min(uint256 x, uint256 y, uint256 w) internal pure returns (uint256) {..."
            function fun_min_7733(var_x_7713, var_y_7715, var_w_7717) -> var__7720 {
                /// @src 15:17264:17271  "uint256"
                let zero_t_uint256_751 := zero_value_for_split_t_uint256()
                var__7720 := zero_t_uint256_751

                /// @src 15:17290:17298  "UtilsLib"
                let expr_7722_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 15:17303:17311  "UtilsLib"
                let expr_7724_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 15:17316:17317  "x"
                let _752 := var_x_7713
                let expr_7726 := _752
                /// @src 15:17319:17320  "y"
                let _753 := var_y_7715
                let expr_7727 := _753
                /// @src 15:17303:17321  "UtilsLib.min(x, y)"
                let expr_7728 := fun_min_5841(expr_7726, expr_7727)
                /// @src 15:17323:17324  "w"
                let _754 := var_w_7717
                let expr_7729 := _754
                /// @src 15:17290:17325  "UtilsLib.min(UtilsLib.min(x, y), w)"
                let expr_7730 := fun_min_5841(expr_7728, expr_7729)
                /// @src 15:17283:17325  "return UtilsLib.min(UtilsLib.min(x, y), w)"
                var__7720 := expr_7730
                leave

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

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

            function checked_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error_0x12() }

                r := div(x, y)
            }

            /// @ast-id 5872
            /// @src 12:790:910  "function mulDivDown(uint256 x, uint256 y, uint256 d) internal pure returns (uint256) {..."
            function fun_mulDivDown_5872(var_x_5855, var_y_5857, var_d_5859) -> var__5862 {
                /// @src 12:866:873  "uint256"
                let zero_t_uint256_755 := zero_value_for_split_t_uint256()
                var__5862 := zero_t_uint256_755

                /// @src 12:893:894  "x"
                let _756 := var_x_5855
                let expr_5864 := _756
                /// @src 12:897:898  "y"
                let _757 := var_y_5857
                let expr_5865 := _757
                /// @src 12:893:898  "x * y"
                let expr_5866 := checked_mul_t_uint256(expr_5864, expr_5865)

                /// @src 12:892:899  "(x * y)"
                let expr_5867 := expr_5866
                /// @src 12:902:903  "d"
                let _758 := var_d_5859
                let expr_5868 := _758
                /// @src 12:892:903  "(x * y) / d"
                let expr_5869 := checked_div_t_uint256(expr_5867, expr_5868)

                /// @src 12:885:903  "return (x * y) / d"
                var__5862 := expr_5869
                leave

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function require_helper_t_error_5441_NoCode(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xf046a71400000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

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
                let _759 := var_token_5447
                let expr_5455 := _759
                /// @src 10:377:394  "token.code.length"
                let expr_5457 := extcodesize(expr_5455)
                /// @src 10:397:398  "0"
                let expr_5458 := 0x00
                /// @src 10:377:398  "token.code.length > 0"
                let expr_5459 := gt(cleanup_t_uint256(expr_5457), convert_t_rational_0_by_1_to_t_uint256(expr_5458))
                /// @src 10:369:409  "require(token.code.length > 0, NoCode())"
                require_helper_t_error_5441_NoCode(expr_5459)
                /// @src 10:462:467  "token"
                let _760 := var_token_5447
                let expr_5468 := _760
                /// @src 10:462:472  "token.call"
                let expr_5469_address := expr_5468
                /// @src 10:506:508  "to"
                let _761 := var_to_5449
                let expr_5474 := _761
                /// @src 10:505:516  "(to, value)"
                let expr_5476_component_1 := expr_5474
                /// @src 10:510:515  "value"
                let _762 := var_value_5451
                let expr_5475 := _762
                /// @src 10:505:516  "(to, value)"
                let expr_5476_component_2 := expr_5475
                /// @src 10:473:517  "abi.encodeCall(IERC20.transfer, (to, value))"

                let expr_5477_mpos := allocate_unbounded()
                let _763 := add(expr_5477_mpos, 0x20)

                mstore(_763, 0xa9059cbb00000000000000000000000000000000000000000000000000000000)
                _763 := add(_763, 4)

                let _764 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(_763, expr_5474, expr_5475)
                mstore(expr_5477_mpos, sub(_764, add(expr_5477_mpos, 0x20)))
                finalize_allocation(expr_5477_mpos, sub(_764, expr_5477_mpos))
                /// @src 10:462:518  "token.call(abi.encodeCall(IERC20.transfer, (to, value)))"

                let _765 := add(expr_5477_mpos, 0x20)
                let _766 := mload(expr_5477_mpos)

                let expr_5478_component_1 := call(gas(), expr_5469_address,  0,  _765, _766, 0, 0)

                let expr_5478_component_2_mpos := extract_returndata()
                /// @src 10:420:518  "(bool success, bytes memory returndata) = token.call(abi.encodeCall(IERC20.transfer, (to, value)))"
                let var_success_5465 := expr_5478_component_1
                let var_returndata_5467_mpos := expr_5478_component_2_mpos
                /// @src 10:533:540  "success"
                let _767 := var_success_5465
                let expr_5480 := _767
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
                let _768_mpos := var_returndata_5467_mpos
                let expr_5486_mpos := _768_mpos
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
                    let _769_mpos := var_returndata_5467_mpos
                    let expr_5492_mpos := _769_mpos
                    /// @src 10:714:744  "abi.decode(returndata, (bool))"

                    let expr_5496 :=  abi_decode_tuple_t_bool_fromMemory(add(expr_5492_mpos, 32), add(add(expr_5492_mpos, 32), array_length_t_bytes_memory_ptr(expr_5492_mpos)))
                    /// @src 10:688:744  "returndata.length == 0 || abi.decode(returndata, (bool))"
                    expr_5497 := expr_5496
                }
                /// @src 10:680:770  "require(returndata.length == 0 || abi.decode(returndata, (bool)), TransferReturnedFalse())"
                require_helper_t_error_5445_TransferReturnedFalse(expr_5497)

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function abi_encode_tuple_t_bytes32_t_uint256__to_t_bytes32_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function require_helper_t_error_5581_PriceGreaterThanOne(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x0fda063a00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 8063
            /// @src 16:824:1638  "function buyerAssetsToUnits(address midnight, bytes32 id, Offer memory offer, uint256 targetBuyerAssets)..."
            function fun_buyerAssetsToUnits_8063(var_midnight_7986, var_id_7988, var_offer_7991_mpos, var_targetBuyerAssets_7993) -> var__7996 {
                /// @src 16:976:983  "uint256"
                let zero_t_uint256_770 := zero_value_for_split_t_uint256()
                var__7996 := zero_t_uint256_770

                /// @src 16:1020:1027  "TickLib"
                let expr_8000_address := linkersymbol("deps/midnight/src/libraries/TickLib.sol:TickLib")
                /// @src 16:1040:1045  "offer"
                let _771_mpos := var_offer_7991_mpos
                let expr_8002_mpos := _771_mpos
                /// @src 16:1040:1050  "offer.tick"
                let _772 := add(expr_8002_mpos, 160)
                let _773 := read_from_memoryt_uint256(_772)
                let expr_8003 := _773
                /// @src 16:1020:1051  "TickLib.tickToPrice(offer.tick)"
                let expr_8004 := fun_tickToPrice_5743(expr_8003)
                /// @src 16:999:1051  "uint256 offerPrice = TickLib.tickToPrice(offer.tick)"
                let var_offerPrice_7999 := expr_8004
                /// @src 16:1107:1115  "midnight"
                let _774 := var_midnight_7986
                let expr_8009 := _774
                /// @src 16:1097:1116  "IMidnight(midnight)"
                let expr_8010_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_8009)
                /// @src 16:1097:1130  "IMidnight(midnight).settlementFee"
                let expr_8011_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_8010_address)
                let expr_8011_functionSelector := 0xa9bef809
                /// @src 16:1131:1133  "id"
                let _775 := var_id_7988
                let expr_8012 := _775
                /// @src 16:1135:1143  "UtilsLib"
                let expr_8013_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 16:1157:1162  "offer"
                let _776_mpos := var_offer_7991_mpos
                let expr_8015_mpos := _776_mpos
                /// @src 16:1157:1169  "offer.market"
                let _777 := add(expr_8015_mpos, 0)
                let _778_mpos := mload(_777)
                let expr_8016_mpos := _778_mpos
                /// @src 16:1157:1178  "offer.market.maturity"
                let _779 := add(expr_8016_mpos, 64)
                let _780 := read_from_memoryt_uint256(_779)
                let expr_8017 := _780
                /// @src 16:1180:1195  "block.timestamp"
                let expr_8019 := timestamp()
                /// @src 16:1135:1196  "UtilsLib.zeroFloorSub(offer.market.maturity, block.timestamp)"
                let expr_8020 := fun_zeroFloorSub_5852(expr_8017, expr_8019)
                /// @src 16:1097:1197  "IMidnight(midnight).settlementFee(id, UtilsLib.zeroFloorSub(offer.market.maturity, block.timestamp))"

                // storage for arguments and returned data
                let _781 := allocate_unbounded()
                mstore(_781, shift_left_224(expr_8011_functionSelector))
                let _782 := abi_encode_tuple_t_bytes32_t_uint256__to_t_bytes32_t_uint256__fromStack(add(_781, 4) , expr_8012, expr_8020)

                let _783 := staticcall(gas(), expr_8011_address,  _781, sub(_782, _781), _781, 32)

                if iszero(_783) { revert_forward_1() }

                let expr_8021
                if _783 {

                    let _784 := 32

                    if gt(_784, returndatasize()) {
                        _784 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_781, _784)

                    // decode return parameters from external try-call into retVars
                    expr_8021 :=  abi_decode_tuple_t_uint256_fromMemory(_781, add(_781, _784))
                }
                /// @src 16:1061:1197  "uint256 settlementFee =..."
                let var_settlementFee_8007 := expr_8021
                /// @src 16:1335:1340  "offer"
                let _785_mpos := var_offer_7991_mpos
                let expr_8025_mpos := _785_mpos
                /// @src 16:1335:1344  "offer.buy"
                let _786 := add(expr_8025_mpos, 32)
                let _787 := read_from_memoryt_bool(_786)
                let expr_8026 := _787
                /// @src 16:1335:1386  "offer.buy ? offerPrice - settlementFee : offerPrice"
                let expr_8031
                switch expr_8026
                case 0 {
                    /// @src 16:1376:1386  "offerPrice"
                    let _788 := var_offerPrice_7999
                    let expr_8030 := _788
                    /// @src 16:1335:1386  "offer.buy ? offerPrice - settlementFee : offerPrice"
                    expr_8031 := expr_8030
                }
                default {
                    /// @src 16:1347:1357  "offerPrice"
                    let _789 := var_offerPrice_7999
                    let expr_8027 := _789
                    /// @src 16:1360:1373  "settlementFee"
                    let _790 := var_settlementFee_8007
                    let expr_8028 := _790
                    /// @src 16:1347:1373  "offerPrice - settlementFee"
                    let expr_8029 := checked_sub_t_uint256(expr_8027, expr_8028)

                    /// @src 16:1335:1386  "offer.buy ? offerPrice - settlementFee : offerPrice"
                    expr_8031 := expr_8029
                }
                /// @src 16:1313:1386  "uint256 sellerPrice = offer.buy ? offerPrice - settlementFee : offerPrice"
                let var_sellerPrice_8024 := expr_8031
                /// @src 16:1417:1428  "sellerPrice"
                let _791 := var_sellerPrice_8024
                let expr_8035 := _791
                /// @src 16:1431:1444  "settlementFee"
                let _792 := var_settlementFee_8007
                let expr_8036 := _792
                /// @src 16:1417:1444  "sellerPrice + settlementFee"
                let expr_8037 := checked_add_t_uint256(expr_8035, expr_8036)

                /// @src 16:1396:1444  "uint256 buyerPrice = sellerPrice + settlementFee"
                let var_buyerPrice_8034 := expr_8037
                /// @src 16:1462:1472  "buyerPrice"
                let _793 := var_buyerPrice_8034
                let expr_8040 := _793
                /// @src 16:1476:1479  "WAD"
                let expr_8041 := constant_WAD_4917()
                /// @src 16:1462:1479  "buyerPrice <= WAD"
                let expr_8042 := iszero(gt(cleanup_t_uint256(expr_8040), cleanup_t_uint256(expr_8041)))
                /// @src 16:1481:1488  "TickLib"
                let expr_8043_address := linkersymbol("deps/midnight/src/libraries/TickLib.sol:TickLib")
                /// @src 16:1454:1511  "require(buyerPrice <= WAD, TickLib.PriceGreaterThanOne())"
                require_helper_t_error_5581_PriceGreaterThanOne(expr_8042)
                /// @src 16:1528:1533  "offer"
                let _794_mpos := var_offer_7991_mpos
                let expr_8048_mpos := _794_mpos
                /// @src 16:1528:1537  "offer.buy"
                let _795 := add(expr_8048_mpos, 32)
                let _796 := read_from_memoryt_bool(_795)
                let expr_8049 := _796
                /// @src 16:1528:1631  "offer.buy ? targetBuyerAssets.mulDivUp(WAD, buyerPrice) : targetBuyerAssets.mulDivDown(WAD, buyerPrice)"
                let expr_8060
                switch expr_8049
                case 0 {
                    /// @src 16:1586:1603  "targetBuyerAssets"
                    let _797 := var_targetBuyerAssets_7993
                    let expr_8055 := _797
                    /// @src 16:1586:1614  "targetBuyerAssets.mulDivDown"
                    let expr_8056_self := expr_8055
                    /// @src 16:1615:1618  "WAD"
                    let expr_8057 := constant_WAD_4917()
                    /// @src 16:1620:1630  "buyerPrice"
                    let _798 := var_buyerPrice_8034
                    let expr_8058 := _798
                    /// @src 16:1586:1631  "targetBuyerAssets.mulDivDown(WAD, buyerPrice)"
                    let expr_8059 := fun_mulDivDown_5872(expr_8056_self, expr_8057, expr_8058)
                    /// @src 16:1528:1631  "offer.buy ? targetBuyerAssets.mulDivUp(WAD, buyerPrice) : targetBuyerAssets.mulDivDown(WAD, buyerPrice)"
                    expr_8060 := expr_8059
                }
                default {
                    /// @src 16:1540:1557  "targetBuyerAssets"
                    let _799 := var_targetBuyerAssets_7993
                    let expr_8050 := _799
                    /// @src 16:1540:1566  "targetBuyerAssets.mulDivUp"
                    let expr_8051_self := expr_8050
                    /// @src 16:1567:1570  "WAD"
                    let expr_8052 := constant_WAD_4917()
                    /// @src 16:1572:1582  "buyerPrice"
                    let _800 := var_buyerPrice_8034
                    let expr_8053 := _800
                    /// @src 16:1540:1583  "targetBuyerAssets.mulDivUp(WAD, buyerPrice)"
                    let expr_8054 := fun_mulDivUp_5897(expr_8051_self, expr_8052, expr_8053)
                    /// @src 16:1528:1631  "offer.buy ? targetBuyerAssets.mulDivUp(WAD, buyerPrice) : targetBuyerAssets.mulDivDown(WAD, buyerPrice)"
                    expr_8060 := expr_8054
                }
                /// @src 16:1521:1631  "return offer.buy ? targetBuyerAssets.mulDivUp(WAD, buyerPrice) : targetBuyerAssets.mulDivDown(WAD, buyerPrice)"
                var__7996 := expr_8060
                leave

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            /// @ast-id 8128
            /// @src 16:2035:2636  "function sellerAssetsToUnits(address midnight, bytes32 id, Offer memory offer, uint256 targetSellerAssets)..."
            function fun_sellerAssetsToUnits_8128(var_midnight_8066, var_id_8068, var_offer_8071_mpos, var_targetSellerAssets_8073) -> var__8076 {
                /// @src 16:2189:2196  "uint256"
                let zero_t_uint256_801 := zero_value_for_split_t_uint256()
                var__8076 := zero_t_uint256_801

                /// @src 16:2233:2240  "TickLib"
                let expr_8080_address := linkersymbol("deps/midnight/src/libraries/TickLib.sol:TickLib")
                /// @src 16:2253:2258  "offer"
                let _802_mpos := var_offer_8071_mpos
                let expr_8082_mpos := _802_mpos
                /// @src 16:2253:2263  "offer.tick"
                let _803 := add(expr_8082_mpos, 160)
                let _804 := read_from_memoryt_uint256(_803)
                let expr_8083 := _804
                /// @src 16:2233:2264  "TickLib.tickToPrice(offer.tick)"
                let expr_8084 := fun_tickToPrice_5743(expr_8083)
                /// @src 16:2212:2264  "uint256 offerPrice = TickLib.tickToPrice(offer.tick)"
                let var_offerPrice_8079 := expr_8084
                /// @src 16:2320:2328  "midnight"
                let _805 := var_midnight_8066
                let expr_8089 := _805
                /// @src 16:2310:2329  "IMidnight(midnight)"
                let expr_8090_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_8089)
                /// @src 16:2310:2343  "IMidnight(midnight).settlementFee"
                let expr_8091_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_8090_address)
                let expr_8091_functionSelector := 0xa9bef809
                /// @src 16:2344:2346  "id"
                let _806 := var_id_8068
                let expr_8092 := _806
                /// @src 16:2348:2356  "UtilsLib"
                let expr_8093_address := linkersymbol("deps/midnight/src/libraries/UtilsLib.sol:UtilsLib")
                /// @src 16:2370:2375  "offer"
                let _807_mpos := var_offer_8071_mpos
                let expr_8095_mpos := _807_mpos
                /// @src 16:2370:2382  "offer.market"
                let _808 := add(expr_8095_mpos, 0)
                let _809_mpos := mload(_808)
                let expr_8096_mpos := _809_mpos
                /// @src 16:2370:2391  "offer.market.maturity"
                let _810 := add(expr_8096_mpos, 64)
                let _811 := read_from_memoryt_uint256(_810)
                let expr_8097 := _811
                /// @src 16:2393:2408  "block.timestamp"
                let expr_8099 := timestamp()
                /// @src 16:2348:2409  "UtilsLib.zeroFloorSub(offer.market.maturity, block.timestamp)"
                let expr_8100 := fun_zeroFloorSub_5852(expr_8097, expr_8099)
                /// @src 16:2310:2410  "IMidnight(midnight).settlementFee(id, UtilsLib.zeroFloorSub(offer.market.maturity, block.timestamp))"

                // storage for arguments and returned data
                let _812 := allocate_unbounded()
                mstore(_812, shift_left_224(expr_8091_functionSelector))
                let _813 := abi_encode_tuple_t_bytes32_t_uint256__to_t_bytes32_t_uint256__fromStack(add(_812, 4) , expr_8092, expr_8100)

                let _814 := staticcall(gas(), expr_8091_address,  _812, sub(_813, _812), _812, 32)

                if iszero(_814) { revert_forward_1() }

                let expr_8101
                if _814 {

                    let _815 := 32

                    if gt(_815, returndatasize()) {
                        _815 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_812, _815)

                    // decode return parameters from external try-call into retVars
                    expr_8101 :=  abi_decode_tuple_t_uint256_fromMemory(_812, add(_812, _815))
                }
                /// @src 16:2274:2410  "uint256 settlementFee =..."
                let var_settlementFee_8087 := expr_8101
                /// @src 16:2442:2447  "offer"
                let _816_mpos := var_offer_8071_mpos
                let expr_8105_mpos := _816_mpos
                /// @src 16:2442:2451  "offer.buy"
                let _817 := add(expr_8105_mpos, 32)
                let _818 := read_from_memoryt_bool(_817)
                let expr_8106 := _818
                /// @src 16:2442:2493  "offer.buy ? offerPrice - settlementFee : offerPrice"
                let expr_8111
                switch expr_8106
                case 0 {
                    /// @src 16:2483:2493  "offerPrice"
                    let _819 := var_offerPrice_8079
                    let expr_8110 := _819
                    /// @src 16:2442:2493  "offer.buy ? offerPrice - settlementFee : offerPrice"
                    expr_8111 := expr_8110
                }
                default {
                    /// @src 16:2454:2464  "offerPrice"
                    let _820 := var_offerPrice_8079
                    let expr_8107 := _820
                    /// @src 16:2467:2480  "settlementFee"
                    let _821 := var_settlementFee_8087
                    let expr_8108 := _821
                    /// @src 16:2454:2480  "offerPrice - settlementFee"
                    let expr_8109 := checked_sub_t_uint256(expr_8107, expr_8108)

                    /// @src 16:2442:2493  "offer.buy ? offerPrice - settlementFee : offerPrice"
                    expr_8111 := expr_8109
                }
                /// @src 16:2420:2493  "uint256 sellerPrice = offer.buy ? offerPrice - settlementFee : offerPrice"
                let var_sellerPrice_8104 := expr_8111
                /// @src 16:2522:2527  "offer"
                let _822_mpos := var_offer_8071_mpos
                let expr_8113_mpos := _822_mpos
                /// @src 16:2522:2531  "offer.buy"
                let _823 := add(expr_8113_mpos, 32)
                let _824 := read_from_memoryt_bool(_823)
                let expr_8114 := _824
                /// @src 16:2522:2629  "offer.buy ? targetSellerAssets.mulDivUp(WAD, sellerPrice) : targetSellerAssets.mulDivDown(WAD, sellerPrice)"
                let expr_8125
                switch expr_8114
                case 0 {
                    /// @src 16:2582:2600  "targetSellerAssets"
                    let _825 := var_targetSellerAssets_8073
                    let expr_8120 := _825
                    /// @src 16:2582:2611  "targetSellerAssets.mulDivDown"
                    let expr_8121_self := expr_8120
                    /// @src 16:2612:2615  "WAD"
                    let expr_8122 := constant_WAD_4917()
                    /// @src 16:2617:2628  "sellerPrice"
                    let _826 := var_sellerPrice_8104
                    let expr_8123 := _826
                    /// @src 16:2582:2629  "targetSellerAssets.mulDivDown(WAD, sellerPrice)"
                    let expr_8124 := fun_mulDivDown_5872(expr_8121_self, expr_8122, expr_8123)
                    /// @src 16:2522:2629  "offer.buy ? targetSellerAssets.mulDivUp(WAD, sellerPrice) : targetSellerAssets.mulDivDown(WAD, sellerPrice)"
                    expr_8125 := expr_8124
                }
                default {
                    /// @src 16:2534:2552  "targetSellerAssets"
                    let _827 := var_targetSellerAssets_8073
                    let expr_8115 := _827
                    /// @src 16:2534:2561  "targetSellerAssets.mulDivUp"
                    let expr_8116_self := expr_8115
                    /// @src 16:2562:2565  "WAD"
                    let expr_8117 := constant_WAD_4917()
                    /// @src 16:2567:2578  "sellerPrice"
                    let _828 := var_sellerPrice_8104
                    let expr_8118 := _828
                    /// @src 16:2534:2579  "targetSellerAssets.mulDivUp(WAD, sellerPrice)"
                    let expr_8119 := fun_mulDivUp_5897(expr_8116_self, expr_8117, expr_8118)
                    /// @src 16:2522:2629  "offer.buy ? targetSellerAssets.mulDivUp(WAD, sellerPrice) : targetSellerAssets.mulDivDown(WAD, sellerPrice)"
                    expr_8125 := expr_8119
                }
                /// @src 16:2503:2629  "return..."
                var__8076 := expr_8125
                leave

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

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
                let _829 := var_token_5505
                let expr_5515 := _829
                /// @src 10:892:909  "token.code.length"
                let expr_5517 := extcodesize(expr_5515)
                /// @src 10:912:913  "0"
                let expr_5518 := 0x00
                /// @src 10:892:913  "token.code.length > 0"
                let expr_5519 := gt(cleanup_t_uint256(expr_5517), convert_t_rational_0_by_1_to_t_uint256(expr_5518))
                /// @src 10:884:924  "require(token.code.length > 0, NoCode())"
                require_helper_t_error_5441_NoCode(expr_5519)
                /// @src 10:977:982  "token"
                let _830 := var_token_5505
                let expr_5528 := _830
                /// @src 10:977:987  "token.call"
                let expr_5529_address := expr_5528
                /// @src 10:1025:1029  "from"
                let _831 := var_from_5507
                let expr_5534 := _831
                /// @src 10:1024:1041  "(from, to, value)"
                let expr_5537_component_1 := expr_5534
                /// @src 10:1031:1033  "to"
                let _832 := var_to_5509
                let expr_5535 := _832
                /// @src 10:1024:1041  "(from, to, value)"
                let expr_5537_component_2 := expr_5535
                /// @src 10:1035:1040  "value"
                let _833 := var_value_5511
                let expr_5536 := _833
                /// @src 10:1024:1041  "(from, to, value)"
                let expr_5537_component_3 := expr_5536
                /// @src 10:988:1042  "abi.encodeCall(IERC20.transferFrom, (from, to, value))"

                let expr_5538_mpos := allocate_unbounded()
                let _834 := add(expr_5538_mpos, 0x20)

                mstore(_834, 0x23b872dd00000000000000000000000000000000000000000000000000000000)
                _834 := add(_834, 4)

                let _835 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(_834, expr_5534, expr_5535, expr_5536)
                mstore(expr_5538_mpos, sub(_835, add(expr_5538_mpos, 0x20)))
                finalize_allocation(expr_5538_mpos, sub(_835, expr_5538_mpos))
                /// @src 10:977:1043  "token.call(abi.encodeCall(IERC20.transferFrom, (from, to, value)))"

                let _836 := add(expr_5538_mpos, 0x20)
                let _837 := mload(expr_5538_mpos)

                let expr_5539_component_1 := call(gas(), expr_5529_address,  0,  _836, _837, 0, 0)

                let expr_5539_component_2_mpos := extract_returndata()
                /// @src 10:935:1043  "(bool success, bytes memory returndata) = token.call(abi.encodeCall(IERC20.transferFrom, (from, to, value)))"
                let var_success_5525 := expr_5539_component_1
                let var_returndata_5527_mpos := expr_5539_component_2_mpos
                /// @src 10:1058:1065  "success"
                let _838 := var_success_5525
                let expr_5541 := _838
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
                let _839_mpos := var_returndata_5527_mpos
                let expr_5547_mpos := _839_mpos
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
                    let _840_mpos := var_returndata_5527_mpos
                    let expr_5553_mpos := _840_mpos
                    /// @src 10:1239:1269  "abi.decode(returndata, (bool))"

                    let expr_5557 :=  abi_decode_tuple_t_bool_fromMemory(add(expr_5553_mpos, 32), add(add(expr_5553_mpos, 32), array_length_t_bytes_memory_ptr(expr_5553_mpos)))
                    /// @src 10:1213:1269  "returndata.length == 0 || abi.decode(returndata, (bool))"
                    expr_5558 := expr_5557
                }
                /// @src 10:1205:1299  "require(returndata.length == 0 || abi.decode(returndata, (bool)), TransferFromReturnedFalse())"
                require_helper_t_error_5443_TransferFromReturnedFalse(expr_5558)

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function require_helper_t_error_8262_ApproveReturnedFalse(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x7d57776400000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 7782
            /// @src 15:17476:17923  "function safeApprove(address token, address spender, uint256 value) internal {..."
            function fun_safeApprove_7782(var_token_7736, var_spender_7738, var_value_7740) {

                /// @src 15:17605:17610  "token"
                let _841 := var_token_7736
                let expr_7747 := _841
                /// @src 15:17605:17615  "token.call"
                let expr_7748_address := expr_7747
                /// @src 15:17648:17655  "spender"
                let _842 := var_spender_7738
                let expr_7753 := _842
                /// @src 15:17647:17663  "(spender, value)"
                let expr_7755_component_1 := expr_7753
                /// @src 15:17657:17662  "value"
                let _843 := var_value_7740
                let expr_7754 := _843
                /// @src 15:17647:17663  "(spender, value)"
                let expr_7755_component_2 := expr_7754
                /// @src 15:17616:17664  "abi.encodeCall(IERC20.approve, (spender, value))"

                let expr_7756_mpos := allocate_unbounded()
                let _844 := add(expr_7756_mpos, 0x20)

                mstore(_844, 0x095ea7b300000000000000000000000000000000000000000000000000000000)
                _844 := add(_844, 4)

                let _845 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(_844, expr_7753, expr_7754)
                mstore(expr_7756_mpos, sub(_845, add(expr_7756_mpos, 0x20)))
                finalize_allocation(expr_7756_mpos, sub(_845, expr_7756_mpos))
                /// @src 15:17605:17665  "token.call(abi.encodeCall(IERC20.approve, (spender, value)))"

                let _846 := add(expr_7756_mpos, 0x20)
                let _847 := mload(expr_7756_mpos)

                let expr_7757_component_1 := call(gas(), expr_7748_address,  0,  _846, _847, 0, 0)

                let expr_7757_component_2_mpos := extract_returndata()
                /// @src 15:17563:17665  "(bool success, bytes memory returndata) = token.call(abi.encodeCall(IERC20.approve, (spender, value)))"
                let var_success_7744 := expr_7757_component_1
                let var_returndata_7746_mpos := expr_7757_component_2_mpos
                /// @src 15:17680:17687  "success"
                let _848 := var_success_7744
                let expr_7759 := _848
                /// @src 15:17679:17687  "!success"
                let expr_7760 := cleanup_t_bool(iszero(expr_7759))
                /// @src 15:17675:17818  "if (!success) {..."
                if expr_7760 {
                    /// @src 15:17703:17808  "assembly (\"memory-safe\") {..."
                    {
                        revert(add(var_returndata_7746_mpos, 0x20), mload(var_returndata_7746_mpos))
                    }
                    /// @src 15:17675:17818  "if (!success) {..."
                }
                /// @src 15:17835:17845  "returndata"
                let _849_mpos := var_returndata_7746_mpos
                let expr_7765_mpos := _849_mpos
                /// @src 15:17835:17852  "returndata.length"
                let expr_7766 := array_length_t_bytes_memory_ptr(expr_7765_mpos)
                /// @src 15:17856:17857  "0"
                let expr_7767 := 0x00
                /// @src 15:17835:17857  "returndata.length == 0"
                let expr_7768 := eq(cleanup_t_uint256(expr_7766), convert_t_rational_0_by_1_to_t_uint256(expr_7767))
                /// @src 15:17835:17891  "returndata.length == 0 || abi.decode(returndata, (bool))"
                let expr_7776 := expr_7768
                if iszero(expr_7776) {
                    /// @src 15:17872:17882  "returndata"
                    let _850_mpos := var_returndata_7746_mpos
                    let expr_7771_mpos := _850_mpos
                    /// @src 15:17861:17891  "abi.decode(returndata, (bool))"

                    let expr_7775 :=  abi_decode_tuple_t_bool_fromMemory(add(expr_7771_mpos, 32), add(add(expr_7771_mpos, 32), array_length_t_bytes_memory_ptr(expr_7771_mpos)))
                    /// @src 15:17835:17891  "returndata.length == 0 || abi.decode(returndata, (bool))"
                    expr_7776 := expr_7775
                }
                /// @src 15:17827:17916  "require(returndata.length == 0 || abi.decode(returndata, (bool)), ApproveReturnedFalse())"
                require_helper_t_error_8262_ApproveReturnedFalse(expr_7776)

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            /// @ast-id 5852
            /// @src 12:581:737  "function zeroFloorSub(uint256 x, uint256 y) internal pure returns (uint256 z) {..."
            function fun_zeroFloorSub_5852(var_x_5843, var_y_5845) -> var_z_5848 {
                /// @src 12:648:657  "uint256 z"
                let zero_t_uint256_851 := zero_value_for_split_t_uint256()
                var_z_5848 := zero_t_uint256_851

                /// @src 12:669:731  "assembly {..."
                {
                    var_z_5848 := mul(gt(var_x_5843, var_y_5845), sub(var_x_5843, var_y_5845))
                }

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            /// @ast-id 5841
            /// @src 12:420:575  "function min(uint256 x, uint256 y) internal pure returns (uint256 z) {..."
            function fun_min_5841(var_x_5832, var_y_5834) -> var_z_5837 {
                /// @src 12:478:487  "uint256 z"
                let zero_t_uint256_852 := zero_value_for_split_t_uint256()
                var_z_5837 := zero_t_uint256_852

                /// @src 12:499:569  "assembly {..."
                {
                    var_z_5837 := xor(var_x_5832, mul(xor(var_x_5832, var_y_5834), lt(var_y_5834, var_x_5832)))
                }

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

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
                let _855 := convert_t_rational_5820_by_1_to_t_uint256(expr_5572)

                ret := _855
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

            function cleanup_t_rational_1000000000000000000000000000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1000000000000000000000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1000000000000000000000000000000000000_by_1(value)))
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
                let _856 := convert_t_rational_4987541511039073_by_1_to_t_int256(expr_5569)

                ret := _856
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_2_by_1(value)))
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

            function cleanup_t_rational_1000000000000_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1000000000000_by_1(value)))
            }

            /// @src 11:345:388  "uint256 constant PRICE_ROUNDING_STEP = 1e12"
            function constant_PRICE_ROUNDING_STEP_5576() -> ret {
                /// @src 11:384:388  "1e12"
                let expr_5575 := 0xe8d4a51000
                let _858 := convert_t_rational_1000000000000_by_1_to_t_uint256(expr_5575)

                ret := _858
            }

            function wrapping_mul_t_uint256(x, y) -> product {
                product := cleanup_t_uint256(mul(x, y))
            }

            /// @ast-id 5743
            /// @src 11:1803:2255  "function tickToPrice(uint256 tick) internal pure returns (uint256) {..."
            function fun_tickToPrice_5743(var_tick_5698) -> var__5701 {
                /// @src 11:1861:1868  "uint256"
                let zero_t_uint256_853 := zero_value_for_split_t_uint256()
                var__5701 := zero_t_uint256_853

                /// @src 11:1888:1892  "tick"
                let _854 := var_tick_5698
                let expr_5704 := _854
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
                let _857 := var_tick_5698
                let expr_5727 := _857
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
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function cleanup_t_rational_1_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1_by_1(value)))
            }

            /// @ast-id 5897
            /// @src 12:961:1089  "function mulDivUp(uint256 x, uint256 y, uint256 d) internal pure returns (uint256) {..."
            function fun_mulDivUp_5897(var_x_5875, var_y_5877, var_d_5879) -> var__5882 {
                /// @src 12:1035:1042  "uint256"
                let zero_t_uint256_859 := zero_value_for_split_t_uint256()
                var__5882 := zero_t_uint256_859

                /// @src 12:1062:1063  "x"
                let _860 := var_x_5875
                let expr_5884 := _860
                /// @src 12:1066:1067  "y"
                let _861 := var_y_5877
                let expr_5885 := _861
                /// @src 12:1062:1067  "x * y"
                let expr_5886 := checked_mul_t_uint256(expr_5884, expr_5885)

                /// @src 12:1071:1072  "d"
                let _862 := var_d_5879
                let expr_5887 := _862
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
                let _863 := var_d_5879
                let expr_5893 := _863
                /// @src 12:1061:1082  "(x * y + (d - 1)) / d"
                let expr_5894 := checked_div_t_uint256(expr_5892, expr_5893)

                /// @src 12:1054:1082  "return (x * y + (d - 1)) / d"
                var__5882 := expr_5894
                leave

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

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

            function shift_left_dynamic(bits, value) -> newValue {
                newValue :=

                shl(bits, value)

            }

            function shift_left_t_uint256_t_uint256(value, bits) -> result {
                bits := cleanup_t_uint256(bits)
                result := cleanup_t_uint256(shift_left_dynamic(bits, cleanup_t_uint256(value)))
            }

            function negate_wrapping_t_int256(value) -> ret {
                ret := cleanup_t_int256(sub(0, value))
            }

            /// @ast-id 5696
            /// @src 11:789:1797  "function wExp(int256 x) internal pure returns (uint256) {..."
            function fun_wExp_5696(var_x_5609) -> var__5612 {
                /// @src 11:836:843  "uint256"
                let zero_t_uint256_864 := zero_value_for_split_t_uint256()
                var__5612 := zero_t_uint256_864

                /// @src 11:883:884  "x"
                let _865 := var_x_5609
                let expr_5614 := _865
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
                    let _866 := var_x_5609
                    let expr_5635 := _866
                    /// @src 11:1236:1242  "offset"
                    let _867 := var_offset_5630
                    let expr_5636 := _867
                    /// @src 11:1232:1242  "x + offset"
                    let expr_5637 := wrapping_add_t_int256(expr_5635, expr_5636)

                    /// @src 11:1231:1243  "(x + offset)"
                    let expr_5638 := expr_5637
                    /// @src 11:1246:1249  "ln2"
                    let _868 := var_ln2_5626
                    let expr_5639 := _868
                    /// @src 11:1231:1249  "(x + offset) / ln2"
                    let expr_5640 := wrapping_div_t_int256(expr_5638, expr_5639)

                    /// @src 11:1220:1249  "int256 q = (x + offset) / ln2"
                    let var_q_5634 := expr_5640
                    /// @src 11:1278:1279  "x"
                    let _869 := var_x_5609
                    let expr_5644 := _869
                    /// @src 11:1282:1283  "q"
                    let _870 := var_q_5634
                    let expr_5645 := _870
                    /// @src 11:1286:1289  "ln2"
                    let _871 := var_ln2_5626
                    let expr_5646 := _871
                    /// @src 11:1282:1289  "q * ln2"
                    let expr_5647 := wrapping_mul_t_int256(expr_5645, expr_5646)

                    /// @src 11:1278:1289  "x - q * ln2"
                    let expr_5648 := wrapping_sub_t_int256(expr_5644, expr_5647)

                    /// @src 11:1267:1289  "int256 r = x - q * ln2"
                    let var_r_5643 := expr_5648
                    /// @src 11:1327:1328  "r"
                    let _872 := var_r_5643
                    let expr_5652 := _872
                    /// @src 11:1331:1332  "r"
                    let _873 := var_r_5643
                    let expr_5653 := _873
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
                    let _874 := var_secondTerm_5651
                    let expr_5663 := _874
                    /// @src 11:1395:1396  "r"
                    let _875 := var_r_5643
                    let expr_5664 := _875
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
                    let _876 := var_r_5643
                    let expr_5675 := _876
                    /// @src 11:1441:1449  "1e18 + r"
                    let expr_5676 := wrapping_add_t_int256(convert_t_rational_1000000000000000000_by_1_to_t_int256(expr_5674), expr_5675)

                    /// @src 11:1452:1462  "secondTerm"
                    let _877 := var_secondTerm_5651
                    let expr_5677 := _877
                    /// @src 11:1441:1462  "1e18 + r + secondTerm"
                    let expr_5678 := wrapping_add_t_int256(expr_5676, expr_5677)

                    /// @src 11:1465:1474  "thirdTerm"
                    let _878 := var_thirdTerm_5662
                    let expr_5679 := _878
                    /// @src 11:1441:1474  "1e18 + r + secondTerm + thirdTerm"
                    let expr_5680 := wrapping_add_t_int256(expr_5678, expr_5679)

                    /// @src 11:1427:1474  "int256 expR = 1e18 + r + secondTerm + thirdTerm"
                    let var_expR_5673 := expr_5680
                    /// @src 11:1747:1751  "expR"
                    let _879 := var_expR_5673
                    let expr_5684 := _879
                    /// @src 11:1739:1752  "uint256(expR)"
                    let expr_5685 := convert_t_int256_to_t_uint256(expr_5684)
                    /// @src 11:1764:1765  "q"
                    let _880 := var_q_5634
                    let expr_5688 := _880
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
                    let _881 := var_x_5609
                    let expr_5619 := _881
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
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

            function wrapping_sub_t_uint256(x, y) -> diff {
                diff := cleanup_t_uint256(sub(x, y))
            }

            /// @ast-id 5607
            /// @src 11:620:783  "function divHalfDownUnchecked(uint256 x, uint256 d) internal pure returns (uint256) {..."
            function fun_divHalfDownUnchecked_5607(var_x_5586, var_d_5588) -> var__5591 {
                /// @src 11:695:702  "uint256"
                let zero_t_uint256_882 := zero_value_for_split_t_uint256()
                var__5591 := zero_t_uint256_882

                /// @src 11:746:747  "x"
                let _883 := var_x_5586
                let expr_5593 := _883
                /// @src 11:751:752  "d"
                let _884 := var_d_5588
                let expr_5594 := _884
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
                let _885 := var_d_5588
                let expr_5602 := _885
                /// @src 11:745:766  "(x + (d - 1) / 2) / d"
                let expr_5603 := wrapping_div_t_uint256(expr_5601, expr_5602)

                /// @src 11:738:766  "return (x + (d - 1) / 2) / d"
                var__5591 := expr_5603
                leave

            }
            /// @src 15:1067:19791  "contract MidnightBundles is IMidnightBundles {..."

        }

        data ".metadata" hex"a264697066735822122080ada842aceecbdd726c2f3a8f1977e5614096598a001cc79b6db5bac700646864736f6c63430008220033"
    }

}

