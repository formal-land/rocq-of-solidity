
/// @use-src 14:"deps/midnight/src/periphery/EcrecoverAuthorizer.sol", 18:"deps/midnight/src/periphery/interfaces/IEcrecoverAuthorizer.sol"
object "EcrecoverAuthorizer_6335" {
    code {
        /// @src 14:485:1937  "contract EcrecoverAuthorizer is IEcrecoverAuthorizer {..."
        mstore(64, memoryguard(160))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := copy_arguments_for_constructor_6198_object_EcrecoverAuthorizer_6335()
        constructor_EcrecoverAuthorizer_6335(_1)

        let _2 := allocate_unbounded()
        codecopy(_2, dataoffset("EcrecoverAuthorizer_6335_deployed"), datasize("EcrecoverAuthorizer_6335_deployed"))

        setimmutable(_2, "6184", mload(128))

        return(_2, datasize("EcrecoverAuthorizer_6335_deployed"))

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

        function copy_arguments_for_constructor_6198_object_EcrecoverAuthorizer_6335() -> ret_param_0 {

            let programSize := datasize("EcrecoverAuthorizer_6335")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0 := abi_decode_tuple_t_address_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }

        /// @ast-id 6198
        /// @src 14:630:698  "constructor(address _midnight) {..."
        function constructor_EcrecoverAuthorizer_6335(var__midnight_6190) {

            /// @src 14:630:698  "constructor(address _midnight) {..."
            constructor_IEcrecoverAuthorizer_8223()

            /// @src 14:682:691  "_midnight"
            let _3 := var__midnight_6190
            let expr_6194 := _3
            /// @src 14:671:691  "MIDNIGHT = _midnight"
            let _4 := expr_6194
            mstore(128, _4)
            let expr_6195 := expr_6194

        }
        /// @src 14:485:1937  "contract EcrecoverAuthorizer is IEcrecoverAuthorizer {..."

        /// @src 18:745:1360  "interface IEcrecoverAuthorizer {..."
        function constructor_IEcrecoverAuthorizer_8223() {

            /// @src 18:745:1360  "interface IEcrecoverAuthorizer {..."

        }
        /// @src 14:485:1937  "contract EcrecoverAuthorizer is IEcrecoverAuthorizer {..."

    }
    /// @use-src 14:"deps/midnight/src/periphery/EcrecoverAuthorizer.sol", 18:"deps/midnight/src/periphery/interfaces/IEcrecoverAuthorizer.sol"
    object "EcrecoverAuthorizer_6335_deployed" {
        code {
            /// @src 14:485:1937  "contract EcrecoverAuthorizer is IEcrecoverAuthorizer {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x70ae92d2
                {
                    // nonce(address)

                    external_fun_nonce_6188()
                }

                case 0xda0024bc
                {
                    // setIsAuthorized((address,address,bool,uint256,uint256),(uint8,bytes32,bytes32))

                    external_fun_setIsAuthorized_6334()
                }

                case 0xdc400c12
                {
                    // MIDNIGHT()

                    external_fun_MIDNIGHT_6184()
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

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

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

            /// @ast-id 6188
            /// @src 14:583:623  "mapping(address => uint256) public nonce"
            function getter_fun_nonce_6188(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 14:485:1937  "contract EcrecoverAuthorizer is IEcrecoverAuthorizer {..."

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_nonce_6188() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                let ret_0 :=  getter_fun_nonce_6188(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
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

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            // struct Authorization
            function abi_decode_t_struct$_Authorization_$8169_memory_ptr(headStart, end) -> value {
                if slt(sub(end, headStart), 0xa0) { revert_error_3538a459e4a0eb828f1aed5ebe5dc96fe59620a31d9b33e41259bb820cae769f() }
                value := allocate_memory(0xa0)

                {
                    // authorizer

                    let offset := 0

                    mstore(add(value, 0x00), abi_decode_t_address(add(headStart, offset), end))

                }

                {
                    // authorized

                    let offset := 32

                    mstore(add(value, 0x20), abi_decode_t_address(add(headStart, offset), end))

                }

                {
                    // isAuthorized

                    let offset := 64

                    mstore(add(value, 0x40), abi_decode_t_bool(add(headStart, offset), end))

                }

                {
                    // nonce

                    let offset := 96

                    mstore(add(value, 0x60), abi_decode_t_uint256(add(headStart, offset), end))

                }

                {
                    // deadline

                    let offset := 128

                    mstore(add(value, 0x80), abi_decode_t_uint256(add(headStart, offset), end))

                }

            }

            function revert_error_21fe6b43b4db61d76a176e95bf1a6b9ede4c301f93a4246f41fecb96e160861d() {
                revert(0, 0)
            }

            // struct Signature
            function abi_decode_t_struct$_Signature_$8158_calldata_ptr(offset, end) -> value {
                if slt(sub(end, offset), 96) { revert_error_21fe6b43b4db61d76a176e95bf1a6b9ede4c301f93a4246f41fecb96e160861d() }
                value := offset
            }

            function abi_decode_tuple_t_struct$_Authorization_$8169_memory_ptrt_struct$_Signature_$8158_calldata_ptr(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 256) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_struct$_Authorization_$8169_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 160

                    value1 := abi_decode_t_struct$_Signature_$8158_calldata_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_setIsAuthorized_6334() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_struct$_Authorization_$8169_memory_ptrt_struct$_Signature_$8158_calldata_ptr(4, calldatasize())
                fun_setIsAuthorized_6334(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            /// @ast-id 6184
            /// @src 14:544:577  "address public immutable MIDNIGHT"
            function getter_fun_MIDNIGHT_6184() -> rval {

                rval := loadimmutable("6184")

            }
            /// @src 14:485:1937  "contract EcrecoverAuthorizer is IEcrecoverAuthorizer {..."

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_MIDNIGHT_6184() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_MIDNIGHT_6184()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            function require_helper_t_error_8180_Expired(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x203d82d800000000000000000000000000000000000000000000000000000000)
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

            function extract_from_storage_value_offset_0_t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0_t_uint256(sload(slot))

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

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0_t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function require_helper_t_error_8182_InvalidNonce(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x756688fe00000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function cleanup_t_rational_58716139875033191547423680425660227735028985010655085009261943264615620979857_by_1(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_58716139875033191547423680425660227735028985010655085009261943264615620979857_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_58716139875033191547423680425660227735028985010655085009261943264615620979857_by_1(value)))
            }

            /// @src 18:444:552  "bytes32 constant AUTHORIZATION_TYPEHASH = 0x81d0284fb0e2cde18d0553b06189d6f7613c96a01bb5b5e7828eade6a0dcac91"
            function constant_AUTHORIZATION_TYPEHASH_8173() -> ret {
                /// @src 18:486:552  "0x81d0284fb0e2cde18d0553b06189d6f7613c96a01bb5b5e7828eade6a0dcac91"
                let expr_8172 := 0x81d0284fb0e2cde18d0553b06189d6f7613c96a01bb5b5e7828eade6a0dcac91
                let _14 := convert_t_rational_58716139875033191547423680425660227735028985010655085009261943264615620979857_by_1_to_t_bytes32(expr_8172)

                ret := _14
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_t_address_to_t_address(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_uint256_to_t_uint256(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            // struct Authorization -> struct Authorization
            function abi_encode_t_struct$_Authorization_$8169_memory_ptr_to_t_struct$_Authorization_$8169_memory_ptr_fromStack(value, pos)  {
                let tail := add(pos, 0xa0)

                {
                    // authorizer

                    let memberValue0 := mload(add(value, 0x00))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x00))
                }

                {
                    // authorized

                    let memberValue0 := mload(add(value, 0x20))
                    abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x20))
                }

                {
                    // isAuthorized

                    let memberValue0 := mload(add(value, 0x40))
                    abi_encode_t_bool_to_t_bool(memberValue0, add(pos, 0x40))
                }

                {
                    // nonce

                    let memberValue0 := mload(add(value, 0x60))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x60))
                }

                {
                    // deadline

                    let memberValue0 := mload(add(value, 0x80))
                    abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x80))
                }

            }

