
/// @use-src 6:"deps/midnight/src/interfaces/IRatifier.sol", 21:"deps/midnight/src/ratifiers/EcrecoverRatifier.sol", 23:"deps/midnight/src/ratifiers/interfaces/IEcrecoverRatifier.sol"
object "EcrecoverRatifier_8677" {
    code {
        /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."
        mstore(64, memoryguard(160))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := copy_arguments_for_constructor_8480_object_EcrecoverRatifier_8677()
        constructor_EcrecoverRatifier_8677(_1)

        let _2 := allocate_unbounded()
        codecopy(_2, dataoffset("EcrecoverRatifier_8677_deployed"), datasize("EcrecoverRatifier_8677_deployed"))

        setimmutable(_2, "8464", mload(128))

        return(_2, datasize("EcrecoverRatifier_8677_deployed"))

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

        function copy_arguments_for_constructor_8480_object_EcrecoverRatifier_8677() -> ret_param_0 {

            let programSize := datasize("EcrecoverRatifier_8677")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0 := abi_decode_tuple_t_address_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }

        /// @ast-id 8480
        /// @src 21:1282:1350  "constructor(address _midnight) {..."
        function constructor_EcrecoverRatifier_8677(var__midnight_8472) {

            /// @src 21:1282:1350  "constructor(address _midnight) {..."
            constructor_IEcrecoverRatifier_8883()

            /// @src 21:1334:1343  "_midnight"
            let _3 := var__midnight_8472
            let expr_8476 := _3
            /// @src 21:1323:1343  "MIDNIGHT = _midnight"
            let _4 := expr_8476
            mstore(128, _4)
            let expr_8477 := expr_8476

        }
        /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

        /// @src 23:425:992  "interface IEcrecoverRatifier is IRatifier {..."
        function constructor_IEcrecoverRatifier_8883() {

            /// @src 23:425:992  "interface IEcrecoverRatifier is IRatifier {..."
            constructor_IRatifier_4910()

        }
        /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

        /// @src 6:152:279  "interface IRatifier {..."
        function constructor_IRatifier_4910() {

            /// @src 6:152:279  "interface IRatifier {..."

        }
        /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

    }
    /// @use-src 7:"deps/midnight/src/libraries/ConstantsLib.sol", 21:"deps/midnight/src/ratifiers/EcrecoverRatifier.sol", 23:"deps/midnight/src/ratifiers/interfaces/IEcrecoverRatifier.sol", 25:"deps/midnight/src/ratifiers/libraries/HashLib.sol"
    object "EcrecoverRatifier_8677_deployed" {
        code {
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x675ef8d3
                {
                    // isRatified(((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),bool,address,uint256,uint256,uint256,bytes32,address,bytes,address,address,bool,uint256,uint256),bytes)

                    external_fun_isRatified_8676()
                }

                case 0xbb1f12aa
                {
                    // cancelRoot(address,bytes32)

                    external_fun_cancelRoot_8521()
                }

                case 0xdc400c12
                {
                    // MIDNIGHT()

                    external_fun_MIDNIGHT_8464()
                }

                case 0xffe8c2d6
                {
                    // isRootCanceled(address,bytes32)

                    external_fun_isRootCanceled_8470()
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

            function abi_decode_tuple_t_struct$_Offer_$4210_memory_ptrt_bytes_memory_ptr(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

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

            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_isRatified_8676() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_struct$_Offer_$4210_memory_ptrt_bytes_memory_ptr(4, calldatasize())
                let ret_0 :=  fun_isRatified_8676(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos , ret_0)
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

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_cancelRoot_8521() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_bytes32(4, calldatasize())
                fun_cancelRoot_8521(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            /// @ast-id 8464
            /// @src 21:1158:1191  "address public immutable MIDNIGHT"
            function getter_fun_MIDNIGHT_8464() -> rval {

                rval := loadimmutable("8464")

            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_MIDNIGHT_8464() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_MIDNIGHT_8464()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

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

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_bool_$_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function convert_t_bytes32_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function mapping_index_access_t_mapping$_t_bytes32_$_t_bool_$_of_t_bytes32(slot , key) -> dataSlot {
                mstore(0, convert_t_bytes32_to_t_bytes32(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

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

            /// @ast-id 8470
            /// @src 21:1198:1275  "mapping(address maker => mapping(bytes32 root => bool)) public isRootCanceled"
            function getter_fun_isRootCanceled_8470(key_0, key_1) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_bool_$_$_of_t_address(slot, key_0)

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_bool_$_of_t_bytes32(slot, key_1)

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_isRootCanceled_8470() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_bytes32(4, calldatasize())
                let ret_0 :=  getter_fun_isRootCanceled_8470(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function zero_value_for_split_t_bytes32() -> ret {
                ret := 0
            }

            function require_helper_t_error_8846_NotMidnight(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x1e6a35c700000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
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

            function abi_decode_t_bytes32_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_bytes32(value)
            }

            // struct Signature
            function abi_decode_t_struct$_Signature_$8833_memory_ptr_fromMemory(headStart, end) -> value {
                if slt(sub(end, headStart), 0x60) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0x60)

                {
                    // v

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_uint8_fromMemory(add(headStart, offset), end))

                }

                {
                    // r

                    let offset := 32

                    mstore(add(value, 0x20), abi_decode_t_bytes32_fromMemory(add(headStart, offset), end))

                }

                {
                    // s

                    let offset := 64

                    mstore(add(value, 0x40), abi_decode_t_bytes32_fromMemory(add(headStart, offset), end))

                }

            }

            function abi_decode_t_uint256_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_uint256(value)
            }

            function array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            // bytes32[]
            function abi_decode_available_length_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(offset, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length))
                let dst := array

                mstore(array, length)
                dst := add(array, 0x20)

                let srcEnd := add(offset, mul(length, 0x20))
                if gt(srcEnd, end) {
                    revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef()
                }
                for { let src := offset } lt(src, srcEnd) { src := add(src, 0x20) }
                {

                    let elementPos := src

                    mstore(dst, abi_decode_t_bytes32_fromMemory(elementPos, end))
                    dst := add(dst, 0x20)
                }
            }

            // bytes32[]
            function abi_decode_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := mload(offset)
                array := abi_decode_available_length_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(add(offset, 0x20), length, end)
            }

            function abi_decode_tuple_t_struct$_Signature_$8833_memory_ptrt_bytes32t_uint256t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(headStart, dataEnd) -> value0, value1, value2, value3 {
                if slt(sub(dataEnd, headStart), 192) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_struct$_Signature_$8833_memory_ptr_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 96

                    value1 := abi_decode_t_bytes32_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 128

                    value2 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := mload(add(headStart, 160))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value3 := abi_decode_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function require_helper_t_error_8842_InvalidProof(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x09bde33900000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function read_from_memoryt_address(ptr) -> returnValue {

                let value := cleanup_t_address(mload(ptr))

                returnValue :=

                value

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function extract_from_storage_value_offset_0_t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0_t_bool(sload(slot))

            }

            function require_helper_t_error_8848_RootCanceled(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0xec7bcf5b00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function array_length_t_array$_t_bytes32_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function abi_encode_tuple_t_bytes32_t_bytes32__to_t_bytes32_t_bytes32__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value1,  add(headStart, 32))

            }

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function cleanup_t_rational_32523383700587834770323112271211932718128200013265661849047136999858837557784_by_1(value) -> cleaned {
                cleaned := value
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function convert_t_rational_32523383700587834770323112271211932718128200013265661849047136999858837557784_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_32523383700587834770323112271211932718128200013265661849047136999858837557784_by_1(value)))
            }

            /// @src 23:314:422  "bytes32 constant EIP712_DOMAIN_TYPEHASH = 0x47e79534a245952e8b16893a336b85a3d9ea9fa8c573f3d803afb92a79469218"
            function constant_EIP712_DOMAIN_TYPEHASH_8837() -> ret {
                /// @src 23:356:422  "0x47e79534a245952e8b16893a336b85a3d9ea9fa8c573f3d803afb92a79469218"
                let expr_8836 := 0x47e79534a245952e8b16893a336b85a3d9ea9fa8c573f3d803afb92a79469218
                let _21 := convert_t_rational_32523383700587834770323112271211932718128200013265661849047136999858837557784_by_1_to_t_bytes32(expr_8836)

                ret := _21
            }

            function convert_t_contract$_EcrecoverRatifier_$8677_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_bytes32_t_uint256_t_address__to_t_bytes32_t_uint256_t_address__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_address_to_t_address_fromStack(value2,  add(headStart, 64))

            }

            function abi_encode_t_stringliteral_301a50b291d33ce1e8e9064e3f6a6c51d902ec22892b50d58abf6357c6a45541_to_t_bytes2_nonPadded_inplace_fromStack(pos) {
                mstore(pos, 0x1901000000000000000000000000000000000000000000000000000000000000)
            }

            function leftAlign_t_bytes32(value) -> aligned {
                aligned := value
            }

            function abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_bytes32(cleanup_t_bytes32(value)))
            }

            function abi_encode_tuple_packed_t_stringliteral_301a50b291d33ce1e8e9064e3f6a6c51d902ec22892b50d58abf6357c6a45541_t_bytes32_t_bytes32__to_t_bytes2_t_bytes32_t_bytes32__nonPadded_inplace_fromStack(pos , value0, value1) -> end {

                abi_encode_t_stringliteral_301a50b291d33ce1e8e9064e3f6a6c51d902ec22892b50d58abf6357c6a45541_to_t_bytes2_nonPadded_inplace_fromStack( pos)
                pos := add(pos, 2)

                abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value0,  pos)
                pos := add(pos, 32)

                abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value1,  pos)
                pos := add(pos, 32)

                end := pos
            }

            function bytes_concat_t_stringliteral_301a50b291d33ce1e8e9064e3f6a6c51d902ec22892b50d58abf6357c6a45541_t_bytes32_t_bytes32(param_0, param_1) -> outPtr {
                outPtr := allocate_unbounded()
                let dataStart := add(outPtr, 0x20)
                let dataEnd := abi_encode_tuple_packed_t_stringliteral_301a50b291d33ce1e8e9064e3f6a6c51d902ec22892b50d58abf6357c6a45541_t_bytes32_t_bytes32__to_t_bytes2_t_bytes32_t_bytes32__nonPadded_inplace_fromStack(dataStart, param_0, param_1)
                mstore(outPtr, sub(dataEnd, dataStart))
                finalize_allocation(outPtr, sub(dataEnd, outPtr))
            }

            function read_from_memoryt_uint8(ptr) -> returnValue {

                let value := cleanup_t_uint8(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_bytes32(ptr) -> returnValue {

                let value := cleanup_t_bytes32(mload(ptr))

                returnValue :=

                value

            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple_t_bytes32_t_uint8_t_bytes32_t_bytes32__to_t_bytes32_t_uint8_t_bytes32_t_bytes32__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 128)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint8_to_t_uint8_fromStack(value1,  add(headStart, 32))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value2,  add(headStart, 64))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value3,  add(headStart, 96))

            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_rational_0_by_1(value)))
            }

            function convert_t_rational_0_by_1_to_t_address(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function require_helper_t_error_8844_InvalidSignature(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x8baa579f00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_uint160_to_t_contract$_IMidnight_$4887(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IMidnight_$4887(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IMidnight_$4887(value)
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

            function require_helper_t_error_8850_Unauthorized(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x82b4290000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @src 7:1109:1189  "bytes32 constant CALLBACK_SUCCESS = keccak256(\"morpho.midnight.callbackSuccess\")"
            function constant_CALLBACK_SUCCESS_4986() -> ret {
                /// @src 7:1145:1189  "keccak256(\"morpho.midnight.callbackSuccess\")"
                let expr_4985 := 0x7f87788ea698181ea4d28d1576d0ba4fc92c0dbe5bf75b43692af2ce91dbaea2
                let _53 := expr_4985

                ret := _53
            }

            /// @ast-id 8676
            /// @src 21:1630:2705  "function isRatified(Offer memory offer, bytes memory ratifierData) external view returns (bytes32) {..."
            function fun_isRatified_8676(var_offer_8524_mpos, var_ratifierData_8526_mpos) -> var__8529 {
                /// @src 21:1720:1727  "bytes32"
                let zero_t_bytes32_1 := zero_value_for_split_t_bytes32()
                var__8529 := zero_t_bytes32_1

                /// @src 21:1747:1757  "msg.sender"
                let expr_8533 := caller()
                /// @src 21:1761:1769  "MIDNIGHT"
                let _2 := loadimmutable("8464")
                let expr_8534 := _2
                /// @src 21:1747:1769  "msg.sender == MIDNIGHT"
                let expr_8535 := eq(cleanup_t_address(expr_8533), cleanup_t_address(expr_8534))
                /// @src 21:1739:1785  "require(msg.sender == MIDNIGHT, NotMidnight())"
                require_helper_t_error_8846_NotMidnight(expr_8535)
                /// @src 21:1900:1912  "ratifierData"
                let _3_mpos := var_ratifierData_8526_mpos
                let expr_8552_mpos := _3_mpos
                /// @src 21:1889:1955  "abi.decode(ratifierData, (Signature, bytes32, uint256, bytes32[]))"

                let expr_8562_component_1_mpos, expr_8562_component_2, expr_8562_component_3, expr_8562_component_4_mpos :=  abi_decode_tuple_t_struct$_Signature_$8833_memory_ptrt_bytes32t_uint256t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(add(expr_8552_mpos, 32), add(add(expr_8552_mpos, 32), array_length_t_bytes_memory_ptr(expr_8552_mpos)))
                /// @src 21:1795:1955  "(Signature memory sig, bytes32 root, uint256 leafIndex, bytes32[] memory proof) =..."
                let var_sig_8542_mpos := expr_8562_component_1_mpos
                let var_root_8544 := expr_8562_component_2
                let var_leafIndex_8546 := expr_8562_component_3
                let var_proof_8549_mpos := expr_8562_component_4_mpos
                /// @src 21:1973:1980  "HashLib"
                let expr_8565_address := linkersymbol("deps/midnight/src/ratifiers/libraries/HashLib.sol:HashLib")
                /// @src 21:1988:1992  "root"
                let _4 := var_root_8544
                let expr_8567 := _4
                /// @src 21:1994:2001  "HashLib"
                let expr_8568_address := linkersymbol("deps/midnight/src/ratifiers/libraries/HashLib.sol:HashLib")
                /// @src 21:2012:2017  "offer"
                let _5_mpos := var_offer_8524_mpos
                let expr_8570_mpos := _5_mpos
                /// @src 21:1994:2018  "HashLib.hashOffer(offer)"
                let expr_8571 := fun_hashOffer_9325(expr_8570_mpos)
                /// @src 21:2020:2029  "leafIndex"
                let _6 := var_leafIndex_8546
                let expr_8572 := _6
                /// @src 21:2031:2036  "proof"
                let _7_mpos := var_proof_8549_mpos
                let expr_8573_mpos := _7_mpos
                /// @src 21:1973:2037  "HashLib.isLeaf(root, HashLib.hashOffer(offer), leafIndex, proof)"
                let expr_8574 := fun_isLeaf_9169(expr_8567, expr_8571, expr_8572, expr_8573_mpos)
                /// @src 21:1965:2054  "require(HashLib.isLeaf(root, HashLib.hashOffer(offer), leafIndex, proof), InvalidProof())"
                require_helper_t_error_8842_InvalidProof(expr_8574)
                /// @src 21:2073:2087  "isRootCanceled"
                let _8_slot := 0x00
                let expr_8580_slot := _8_slot
                /// @src 21:2088:2093  "offer"
                let _9_mpos := var_offer_8524_mpos
                let expr_8581_mpos := _9_mpos
                /// @src 21:2088:2099  "offer.maker"
                let _10 := add(expr_8581_mpos, 64)
                let _11 := read_from_memoryt_address(_10)
                let expr_8582 := _11
                /// @src 21:2073:2100  "isRootCanceled[offer.maker]"
                let _12 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_bool_$_$_of_t_address(expr_8580_slot,expr_8582)
                let _13_slot := _12
                let expr_8583_slot := _13_slot
                /// @src 21:2101:2105  "root"
                let _14 := var_root_8544
                let expr_8584 := _14
                /// @src 21:2073:2106  "isRootCanceled[offer.maker][root]"
                let _15 := mapping_index_access_t_mapping$_t_bytes32_$_t_bool_$_of_t_bytes32(expr_8583_slot,expr_8584)
                let _16 := read_from_storage_split_offset_0_t_bool(_15)
                let expr_8585 := _16
                /// @src 21:2072:2106  "!isRootCanceled[offer.maker][root]"
                let expr_8586 := cleanup_t_bool(iszero(expr_8585))
                /// @src 21:2064:2123  "require(!isRootCanceled[offer.maker][root], RootCanceled())"
                require_helper_t_error_8848_RootCanceled(expr_8586)
                /// @src 21:2175:2182  "HashLib"
                let expr_8596_address := linkersymbol("deps/midnight/src/ratifiers/libraries/HashLib.sol:HashLib")
                /// @src 21:2201:2206  "proof"
                let _17_mpos := var_proof_8549_mpos
                let expr_8598_mpos := _17_mpos
                /// @src 21:2201:2213  "proof.length"
                let expr_8599 := array_length_t_array$_t_bytes32_$dyn_memory_ptr(expr_8598_mpos)
                /// @src 21:2175:2214  "HashLib.offerTreeTypeHash(proof.length)"
                let expr_8600 := fun_offerTreeTypeHash_9097(expr_8599)
                /// @src 21:2216:2220  "root"
                let _18 := var_root_8544
                let expr_8601 := _18
                /// @src 21:2164:2221  "abi.encode(HashLib.offerTreeTypeHash(proof.length), root)"

                let expr_8602_mpos := allocate_unbounded()
                let _19 := add(expr_8602_mpos, 0x20)

                let _20 := abi_encode_tuple_t_bytes32_t_bytes32__to_t_bytes32_t_bytes32__fromStack(_19, expr_8600, expr_8601)
                mstore(expr_8602_mpos, sub(_20, add(expr_8602_mpos, 0x20)))
                finalize_allocation(expr_8602_mpos, sub(_20, expr_8602_mpos))
                /// @src 21:2154:2222  "keccak256(abi.encode(HashLib.offerTreeTypeHash(proof.length), root))"
                let expr_8603 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_8602_mpos), array_length_t_bytes_memory_ptr(expr_8602_mpos))
                /// @src 21:2133:2222  "bytes32 structHash = keccak256(abi.encode(HashLib.offerTreeTypeHash(proof.length), root))"
                let var_structHash_8592 := expr_8603
                /// @src 21:2279:2301  "EIP712_DOMAIN_TYPEHASH"
                let expr_8610 := constant_EIP712_DOMAIN_TYPEHASH_8837()
                /// @src 21:2303:2316  "block.chainid"
                let expr_8612 := chainid()
                /// @src 21:2326:2330  "this"
                let expr_8615_address := address()
                /// @src 21:2318:2331  "address(this)"
                let expr_8616 := convert_t_contract$_EcrecoverRatifier_$8677_to_t_address(expr_8615_address)
                /// @src 21:2268:2332  "abi.encode(EIP712_DOMAIN_TYPEHASH, block.chainid, address(this))"

                let expr_8617_mpos := allocate_unbounded()
                let _22 := add(expr_8617_mpos, 0x20)

                let _23 := abi_encode_tuple_t_bytes32_t_uint256_t_address__to_t_bytes32_t_uint256_t_address__fromStack(_22, expr_8610, expr_8612, expr_8616)
                mstore(expr_8617_mpos, sub(_23, add(expr_8617_mpos, 0x20)))
                finalize_allocation(expr_8617_mpos, sub(_23, expr_8617_mpos))
                /// @src 21:2258:2333  "keccak256(abi.encode(EIP712_DOMAIN_TYPEHASH, block.chainid, address(this)))"
                let expr_8618 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_8617_mpos), array_length_t_bytes_memory_ptr(expr_8617_mpos))
                /// @src 21:2232:2333  "bytes32 domainSeparator = keccak256(abi.encode(EIP712_DOMAIN_TYPEHASH, block.chainid, address(this)))"
                let var_domainSeparator_8606 := expr_8618
                /// @src 21:2395:2410  "domainSeparator"
                let _24 := var_domainSeparator_8606
                let expr_8627 := _24
                /// @src 21:2412:2422  "structHash"
                let _25 := var_structHash_8592
                let expr_8628 := _25
                /// @src 21:2370:2423  "bytes.concat(\"\\x19\\x01\", domainSeparator, structHash)"
                let expr_8629_mpos := bytes_concat_t_stringliteral_301a50b291d33ce1e8e9064e3f6a6c51d902ec22892b50d58abf6357c6a45541_t_bytes32_t_bytes32(expr_8627, expr_8628)
                /// @src 21:2360:2424  "keccak256(bytes.concat(\"\\x19\\x01\", domainSeparator, structHash))"
                let expr_8630 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_8629_mpos), array_length_t_bytes_memory_ptr(expr_8629_mpos))
                /// @src 21:2343:2424  "bytes32 digest = keccak256(bytes.concat(\"\\x19\\x01\", domainSeparator, structHash))"
                let var_digest_8621 := expr_8630
                /// @src 21:2462:2468  "digest"
                let _26 := var_digest_8621
                let expr_8635 := _26
                /// @src 21:2470:2473  "sig"
                let _27_mpos := var_sig_8542_mpos
                let expr_8636_mpos := _27_mpos
                /// @src 21:2470:2475  "sig.v"
                let _28 := add(expr_8636_mpos, 0)
                let _29 := read_from_memoryt_uint8(_28)
                let expr_8637 := _29
                /// @src 21:2477:2480  "sig"
                let _30_mpos := var_sig_8542_mpos
                let expr_8638_mpos := _30_mpos
                /// @src 21:2477:2482  "sig.r"
                let _31 := add(expr_8638_mpos, 32)
                let _32 := read_from_memoryt_bytes32(_31)
                let expr_8639 := _32
                /// @src 21:2484:2487  "sig"
                let _33_mpos := var_sig_8542_mpos
                let expr_8640_mpos := _33_mpos
                /// @src 21:2484:2489  "sig.s"
                let _34 := add(expr_8640_mpos, 64)
                let _35 := read_from_memoryt_bytes32(_34)
                let expr_8641 := _35
                /// @src 21:2452:2490  "ecrecover(digest, sig.v, sig.r, sig.s)"

                let _36 := allocate_unbounded()
                let _37 := abi_encode_tuple_t_bytes32_t_uint8_t_bytes32_t_bytes32__to_t_bytes32_t_uint8_t_bytes32_t_bytes32__fromStack(_36 , expr_8635, expr_8637, expr_8639, expr_8641)

                mstore(0, 0)

                let _38 := staticcall(gas(), 1 , _36, sub(_37, _36), 0, 32)

                if iszero(_38) { revert_forward_1() }

                let expr_8642 := shift_left_0(mload(0))
                /// @src 21:2434:2490  "address _signer = ecrecover(digest, sig.v, sig.r, sig.s)"
                let var__signer_8633 := expr_8642
                /// @src 21:2508:2515  "_signer"
                let _39 := var__signer_8633
                let expr_8645 := _39
                /// @src 21:2527:2528  "0"
                let expr_8648 := 0x00
                /// @src 21:2519:2529  "address(0)"
                let expr_8649 := convert_t_rational_0_by_1_to_t_address(expr_8648)
                /// @src 21:2508:2529  "_signer != address(0)"
                let expr_8650 := iszero(eq(cleanup_t_address(expr_8645), cleanup_t_address(expr_8649)))
                /// @src 21:2500:2550  "require(_signer != address(0), InvalidSignature())"
                require_helper_t_error_8844_InvalidSignature(expr_8650)
                /// @src 21:2568:2575  "_signer"
                let _40 := var__signer_8633
                let expr_8656 := _40
                /// @src 21:2579:2584  "offer"
                let _41_mpos := var_offer_8524_mpos
                let expr_8657_mpos := _41_mpos
                /// @src 21:2579:2590  "offer.maker"
                let _42 := add(expr_8657_mpos, 64)
                let _43 := read_from_memoryt_address(_42)
                let expr_8658 := _43
                /// @src 21:2568:2590  "_signer == offer.maker"
                let expr_8659 := eq(cleanup_t_address(expr_8656), cleanup_t_address(expr_8658))
                /// @src 21:2568:2648  "_signer == offer.maker || IMidnight(MIDNIGHT).isAuthorized(offer.maker, _signer)"
                let expr_8668 := expr_8659
                if iszero(expr_8668) {
                    /// @src 21:2604:2612  "MIDNIGHT"
                    let _44 := loadimmutable("8464")
                    let expr_8661 := _44
                    /// @src 21:2594:2613  "IMidnight(MIDNIGHT)"
                    let expr_8662_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_8661)
                    /// @src 21:2594:2626  "IMidnight(MIDNIGHT).isAuthorized"
                    let expr_8663_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_8662_address)
                    let expr_8663_functionSelector := 0x65e4ad9e
                    /// @src 21:2627:2632  "offer"
                    let _45_mpos := var_offer_8524_mpos
                    let expr_8664_mpos := _45_mpos
                    /// @src 21:2627:2638  "offer.maker"
                    let _46 := add(expr_8664_mpos, 64)
                    let _47 := read_from_memoryt_address(_46)
                    let expr_8665 := _47
                    /// @src 21:2640:2647  "_signer"
                    let _48 := var__signer_8633
                    let expr_8666 := _48
                    /// @src 21:2594:2648  "IMidnight(MIDNIGHT).isAuthorized(offer.maker, _signer)"

                    // storage for arguments and returned data
                    let _49 := allocate_unbounded()
                    mstore(_49, shift_left_224(expr_8663_functionSelector))
                    let _50 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_49, 4) , expr_8665, expr_8666)

                    let _51 := staticcall(gas(), expr_8663_address,  _49, sub(_50, _49), _49, 32)

                    if iszero(_51) { revert_forward_1() }

                    let expr_8667
                    if _51 {

                        let _52 := 32

                        if gt(_52, returndatasize()) {
                            _52 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_49, _52)

                        // decode return parameters from external try-call into retVars
                        expr_8667 :=  abi_decode_tuple_t_bool_fromMemory(_49, add(_49, _52))
                    }
                    /// @src 21:2568:2648  "_signer == offer.maker || IMidnight(MIDNIGHT).isAuthorized(offer.maker, _signer)"
                    expr_8668 := expr_8667
                }
                /// @src 21:2560:2665  "require(_signer == offer.maker || IMidnight(MIDNIGHT).isAuthorized(offer.maker, _signer), Unauthorized())"
                require_helper_t_error_8850_Unauthorized(expr_8668)
                /// @src 21:2682:2698  "CALLBACK_SUCCESS"
                let expr_8673 := constant_CALLBACK_SUCCESS_4986()
                /// @src 21:2675:2698  "return CALLBACK_SUCCESS"
                var__8529 := expr_8673
                leave

            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

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

            /// @ast-id 8521
            /// @src 21:1356:1624  "function cancelRoot(address maker, bytes32 root) external {..."
            function fun_cancelRoot_8521(var_maker_8482, var_root_8484) {

                /// @src 21:1432:1437  "maker"
                let _54 := var_maker_8482
                let expr_8488 := _54
                /// @src 21:1441:1451  "msg.sender"
                let expr_8490 := caller()
                /// @src 21:1432:1451  "maker == msg.sender"
                let expr_8491 := eq(cleanup_t_address(expr_8488), cleanup_t_address(expr_8490))
                /// @src 21:1432:1506  "maker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(maker, msg.sender)"
                let expr_8500 := expr_8491
                if iszero(expr_8500) {
                    /// @src 21:1465:1473  "MIDNIGHT"
                    let _55 := loadimmutable("8464")
                    let expr_8493 := _55
                    /// @src 21:1455:1474  "IMidnight(MIDNIGHT)"
                    let expr_8494_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_8493)
                    /// @src 21:1455:1487  "IMidnight(MIDNIGHT).isAuthorized"
                    let expr_8495_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_8494_address)
                    let expr_8495_functionSelector := 0x65e4ad9e
                    /// @src 21:1488:1493  "maker"
                    let _56 := var_maker_8482
                    let expr_8496 := _56
                    /// @src 21:1495:1505  "msg.sender"
                    let expr_8498 := caller()
                    /// @src 21:1455:1506  "IMidnight(MIDNIGHT).isAuthorized(maker, msg.sender)"

                    // storage for arguments and returned data
                    let _57 := allocate_unbounded()
                    mstore(_57, shift_left_224(expr_8495_functionSelector))
                    let _58 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_57, 4) , expr_8496, expr_8498)

                    let _59 := staticcall(gas(), expr_8495_address,  _57, sub(_58, _57), _57, 32)

                    if iszero(_59) { revert_forward_1() }

                    let expr_8499
                    if _59 {

                        let _60 := 32

                        if gt(_60, returndatasize()) {
                            _60 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_57, _60)

                        // decode return parameters from external try-call into retVars
                        expr_8499 :=  abi_decode_tuple_t_bool_fromMemory(_57, add(_57, _60))
                    }
                    /// @src 21:1432:1506  "maker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(maker, msg.sender)"
                    expr_8500 := expr_8499
                }
                /// @src 21:1424:1523  "require(maker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(maker, msg.sender), Unauthorized())"
                require_helper_t_error_8850_Unauthorized(expr_8500)
                /// @src 21:1563:1567  "true"
                let expr_8510 := 0x01
                /// @src 21:1533:1547  "isRootCanceled"
                let _61_slot := 0x00
                let expr_8505_slot := _61_slot
                /// @src 21:1548:1553  "maker"
                let _62 := var_maker_8482
                let expr_8506 := _62
                /// @src 21:1533:1554  "isRootCanceled[maker]"
                let _63 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_bool_$_$_of_t_address(expr_8505_slot,expr_8506)
                let _64_slot := _63
                let expr_8508_slot := _64_slot
                /// @src 21:1555:1559  "root"
                let _65 := var_root_8484
                let expr_8507 := _65
                /// @src 21:1533:1560  "isRootCanceled[maker][root]"
                let _66 := mapping_index_access_t_mapping$_t_bytes32_$_t_bool_$_of_t_bytes32(expr_8508_slot,expr_8507)
                /// @src 21:1533:1567  "isRootCanceled[maker][root] = true"
                update_storage_value_offset_0_t_bool_to_t_bool(_66, expr_8510)
                let expr_8511 := expr_8510
                /// @src 21:1593:1603  "msg.sender"
                let expr_8515 := caller()
                /// @src 21:1605:1610  "maker"
                let _67 := var_maker_8482
                let expr_8516 := _67
                /// @src 21:1612:1616  "root"
                let _68 := var_root_8484
                let expr_8517 := _68
                /// @src 21:1582:1617  "CancelRoot(msg.sender, maker, root)"
                let _69 := 0x89c061a730f0adcf72de39ebd2a6b128c09e2d856105ef252fffed026c27c5e3
                let _70 := convert_t_address_to_t_address(expr_8515)
                let _71 := convert_t_address_to_t_address(expr_8516)
                let _72 := convert_t_bytes32_to_t_bytes32(expr_8517)
                {
                    let _73 := allocate_unbounded()
                    let _74 := abi_encode_tuple__to__fromStack(_73 )
                    log4(_73, sub(_74, _73) , _69, _70, _71, _72)
                }
            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

            function cleanup_t_rational_68769752797877666667288518791890740497316252341308469040564434923308253667740_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_68769752797877666667288518791890740497316252341308469040564434923308253667740_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_68769752797877666667288518791890740497316252341308469040564434923308253667740_by_1(value)))
            }

            /// @src 25:661:761  "bytes32 constant OFFER_TYPEHASH = 0x980a4cfc9766df84667f316d76e10cefc8caf04fb4cd4a9fca00a8e7b34f619c"
            function constant_OFFER_TYPEHASH_8953() -> ret {
                /// @src 25:695:761  "0x980a4cfc9766df84667f316d76e10cefc8caf04fb4cd4a9fca00a8e7b34f619c"
                let expr_8952 := 0x980a4cfc9766df84667f316d76e10cefc8caf04fb4cd4a9fca00a8e7b34f619c
                let _76 := convert_t_rational_68769752797877666667288518791890740497316252341308469040564434923308253667740_by_1_to_t_bytes32(expr_8952)

                ret := _76
            }

            function read_from_memoryt_bool(ptr) -> returnValue {

                let value := cleanup_t_bool(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            function abi_encode_tuple_t_bytes32_t_bytes32_t_bool_t_address_t_uint256_t_uint256_t_uint256_t_bytes32_t_address_t_bytes32_t_address_t_address_t_bool_t_uint256_t_uint256__to_t_bytes32_t_bytes32_t_bool_t_address_t_uint256_t_uint256_t_uint256_t_bytes32_t_address_t_bytes32_t_address_t_address_t_bool_t_uint256_t_uint256__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12, value13, value14) -> tail {
                tail := add(headStart, 480)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value1,  add(headStart, 32))

                abi_encode_t_bool_to_t_bool_fromStack(value2,  add(headStart, 64))

                abi_encode_t_address_to_t_address_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint256_to_t_uint256_fromStack(value4,  add(headStart, 128))

                abi_encode_t_uint256_to_t_uint256_fromStack(value5,  add(headStart, 160))

                abi_encode_t_uint256_to_t_uint256_fromStack(value6,  add(headStart, 192))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value7,  add(headStart, 224))

                abi_encode_t_address_to_t_address_fromStack(value8,  add(headStart, 256))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value9,  add(headStart, 288))

                abi_encode_t_address_to_t_address_fromStack(value10,  add(headStart, 320))

                abi_encode_t_address_to_t_address_fromStack(value11,  add(headStart, 352))

                abi_encode_t_bool_to_t_bool_fromStack(value12,  add(headStart, 384))

                abi_encode_t_uint256_to_t_uint256_fromStack(value13,  add(headStart, 416))

                abi_encode_t_uint256_to_t_uint256_fromStack(value14,  add(headStart, 448))

            }

            /// @ast-id 9325
            /// @src 25:6163:6818  "function hashOffer(Offer memory offer) internal pure returns (bytes32) {..."
            function fun_hashOffer_9325(var_offer_9280_mpos) -> var__9283 {
                /// @src 25:6225:6232  "bytes32"
                let zero_t_bytes32_75 := zero_value_for_split_t_bytes32()
                var__9283 := zero_t_bytes32_75

                /// @src 25:6302:6316  "OFFER_TYPEHASH"
                let expr_9288 := constant_OFFER_TYPEHASH_8953()
                /// @src 25:6345:6350  "offer"
                let _77_mpos := var_offer_9280_mpos
                let expr_9290_mpos := _77_mpos
                /// @src 25:6345:6357  "offer.market"
                let _78 := add(expr_9290_mpos, 0)
                let _79_mpos := mload(_78)
                let expr_9291_mpos := _79_mpos
                /// @src 25:6334:6358  "hashMarket(offer.market)"
                let expr_9292 := fun_hashMarket_9276(expr_9291_mpos)
                /// @src 25:6376:6381  "offer"
                let _80_mpos := var_offer_9280_mpos
                let expr_9293_mpos := _80_mpos
                /// @src 25:6376:6385  "offer.buy"
                let _81 := add(expr_9293_mpos, 32)
                let _82 := read_from_memoryt_bool(_81)
                let expr_9294 := _82
                /// @src 25:6403:6408  "offer"
                let _83_mpos := var_offer_9280_mpos
                let expr_9295_mpos := _83_mpos
                /// @src 25:6403:6414  "offer.maker"
                let _84 := add(expr_9295_mpos, 64)
                let _85 := read_from_memoryt_address(_84)
                let expr_9296 := _85
                /// @src 25:6432:6437  "offer"
                let _86_mpos := var_offer_9280_mpos
                let expr_9297_mpos := _86_mpos
                /// @src 25:6432:6443  "offer.start"
                let _87 := add(expr_9297_mpos, 96)
                let _88 := read_from_memoryt_uint256(_87)
                let expr_9298 := _88
                /// @src 25:6461:6466  "offer"
                let _89_mpos := var_offer_9280_mpos
                let expr_9299_mpos := _89_mpos
                /// @src 25:6461:6473  "offer.expiry"
                let _90 := add(expr_9299_mpos, 128)
                let _91 := read_from_memoryt_uint256(_90)
                let expr_9300 := _91
                /// @src 25:6491:6496  "offer"
                let _92_mpos := var_offer_9280_mpos
                let expr_9301_mpos := _92_mpos
                /// @src 25:6491:6501  "offer.tick"
                let _93 := add(expr_9301_mpos, 160)
                let _94 := read_from_memoryt_uint256(_93)
                let expr_9302 := _94
                /// @src 25:6519:6524  "offer"
                let _95_mpos := var_offer_9280_mpos
                let expr_9303_mpos := _95_mpos
                /// @src 25:6519:6530  "offer.group"
                let _96 := add(expr_9303_mpos, 192)
                let _97 := read_from_memoryt_bytes32(_96)
                let expr_9304 := _97
                /// @src 25:6548:6553  "offer"
                let _98_mpos := var_offer_9280_mpos
                let expr_9305_mpos := _98_mpos
                /// @src 25:6548:6562  "offer.callback"
                let _99 := add(expr_9305_mpos, 224)
                let _100 := read_from_memoryt_address(_99)
                let expr_9306 := _100
                /// @src 25:6590:6595  "offer"
                let _101_mpos := var_offer_9280_mpos
                let expr_9308_mpos := _101_mpos
                /// @src 25:6590:6608  "offer.callbackData"
                let _102 := add(expr_9308_mpos, 256)
                let _103_mpos := mload(_102)
                let expr_9309_mpos := _103_mpos
                /// @src 25:6580:6609  "keccak256(offer.callbackData)"
                let expr_9310 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_9309_mpos), array_length_t_bytes_memory_ptr(expr_9309_mpos))
                /// @src 25:6627:6632  "offer"
                let _104_mpos := var_offer_9280_mpos
                let expr_9311_mpos := _104_mpos
                /// @src 25:6627:6656  "offer.receiverIfMakerIsSeller"
                let _105 := add(expr_9311_mpos, 288)
                let _106 := read_from_memoryt_address(_105)
                let expr_9312 := _106
                /// @src 25:6674:6679  "offer"
                let _107_mpos := var_offer_9280_mpos
                let expr_9313_mpos := _107_mpos
                /// @src 25:6674:6688  "offer.ratifier"
                let _108 := add(expr_9313_mpos, 320)
                let _109 := read_from_memoryt_address(_108)
                let expr_9314 := _109
                /// @src 25:6706:6711  "offer"
                let _110_mpos := var_offer_9280_mpos
                let expr_9315_mpos := _110_mpos
                /// @src 25:6706:6722  "offer.reduceOnly"
                let _111 := add(expr_9315_mpos, 352)
                let _112 := read_from_memoryt_bool(_111)
                let expr_9316 := _112
                /// @src 25:6740:6745  "offer"
                let _113_mpos := var_offer_9280_mpos
                let expr_9317_mpos := _113_mpos
                /// @src 25:6740:6754  "offer.maxUnits"
                let _114 := add(expr_9317_mpos, 384)
                let _115 := read_from_memoryt_uint256(_114)
                let expr_9318 := _115
                /// @src 25:6772:6777  "offer"
                let _116_mpos := var_offer_9280_mpos
                let expr_9319_mpos := _116_mpos
                /// @src 25:6772:6787  "offer.maxAssets"
                let _117 := add(expr_9319_mpos, 416)
                let _118 := read_from_memoryt_uint256(_117)
                let expr_9320 := _118
                /// @src 25:6274:6801  "abi.encode(..."

                let expr_9321_mpos := allocate_unbounded()
                let _119 := add(expr_9321_mpos, 0x20)

                let _120 := abi_encode_tuple_t_bytes32_t_bytes32_t_bool_t_address_t_uint256_t_uint256_t_uint256_t_bytes32_t_address_t_bytes32_t_address_t_address_t_bool_t_uint256_t_uint256__to_t_bytes32_t_bytes32_t_bool_t_address_t_uint256_t_uint256_t_uint256_t_bytes32_t_address_t_bytes32_t_address_t_address_t_bool_t_uint256_t_uint256__fromStack(_119, expr_9288, expr_9292, expr_9294, expr_9296, expr_9298, expr_9300, expr_9302, expr_9304, expr_9306, expr_9310, expr_9312, expr_9314, expr_9316, expr_9318, expr_9320)
                mstore(expr_9321_mpos, sub(_120, add(expr_9321_mpos, 0x20)))
                finalize_allocation(expr_9321_mpos, sub(_120, expr_9321_mpos))
                /// @src 25:6251:6811  "keccak256(..."
                let expr_9322 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_9321_mpos), array_length_t_bytes_memory_ptr(expr_9321_mpos))
                /// @src 25:6244:6811  "return keccak256(..."
                var__9283 := expr_9322
                leave

            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function shift_right_t_uint256_t_uint256(value, bits) -> result {
                bits := cleanup_t_uint256(bits)
                result := cleanup_t_uint256(shift_right_unsigned_dynamic(bits, cleanup_t_uint256(value)))
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function require_helper_t_error_8955_LeafIndexOutOfRange(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x118f621800000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function increment_wrapping_t_uint256(value) -> ret {
                ret := cleanup_t_uint256(add(value, 1))
            }

            function cleanup_t_rational_1_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1_by_1(value)))
            }

            function panic_error_0x32() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x32)
                revert(0, 0x24)
            }

            function memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_bytes32_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            /// @ast-id 9169
            /// @src 25:3755:4242  "function isLeaf(bytes32 root, bytes32 leafHash, uint256 leafIndex, bytes32[] memory proof)..."
            function fun_isLeaf_9169(var_root_9100, var_leafHash_9102, var_leafIndex_9104, var_proof_9107_mpos) -> var__9110 {
                /// @src 25:3893:3897  "bool"
                let zero_t_bool_121 := zero_value_for_split_t_bool()
                var__9110 := zero_t_bool_121

                /// @src 25:3921:3930  "leafIndex"
                let _122 := var_leafIndex_9104
                let expr_9113 := _122
                /// @src 25:3934:3939  "proof"
                let _123_mpos := var_proof_9107_mpos
                let expr_9114_mpos := _123_mpos
                /// @src 25:3934:3946  "proof.length"
                let expr_9115 := array_length_t_array$_t_bytes32_$dyn_memory_ptr(expr_9114_mpos)
                /// @src 25:3921:3946  "leafIndex >> proof.length"
                let expr_9116 :=
                shift_right_t_uint256_t_uint256(expr_9113, expr_9115)

                /// @src 25:3950:3951  "0"
                let expr_9117 := 0x00
                /// @src 25:3921:3951  "leafIndex >> proof.length == 0"
                let expr_9118 := eq(cleanup_t_uint256(expr_9116), convert_t_rational_0_by_1_to_t_uint256(expr_9117))
                /// @src 25:3913:3975  "require(leafIndex >> proof.length == 0, LeafIndexOutOfRange())"
                require_helper_t_error_8955_LeafIndexOutOfRange(expr_9118)
                /// @src 25:4007:4015  "leafHash"
                let _124 := var_leafHash_9102
                let expr_9125 := _124
                /// @src 25:3985:4015  "bytes32 currentHash = leafHash"
                let var_currentHash_9124 := expr_9125
                /// @src 25:4025:4200  "for (uint256 i = 0; i < proof.length; i++) {..."
                for {
                    /// @src 25:4042:4043  "0"
                    let expr_9129 := 0x00
                    /// @src 25:4030:4043  "uint256 i = 0"
                    let var_i_9128 := convert_t_rational_0_by_1_to_t_uint256(expr_9129)
                    } 1 {
                    /// @src 25:4063:4066  "i++"
                    let _126 := var_i_9128
                    let _125 := increment_wrapping_t_uint256(_126)
                    var_i_9128 := _125
                    let expr_9136 := _126
                }
                {
                    /// @src 25:4045:4046  "i"
                    let _127 := var_i_9128
                    let expr_9131 := _127
                    /// @src 25:4049:4054  "proof"
                    let _128_mpos := var_proof_9107_mpos
                    let expr_9132_mpos := _128_mpos
                    /// @src 25:4049:4061  "proof.length"
                    let expr_9133 := array_length_t_array$_t_bytes32_$dyn_memory_ptr(expr_9132_mpos)
                    /// @src 25:4045:4061  "i < proof.length"
                    let expr_9134 := lt(cleanup_t_uint256(expr_9131), cleanup_t_uint256(expr_9133))
                    if iszero(expr_9134) { break }
                    /// @src 25:4097:4106  "leafIndex"
                    let _129 := var_leafIndex_9104
                    let expr_9139 := _129
                    /// @src 25:4110:4111  "i"
                    let _130 := var_i_9128
                    let expr_9140 := _130
                    /// @src 25:4097:4111  "leafIndex >> i"
                    let expr_9141 :=
                    shift_right_t_uint256_t_uint256(expr_9139, expr_9140)

                    /// @src 25:4096:4112  "(leafIndex >> i)"
                    let expr_9142 := expr_9141
                    /// @src 25:4115:4116  "1"
                    let expr_9143 := 0x01
                    /// @src 25:4096:4116  "(leafIndex >> i) & 1"
                    let expr_9144 := and(expr_9142, convert_t_rational_1_by_1_to_t_uint256(expr_9143))

                    /// @src 25:4120:4121  "0"
                    let expr_9145 := 0x00
                    /// @src 25:4096:4121  "(leafIndex >> i) & 1 == 0"
                    let expr_9146 := eq(cleanup_t_uint256(expr_9144), convert_t_rational_0_by_1_to_t_uint256(expr_9145))
                    /// @src 25:4096:4189  "(leafIndex >> i) & 1 == 0 ? hashNode(currentHash, proof[i]) : hashNode(proof[i], currentHash)"
                    let expr_9159
                    switch expr_9146
                    case 0 {
                        /// @src 25:4167:4172  "proof"
                        let _131_mpos := var_proof_9107_mpos
                        let expr_9154_mpos := _131_mpos
                        /// @src 25:4173:4174  "i"
                        let _132 := var_i_9128
                        let expr_9155 := _132
                        /// @src 25:4167:4175  "proof[i]"
                        let _133 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_9154_mpos, expr_9155))
                        let expr_9156 := _133
                        /// @src 25:4177:4188  "currentHash"
                        let _134 := var_currentHash_9124
                        let expr_9157 := _134
                        /// @src 25:4158:4189  "hashNode(proof[i], currentHash)"
                        let expr_9158 := fun_hashNode_9181(expr_9156, expr_9157)
                        /// @src 25:4096:4189  "(leafIndex >> i) & 1 == 0 ? hashNode(currentHash, proof[i]) : hashNode(proof[i], currentHash)"
                        expr_9159 := expr_9158
                    }
                    default {
                        /// @src 25:4133:4144  "currentHash"
                        let _135 := var_currentHash_9124
                        let expr_9148 := _135
                        /// @src 25:4146:4151  "proof"
                        let _136_mpos := var_proof_9107_mpos
                        let expr_9149_mpos := _136_mpos
                        /// @src 25:4152:4153  "i"
                        let _137 := var_i_9128
                        let expr_9150 := _137
                        /// @src 25:4146:4154  "proof[i]"
                        let _138 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_9149_mpos, expr_9150))
                        let expr_9151 := _138
                        /// @src 25:4124:4155  "hashNode(currentHash, proof[i])"
                        let expr_9152 := fun_hashNode_9181(expr_9148, expr_9151)
                        /// @src 25:4096:4189  "(leafIndex >> i) & 1 == 0 ? hashNode(currentHash, proof[i]) : hashNode(proof[i], currentHash)"
                        expr_9159 := expr_9152
                    }
                    /// @src 25:4082:4189  "currentHash = (leafIndex >> i) & 1 == 0 ? hashNode(currentHash, proof[i]) : hashNode(proof[i], currentHash)"
                    var_currentHash_9124 := expr_9159
                    let expr_9160 := expr_9159
                }
                /// @src 25:4216:4227  "currentHash"
                let _139 := var_currentHash_9124
                let expr_9164 := _139
                /// @src 25:4231:4235  "root"
                let _140 := var_root_9100
                let expr_9165 := _140
                /// @src 25:4216:4235  "currentHash == root"
                let expr_9166 := eq(cleanup_t_bytes32(expr_9164), cleanup_t_bytes32(expr_9165))
                /// @src 25:4209:4235  "return currentHash == root"
                var__9110 := expr_9166
                leave

            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

            function cleanup_t_rational_10_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_10_by_1(value)))
            }

            function cleanup_t_rational_11_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_11_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_11_by_1(value)))
            }

            function cleanup_t_rational_19385939722180480631016574566536956964141099845311062633052049178854901346712_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_19385939722180480631016574566536956964141099845311062633052049178854901346712_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_19385939722180480631016574566536956964141099845311062633052049178854901346712_by_1(value)))
            }

            function cleanup_t_rational_12_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_12_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_12_by_1(value)))
            }

            function cleanup_t_rational_111050520342807531272321064730389622480626415079694339853011182259576047967661_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_111050520342807531272321064730389622480626415079694339853011182259576047967661_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_111050520342807531272321064730389622480626415079694339853011182259576047967661_by_1(value)))
            }

            function cleanup_t_rational_13_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_13_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_13_by_1(value)))
            }

            function cleanup_t_rational_27813653568644887391158527524812759038441503570356155716992752100467743467181_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_27813653568644887391158527524812759038441503570356155716992752100467743467181_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_27813653568644887391158527524812759038441503570356155716992752100467743467181_by_1(value)))
            }

            function cleanup_t_rational_14_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_14_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_14_by_1(value)))
            }

            function cleanup_t_rational_51863266986363216769525430483347102030021794256182406384325625843678156469064_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_51863266986363216769525430483347102030021794256182406384325625843678156469064_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_51863266986363216769525430483347102030021794256182406384325625843678156469064_by_1(value)))
            }

            function cleanup_t_rational_15_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_15_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_15_by_1(value)))
            }

            function cleanup_t_rational_53451602843806363024807924119125186715749651868811601750645792452090047294660_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_53451602843806363024807924119125186715749651868811601750645792452090047294660_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_53451602843806363024807924119125186715749651868811601750645792452090047294660_by_1(value)))
            }

            function cleanup_t_rational_16_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_16_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_16_by_1(value)))
            }

            function cleanup_t_rational_64620899473789195076879667188681717574629087988767412195633794856466725683846_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_64620899473789195076879667188681717574629087988767412195633794856466725683846_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_64620899473789195076879667188681717574629087988767412195633794856466725683846_by_1(value)))
            }

            function cleanup_t_rational_17_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_17_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_17_by_1(value)))
            }

            function cleanup_t_rational_30013603214667522679385533521797892680999548198339296774819560713373554940277_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_30013603214667522679385533521797892680999548198339296774819560713373554940277_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_30013603214667522679385533521797892680999548198339296774819560713373554940277_by_1(value)))
            }

            function cleanup_t_rational_18_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_18_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_18_by_1(value)))
            }

            function cleanup_t_rational_57213326931251887887258928227715281144007479063643867391973587677122335246060_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_57213326931251887887258928227715281144007479063643867391973587677122335246060_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_57213326931251887887258928227715281144007479063643867391973587677122335246060_by_1(value)))
            }

            function cleanup_t_rational_19_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_19_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_19_by_1(value)))
            }

            function cleanup_t_rational_63871221641216991517566302322836194584019013490178190417230330645720564625593_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_63871221641216991517566302322836194584019013490178190417230330645720564625593_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_63871221641216991517566302322836194584019013490178190417230330645720564625593_by_1(value)))
            }

            function cleanup_t_rational_20_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_20_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_20_by_1(value)))
            }

            function cleanup_t_rational_58938873443561246664471576790694807267544811985195959332237922573169753975887_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_58938873443561246664471576790694807267544811985195959332237922573169753975887_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_58938873443561246664471576790694807267544811985195959332237922573169753975887_by_1(value)))
            }

            function cleanup_t_rational_19730209083838280592466468841270710123648710129851874168871638965826339173347_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_19730209083838280592466468841270710123648710129851874168871638965826339173347_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_19730209083838280592466468841270710123648710129851874168871638965826339173347_by_1(value)))
            }

            function cleanup_t_rational_27480445580906809905100997494486018814590210398458015878350987099064644055584_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_27480445580906809905100997494486018814590210398458015878350987099064644055584_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_27480445580906809905100997494486018814590210398458015878350987099064644055584_by_1(value)))
            }

            function cleanup_t_rational_2_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_2_by_1(value)))
            }

            function cleanup_t_rational_49704039178257456889185367300597873216271100343164554016643926439381018279846_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_49704039178257456889185367300597873216271100343164554016643926439381018279846_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_49704039178257456889185367300597873216271100343164554016643926439381018279846_by_1(value)))
            }

            function cleanup_t_rational_3_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_3_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_3_by_1(value)))
            }

            function cleanup_t_rational_84240858422093979540326314707011935806654655651736740789101956485318292382552_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_84240858422093979540326314707011935806654655651736740789101956485318292382552_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_84240858422093979540326314707011935806654655651736740789101956485318292382552_by_1(value)))
            }

            function cleanup_t_rational_4_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_4_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_4_by_1(value)))
            }

            function cleanup_t_rational_104022516332665819660100429866997666921005820978550711756882154206593351772535_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_104022516332665819660100429866997666921005820978550711756882154206593351772535_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_104022516332665819660100429866997666921005820978550711756882154206593351772535_by_1(value)))
            }

            function cleanup_t_rational_5_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_5_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_5_by_1(value)))
            }

            function cleanup_t_rational_107489781044524099970582977259299756593189663175933764858701808531127504064043_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_107489781044524099970582977259299756593189663175933764858701808531127504064043_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_107489781044524099970582977259299756593189663175933764858701808531127504064043_by_1(value)))
            }

            function cleanup_t_rational_6_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_6_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_6_by_1(value)))
            }

            function cleanup_t_rational_38394979475303745258166323340936816113705930766303530273757854390477888541242_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_38394979475303745258166323340936816113705930766303530273757854390477888541242_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_38394979475303745258166323340936816113705930766303530273757854390477888541242_by_1(value)))
            }

            function cleanup_t_rational_7_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_7_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_7_by_1(value)))
            }

            function cleanup_t_rational_91296689595118601889431677125932351885883671139842369671885303557415579360809_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_91296689595118601889431677125932351885883671139842369671885303557415579360809_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_91296689595118601889431677125932351885883671139842369671885303557415579360809_by_1(value)))
            }

            function cleanup_t_rational_8_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_8_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_8_by_1(value)))
            }

            function cleanup_t_rational_96616582731722574155780299144874424677978567798321118907390464471021432496854_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_96616582731722574155780299144874424677978567798321118907390464471021432496854_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_96616582731722574155780299144874424677978567798321118907390464471021432496854_by_1(value)))
            }

            function cleanup_t_rational_9_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_9_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_9_by_1(value)))
            }

            function cleanup_t_rational_92577716433622933669788071448504994840719321671152081411292292671977191889696_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_92577716433622933669788071448504994840719321671152081411292292671977191889696_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_92577716433622933669788071448504994840719321671152081411292292671977191889696_by_1(value)))
            }

            function cleanup_t_rational_62537328969002378782781025816633972254024462707435887300635360269230577889498_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_62537328969002378782781025816633972254024462707435887300635360269230577889498_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_62537328969002378782781025816633972254024462707435887300635360269230577889498_by_1(value)))
            }

            /// @ast-id 9097
            /// @src 25:1139:3487  "function offerTreeTypeHash(uint256 height) internal pure returns (bytes32) {..."
            function fun_offerTreeTypeHash_9097(var_height_8960) -> var__8963 {
                /// @src 25:1205:1212  "bytes32"
                let zero_t_bytes32_141 := zero_value_for_split_t_bytes32()
                var__8963 := zero_t_bytes32_141

                /// @src 25:1228:1234  "height"
                let _142 := var_height_8960
                let expr_8965 := _142
                /// @src 25:1238:1240  "10"
                let expr_8966 := 0x0a
                /// @src 25:1228:1240  "height <= 10"
                let expr_8967 := iszero(gt(cleanup_t_uint256(expr_8965), convert_t_rational_10_by_1_to_t_uint256(expr_8966)))
                /// @src 25:1224:3481  "if (height <= 10) {..."
                switch expr_8967
                case 0 {
                    /// @src 25:2404:2410  "height"
                    let _143 := var_height_8960
                    let expr_9031 := _143
                    /// @src 25:2414:2416  "11"
                    let expr_9032 := 0x0b
                    /// @src 25:2404:2416  "height == 11"
                    let expr_9033 := eq(cleanup_t_uint256(expr_9031), convert_t_rational_11_by_1_to_t_uint256(expr_9032))
                    /// @src 25:2400:2491  "if (height == 11) return 0x2adc0d948b2e3ecb642661590d2eec36d4e71e9acf382deb6574371800caf198"
                    if expr_9033 {
                        /// @src 25:2425:2491  "0x2adc0d948b2e3ecb642661590d2eec36d4e71e9acf382deb6574371800caf198"
                        let expr_9034 := 0x2adc0d948b2e3ecb642661590d2eec36d4e71e9acf382deb6574371800caf198
                        /// @src 25:2418:2491  "return 0x2adc0d948b2e3ecb642661590d2eec36d4e71e9acf382deb6574371800caf198"
                        var__8963 := convert_t_rational_19385939722180480631016574566536956964141099845311062633052049178854901346712_by_1_to_t_bytes32(expr_9034)
                        leave
                        /// @src 25:2400:2491  "if (height == 11) return 0x2adc0d948b2e3ecb642661590d2eec36d4e71e9acf382deb6574371800caf198"
                    }
                    /// @src 25:2509:2515  "height"
                    let _144 := var_height_8960
                    let expr_9037 := _144
                    /// @src 25:2519:2521  "12"
                    let expr_9038 := 0x0c
                    /// @src 25:2509:2521  "height == 12"
                    let expr_9039 := eq(cleanup_t_uint256(expr_9037), convert_t_rational_12_by_1_to_t_uint256(expr_9038))
                    /// @src 25:2505:2596  "if (height == 12) return 0xf5845dfaed016de272342f346346a49d4b1694f622144d420558a38e46ac9dad"
                    if expr_9039 {
                        /// @src 25:2530:2596  "0xf5845dfaed016de272342f346346a49d4b1694f622144d420558a38e46ac9dad"
                        let expr_9040 := 0xf5845dfaed016de272342f346346a49d4b1694f622144d420558a38e46ac9dad
                        /// @src 25:2523:2596  "return 0xf5845dfaed016de272342f346346a49d4b1694f622144d420558a38e46ac9dad"
                        var__8963 := convert_t_rational_111050520342807531272321064730389622480626415079694339853011182259576047967661_by_1_to_t_bytes32(expr_9040)
                        leave
                        /// @src 25:2505:2596  "if (height == 12) return 0xf5845dfaed016de272342f346346a49d4b1694f622144d420558a38e46ac9dad"
                    }
                    /// @src 25:2614:2620  "height"
                    let _145 := var_height_8960
                    let expr_9043 := _145
                    /// @src 25:2624:2626  "13"
                    let expr_9044 := 0x0d
                    /// @src 25:2614:2626  "height == 13"
                    let expr_9045 := eq(cleanup_t_uint256(expr_9043), convert_t_rational_13_by_1_to_t_uint256(expr_9044))
                    /// @src 25:2610:2701  "if (height == 13) return 0x3d7df854e6294bf433b64bbb8d0a82fa875a87b45b0016db27fc5752e54126ad"
                    if expr_9045 {
                        /// @src 25:2635:2701  "0x3d7df854e6294bf433b64bbb8d0a82fa875a87b45b0016db27fc5752e54126ad"
                        let expr_9046 := 0x3d7df854e6294bf433b64bbb8d0a82fa875a87b45b0016db27fc5752e54126ad
                        /// @src 25:2628:2701  "return 0x3d7df854e6294bf433b64bbb8d0a82fa875a87b45b0016db27fc5752e54126ad"
                        var__8963 := convert_t_rational_27813653568644887391158527524812759038441503570356155716992752100467743467181_by_1_to_t_bytes32(expr_9046)
                        leave
                        /// @src 25:2610:2701  "if (height == 13) return 0x3d7df854e6294bf433b64bbb8d0a82fa875a87b45b0016db27fc5752e54126ad"
                    }
                    /// @src 25:2719:2725  "height"
                    let _146 := var_height_8960
                    let expr_9049 := _146
                    /// @src 25:2729:2731  "14"
                    let expr_9050 := 0x0e
                    /// @src 25:2719:2731  "height == 14"
                    let expr_9051 := eq(cleanup_t_uint256(expr_9049), convert_t_rational_14_by_1_to_t_uint256(expr_9050))
                    /// @src 25:2715:2806  "if (height == 14) return 0x72a991a101708716ff427c524404ab44f4d4d1f4e7e76c0ae8b967222164b348"
                    if expr_9051 {
                        /// @src 25:2740:2806  "0x72a991a101708716ff427c524404ab44f4d4d1f4e7e76c0ae8b967222164b348"
                        let expr_9052 := 0x72a991a101708716ff427c524404ab44f4d4d1f4e7e76c0ae8b967222164b348
                        /// @src 25:2733:2806  "return 0x72a991a101708716ff427c524404ab44f4d4d1f4e7e76c0ae8b967222164b348"
                        var__8963 := convert_t_rational_51863266986363216769525430483347102030021794256182406384325625843678156469064_by_1_to_t_bytes32(expr_9052)
                        leave
                        /// @src 25:2715:2806  "if (height == 14) return 0x72a991a101708716ff427c524404ab44f4d4d1f4e7e76c0ae8b967222164b348"
                    }
                    /// @src 25:2824:2830  "height"
                    let _147 := var_height_8960
                    let expr_9055 := _147
                    /// @src 25:2834:2836  "15"
                    let expr_9056 := 0x0f
                    /// @src 25:2824:2836  "height == 15"
                    let expr_9057 := eq(cleanup_t_uint256(expr_9055), convert_t_rational_15_by_1_to_t_uint256(expr_9056))
                    /// @src 25:2820:2911  "if (height == 15) return 0x762c88fc52cf78a54401d247790f1bdb619d51d3458d1415c20d1422197cecc4"
                    if expr_9057 {
                        /// @src 25:2845:2911  "0x762c88fc52cf78a54401d247790f1bdb619d51d3458d1415c20d1422197cecc4"
                        let expr_9058 := 0x762c88fc52cf78a54401d247790f1bdb619d51d3458d1415c20d1422197cecc4
                        /// @src 25:2838:2911  "return 0x762c88fc52cf78a54401d247790f1bdb619d51d3458d1415c20d1422197cecc4"
                        var__8963 := convert_t_rational_53451602843806363024807924119125186715749651868811601750645792452090047294660_by_1_to_t_bytes32(expr_9058)
                        leave
                        /// @src 25:2820:2911  "if (height == 15) return 0x762c88fc52cf78a54401d247790f1bdb619d51d3458d1415c20d1422197cecc4"
                    }
                    /// @src 25:2929:2935  "height"
                    let _148 := var_height_8960
                    let expr_9061 := _148
                    /// @src 25:2939:2941  "16"
                    let expr_9062 := 0x10
                    /// @src 25:2929:2941  "height == 16"
                    let expr_9063 := eq(cleanup_t_uint256(expr_9061), convert_t_rational_16_by_1_to_t_uint256(expr_9062))
                    /// @src 25:2925:3016  "if (height == 16) return 0x8ede2209e94c8d5f8379d733dc8712b71a3888c1c4b70f3d6b22285f70bf4286"
                    if expr_9063 {
                        /// @src 25:2950:3016  "0x8ede2209e94c8d5f8379d733dc8712b71a3888c1c4b70f3d6b22285f70bf4286"
                        let expr_9064 := 0x8ede2209e94c8d5f8379d733dc8712b71a3888c1c4b70f3d6b22285f70bf4286
                        /// @src 25:2943:3016  "return 0x8ede2209e94c8d5f8379d733dc8712b71a3888c1c4b70f3d6b22285f70bf4286"
                        var__8963 := convert_t_rational_64620899473789195076879667188681717574629087988767412195633794856466725683846_by_1_to_t_bytes32(expr_9064)
                        leave
                        /// @src 25:2925:3016  "if (height == 16) return 0x8ede2209e94c8d5f8379d733dc8712b71a3888c1c4b70f3d6b22285f70bf4286"
                    }
                    /// @src 25:3034:3040  "height"
                    let _149 := var_height_8960
                    let expr_9067 := _149
                    /// @src 25:3044:3046  "17"
                    let expr_9068 := 0x11
                    /// @src 25:3034:3046  "height == 17"
                    let expr_9069 := eq(cleanup_t_uint256(expr_9067), convert_t_rational_17_by_1_to_t_uint256(expr_9068))
                    /// @src 25:3030:3121  "if (height == 17) return 0x425b18f07b3ac2f641977d2c294590565dd40b5d8414610568dca64628399975"
                    if expr_9069 {
                        /// @src 25:3055:3121  "0x425b18f07b3ac2f641977d2c294590565dd40b5d8414610568dca64628399975"
                        let expr_9070 := 0x425b18f07b3ac2f641977d2c294590565dd40b5d8414610568dca64628399975
                        /// @src 25:3048:3121  "return 0x425b18f07b3ac2f641977d2c294590565dd40b5d8414610568dca64628399975"
                        var__8963 := convert_t_rational_30013603214667522679385533521797892680999548198339296774819560713373554940277_by_1_to_t_bytes32(expr_9070)
                        leave
                        /// @src 25:3030:3121  "if (height == 17) return 0x425b18f07b3ac2f641977d2c294590565dd40b5d8414610568dca64628399975"
                    }
                    /// @src 25:3139:3145  "height"
                    let _150 := var_height_8960
                    let expr_9073 := _150
                    /// @src 25:3149:3151  "18"
                    let expr_9074 := 0x12
                    /// @src 25:3139:3151  "height == 18"
                    let expr_9075 := eq(cleanup_t_uint256(expr_9073), convert_t_rational_18_by_1_to_t_uint256(expr_9074))
                    /// @src 25:3135:3226  "if (height == 18) return 0x7e7d98718c0180e882e5963b9bd49810096912c273dfa38d8afdd6d39fde86ec"
                    if expr_9075 {
                        /// @src 25:3160:3226  "0x7e7d98718c0180e882e5963b9bd49810096912c273dfa38d8afdd6d39fde86ec"
                        let expr_9076 := 0x7e7d98718c0180e882e5963b9bd49810096912c273dfa38d8afdd6d39fde86ec
                        /// @src 25:3153:3226  "return 0x7e7d98718c0180e882e5963b9bd49810096912c273dfa38d8afdd6d39fde86ec"
                        var__8963 := convert_t_rational_57213326931251887887258928227715281144007479063643867391973587677122335246060_by_1_to_t_bytes32(expr_9076)
                        leave
                        /// @src 25:3135:3226  "if (height == 18) return 0x7e7d98718c0180e882e5963b9bd49810096912c273dfa38d8afdd6d39fde86ec"
                    }
                    /// @src 25:3244:3250  "height"
                    let _151 := var_height_8960
                    let expr_9079 := _151
                    /// @src 25:3254:3256  "19"
                    let expr_9080 := 0x13
                    /// @src 25:3244:3256  "height == 19"
                    let expr_9081 := eq(cleanup_t_uint256(expr_9079), convert_t_rational_19_by_1_to_t_uint256(expr_9080))
                    /// @src 25:3240:3331  "if (height == 19) return 0x8d35d491a29d846489e19688efff3c4cc7dbd54458058d49b30294074539f0b9"
                    if expr_9081 {
                        /// @src 25:3265:3331  "0x8d35d491a29d846489e19688efff3c4cc7dbd54458058d49b30294074539f0b9"
                        let expr_9082 := 0x8d35d491a29d846489e19688efff3c4cc7dbd54458058d49b30294074539f0b9
                        /// @src 25:3258:3331  "return 0x8d35d491a29d846489e19688efff3c4cc7dbd54458058d49b30294074539f0b9"
                        var__8963 := convert_t_rational_63871221641216991517566302322836194584019013490178190417230330645720564625593_by_1_to_t_bytes32(expr_9082)
                        leave
                        /// @src 25:3240:3331  "if (height == 19) return 0x8d35d491a29d846489e19688efff3c4cc7dbd54458058d49b30294074539f0b9"
                    }
                    /// @src 25:3349:3355  "height"
                    let _152 := var_height_8960
                    let expr_9085 := _152
                    /// @src 25:3359:3361  "20"
                    let expr_9086 := 0x14
                    /// @src 25:3349:3361  "height == 20"
                    let expr_9087 := eq(cleanup_t_uint256(expr_9085), convert_t_rational_20_by_1_to_t_uint256(expr_9086))
                    /// @src 25:3345:3436  "if (height == 20) return 0x824e385eea1953bcbc783bf900b18aa6fba129b6908765e986cf0968b491ec4f"
                    if expr_9087 {
                        /// @src 25:3370:3436  "0x824e385eea1953bcbc783bf900b18aa6fba129b6908765e986cf0968b491ec4f"
                        let expr_9088 := 0x824e385eea1953bcbc783bf900b18aa6fba129b6908765e986cf0968b491ec4f
                        /// @src 25:3363:3436  "return 0x824e385eea1953bcbc783bf900b18aa6fba129b6908765e986cf0968b491ec4f"
                        var__8963 := convert_t_rational_58938873443561246664471576790694807267544811985195959332237922573169753975887_by_1_to_t_bytes32(expr_9088)
                        leave
                        /// @src 25:3345:3436  "if (height == 20) return 0x824e385eea1953bcbc783bf900b18aa6fba129b6908765e986cf0968b491ec4f"
                    }
                    /// @src 25:3457:3470  "TreeTooHigh()"
                    {

                        let _154 := 0

                        mstore(_154, 0x0fda59e600000000000000000000000000000000000000000000000000000000)
                        let _153 := abi_encode_tuple__to__fromStack(add(_154, 4) )
                        revert(_154, sub(_153, _154))
                    }/// @src 25:1224:3481  "if (height <= 10) {..."
                }
                default {
                    /// @src 25:1260:1266  "height"
                    let _155 := var_height_8960
                    let expr_8968 := _155
                    /// @src 25:1270:1271  "0"
                    let expr_8969 := 0x00
                    /// @src 25:1260:1271  "height == 0"
                    let expr_8970 := eq(cleanup_t_uint256(expr_8968), convert_t_rational_0_by_1_to_t_uint256(expr_8969))
                    /// @src 25:1256:1346  "if (height == 0) return 0x2b9ee710e1977dfc5778fe18c905ccc1d9e144baf3ba83be732d4da65ecb73e3"
                    if expr_8970 {
                        /// @src 25:1280:1346  "0x2b9ee710e1977dfc5778fe18c905ccc1d9e144baf3ba83be732d4da65ecb73e3"
                        let expr_8971 := 0x2b9ee710e1977dfc5778fe18c905ccc1d9e144baf3ba83be732d4da65ecb73e3
                        /// @src 25:1273:1346  "return 0x2b9ee710e1977dfc5778fe18c905ccc1d9e144baf3ba83be732d4da65ecb73e3"
                        var__8963 := convert_t_rational_19730209083838280592466468841270710123648710129851874168871638965826339173347_by_1_to_t_bytes32(expr_8971)
                        leave
                        /// @src 25:1256:1346  "if (height == 0) return 0x2b9ee710e1977dfc5778fe18c905ccc1d9e144baf3ba83be732d4da65ecb73e3"
                    }
                    /// @src 25:1364:1370  "height"
                    let _156 := var_height_8960
                    let expr_8974 := _156
                    /// @src 25:1374:1375  "1"
                    let expr_8975 := 0x01
                    /// @src 25:1364:1375  "height == 1"
                    let expr_8976 := eq(cleanup_t_uint256(expr_8974), convert_t_rational_1_by_1_to_t_uint256(expr_8975))
                    /// @src 25:1360:1450  "if (height == 1) return 0x3cc16189b92a85898f1d5c6e87282c8ded7c1c93b2323d5e85ae10c5f4b2b220"
                    if expr_8976 {
                        /// @src 25:1384:1450  "0x3cc16189b92a85898f1d5c6e87282c8ded7c1c93b2323d5e85ae10c5f4b2b220"
                        let expr_8977 := 0x3cc16189b92a85898f1d5c6e87282c8ded7c1c93b2323d5e85ae10c5f4b2b220
                        /// @src 25:1377:1450  "return 0x3cc16189b92a85898f1d5c6e87282c8ded7c1c93b2323d5e85ae10c5f4b2b220"
                        var__8963 := convert_t_rational_27480445580906809905100997494486018814590210398458015878350987099064644055584_by_1_to_t_bytes32(expr_8977)
                        leave
                        /// @src 25:1360:1450  "if (height == 1) return 0x3cc16189b92a85898f1d5c6e87282c8ded7c1c93b2323d5e85ae10c5f4b2b220"
                    }
                    /// @src 25:1468:1474  "height"
                    let _157 := var_height_8960
                    let expr_8980 := _157
                    /// @src 25:1478:1479  "2"
                    let expr_8981 := 0x02
                    /// @src 25:1468:1479  "height == 2"
                    let expr_8982 := eq(cleanup_t_uint256(expr_8980), convert_t_rational_2_by_1_to_t_uint256(expr_8981))
                    /// @src 25:1464:1554  "if (height == 2) return 0x6de37d3e570afa293a8107d4b6b1d9547616c04f42164d009c89194787b2ffa6"
                    if expr_8982 {
                        /// @src 25:1488:1554  "0x6de37d3e570afa293a8107d4b6b1d9547616c04f42164d009c89194787b2ffa6"
                        let expr_8983 := 0x6de37d3e570afa293a8107d4b6b1d9547616c04f42164d009c89194787b2ffa6
                        /// @src 25:1481:1554  "return 0x6de37d3e570afa293a8107d4b6b1d9547616c04f42164d009c89194787b2ffa6"
                        var__8963 := convert_t_rational_49704039178257456889185367300597873216271100343164554016643926439381018279846_by_1_to_t_bytes32(expr_8983)
                        leave
                        /// @src 25:1464:1554  "if (height == 2) return 0x6de37d3e570afa293a8107d4b6b1d9547616c04f42164d009c89194787b2ffa6"
                    }
                    /// @src 25:1572:1578  "height"
                    let _158 := var_height_8960
                    let expr_8986 := _158
                    /// @src 25:1582:1583  "3"
                    let expr_8987 := 0x03
                    /// @src 25:1572:1583  "height == 3"
                    let expr_8988 := eq(cleanup_t_uint256(expr_8986), convert_t_rational_3_by_1_to_t_uint256(expr_8987))
                    /// @src 25:1568:1658  "if (height == 3) return 0xba3ea2ddfbf40a906fcd1b9506dbd344c062e8dcba8b5c902ceb13339f45a358"
                    if expr_8988 {
                        /// @src 25:1592:1658  "0xba3ea2ddfbf40a906fcd1b9506dbd344c062e8dcba8b5c902ceb13339f45a358"
                        let expr_8989 := 0xba3ea2ddfbf40a906fcd1b9506dbd344c062e8dcba8b5c902ceb13339f45a358
                        /// @src 25:1585:1658  "return 0xba3ea2ddfbf40a906fcd1b9506dbd344c062e8dcba8b5c902ceb13339f45a358"
                        var__8963 := convert_t_rational_84240858422093979540326314707011935806654655651736740789101956485318292382552_by_1_to_t_bytes32(expr_8989)
                        leave
                        /// @src 25:1568:1658  "if (height == 3) return 0xba3ea2ddfbf40a906fcd1b9506dbd344c062e8dcba8b5c902ceb13339f45a358"
                    }
                    /// @src 25:1676:1682  "height"
                    let _159 := var_height_8960
                    let expr_8992 := _159
                    /// @src 25:1686:1687  "4"
                    let expr_8993 := 0x04
                    /// @src 25:1676:1687  "height == 4"
                    let expr_8994 := eq(cleanup_t_uint256(expr_8992), convert_t_rational_4_by_1_to_t_uint256(expr_8993))
                    /// @src 25:1672:1762  "if (height == 4) return 0xe5faa865e93bc1b7b8fdf91980f54682d649683b014edd6c54b642f5a0c96977"
                    if expr_8994 {
                        /// @src 25:1696:1762  "0xe5faa865e93bc1b7b8fdf91980f54682d649683b014edd6c54b642f5a0c96977"
                        let expr_8995 := 0xe5faa865e93bc1b7b8fdf91980f54682d649683b014edd6c54b642f5a0c96977
                        /// @src 25:1689:1762  "return 0xe5faa865e93bc1b7b8fdf91980f54682d649683b014edd6c54b642f5a0c96977"
                        var__8963 := convert_t_rational_104022516332665819660100429866997666921005820978550711756882154206593351772535_by_1_to_t_bytes32(expr_8995)
                        leave
                        /// @src 25:1672:1762  "if (height == 4) return 0xe5faa865e93bc1b7b8fdf91980f54682d649683b014edd6c54b642f5a0c96977"
                    }
                    /// @src 25:1780:1786  "height"
                    let _160 := var_height_8960
                    let expr_8998 := _160
                    /// @src 25:1790:1791  "5"
                    let expr_8999 := 0x05
                    /// @src 25:1780:1791  "height == 5"
                    let expr_9000 := eq(cleanup_t_uint256(expr_8998), convert_t_rational_5_by_1_to_t_uint256(expr_8999))
                    /// @src 25:1776:1866  "if (height == 5) return 0xeda50f61dd2a827c6ff9fbfcd54335628dcaa78aaa4f2d118c60886219cdce2b"
                    if expr_9000 {
                        /// @src 25:1800:1866  "0xeda50f61dd2a827c6ff9fbfcd54335628dcaa78aaa4f2d118c60886219cdce2b"
                        let expr_9001 := 0xeda50f61dd2a827c6ff9fbfcd54335628dcaa78aaa4f2d118c60886219cdce2b
                        /// @src 25:1793:1866  "return 0xeda50f61dd2a827c6ff9fbfcd54335628dcaa78aaa4f2d118c60886219cdce2b"
                        var__8963 := convert_t_rational_107489781044524099970582977259299756593189663175933764858701808531127504064043_by_1_to_t_bytes32(expr_9001)
                        leave
                        /// @src 25:1776:1866  "if (height == 5) return 0xeda50f61dd2a827c6ff9fbfcd54335628dcaa78aaa4f2d118c60886219cdce2b"
                    }
                    /// @src 25:1884:1890  "height"
                    let _161 := var_height_8960
                    let expr_9004 := _161
                    /// @src 25:1894:1895  "6"
                    let expr_9005 := 0x06
                    /// @src 25:1884:1895  "height == 6"
                    let expr_9006 := eq(cleanup_t_uint256(expr_9004), convert_t_rational_6_by_1_to_t_uint256(expr_9005))
                    /// @src 25:1880:1970  "if (height == 6) return 0x54e2c9cc40cdc0e9ad530cf2be298f952f57af2b18b02f88274a9bbab359d23a"
                    if expr_9006 {
                        /// @src 25:1904:1970  "0x54e2c9cc40cdc0e9ad530cf2be298f952f57af2b18b02f88274a9bbab359d23a"
                        let expr_9007 := 0x54e2c9cc40cdc0e9ad530cf2be298f952f57af2b18b02f88274a9bbab359d23a
                        /// @src 25:1897:1970  "return 0x54e2c9cc40cdc0e9ad530cf2be298f952f57af2b18b02f88274a9bbab359d23a"
                        var__8963 := convert_t_rational_38394979475303745258166323340936816113705930766303530273757854390477888541242_by_1_to_t_bytes32(expr_9007)
                        leave
                        /// @src 25:1880:1970  "if (height == 6) return 0x54e2c9cc40cdc0e9ad530cf2be298f952f57af2b18b02f88274a9bbab359d23a"
                    }
                    /// @src 25:1988:1994  "height"
                    let _162 := var_height_8960
                    let expr_9010 := _162
                    /// @src 25:1998:1999  "7"
                    let expr_9011 := 0x07
                    /// @src 25:1988:1999  "height == 7"
                    let expr_9012 := eq(cleanup_t_uint256(expr_9010), convert_t_rational_7_by_1_to_t_uint256(expr_9011))
                    /// @src 25:1984:2074  "if (height == 7) return 0xc9d81859d60d6b21c688f4be93ca83e3be222728bb156ef5f4cf497f879f1e29"
                    if expr_9012 {
                        /// @src 25:2008:2074  "0xc9d81859d60d6b21c688f4be93ca83e3be222728bb156ef5f4cf497f879f1e29"
                        let expr_9013 := 0xc9d81859d60d6b21c688f4be93ca83e3be222728bb156ef5f4cf497f879f1e29
                        /// @src 25:2001:2074  "return 0xc9d81859d60d6b21c688f4be93ca83e3be222728bb156ef5f4cf497f879f1e29"
                        var__8963 := convert_t_rational_91296689595118601889431677125932351885883671139842369671885303557415579360809_by_1_to_t_bytes32(expr_9013)
                        leave
                        /// @src 25:1984:2074  "if (height == 7) return 0xc9d81859d60d6b21c688f4be93ca83e3be222728bb156ef5f4cf497f879f1e29"
                    }
                    /// @src 25:2092:2098  "height"
                    let _163 := var_height_8960
                    let expr_9016 := _163
                    /// @src 25:2102:2103  "8"
                    let expr_9017 := 0x08
                    /// @src 25:2092:2103  "height == 8"
                    let expr_9018 := eq(cleanup_t_uint256(expr_9016), convert_t_rational_8_by_1_to_t_uint256(expr_9017))
                    /// @src 25:2088:2178  "if (height == 8) return 0xd59b0c4544e0c60c8611eab0aaa402575f14ee784d22289c5d57f48c422a62d6"
                    if expr_9018 {
                        /// @src 25:2112:2178  "0xd59b0c4544e0c60c8611eab0aaa402575f14ee784d22289c5d57f48c422a62d6"
                        let expr_9019 := 0xd59b0c4544e0c60c8611eab0aaa402575f14ee784d22289c5d57f48c422a62d6
                        /// @src 25:2105:2178  "return 0xd59b0c4544e0c60c8611eab0aaa402575f14ee784d22289c5d57f48c422a62d6"
                        var__8963 := convert_t_rational_96616582731722574155780299144874424677978567798321118907390464471021432496854_by_1_to_t_bytes32(expr_9019)
                        leave
                        /// @src 25:2088:2178  "if (height == 8) return 0xd59b0c4544e0c60c8611eab0aaa402575f14ee784d22289c5d57f48c422a62d6"
                    }
                    /// @src 25:2196:2202  "height"
                    let _164 := var_height_8960
                    let expr_9022 := _164
                    /// @src 25:2206:2207  "9"
                    let expr_9023 := 0x09
                    /// @src 25:2196:2207  "height == 9"
                    let expr_9024 := eq(cleanup_t_uint256(expr_9022), convert_t_rational_9_by_1_to_t_uint256(expr_9023))
                    /// @src 25:2192:2282  "if (height == 9) return 0xccad21701f34f08bb8398a3dbc77e20e4c9c424930f3a8b31485bf059e2bdb20"
                    if expr_9024 {
                        /// @src 25:2216:2282  "0xccad21701f34f08bb8398a3dbc77e20e4c9c424930f3a8b31485bf059e2bdb20"
                        let expr_9025 := 0xccad21701f34f08bb8398a3dbc77e20e4c9c424930f3a8b31485bf059e2bdb20
                        /// @src 25:2209:2282  "return 0xccad21701f34f08bb8398a3dbc77e20e4c9c424930f3a8b31485bf059e2bdb20"
                        var__8963 := convert_t_rational_92577716433622933669788071448504994840719321671152081411292292671977191889696_by_1_to_t_bytes32(expr_9025)
                        leave
                        /// @src 25:2192:2282  "if (height == 9) return 0xccad21701f34f08bb8398a3dbc77e20e4c9c424930f3a8b31485bf059e2bdb20"
                    }
                    /// @src 25:2303:2369  "0x8a42dfb49807647bfc49c906aef322aa0239d40e4cb675761e141bc7bfa530da"
                    let expr_9028 := 0x8a42dfb49807647bfc49c906aef322aa0239d40e4cb675761e141bc7bfa530da
                    /// @src 25:2296:2369  "return 0x8a42dfb49807647bfc49c906aef322aa0239d40e4cb675761e141bc7bfa530da"
                    var__8963 := convert_t_rational_62537328969002378782781025816633972254024462707435887300635360269230577889498_by_1_to_t_bytes32(expr_9028)
                    leave
                    /// @src 25:1224:3481  "if (height <= 10) {..."
                }

            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

            function array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function allocate_memory_array_t_array$_t_bytes32_$dyn_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

                mstore(memPtr, length)

            }

            function zero_memory_chunk_t_bytes32(dataStart, dataSizeInBytes) {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }

            function allocate_and_zero_memory_array_t_array$_t_bytes32_$dyn_memory_ptr(length) -> memPtr {
                memPtr := allocate_memory_array_t_array$_t_bytes32_$dyn_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length)

                dataStart := add(dataStart, 32)
                dataSize := sub(dataSize, 32)

                zero_memory_chunk_t_bytes32(dataStart, dataSize)
            }

            function memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function write_to_memory_t_bytes32(memPtr, value) {
                mstore(memPtr, cleanup_t_bytes32(value))
            }

            function cleanup_t_rational_24200669282116936182035894255520409376334054108231253457609625050124993130030_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_24200669282116936182035894255520409376334054108231253457609625050124993130030_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_24200669282116936182035894255520409376334054108231253457609625050124993130030_by_1(value)))
            }

            /// @src 25:475:576  "bytes32 constant MARKET_TYPEHASH = 0x358117e98511cc3df97175dca58053b06675b43ad090b0553f8a1eff008b6e2e"
            function constant_MARKET_TYPEHASH_8949() -> ret {
                /// @src 25:510:576  "0x358117e98511cc3df97175dca58053b06675b43ad090b0553f8a1eff008b6e2e"
                let expr_8948 := 0x358117e98511cc3df97175dca58053b06675b43ad090b0553f8a1eff008b6e2e
                let _184 := convert_t_rational_24200669282116936182035894255520409376334054108231253457609625050124993130030_by_1_to_t_bytes32(expr_8948)

                ret := _184
            }

            function abi_encode_tuple_t_bytes32_t_address_t_bytes32_t_uint256_t_uint256_t_address_t_address__to_t_bytes32_t_address_t_bytes32_t_uint256_t_uint256_t_address_t_address__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6) -> tail {
                tail := add(headStart, 224)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint256_to_t_uint256_fromStack(value4,  add(headStart, 128))

                abi_encode_t_address_to_t_address_fromStack(value5,  add(headStart, 160))

                abi_encode_t_address_to_t_address_fromStack(value6,  add(headStart, 192))

            }

            /// @ast-id 9276
            /// @src 25:5101:6098  "function hashMarket(Market memory market) internal pure returns (bytes32) {..."
            function fun_hashMarket_9276(var_market_9210_mpos) -> var__9213 {
                /// @src 25:5166:5173  "bytes32"
                let zero_t_bytes32_165 := zero_value_for_split_t_bytes32()
                var__9213 := zero_t_bytes32_165

                /// @src 25:5241:5247  "market"
                let _166_mpos := var_market_9210_mpos
                let expr_9223_mpos := _166_mpos
                /// @src 25:5241:5264  "market.collateralParams"
                let _167 := add(expr_9223_mpos, 32)
                let _168_mpos := mload(_167)
                let expr_9224_mpos := _168_mpos
                /// @src 25:5241:5271  "market.collateralParams.length"
                let expr_9225 := array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_9224_mpos)
                /// @src 25:5227:5272  "new bytes32[](market.collateralParams.length)"
                let expr_9226_mpos := allocate_and_zero_memory_array_t_array$_t_bytes32_$dyn_memory_ptr(expr_9225)
                /// @src 25:5185:5272  "bytes32[] memory collateralParamsHashes = new bytes32[](market.collateralParams.length)"
                let var_collateralParamsHashes_9219_mpos := expr_9226_mpos
                /// @src 25:5282:5444  "for (uint256 i = 0; i < market.collateralParams.length; i++) {..."
                for {
                    /// @src 25:5299:5300  "0"
                    let expr_9230 := 0x00
                    /// @src 25:5287:5300  "uint256 i = 0"
                    let var_i_9229 := convert_t_rational_0_by_1_to_t_uint256(expr_9230)
                    } 1 {
                    /// @src 25:5338:5341  "i++"
                    let _170 := var_i_9229
                    let _169 := increment_wrapping_t_uint256(_170)
                    var_i_9229 := _169
                    let expr_9238 := _170
                }
                {
                    /// @src 25:5302:5303  "i"
                    let _171 := var_i_9229
                    let expr_9232 := _171
                    /// @src 25:5306:5312  "market"
                    let _172_mpos := var_market_9210_mpos
                    let expr_9233_mpos := _172_mpos
                    /// @src 25:5306:5329  "market.collateralParams"
                    let _173 := add(expr_9233_mpos, 32)
                    let _174_mpos := mload(_173)
                    let expr_9234_mpos := _174_mpos
                    /// @src 25:5306:5336  "market.collateralParams.length"
                    let expr_9235 := array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_9234_mpos)
                    /// @src 25:5302:5336  "i < market.collateralParams.length"
                    let expr_9236 := lt(cleanup_t_uint256(expr_9232), cleanup_t_uint256(expr_9235))
                    if iszero(expr_9236) { break }
                    /// @src 25:5406:5412  "market"
                    let _175_mpos := var_market_9210_mpos
                    let expr_9244_mpos := _175_mpos
                    /// @src 25:5406:5429  "market.collateralParams"
                    let _176 := add(expr_9244_mpos, 32)
                    let _177_mpos := mload(_176)
                    let expr_9245_mpos := _177_mpos
                    /// @src 25:5430:5431  "i"
                    let _178 := var_i_9229
                    let expr_9246 := _178
                    /// @src 25:5406:5432  "market.collateralParams[i]"
                    let _179_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_9245_mpos, expr_9246))
                    let expr_9247_mpos := _179_mpos
                    /// @src 25:5385:5433  "hashCollateralParams(market.collateralParams[i])"
                    let expr_9248 := fun_hashCollateralParams_9206(expr_9247_mpos)
                    /// @src 25:5357:5379  "collateralParamsHashes"
                    let _180_mpos := var_collateralParamsHashes_9219_mpos
                    let expr_9240_mpos := _180_mpos
                    /// @src 25:5380:5381  "i"
                    let _181 := var_i_9229
                    let expr_9241 := _181
                    /// @src 25:5357:5433  "collateralParamsHashes[i] = hashCollateralParams(market.collateralParams[i])"
                    let _182 := expr_9248
                    write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_9240_mpos, expr_9241), _182)
                    let expr_9249 := expr_9248
                }
                /// @src 25:5454:5482  "bytes32 collateralParamsHash"
                let var_collateralParamsHash_9254
                let zero_t_bytes32_183 := zero_value_for_split_t_bytes32()
                var_collateralParamsHash_9254 := zero_t_bytes32_183
                /// @src 25:5564:5769  "assembly (\"memory-safe\") {..."
                {
                    var_collateralParamsHash_9254 := keccak256(add(var_collateralParamsHashes_9219_mpos, 0x20), mul(mload(var_collateralParamsHashes_9219_mpos), 0x20))
                }
                /// @src 25:5837:5852  "MARKET_TYPEHASH"
                let expr_9260 := constant_MARKET_TYPEHASH_8949()
                /// @src 25:5870:5876  "market"
                let _185_mpos := var_market_9210_mpos
                let expr_9261_mpos := _185_mpos
                /// @src 25:5870:5886  "market.loanToken"
                let _186 := add(expr_9261_mpos, 0)
                let _187 := read_from_memoryt_address(_186)
                let expr_9262 := _187
                /// @src 25:5904:5924  "collateralParamsHash"
                let _188 := var_collateralParamsHash_9254
                let expr_9263 := _188
                /// @src 25:5942:5948  "market"
                let _189_mpos := var_market_9210_mpos
                let expr_9264_mpos := _189_mpos
                /// @src 25:5942:5957  "market.maturity"
                let _190 := add(expr_9264_mpos, 64)
                let _191 := read_from_memoryt_uint256(_190)
                let expr_9265 := _191
                /// @src 25:5975:5981  "market"
                let _192_mpos := var_market_9210_mpos
                let expr_9266_mpos := _192_mpos
                /// @src 25:5975:5994  "market.rcfThreshold"
                let _193 := add(expr_9266_mpos, 96)
                let _194 := read_from_memoryt_uint256(_193)
                let expr_9267 := _194
                /// @src 25:6012:6018  "market"
                let _195_mpos := var_market_9210_mpos
                let expr_9268_mpos := _195_mpos
                /// @src 25:6012:6028  "market.enterGate"
                let _196 := add(expr_9268_mpos, 128)
                let _197 := read_from_memoryt_address(_196)
                let expr_9269 := _197
                /// @src 25:6046:6052  "market"
                let _198_mpos := var_market_9210_mpos
                let expr_9270_mpos := _198_mpos
                /// @src 25:6046:6067  "market.liquidatorGate"
                let _199 := add(expr_9270_mpos, 160)
                let _200 := read_from_memoryt_address(_199)
                let expr_9271 := _200
                /// @src 25:5809:6081  "abi.encode(..."

                let expr_9272_mpos := allocate_unbounded()
                let _201 := add(expr_9272_mpos, 0x20)

                let _202 := abi_encode_tuple_t_bytes32_t_address_t_bytes32_t_uint256_t_uint256_t_address_t_address__to_t_bytes32_t_address_t_bytes32_t_uint256_t_uint256_t_address_t_address__fromStack(_201, expr_9260, expr_9262, expr_9263, expr_9265, expr_9267, expr_9269, expr_9271)
                mstore(expr_9272_mpos, sub(_202, add(expr_9272_mpos, 0x20)))
                finalize_allocation(expr_9272_mpos, sub(_202, expr_9272_mpos))
                /// @src 25:5786:6091  "keccak256(..."
                let expr_9273 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_9272_mpos), array_length_t_bytes_memory_ptr(expr_9272_mpos))
                /// @src 25:5779:6091  "return keccak256(..."
                var__9213 := expr_9273
                leave

            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

            /// @ast-id 9181
            /// @src 25:4328:4571  "function hashNode(bytes32 left, bytes32 right) internal pure returns (bytes32 value) {..."
            function fun_hashNode_9181(var_left_9172, var_right_9174) -> var_value_9177 {
                /// @src 25:4398:4411  "bytes32 value"
                let zero_t_bytes32_203 := zero_value_for_split_t_bytes32()
                var_value_9177 := zero_t_bytes32_203

                /// @src 25:4423:4565  "assembly (\"memory-safe\") {..."
                {
                    mstore(0x00, var_left_9172)
                    mstore(0x20, var_right_9174)
                    var_value_9177 := keccak256(0x00, 0x40)
                }

            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

            function cleanup_t_rational_79276057443242824598701412555500554287286532544607853751535428707705631729327_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_79276057443242824598701412555500554287286532544607853751535428707705631729327_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_79276057443242824598701412555500554287286532544607853751535428707705631729327_by_1(value)))
            }

            /// @src 25:290:402  "bytes32 constant COLLATERAL_PARAMS_TYPEHASH = 0xaf44a88eb50ebdbbebd980e5a23045c44f61ece5f80ab708a1bbe8718102e6af"
            function constant_COLLATERAL_PARAMS_TYPEHASH_8945() -> ret {
                /// @src 25:336:402  "0xaf44a88eb50ebdbbebd980e5a23045c44f61ece5f80ab708a1bbe8718102e6af"
                let expr_8944 := 0xaf44a88eb50ebdbbebd980e5a23045c44f61ece5f80ab708a1bbe8718102e6af
                let _205 := convert_t_rational_79276057443242824598701412555500554287286532544607853751535428707705631729327_by_1_to_t_bytes32(expr_8944)

                ret := _205
            }

            function abi_encode_tuple_t_bytes32_t_address_t_uint256_t_uint256_t_address__to_t_bytes32_t_address_t_uint256_t_uint256_t_address__fromStack(headStart , value0, value1, value2, value3, value4) -> tail {
                tail := add(headStart, 160)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

                abi_encode_t_address_to_t_address_fromStack(value4,  add(headStart, 128))

            }

            /// @ast-id 9206
            /// @src 25:4646:5036  "function hashCollateralParams(CollateralParams memory collateralParams) internal pure returns (bytes32) {..."
            function fun_hashCollateralParams_9206(var_collateralParams_9185_mpos) -> var__9188 {
                /// @src 25:4741:4748  "bytes32"
                let zero_t_bytes32_204 := zero_value_for_split_t_bytes32()
                var__9188 := zero_t_bytes32_204

                /// @src 25:4818:4844  "COLLATERAL_PARAMS_TYPEHASH"
                let expr_9193 := constant_COLLATERAL_PARAMS_TYPEHASH_8945()
                /// @src 25:4862:4878  "collateralParams"
                let _206_mpos := var_collateralParams_9185_mpos
                let expr_9194_mpos := _206_mpos
                /// @src 25:4862:4884  "collateralParams.token"
                let _207 := add(expr_9194_mpos, 0)
                let _208 := read_from_memoryt_address(_207)
                let expr_9195 := _208
                /// @src 25:4902:4918  "collateralParams"
                let _209_mpos := var_collateralParams_9185_mpos
                let expr_9196_mpos := _209_mpos
                /// @src 25:4902:4923  "collateralParams.lltv"
                let _210 := add(expr_9196_mpos, 32)
                let _211 := read_from_memoryt_uint256(_210)
                let expr_9197 := _211
                /// @src 25:4941:4957  "collateralParams"
                let _212_mpos := var_collateralParams_9185_mpos
                let expr_9198_mpos := _212_mpos
                /// @src 25:4941:4964  "collateralParams.maxLif"
                let _213 := add(expr_9198_mpos, 64)
                let _214 := read_from_memoryt_uint256(_213)
                let expr_9199 := _214
                /// @src 25:4982:4998  "collateralParams"
                let _215_mpos := var_collateralParams_9185_mpos
                let expr_9200_mpos := _215_mpos
                /// @src 25:4982:5005  "collateralParams.oracle"
                let _216 := add(expr_9200_mpos, 96)
                let _217 := read_from_memoryt_address(_216)
                let expr_9201 := _217
                /// @src 25:4790:5019  "abi.encode(..."

                let expr_9202_mpos := allocate_unbounded()
                let _218 := add(expr_9202_mpos, 0x20)

                let _219 := abi_encode_tuple_t_bytes32_t_address_t_uint256_t_uint256_t_address__to_t_bytes32_t_address_t_uint256_t_uint256_t_address__fromStack(_218, expr_9193, expr_9195, expr_9197, expr_9199, expr_9201)
                mstore(expr_9202_mpos, sub(_219, add(expr_9202_mpos, 0x20)))
                finalize_allocation(expr_9202_mpos, sub(_219, expr_9202_mpos))
                /// @src 25:4767:5029  "keccak256(..."
                let expr_9203 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_9202_mpos), array_length_t_bytes_memory_ptr(expr_9202_mpos))
                /// @src 25:4760:5029  "return keccak256(..."
                var__9188 := expr_9203
                leave

            }
            /// @src 21:1103:2707  "contract EcrecoverRatifier is IEcrecoverRatifier {..."

        }

        data ".metadata" hex"a2646970667358221220eed345c38ad3c4491a7245b3ee761e3468d206961cffa88a30884c891927973364736f6c63430008220033"
    }

}

