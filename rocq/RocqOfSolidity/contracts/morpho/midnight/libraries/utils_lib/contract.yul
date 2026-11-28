
/// @use-src 12:"deps/midnight/src/libraries/UtilsLib.sol"
object "UtilsLib_6089" {
    code {
        /// @src 12:111:3249  "library UtilsLib {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("UtilsLib_6089_deployed"), datasize("UtilsLib_6089_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("UtilsLib_6089_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 12:111:3249  "library UtilsLib {..."
        function constructor_UtilsLib_6089() {

            /// @src 12:111:3249  "library UtilsLib {..."

        }
        /// @src 12:111:3249  "library UtilsLib {..."

    }
    /// @use-src 12:"deps/midnight/src/libraries/UtilsLib.sol"
    object "UtilsLib_6089_deployed" {
        code {
            /// @src 12:111:3249  "library UtilsLib {..."
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

        data ".metadata" hex"a2646970667358221220ad5de1c74778c99b5ffb9e0898d65129488b671b82a23d275c4da25ccf9e857664736f6c63430008220033"
    }

}

