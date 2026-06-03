
/// @use-src 25:"deps/midnight/src/ratifiers/libraries/HashLib.sol"
object "HashLib_9326" {
    code {
        /// @src 25:764:6820  "library HashLib {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("HashLib_9326_deployed"), datasize("HashLib_9326_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("HashLib_9326_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 25:764:6820  "library HashLib {..."
        function constructor_HashLib_9326() {

            /// @src 25:764:6820  "library HashLib {..."

        }
        /// @src 25:764:6820  "library HashLib {..."

    }
    /// @use-src 25:"deps/midnight/src/ratifiers/libraries/HashLib.sol"
    object "HashLib_9326_deployed" {
        code {
            /// @src 25:764:6820  "library HashLib {..."
            mstore(64, memoryguard(128))

            let called_via_delegatecall := iszero(eq(loadimmutable("library_deploy_address"), address()))

            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

        }

        data ".metadata" hex"a26469706673582212209813d3797606afc0c9df1e6f1c802632303cfa88bf97481901077a7b71a0b95364736f6c63430008220033"
    }

}