            function abi_encode_tuple_t_bytes32_t_struct$_Authorization_$8169_memory_ptr__to_t_bytes32_t_struct$_Authorization_$8169_memory_ptr__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 192)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_struct$_Authorization_$8169_memory_ptr_to_t_struct$_Authorization_$8169_memory_ptr_fromStack(value1,  add(headStart, 32))

            }

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function cleanup_t_rational_32523383700587834770323112271211932718128200013265661849047136999858837557784_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_32523383700587834770323112271211932718128200013265661849047136999858837557784_by_1_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(shift_left_0(cleanup_t_rational_32523383700587834770323112271211932718128200013265661849047136999858837557784_by_1(value)))
            }

            /// @src 18:634:742  "bytes32 constant EIP712_DOMAIN_TYPEHASH = 0x47e79534a245952e8b16893a336b85a3d9ea9fa8c573f3d803afb92a79469218"
            function constant_EIP712_DOMAIN_TYPEHASH_8177() -> ret {
                /// @src 18:676:742  "0x47e79534a245952e8b16893a336b85a3d9ea9fa8c573f3d803afb92a79469218"
                let expr_8176 := 0x47e79534a245952e8b16893a336b85a3d9ea9fa8c573f3d803afb92a79469218
                let _18 := convert_t_rational_32523383700587834770323112271211932718128200013265661849047136999858837557784_by_1_to_t_bytes32(expr_8176)

                ret := _18
            }

            function convert_t_contract$_EcrecoverAuthorizer_$6335_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
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

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function validator_revert_t_uint8(value) {
                if iszero(eq(value, cleanup_t_uint8(value))) { revert(0, 0) }
            }

            function read_from_calldatat_uint8(ptr) -> returnValue {

                let value := calldataload(ptr)
                validator_revert_t_uint8(value)

                returnValue :=

                value

            }

            function validator_revert_t_bytes32(value) {
                if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
            }

            function read_from_calldatat_bytes32(ptr) -> returnValue {

                let value := calldataload(ptr)
                validator_revert_t_bytes32(value)

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

            function require_helper_t_error_8184_InvalidSignature(condition ) {
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

            function require_helper_t_error_8186_Unauthorized(condition ) {
                if iszero(condition)
                {

                    let memPtr := 0

                    mstore(memPtr, 0x82b4290000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple__to__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function read_from_memoryt_bool(ptr) -> returnValue {

                let value := cleanup_t_bool(mload(ptr))

                returnValue :=

                value

            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_tuple_t_bool_t_uint256__to_t_bool_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function abi_decode_tuple__fromMemory(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function abi_encode_tuple_t_address_t_bool_t_address__to_t_address_t_bool_t_address__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_bool_to_t_bool_fromStack(value1,  add(headStart, 32))

                abi_encode_t_address_to_t_address_fromStack(value2,  add(headStart, 64))

            }

            /// @ast-id 6334
            /// @src 14:704:1935  "function setIsAuthorized(Authorization memory authorization, Signature calldata signature) external {..."
            function fun_setIsAuthorized_6334(var_authorization_6201_mpos, var_signature_6204_offset) {

                /// @src 14:822:837  "block.timestamp"
                let expr_6209 := timestamp()
                /// @src 14:841:854  "authorization"
                let _1_mpos := var_authorization_6201_mpos
                let expr_6210_mpos := _1_mpos
                /// @src 14:841:863  "authorization.deadline"
                let _2 := add(expr_6210_mpos, 128)
                let _3 := read_from_memoryt_uint256(_2)
                let expr_6211 := _3
                /// @src 14:822:863  "block.timestamp <= authorization.deadline"
                let expr_6212 := iszero(gt(cleanup_t_uint256(expr_6209), cleanup_t_uint256(expr_6211)))
                /// @src 14:814:875  "require(block.timestamp <= authorization.deadline, Expired())"
                require_helper_t_error_8180_Expired(expr_6212)
                /// @src 14:893:906  "authorization"
                let _4_mpos := var_authorization_6201_mpos
                let expr_6218_mpos := _4_mpos
                /// @src 14:893:912  "authorization.nonce"
                let _5 := add(expr_6218_mpos, 96)
                let _6 := read_from_memoryt_uint256(_5)
                let expr_6219 := _6
                /// @src 14:916:921  "nonce"
                let _7_slot := 0x00
                let expr_6220_slot := _7_slot
                /// @src 14:922:935  "authorization"
                let _8_mpos := var_authorization_6201_mpos
                let expr_6221_mpos := _8_mpos
                /// @src 14:922:946  "authorization.authorizer"
                let _9 := add(expr_6221_mpos, 0)
                let _10 := read_from_memoryt_address(_9)
                let expr_6222 := _10
                /// @src 14:916:947  "nonce[authorization.authorizer]"
                let _11 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_6220_slot,expr_6222)
                /// @src 14:916:949  "nonce[authorization.authorizer]++"
                let _13 := read_from_storage_split_offset_0_t_uint256(_11)
                let _12 := increment_t_uint256(_13)
                update_storage_value_offset_0_t_uint256_to_t_uint256(_11, _12)
                let expr_6224 := _13
                /// @src 14:893:949  "authorization.nonce == nonce[authorization.authorizer]++"
                let expr_6225 := eq(cleanup_t_uint256(expr_6219), cleanup_t_uint256(expr_6224))
                /// @src 14:885:966  "require(authorization.nonce == nonce[authorization.authorizer]++, InvalidNonce())"
                require_helper_t_error_8182_InvalidNonce(expr_6225)
                /// @src 14:1019:1041  "AUTHORIZATION_TYPEHASH"
                let expr_6235 := constant_AUTHORIZATION_TYPEHASH_8173()
                /// @src 14:1043:1056  "authorization"
                let _15_mpos := var_authorization_6201_mpos
                let expr_6236_mpos := _15_mpos
                /// @src 14:1008:1057  "abi.encode(AUTHORIZATION_TYPEHASH, authorization)"

                let expr_6237_mpos := allocate_unbounded()
                let _16 := add(expr_6237_mpos, 0x20)

                let _17 := abi_encode_tuple_t_bytes32_t_struct$_Authorization_$8169_memory_ptr__to_t_bytes32_t_struct$_Authorization_$8169_memory_ptr__fromStack(_16, expr_6235, expr_6236_mpos)
                mstore(expr_6237_mpos, sub(_17, add(expr_6237_mpos, 0x20)))
                finalize_allocation(expr_6237_mpos, sub(_17, expr_6237_mpos))
                /// @src 14:998:1058  "keccak256(abi.encode(AUTHORIZATION_TYPEHASH, authorization))"
                let expr_6238 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_6237_mpos), array_length_t_bytes_memory_ptr(expr_6237_mpos))
                /// @src 14:977:1058  "bytes32 hashStruct = keccak256(abi.encode(AUTHORIZATION_TYPEHASH, authorization))"
                let var_hashStruct_6231 := expr_6238
                /// @src 14:1115:1137  "EIP712_DOMAIN_TYPEHASH"
                let expr_6245 := constant_EIP712_DOMAIN_TYPEHASH_8177()
                /// @src 14:1139:1152  "block.chainid"
                let expr_6247 := chainid()
                /// @src 14:1162:1166  "this"
                let expr_6250_address := address()
                /// @src 14:1154:1167  "address(this)"
                let expr_6251 := convert_t_contract$_EcrecoverAuthorizer_$6335_to_t_address(expr_6250_address)
                /// @src 14:1104:1168  "abi.encode(EIP712_DOMAIN_TYPEHASH, block.chainid, address(this))"

                let expr_6252_mpos := allocate_unbounded()
                let _19 := add(expr_6252_mpos, 0x20)

                let _20 := abi_encode_tuple_t_bytes32_t_uint256_t_address__to_t_bytes32_t_uint256_t_address__fromStack(_19, expr_6245, expr_6247, expr_6251)
                mstore(expr_6252_mpos, sub(_20, add(expr_6252_mpos, 0x20)))
                finalize_allocation(expr_6252_mpos, sub(_20, expr_6252_mpos))
                /// @src 14:1094:1169  "keccak256(abi.encode(EIP712_DOMAIN_TYPEHASH, block.chainid, address(this)))"
                let expr_6253 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_6252_mpos), array_length_t_bytes_memory_ptr(expr_6252_mpos))
                /// @src 14:1068:1169  "bytes32 domainSeparator = keccak256(abi.encode(EIP712_DOMAIN_TYPEHASH, block.chainid, address(this)))"
                let var_domainSeparator_6241 := expr_6253
                /// @src 14:1231:1246  "domainSeparator"
                let _21 := var_domainSeparator_6241
                let expr_6262 := _21
                /// @src 14:1248:1258  "hashStruct"
                let _22 := var_hashStruct_6231
                let expr_6263 := _22
                /// @src 14:1206:1259  "bytes.concat(\"\\x19\\x01\", domainSeparator, hashStruct)"
                let expr_6264_mpos := bytes_concat_t_stringliteral_301a50b291d33ce1e8e9064e3f6a6c51d902ec22892b50d58abf6357c6a45541_t_bytes32_t_bytes32(expr_6262, expr_6263)
                /// @src 14:1196:1260  "keccak256(bytes.concat(\"\\x19\\x01\", domainSeparator, hashStruct))"
                let expr_6265 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_6264_mpos), array_length_t_bytes_memory_ptr(expr_6264_mpos))
                /// @src 14:1179:1260  "bytes32 digest = keccak256(bytes.concat(\"\\x19\\x01\", domainSeparator, hashStruct))"
                let var_digest_6256 := expr_6265
                /// @src 14:1297:1303  "digest"
                let _23 := var_digest_6256
                let expr_6270 := _23
                /// @src 14:1305:1314  "signature"
                let _24_offset := var_signature_6204_offset
                let expr_6271_offset := _24_offset
                /// @src 14:1305:1316  "signature.v"
                let _25 := add(expr_6271_offset, 0)
                let expr_6272 := read_from_calldatat_uint8(_25)
                /// @src 14:1318:1327  "signature"
                let _26_offset := var_signature_6204_offset
                let expr_6273_offset := _26_offset
                /// @src 14:1318:1329  "signature.r"
                let _27 := add(expr_6273_offset, 32)
                let expr_6274 := read_from_calldatat_bytes32(_27)
                /// @src 14:1331:1340  "signature"
                let _28_offset := var_signature_6204_offset
                let expr_6275_offset := _28_offset
                /// @src 14:1331:1342  "signature.s"
                let _29 := add(expr_6275_offset, 64)
                let expr_6276 := read_from_calldatat_bytes32(_29)
                /// @src 14:1287:1343  "ecrecover(digest, signature.v, signature.r, signature.s)"

                let _30 := allocate_unbounded()
                let _31 := abi_encode_tuple_t_bytes32_t_uint8_t_bytes32_t_bytes32__to_t_bytes32_t_uint8_t_bytes32_t_bytes32__fromStack(_30 , expr_6270, expr_6272, expr_6274, expr_6276)

                mstore(0, 0)

                let _32 := staticcall(gas(), 1 , _30, sub(_31, _30), 0, 32)

                if iszero(_32) { revert_forward_1() }

                let expr_6277 := shift_left_0(mload(0))
                /// @src 14:1270:1343  "address signer = ecrecover(digest, signature.v, signature.r, signature.s)"
                let var_signer_6268 := expr_6277
                /// @src 14:1361:1367  "signer"
                let _33 := var_signer_6268
                let expr_6280 := _33
                /// @src 14:1379:1380  "0"
                let expr_6283 := 0x00
                /// @src 14:1371:1381  "address(0)"
                let expr_6284 := convert_t_rational_0_by_1_to_t_address(expr_6283)
                /// @src 14:1361:1381  "signer != address(0)"
                let expr_6285 := iszero(eq(cleanup_t_address(expr_6280), cleanup_t_address(expr_6284)))
                /// @src 14:1353:1402  "require(signer != address(0), InvalidSignature())"
                require_helper_t_error_8184_InvalidSignature(expr_6285)
                /// @src 14:1433:1439  "signer"
                let _34 := var_signer_6268
                let expr_6291 := _34
                /// @src 14:1443:1456  "authorization"
                let _35_mpos := var_authorization_6201_mpos
                let expr_6292_mpos := _35_mpos
                /// @src 14:1443:1467  "authorization.authorizer"
                let _36 := add(expr_6292_mpos, 0)
                let _37 := read_from_memoryt_address(_36)
                let expr_6293 := _37
                /// @src 14:1433:1467  "signer == authorization.authorizer"
                let expr_6294 := eq(cleanup_t_address(expr_6291), cleanup_t_address(expr_6293))
                /// @src 14:1433:1537  "signer == authorization.authorizer || IMidnight(MIDNIGHT).isAuthorized(authorization.authorizer, signer)"
                let expr_6303 := expr_6294
                if iszero(expr_6303) {
                    /// @src 14:1481:1489  "MIDNIGHT"
                    let _38 := loadimmutable("6184")
                    let expr_6296 := _38
                    /// @src 14:1471:1490  "IMidnight(MIDNIGHT)"
                    let expr_6297_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6296)
                    /// @src 14:1471:1503  "IMidnight(MIDNIGHT).isAuthorized"
                    let expr_6298_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6297_address)
                    let expr_6298_functionSelector := 0x65e4ad9e
                    /// @src 14:1504:1517  "authorization"
                    let _39_mpos := var_authorization_6201_mpos
                    let expr_6299_mpos := _39_mpos
                    /// @src 14:1504:1528  "authorization.authorizer"
                    let _40 := add(expr_6299_mpos, 0)
                    let _41 := read_from_memoryt_address(_40)
                    let expr_6300 := _41
                    /// @src 14:1530:1536  "signer"
                    let _42 := var_signer_6268
                    let expr_6301 := _42
                    /// @src 14:1471:1537  "IMidnight(MIDNIGHT).isAuthorized(authorization.authorizer, signer)"

                    // storage for arguments and returned data
                    let _43 := allocate_unbounded()
                    mstore(_43, shift_left_224(expr_6298_functionSelector))
                    let _44 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_43, 4) , expr_6300, expr_6301)

                    let _45 := staticcall(gas(), expr_6298_address,  _43, sub(_44, _43), _43, 32)

                    if iszero(_45) { revert_forward_1() }

                    let expr_6302
                    if _45 {

                        let _46 := 32

                        if gt(_46, returndatasize()) {
                            _46 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_43, _46)

                        // decode return parameters from external try-call into retVars
                        expr_6302 :=  abi_decode_tuple_t_bool_fromMemory(_43, add(_43, _46))
                    }
                    /// @src 14:1433:1537  "signer == authorization.authorizer || IMidnight(MIDNIGHT).isAuthorized(authorization.authorizer, signer)"
                    expr_6303 := expr_6302
                }
                /// @src 14:1412:1575  "require(..."
                require_helper_t_error_8186_Unauthorized(expr_6303)
                /// @src 14:1620:1630  "msg.sender"
                let expr_6310 := caller()
                /// @src 14:1644:1657  "authorization"
                let _47_mpos := var_authorization_6201_mpos
                let expr_6311_mpos := _47_mpos
                /// @src 14:1644:1668  "authorization.authorizer"
                let _48 := add(expr_6311_mpos, 0)
                let _49 := read_from_memoryt_address(_48)
                let expr_6312 := _49
                /// @src 14:1682:1695  "authorization"
                let _50_mpos := var_authorization_6201_mpos
                let expr_6313_mpos := _50_mpos
                /// @src 14:1682:1706  "authorization.authorized"
                let _51 := add(expr_6313_mpos, 32)
                let _52 := read_from_memoryt_address(_51)
                let expr_6314 := _52
                /// @src 14:1720:1733  "authorization"
                let _53_mpos := var_authorization_6201_mpos
                let expr_6315_mpos := _53_mpos
                /// @src 14:1720:1746  "authorization.isAuthorized"
                let _54 := add(expr_6315_mpos, 64)
                let _55 := read_from_memoryt_bool(_54)
                let expr_6316 := _55
                /// @src 14:1760:1773  "authorization"
                let _56_mpos := var_authorization_6201_mpos
                let expr_6317_mpos := _56_mpos
                /// @src 14:1760:1779  "authorization.nonce"
                let _57 := add(expr_6317_mpos, 96)
                let _58 := read_from_memoryt_uint256(_57)
                let expr_6318 := _58
                /// @src 14:1591:1789  "SetIsAuthorized(..."
                let _59 := 0x9997f919a6e60aedeb9ffc87ec9600fbcefa7cf69a0ddf900d72043194eae94e
                let _60 := convert_t_address_to_t_address(expr_6310)
                let _61 := convert_t_address_to_t_address(expr_6312)
                let _62 := convert_t_address_to_t_address(expr_6314)
                {
                    let _63 := allocate_unbounded()
                    let _64 := abi_encode_tuple_t_bool_t_uint256__to_t_bool_t_uint256__fromStack(_63 , expr_6316, expr_6318)
                    log4(_63, sub(_64, _63) , _59, _60, _61, _62)
                }/// @src 14:1810:1818  "MIDNIGHT"
                let _65 := loadimmutable("6184")
                let expr_6322 := _65
                /// @src 14:1800:1819  "IMidnight(MIDNIGHT)"
                let expr_6323_address := convert_t_address_to_t_contract$_IMidnight_$4887(expr_6322)
                /// @src 14:1800:1848  "IMidnight(MIDNIGHT)..."
                let expr_6324_address := convert_t_contract$_IMidnight_$4887_to_t_address(expr_6323_address)
                let expr_6324_functionSelector := 0xb78212ab
                /// @src 14:1849:1862  "authorization"
                let _66_mpos := var_authorization_6201_mpos
                let expr_6325_mpos := _66_mpos
                /// @src 14:1849:1873  "authorization.authorized"
                let _67 := add(expr_6325_mpos, 32)
                let _68 := read_from_memoryt_address(_67)
                let expr_6326 := _68
                /// @src 14:1875:1888  "authorization"
                let _69_mpos := var_authorization_6201_mpos
                let expr_6327_mpos := _69_mpos
                /// @src 14:1875:1901  "authorization.isAuthorized"
                let _70 := add(expr_6327_mpos, 64)
                let _71 := read_from_memoryt_bool(_70)
                let expr_6328 := _71
                /// @src 14:1903:1916  "authorization"
                let _72_mpos := var_authorization_6201_mpos
                let expr_6329_mpos := _72_mpos
                /// @src 14:1903:1927  "authorization.authorizer"
                let _73 := add(expr_6329_mpos, 0)
                let _74 := read_from_memoryt_address(_73)
                let expr_6330 := _74
                /// @src 14:1800:1928  "IMidnight(MIDNIGHT)..."

                if iszero(extcodesize(expr_6324_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _75 := allocate_unbounded()
                mstore(_75, shift_left_224(expr_6324_functionSelector))
                let _76 := abi_encode_tuple_t_address_t_bool_t_address__to_t_address_t_bool_t_address__fromStack(add(_75, 4) , expr_6326, expr_6328, expr_6330)

                let _77 := call(gas(), expr_6324_address,  0,  _75, sub(_76, _75), _75, 0)

                if iszero(_77) { revert_forward_1() }

                if _77 {

                    let _78 := 0

                    if gt(_78, returndatasize()) {
                        _78 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_75, _78)

                    // decode return parameters from external try-call into retVars
                    abi_decode_tuple__fromMemory(_75, add(_75, _78))
                }

            }
            /// @src 14:485:1937  "contract EcrecoverAuthorizer is IEcrecoverAuthorizer {..."

        }

        data ".metadata" hex"a2646970667358221220f92b79deb8867e0afd06d5df5137971ee349d921040fce2e5936d2ec1d26753c64736f6c63430008220033"
    }

}

