
/// @use-src 13:"deps/midnight/src/periphery/ConsumableUnitsLib.sol"
object "ConsumableUnitsLib_6169" {
    code {
        /// @src 13:279:1059  "library ConsumableUnitsLib {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("ConsumableUnitsLib_6169_deployed"), datasize("ConsumableUnitsLib_6169_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("ConsumableUnitsLib_6169_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 13:279:1059  "library ConsumableUnitsLib {..."
        function constructor_ConsumableUnitsLib_6169() {

            /// @src 13:279:1059  "library ConsumableUnitsLib {..."

        }
        /// @src 13:279:1059  "library ConsumableUnitsLib {..."

    }
    /// @use-src 13:"deps/midnight/src/periphery/ConsumableUnitsLib.sol"
    object "ConsumableUnitsLib_6169_deployed" {
        code {
            /// @src 13:279:1059  "library ConsumableUnitsLib {..."
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

        data ".metadata" hex"a2646970667358221220b921899dfb1b27ee2406b32a17c2f84ecf78a54f5386bd716b6690beb98748e864736f6c63430008220033"
    }

}

