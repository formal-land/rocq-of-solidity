
/// @use-src 16:"deps/midnight/src/periphery/TakeAmountsLib.sol"
object "TakeAmountsLib_8129" {
    code {
        /// @src 16:286:2638  "library TakeAmountsLib {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("TakeAmountsLib_8129_deployed"), datasize("TakeAmountsLib_8129_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("TakeAmountsLib_8129_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 16:286:2638  "library TakeAmountsLib {..."
        function constructor_TakeAmountsLib_8129() {

            /// @src 16:286:2638  "library TakeAmountsLib {..."

        }
        /// @src 16:286:2638  "library TakeAmountsLib {..."

    }
    /// @use-src 16:"deps/midnight/src/periphery/TakeAmountsLib.sol"
    object "TakeAmountsLib_8129_deployed" {
        code {
            /// @src 16:286:2638  "library TakeAmountsLib {..."
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

        data ".metadata" hex"a2646970667358221220139eba41b075e1cf7f7a45948bfb3d23611b8638d7f6f88dc3df95405dc78a5064736f6c63430008220033"
    }

}

