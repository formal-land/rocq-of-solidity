
/// @use-src 8:"deps/midnight/src/libraries/EventsLib.sol"
object "EventsLib_5354" {
    code {
        /// @src 8:224:3064  "library EventsLib {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("EventsLib_5354_deployed"), datasize("EventsLib_5354_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("EventsLib_5354_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 8:224:3064  "library EventsLib {..."
        function constructor_EventsLib_5354() {

            /// @src 8:224:3064  "library EventsLib {..."

        }
        /// @src 8:224:3064  "library EventsLib {..."

    }
    /// @use-src 8:"deps/midnight/src/libraries/EventsLib.sol"
    object "EventsLib_5354_deployed" {
        code {
            /// @src 8:224:3064  "library EventsLib {..."
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

        data ".metadata" hex"a2646970667358221220d89670cbbb14cfcab9fd3a3744ed0434a158ee128b6adae1748c20f6b42320ec64736f6c63430008220033"
    }

}

