
/// @use-src 11:"deps/midnight/src/libraries/TickLib.sol"
object "TickLib_5813" {
    code {
        /// @src 11:391:2902  "library TickLib {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("TickLib_5813_deployed"), datasize("TickLib_5813_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("TickLib_5813_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 11:391:2902  "library TickLib {..."
        function constructor_TickLib_5813() {

            /// @src 11:391:2902  "library TickLib {..."

        }
        /// @src 11:391:2902  "library TickLib {..."

    }
    /// @use-src 11:"deps/midnight/src/libraries/TickLib.sol"
    object "TickLib_5813_deployed" {
        code {
            /// @src 11:391:2902  "library TickLib {..."
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

        data ".metadata" hex"a264697066735822122039c02cacb986dad0e718dfd805cbfd6824c2bb2fb48a680b879973f1797a513964736f6c63430008220033"
    }

}

