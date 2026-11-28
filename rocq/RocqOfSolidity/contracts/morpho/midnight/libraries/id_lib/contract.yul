
/// @use-src 9:"deps/midnight/src/libraries/IdLib.sol"
object "IdLib_5435" {
    code {
        /// @src 9:164:2051  "library IdLib {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("IdLib_5435_deployed"), datasize("IdLib_5435_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("IdLib_5435_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 9:164:2051  "library IdLib {..."
        function constructor_IdLib_5435() {

            /// @src 9:164:2051  "library IdLib {..."

        }
        /// @src 9:164:2051  "library IdLib {..."

    }
    /// @use-src 9:"deps/midnight/src/libraries/IdLib.sol"
    object "IdLib_5435_deployed" {
        code {
            /// @src 9:164:2051  "library IdLib {..."
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

        data ".metadata" hex"a26469706673582212203b9a9cdc0f0586989f82b3c67403cdb3351879db1ae0c955ca64fcd956a11c1d64736f6c63430008220033"
    }

}

