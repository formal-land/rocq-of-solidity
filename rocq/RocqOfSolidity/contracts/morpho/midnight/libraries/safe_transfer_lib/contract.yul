
/// @use-src 10:"deps/midnight/src/libraries/SafeTransferLib.sol"
object "SafeTransferLib_5565" {
    code {
        /// @src 10:161:1308  "library SafeTransferLib {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("SafeTransferLib_5565_deployed"), datasize("SafeTransferLib_5565_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("SafeTransferLib_5565_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 10:161:1308  "library SafeTransferLib {..."
        function constructor_SafeTransferLib_5565() {

            /// @src 10:161:1308  "library SafeTransferLib {..."

        }
        /// @src 10:161:1308  "library SafeTransferLib {..."

    }
    /// @use-src 10:"deps/midnight/src/libraries/SafeTransferLib.sol"
    object "SafeTransferLib_5565_deployed" {
        code {
            /// @src 10:161:1308  "library SafeTransferLib {..."
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

        data ".metadata" hex"a264697066735822122031852c350176426a443624b38c34015a65b8d46b70b2f02f4c7a69cbfb05d5ba64736f6c63430008220033"
    }

}

