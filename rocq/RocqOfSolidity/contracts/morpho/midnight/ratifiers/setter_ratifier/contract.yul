
/// @use-src 6:"deps/midnight/src/interfaces/IRatifier.sol", 22:"deps/midnight/src/ratifiers/SetterRatifier.sol", 24:"deps/midnight/src/ratifiers/interfaces/ISetterRatifier.sol"
object "SetterRatifier_8822" {
    code {
        /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."
        mstore(64, memoryguard(160))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := copy_arguments_for_constructor_8709_object_SetterRatifier_8822()
        constructor_SetterRatifier_8822(_1)

        let _2 := allocate_unbounded()
        codecopy(_2, dataoffset("SetterRatifier_8822_deployed"), datasize("SetterRatifier_8822_deployed"))

        setimmutable(_2, "8693", mload(128))

        return(_2, datasize("SetterRatifier_8822_deployed"))

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

        function copy_arguments_for_constructor_8709_object_SetterRatifier_8822() -> ret_param_0 {

            let programSize := datasize("SetterRatifier_8822")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0 := abi_decode_tuple_t_address_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }

        /// @ast-id 8709
        /// @src 22:992:1060  "constructor(address _midnight) {..."
        function constructor_SetterRatifier_8822(var__midnight_8701) {

            /// @src 22:992:1060  "constructor(address _midnight) {..."
            constructor_ISetterRatifier_8935()

            /// @src 22:1044:1053  "_midnight"
            let _3 := var__midnight_8701
            let expr_8705 := _3
            /// @src 22:1033:1053  "MIDNIGHT = _midnight"
            let _4 := expr_8705
            mstore(128, _4)
            let expr_8706 := expr_8705

        }
        /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

        /// @src 24:170:779  "interface ISetterRatifier is IRatifier {..."
        function constructor_ISetterRatifier_8935() {

            /// @src 24:170:779  "interface ISetterRatifier is IRatifier {..."
            constructor_IRatifier_4910()

        }
        /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

        /// @src 6:152:279  "interface IRatifier {..."
        function constructor_IRatifier_4910() {

            /// @src 6:152:279  "interface IRatifier {..."

        }
        /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

    }
    /// @use-src 7:"deps/midnight/src/libraries/ConstantsLib.sol", 22:"deps/midnight/src/ratifiers/SetterRatifier.sol", 25:"deps/midnight/src/ratifiers/libraries/HashLib.sol"
    object "SetterRatifier_8822_deployed" {
        code {
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x2fd0e45d
                {
                    // setIsRootRatified(address,bytes32,bool)

                    external_fun_setIsRootRatified_8753()
                }

                case 0x675ef8d3
                {
                    // isRatified(((address,(address,uint256,uint256,address)[],uint256,uint256,address,address),bool,address,uint256,uint256,uint256,bytes32,address,bytes,address,address,bool,uint256,uint256),bytes)

                    external_fun_isRatified_8821()
                }

                case 0x698a554e
                {
                    // isRootRatified(address,bytes32)

                    external_fun_isRootRatified_8699()
                }

                case 0xdc400c12
                {
                    // MIDNIGHT()

                    external_fun_MIDNIGHT_8693()
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

            function abi_decode_tuple_t_addresst_bytes32t_bool(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_setIsRootRatified_8753() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_bytes32t_bool(4, calldatasize())
                fun_setIsRootRatified_8753(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

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

            function external_fun_isRatified_8821() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_struct$_Offer_$4210_memory_ptrt_bytes_memory_ptr(4, calldatasize())
                let ret_0 :=  fun_isRatified_8821(param_0, param_1)
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

            /// @ast-id 8699
            /// @src 22:908:985  "mapping(address maker => mapping(bytes32 root => bool)) public isRootRatified"
            function getter_fun_isRootRatified_8699(key_0, key_1) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_bool_$_$_of_t_address(slot, key_0)

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_bool_$_of_t_bytes32(slot, key_1)

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_isRootRatified_8699() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_bytes32(4, calldatasize())
                let ret_0 :=  getter_fun_isRootRatified_8699(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            /// @ast-id 8693
            /// @src 22:868:901  "address public immutable MIDNIGHT"
            function getter_fun_MIDNIGHT_8693() -> rval {

                rval := loadimmutable("8693")

            }
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_MIDNIGHT_8693() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_MIDNIGHT_8693()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
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

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            function require_helper_t_error_8894_Unauthorized(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x82b4290000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

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

            /// @ast-id 8753
            /// @src 22:1066:1402  "function setIsRootRatified(address maker, bytes32 root, bool newIsRootRatified) public {..."
            function fun_setIsRootRatified_8753(var_maker_8711, var_root_8713, var_newIsRootRatified_8715) {

                /// @src 22:1171:1176  "maker"
                let _1 := var_maker_8711
                let expr_8719 := _1
                /// @src 22:1180:1190  "msg.sender"
                let expr_8721 := caller()
                /// @src 22:1171:1190  "maker == msg.sender"
                let expr_8722 := eq(cleanup_t_address(expr_8719), cleanup_t_address(expr_8721))
                /// @src 22:1171:1245  "maker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(maker, msg.sender)"
                let expr_8731 := expr_8722
                if iszero(expr_8731) {
                    /// @src 22:1204:1212  "MIDNIGHT"
                    let _2 := loadimmutable("8693")
                    let expr_8724 := _2
                    /// @src 22:1194:1213  "IMidnight(MIDNIGHT)"
                    let expr_8725_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_8724)
                    /// @src 22:1194:1226  "IMidnight(MIDNIGHT).isAuthorized"
                    let expr_8726_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_8725_address)
                    let expr_8726_functionSelector := 0x65e4ad9e
                    /// @src 22:1227:1232  "maker"
                    let _3 := var_maker_8711
                    let expr_8727 := _3
                    /// @src 22:1234:1244  "msg.sender"
                    let expr_8729 := caller()
                    /// @src 22:1194:1245  "IMidnight(MIDNIGHT).isAuthorized(maker, msg.sender)"

                    // storage for arguments and returned data
                    let _4 := allocate_unbounded()
                    mstore(_4, shift_left_224(expr_8726_functionSelector))
                    let _5 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_4, 4) , expr_8727, expr_8729)

                    let _6 := staticcall(gas(), expr_8726_address,  _4, sub(_5, _4), _4, 32)

                    if iszero(_6) { revert_forward_1() }

                    let expr_8730
                    if _6 {

                        let _7 := 32

                        if gt(_7, returndatasize()) {
                            _7 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_4, _7)

                        // decode return parameters from external try-call into retVars
                        expr_8730 :=  abi_decode_tuple_t_bool_fromMemory(_4, add(_4, _7))
                    }
                    /// @src 22:1171:1245  "maker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(maker, msg.sender)"
                    expr_8731 := expr_8730
                }
                /// @src 22:1163:1262  "require(maker == msg.sender || IMidnight(MIDNIGHT).isAuthorized(maker, msg.sender), Unauthorized())"
                require_helper_t_error_8894_Unauthorized(expr_8731)
                /// @src 22:1302:1319  "newIsRootRatified"
                let _8 := var_newIsRootRatified_8715
                let expr_8741 := _8
                /// @src 22:1272:1286  "isRootRatified"
                let _9_slot := 0x00
                let expr_8736_slot := _9_slot
                /// @src 22:1287:1292  "maker"
                let _10 := var_maker_8711
                let expr_8737 := _10
                /// @src 22:1272:1293  "isRootRatified[maker]"
                let _11 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_bool_$_$_of_t_address(expr_8736_slot,expr_8737)
                let _12_slot := _11
                let expr_8739_slot := _12_slot
                /// @src 22:1294:1298  "root"
                let _13 := var_root_8713
                let expr_8738 := _13
                /// @src 22:1272:1299  "isRootRatified[maker][root]"
                let _14 := mapping_index_access_t_mapping$_t_bytes32_$_t_bool_$_of_t_bytes32(expr_8739_slot,expr_8738)
                /// @src 22:1272:1319  "isRootRatified[maker][root] = newIsRootRatified"
                update_storage_value_offset_0_t_bool_to_t_bool(_14, expr_8741)
                let expr_8742 := expr_8741
                /// @src 22:1352:1362  "msg.sender"
                let expr_8746 := caller()
                /// @src 22:1364:1369  "maker"
                let _15 := var_maker_8711
                let expr_8747 := _15
                /// @src 22:1371:1375  "root"
                let _16 := var_root_8713
                let expr_8748 := _16
                /// @src 22:1377:1394  "newIsRootRatified"
                let _17 := var_newIsRootRatified_8715
                let expr_8749 := _17
                /// @src 22:1334:1395  "SetIsRootRatified(msg.sender, maker, root, newIsRootRatified)"
                let _18 := 0x1b3c916383c77df46e76904b45e2acbf60ada4dc6992cfcd731c5e0944800efe
                let _19 := convert_t_address_to_t_address(expr_8746)
                let _20 := convert_t_address_to_t_address(expr_8747)
                let _21 := convert_t_bytes32_to_t_bytes32(expr_8748)
                {
                    let _22 := allocate_unbounded()
                    let _23 := abi_encode_tuple_t_bool__to_t_bool__fromStack(_22 , expr_8749)
                    log4(_22, sub(_23, _22) , _18, _19, _20, _21)
                }
            }
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

            function zero_value_for_split_t_bytes32() -> ret {
                ret := 0
            }

            function require_helper_t_error_8896_NotMidnight(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x1e6a35c700000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function abi_decode_t_bytes32_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_bytes32(value)
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

            function abi_decode_tuple_t_bytes32t_uint256t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

                {

                    let offset := mload(add(headStart, 64))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value2 := abi_decode_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function require_helper_t_error_8892_InvalidProof(condition ) {
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

            function require_helper_t_error_8898_NotRatified(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x5f9fdfe800000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @src 7:1109:1189  "bytes32 constant CALLBACK_SUCCESS = keccak256(\"morpho.midnight.callbackSuccess\")"
            function constant_CALLBACK_SUCCESS_4986() -> ret {
                /// @src 7:1145:1189  "keccak256(\"morpho.midnight.callbackSuccess\")"
                let expr_4985 := 0x7f87788ea698181ea4d28d1576d0ba4fc92c0dbe5bf75b43692af2ce91dbaea2
                let _40 := expr_4985

                ret := _40
            }

            /// @ast-id 8821
            /// @src 22:1408:1906  "function isRatified(Offer memory offer, bytes memory ratifierData) external view returns (bytes32) {..."
            function fun_isRatified_8821(var_offer_8756_mpos, var_ratifierData_8758_mpos) -> var__8761 {
                /// @src 22:1498:1505  "bytes32"
                let zero_t_bytes32_24 := zero_value_for_split_t_bytes32()
                var__8761 := zero_t_bytes32_24

                /// @src 22:1525:1535  "msg.sender"
                let expr_8765 := caller()
                /// @src 22:1539:1547  "MIDNIGHT"
                let _25 := loadimmutable("8693")
                let expr_8766 := _25
                /// @src 22:1525:1547  "msg.sender == MIDNIGHT"
                let expr_8767 := eq(cleanup_t_address(expr_8765), cleanup_t_address(expr_8766))
                /// @src 22:1517:1563  "require(msg.sender == MIDNIGHT, NotMidnight())"
                require_helper_t_error_8896_NotMidnight(expr_8767)
                /// @src 22:1656:1668  "ratifierData"
                let _26_mpos := var_ratifierData_8758_mpos
                let expr_8781_mpos := _26_mpos
                /// @src 22:1645:1700  "abi.decode(ratifierData, (bytes32, uint256, bytes32[]))"

                let expr_8790_component_1, expr_8790_component_2, expr_8790_component_3_mpos :=  abi_decode_tuple_t_bytes32t_uint256t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(add(expr_8781_mpos, 32), add(add(expr_8781_mpos, 32), array_length_t_bytes_memory_ptr(expr_8781_mpos)))
                /// @src 22:1573:1700  "(bytes32 root, uint256 leafIndex, bytes32[] memory proof) =..."
                let var_root_8773 := expr_8790_component_1
                let var_leafIndex_8775 := expr_8790_component_2
                let var_proof_8778_mpos := expr_8790_component_3_mpos
                /// @src 22:1718:1725  "HashLib"
                let expr_8793_address := linkersymbol("deps/midnight/src/ratifiers/libraries/HashLib.sol:HashLib")
                /// @src 22:1733:1737  "root"
                let _27 := var_root_8773
                let expr_8795 := _27
                /// @src 22:1739:1746  "HashLib"
                let expr_8796_address := linkersymbol("deps/midnight/src/ratifiers/libraries/HashLib.sol:HashLib")
                /// @src 22:1757:1762  "offer"
                let _28_mpos := var_offer_8756_mpos
                let expr_8798_mpos := _28_mpos
                /// @src 22:1739:1763  "HashLib.hashOffer(offer)"
                let expr_8799 := fun_hashOffer_9325(expr_8798_mpos)
                /// @src 22:1765:1774  "leafIndex"
                let _29 := var_leafIndex_8775
                let expr_8800 := _29
                /// @src 22:1776:1781  "proof"
                let _30_mpos := var_proof_8778_mpos
                let expr_8801_mpos := _30_mpos
                /// @src 22:1718:1782  "HashLib.isLeaf(root, HashLib.hashOffer(offer), leafIndex, proof)"
                let expr_8802 := fun_isLeaf_9169(expr_8795, expr_8799, expr_8800, expr_8801_mpos)
                /// @src 22:1710:1799  "require(HashLib.isLeaf(root, HashLib.hashOffer(offer), leafIndex, proof), InvalidProof())"
                require_helper_t_error_8892_InvalidProof(expr_8802)
                /// @src 22:1817:1831  "isRootRatified"
                let _31_slot := 0x00
                let expr_8808_slot := _31_slot
                /// @src 22:1832:1837  "offer"
                let _32_mpos := var_offer_8756_mpos
                let expr_8809_mpos := _32_mpos
                /// @src 22:1832:1843  "offer.maker"
                let _33 := add(expr_8809_mpos, 64)
                let _34 := read_from_memoryt_address(_33)
                let expr_8810 := _34
                /// @src 22:1817:1844  "isRootRatified[offer.maker]"
                let _35 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_bytes32_$_t_bool_$_$_of_t_address(expr_8808_slot,expr_8810)
                let _36_slot := _35
                let expr_8811_slot := _36_slot
                /// @src 22:1845:1849  "root"
                let _37 := var_root_8773
                let expr_8812 := _37
                /// @src 22:1817:1850  "isRootRatified[offer.maker][root]"
                let _38 := mapping_index_access_t_mapping$_t_bytes32_$_t_bool_$_of_t_bytes32(expr_8811_slot,expr_8812)
                let _39 := read_from_storage_split_offset_0_t_bool(_38)
                let expr_8813 := _39
                /// @src 22:1809:1866  "require(isRootRatified[offer.maker][root], NotRatified())"
                require_helper_t_error_8898_NotRatified(expr_8813)
                /// @src 22:1883:1899  "CALLBACK_SUCCESS"
                let expr_8818 := constant_CALLBACK_SUCCESS_4986()
                /// @src 22:1876:1899  "return CALLBACK_SUCCESS"
                var__8761 := expr_8818
                leave

            }
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

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
                let _42 := convert_t_rational_68769752797877666667288518791890740497316252341308469040564434923308253667740_by_1_to_t_bytes32(expr_8952)

                ret := _42
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

            function read_from_memoryt_bytes32(ptr) -> returnValue {

                let value := cleanup_t_bytes32(mload(ptr))

                returnValue :=

                value

            }

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
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
                let zero_t_bytes32_41 := zero_value_for_split_t_bytes32()
                var__9283 := zero_t_bytes32_41

                /// @src 25:6302:6316  "OFFER_TYPEHASH"
                let expr_9288 := constant_OFFER_TYPEHASH_8953()
                /// @src 25:6345:6350  "offer"
                let _43_mpos := var_offer_9280_mpos
                let expr_9290_mpos := _43_mpos
                /// @src 25:6345:6357  "offer.market"
                let _44 := add(expr_9290_mpos, 0)
                let _45_mpos := mload(_44)
                let expr_9291_mpos := _45_mpos
                /// @src 25:6334:6358  "hashMarket(offer.market)"
                let expr_9292 := fun_hashMarket_9276(expr_9291_mpos)
                /// @src 25:6376:6381  "offer"
                let _46_mpos := var_offer_9280_mpos
                let expr_9293_mpos := _46_mpos
                /// @src 25:6376:6385  "offer.buy"
                let _47 := add(expr_9293_mpos, 32)
                let _48 := read_from_memoryt_bool(_47)
                let expr_9294 := _48
                /// @src 25:6403:6408  "offer"
                let _49_mpos := var_offer_9280_mpos
                let expr_9295_mpos := _49_mpos
                /// @src 25:6403:6414  "offer.maker"
                let _50 := add(expr_9295_mpos, 64)
                let _51 := read_from_memoryt_address(_50)
                let expr_9296 := _51
                /// @src 25:6432:6437  "offer"
                let _52_mpos := var_offer_9280_mpos
                let expr_9297_mpos := _52_mpos
                /// @src 25:6432:6443  "offer.start"
                let _53 := add(expr_9297_mpos, 96)
                let _54 := read_from_memoryt_uint256(_53)
                let expr_9298 := _54
                /// @src 25:6461:6466  "offer"
                let _55_mpos := var_offer_9280_mpos
                let expr_9299_mpos := _55_mpos
                /// @src 25:6461:6473  "offer.expiry"
                let _56 := add(expr_9299_mpos, 128)
                let _57 := read_from_memoryt_uint256(_56)
                let expr_9300 := _57
                /// @src 25:6491:6496  "offer"
                let _58_mpos := var_offer_9280_mpos
                let expr_9301_mpos := _58_mpos
                /// @src 25:6491:6501  "offer.tick"
                let _59 := add(expr_9301_mpos, 160)
                let _60 := read_from_memoryt_uint256(_59)
                let expr_9302 := _60
                /// @src 25:6519:6524  "offer"
                let _61_mpos := var_offer_9280_mpos
                let expr_9303_mpos := _61_mpos
                /// @src 25:6519:6530  "offer.group"
                let _62 := add(expr_9303_mpos, 192)
                let _63 := read_from_memoryt_bytes32(_62)
                let expr_9304 := _63
                /// @src 25:6548:6553  "offer"
                let _64_mpos := var_offer_9280_mpos
                let expr_9305_mpos := _64_mpos
                /// @src 25:6548:6562  "offer.callback"
                let _65 := add(expr_9305_mpos, 224)
                let _66 := read_from_memoryt_address(_65)
                let expr_9306 := _66
                /// @src 25:6590:6595  "offer"
                let _67_mpos := var_offer_9280_mpos
                let expr_9308_mpos := _67_mpos
                /// @src 25:6590:6608  "offer.callbackData"
                let _68 := add(expr_9308_mpos, 256)
                let _69_mpos := mload(_68)
                let expr_9309_mpos := _69_mpos
                /// @src 25:6580:6609  "keccak256(offer.callbackData)"
                let expr_9310 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_9309_mpos), array_length_t_bytes_memory_ptr(expr_9309_mpos))
                /// @src 25:6627:6632  "offer"
                let _70_mpos := var_offer_9280_mpos
                let expr_9311_mpos := _70_mpos
                /// @src 25:6627:6656  "offer.receiverIfMakerIsSeller"
                let _71 := add(expr_9311_mpos, 288)
                let _72 := read_from_memoryt_address(_71)
                let expr_9312 := _72
                /// @src 25:6674:6679  "offer"
                let _73_mpos := var_offer_9280_mpos
                let expr_9313_mpos := _73_mpos
                /// @src 25:6674:6688  "offer.ratifier"
                let _74 := add(expr_9313_mpos, 320)
                let _75 := read_from_memoryt_address(_74)
                let expr_9314 := _75
                /// @src 25:6706:6711  "offer"
                let _76_mpos := var_offer_9280_mpos
                let expr_9315_mpos := _76_mpos
                /// @src 25:6706:6722  "offer.reduceOnly"
                let _77 := add(expr_9315_mpos, 352)
                let _78 := read_from_memoryt_bool(_77)
                let expr_9316 := _78
                /// @src 25:6740:6745  "offer"
                let _79_mpos := var_offer_9280_mpos
                let expr_9317_mpos := _79_mpos
                /// @src 25:6740:6754  "offer.maxUnits"
                let _80 := add(expr_9317_mpos, 384)
                let _81 := read_from_memoryt_uint256(_80)
                let expr_9318 := _81
                /// @src 25:6772:6777  "offer"
                let _82_mpos := var_offer_9280_mpos
                let expr_9319_mpos := _82_mpos
                /// @src 25:6772:6787  "offer.maxAssets"
                let _83 := add(expr_9319_mpos, 416)
                let _84 := read_from_memoryt_uint256(_83)
                let expr_9320 := _84
                /// @src 25:6274:6801  "abi.encode(..."

                let expr_9321_mpos := allocate_unbounded()
                let _85 := add(expr_9321_mpos, 0x20)

                let _86 := abi_encode_tuple_t_bytes32_t_bytes32_t_bool_t_address_t_uint256_t_uint256_t_uint256_t_bytes32_t_address_t_bytes32_t_address_t_address_t_bool_t_uint256_t_uint256__to_t_bytes32_t_bytes32_t_bool_t_address_t_uint256_t_uint256_t_uint256_t_bytes32_t_address_t_bytes32_t_address_t_address_t_bool_t_uint256_t_uint256__fromStack(_85, expr_9288, expr_9292, expr_9294, expr_9296, expr_9298, expr_9300, expr_9302, expr_9304, expr_9306, expr_9310, expr_9312, expr_9314, expr_9316, expr_9318, expr_9320)
                mstore(expr_9321_mpos, sub(_86, add(expr_9321_mpos, 0x20)))
                finalize_allocation(expr_9321_mpos, sub(_86, expr_9321_mpos))
                /// @src 25:6251:6811  "keccak256(..."
                let expr_9322 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_9321_mpos), array_length_t_bytes_memory_ptr(expr_9321_mpos))
                /// @src 25:6244:6811  "return keccak256(..."
                var__9283 := expr_9322
                leave

            }
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function array_length_t_array$_t_bytes32_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function shift_right_t_uint256_t_uint256(value, bits) -> result {
                bits := cleanup_t_uint256(bits)
                result := cleanup_t_uint256(shift_right_unsigned_dynamic(bits, cleanup_t_uint256(value)))
            }

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
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
                let zero_t_bool_87 := zero_value_for_split_t_bool()
                var__9110 := zero_t_bool_87

                /// @src 25:3921:3930  "leafIndex"
                let _88 := var_leafIndex_9104
                let expr_9113 := _88
                /// @src 25:3934:3939  "proof"
                let _89_mpos := var_proof_9107_mpos
                let expr_9114_mpos := _89_mpos
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
                let _90 := var_leafHash_9102
                let expr_9125 := _90
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
                    let _92 := var_i_9128
                    let _91 := increment_wrapping_t_uint256(_92)
                    var_i_9128 := _91
                    let expr_9136 := _92
                }
                {
                    /// @src 25:4045:4046  "i"
                    let _93 := var_i_9128
                    let expr_9131 := _93
                    /// @src 25:4049:4054  "proof"
                    let _94_mpos := var_proof_9107_mpos
                    let expr_9132_mpos := _94_mpos
                    /// @src 25:4049:4061  "proof.length"
                    let expr_9133 := array_length_t_array$_t_bytes32_$dyn_memory_ptr(expr_9132_mpos)
                    /// @src 25:4045:4061  "i < proof.length"
                    let expr_9134 := lt(cleanup_t_uint256(expr_9131), cleanup_t_uint256(expr_9133))
                    if iszero(expr_9134) { break }
                    /// @src 25:4097:4106  "leafIndex"
                    let _95 := var_leafIndex_9104
                    let expr_9139 := _95
                    /// @src 25:4110:4111  "i"
                    let _96 := var_i_9128
                    let expr_9140 := _96
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
                        let _97_mpos := var_proof_9107_mpos
                        let expr_9154_mpos := _97_mpos
                        /// @src 25:4173:4174  "i"
                        let _98 := var_i_9128
                        let expr_9155 := _98
                        /// @src 25:4167:4175  "proof[i]"
                        let _99 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_9154_mpos, expr_9155))
                        let expr_9156 := _99
                        /// @src 25:4177:4188  "currentHash"
                        let _100 := var_currentHash_9124
                        let expr_9157 := _100
                        /// @src 25:4158:4189  "hashNode(proof[i], currentHash)"
                        let expr_9158 := fun_hashNode_9181(expr_9156, expr_9157)
                        /// @src 25:4096:4189  "(leafIndex >> i) & 1 == 0 ? hashNode(currentHash, proof[i]) : hashNode(proof[i], currentHash)"
                        expr_9159 := expr_9158
                    }
                    default {
                        /// @src 25:4133:4144  "currentHash"
                        let _101 := var_currentHash_9124
                        let expr_9148 := _101
                        /// @src 25:4146:4151  "proof"
                        let _102_mpos := var_proof_9107_mpos
                        let expr_9149_mpos := _102_mpos
                        /// @src 25:4152:4153  "i"
                        let _103 := var_i_9128
                        let expr_9150 := _103
                        /// @src 25:4146:4154  "proof[i]"
                        let _104 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_9149_mpos, expr_9150))
                        let expr_9151 := _104
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
                let _105 := var_currentHash_9124
                let expr_9164 := _105
                /// @src 25:4231:4235  "root"
                let _106 := var_root_9100
                let expr_9165 := _106
                /// @src 25:4216:4235  "currentHash == root"
                let expr_9166 := eq(cleanup_t_bytes32(expr_9164), cleanup_t_bytes32(expr_9165))
                /// @src 25:4209:4235  "return currentHash == root"
                var__9110 := expr_9166
                leave

            }
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

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
                let _126 := convert_t_rational_24200669282116936182035894255520409376334054108231253457609625050124993130030_by_1_to_t_bytes32(expr_8948)

                ret := _126
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
                let zero_t_bytes32_107 := zero_value_for_split_t_bytes32()
                var__9213 := zero_t_bytes32_107

                /// @src 25:5241:5247  "market"
                let _108_mpos := var_market_9210_mpos
                let expr_9223_mpos := _108_mpos
                /// @src 25:5241:5264  "market.collateralParams"
                let _109 := add(expr_9223_mpos, 32)
                let _110_mpos := mload(_109)
                let expr_9224_mpos := _110_mpos
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
                    let _112 := var_i_9229
                    let _111 := increment_wrapping_t_uint256(_112)
                    var_i_9229 := _111
                    let expr_9238 := _112
                }
                {
                    /// @src 25:5302:5303  "i"
                    let _113 := var_i_9229
                    let expr_9232 := _113
                    /// @src 25:5306:5312  "market"
                    let _114_mpos := var_market_9210_mpos
                    let expr_9233_mpos := _114_mpos
                    /// @src 25:5306:5329  "market.collateralParams"
                    let _115 := add(expr_9233_mpos, 32)
                    let _116_mpos := mload(_115)
                    let expr_9234_mpos := _116_mpos
                    /// @src 25:5306:5336  "market.collateralParams.length"
                    let expr_9235 := array_length_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_9234_mpos)
                    /// @src 25:5302:5336  "i < market.collateralParams.length"
                    let expr_9236 := lt(cleanup_t_uint256(expr_9232), cleanup_t_uint256(expr_9235))
                    if iszero(expr_9236) { break }
                    /// @src 25:5406:5412  "market"
                    let _117_mpos := var_market_9210_mpos
                    let expr_9244_mpos := _117_mpos
                    /// @src 25:5406:5429  "market.collateralParams"
                    let _118 := add(expr_9244_mpos, 32)
                    let _119_mpos := mload(_118)
                    let expr_9245_mpos := _119_mpos
                    /// @src 25:5430:5431  "i"
                    let _120 := var_i_9229
                    let expr_9246 := _120
                    /// @src 25:5406:5432  "market.collateralParams[i]"
                    let _121_mpos := mload(memory_array_index_access_t_array$_t_struct$_CollateralParams_$4180_memory_ptr_$dyn_memory_ptr(expr_9245_mpos, expr_9246))
                    let expr_9247_mpos := _121_mpos
                    /// @src 25:5385:5433  "hashCollateralParams(market.collateralParams[i])"
                    let expr_9248 := fun_hashCollateralParams_9206(expr_9247_mpos)
                    /// @src 25:5357:5379  "collateralParamsHashes"
                    let _122_mpos := var_collateralParamsHashes_9219_mpos
                    let expr_9240_mpos := _122_mpos
                    /// @src 25:5380:5381  "i"
                    let _123 := var_i_9229
                    let expr_9241 := _123
                    /// @src 25:5357:5433  "collateralParamsHashes[i] = hashCollateralParams(market.collateralParams[i])"
                    let _124 := expr_9248
                    write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_9240_mpos, expr_9241), _124)
                    let expr_9249 := expr_9248
                }
                /// @src 25:5454:5482  "bytes32 collateralParamsHash"
                let var_collateralParamsHash_9254
                let zero_t_bytes32_125 := zero_value_for_split_t_bytes32()
                var_collateralParamsHash_9254 := zero_t_bytes32_125
                /// @src 25:5564:5769  "assembly (\"memory-safe\") {..."
                {
                    var_collateralParamsHash_9254 := keccak256(add(var_collateralParamsHashes_9219_mpos, 0x20), mul(mload(var_collateralParamsHashes_9219_mpos), 0x20))
                }
                /// @src 25:5837:5852  "MARKET_TYPEHASH"
                let expr_9260 := constant_MARKET_TYPEHASH_8949()
                /// @src 25:5870:5876  "market"
                let _127_mpos := var_market_9210_mpos
                let expr_9261_mpos := _127_mpos
                /// @src 25:5870:5886  "market.loanToken"
                let _128 := add(expr_9261_mpos, 0)
                let _129 := read_from_memoryt_address(_128)
                let expr_9262 := _129
                /// @src 25:5904:5924  "collateralParamsHash"
                let _130 := var_collateralParamsHash_9254
                let expr_9263 := _130
                /// @src 25:5942:5948  "market"
                let _131_mpos := var_market_9210_mpos
                let expr_9264_mpos := _131_mpos
                /// @src 25:5942:5957  "market.maturity"
                let _132 := add(expr_9264_mpos, 64)
                let _133 := read_from_memoryt_uint256(_132)
                let expr_9265 := _133
                /// @src 25:5975:5981  "market"
                let _134_mpos := var_market_9210_mpos
                let expr_9266_mpos := _134_mpos
                /// @src 25:5975:5994  "market.rcfThreshold"
                let _135 := add(expr_9266_mpos, 96)
                let _136 := read_from_memoryt_uint256(_135)
                let expr_9267 := _136
                /// @src 25:6012:6018  "market"
                let _137_mpos := var_market_9210_mpos
                let expr_9268_mpos := _137_mpos
                /// @src 25:6012:6028  "market.enterGate"
                let _138 := add(expr_9268_mpos, 128)
                let _139 := read_from_memoryt_address(_138)
                let expr_9269 := _139
                /// @src 25:6046:6052  "market"
                let _140_mpos := var_market_9210_mpos
                let expr_9270_mpos := _140_mpos
                /// @src 25:6046:6067  "market.liquidatorGate"
                let _141 := add(expr_9270_mpos, 160)
                let _142 := read_from_memoryt_address(_141)
                let expr_9271 := _142
                /// @src 25:5809:6081  "abi.encode(..."

                let expr_9272_mpos := allocate_unbounded()
                let _143 := add(expr_9272_mpos, 0x20)

                let _144 := abi_encode_tuple_t_bytes32_t_address_t_bytes32_t_uint256_t_uint256_t_address_t_address__to_t_bytes32_t_address_t_bytes32_t_uint256_t_uint256_t_address_t_address__fromStack(_143, expr_9260, expr_9262, expr_9263, expr_9265, expr_9267, expr_9269, expr_9271)
                mstore(expr_9272_mpos, sub(_144, add(expr_9272_mpos, 0x20)))
                finalize_allocation(expr_9272_mpos, sub(_144, expr_9272_mpos))
                /// @src 25:5786:6091  "keccak256(..."
                let expr_9273 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_9272_mpos), array_length_t_bytes_memory_ptr(expr_9272_mpos))
                /// @src 25:5779:6091  "return keccak256(..."
                var__9213 := expr_9273
                leave

            }
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

            /// @ast-id 9181
            /// @src 25:4328:4571  "function hashNode(bytes32 left, bytes32 right) internal pure returns (bytes32 value) {..."
            function fun_hashNode_9181(var_left_9172, var_right_9174) -> var_value_9177 {
                /// @src 25:4398:4411  "bytes32 value"
                let zero_t_bytes32_145 := zero_value_for_split_t_bytes32()
                var_value_9177 := zero_t_bytes32_145

                /// @src 25:4423:4565  "assembly (\"memory-safe\") {..."
                {
                    mstore(0x00, var_left_9172)
                    mstore(0x20, var_right_9174)
                    var_value_9177 := keccak256(0x00, 0x40)
                }

            }
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

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
                let _147 := convert_t_rational_79276057443242824598701412555500554287286532544607853751535428707705631729327_by_1_to_t_bytes32(expr_8944)

                ret := _147
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
                let zero_t_bytes32_146 := zero_value_for_split_t_bytes32()
                var__9188 := zero_t_bytes32_146

                /// @src 25:4818:4844  "COLLATERAL_PARAMS_TYPEHASH"
                let expr_9193 := constant_COLLATERAL_PARAMS_TYPEHASH_8945()
                /// @src 25:4862:4878  "collateralParams"
                let _148_mpos := var_collateralParams_9185_mpos
                let expr_9194_mpos := _148_mpos
                /// @src 25:4862:4884  "collateralParams.token"
                let _149 := add(expr_9194_mpos, 0)
                let _150 := read_from_memoryt_address(_149)
                let expr_9195 := _150
                /// @src 25:4902:4918  "collateralParams"
                let _151_mpos := var_collateralParams_9185_mpos
                let expr_9196_mpos := _151_mpos
                /// @src 25:4902:4923  "collateralParams.lltv"
                let _152 := add(expr_9196_mpos, 32)
                let _153 := read_from_memoryt_uint256(_152)
                let expr_9197 := _153
                /// @src 25:4941:4957  "collateralParams"
                let _154_mpos := var_collateralParams_9185_mpos
                let expr_9198_mpos := _154_mpos
                /// @src 25:4941:4964  "collateralParams.maxLif"
                let _155 := add(expr_9198_mpos, 64)
                let _156 := read_from_memoryt_uint256(_155)
                let expr_9199 := _156
                /// @src 25:4982:4998  "collateralParams"
                let _157_mpos := var_collateralParams_9185_mpos
                let expr_9200_mpos := _157_mpos
                /// @src 25:4982:5005  "collateralParams.oracle"
                let _158 := add(expr_9200_mpos, 96)
                let _159 := read_from_memoryt_address(_158)
                let expr_9201 := _159
                /// @src 25:4790:5019  "abi.encode(..."

                let expr_9202_mpos := allocate_unbounded()
                let _160 := add(expr_9202_mpos, 0x20)

                let _161 := abi_encode_tuple_t_bytes32_t_address_t_uint256_t_uint256_t_address__to_t_bytes32_t_address_t_uint256_t_uint256_t_address__fromStack(_160, expr_9193, expr_9195, expr_9197, expr_9199, expr_9201)
                mstore(expr_9202_mpos, sub(_161, add(expr_9202_mpos, 0x20)))
                finalize_allocation(expr_9202_mpos, sub(_161, expr_9202_mpos))
                /// @src 25:4767:5029  "keccak256(..."
                let expr_9203 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_9202_mpos), array_length_t_bytes_memory_ptr(expr_9202_mpos))
                /// @src 25:4760:5029  "return keccak256(..."
                var__9188 := expr_9203
                leave

            }
            /// @src 22:819:1908  "contract SetterRatifier is ISetterRatifier {..."

        }

        data ".metadata" hex"a26469706673582212202560475cfa28437cb484cb1ea5efef18dc479be6b5962caf9ef3e25cd8c3371264736f6c63430008220033"
    }

}

