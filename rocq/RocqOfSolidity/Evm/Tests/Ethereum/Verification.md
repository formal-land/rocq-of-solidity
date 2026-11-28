# Ethereum Fixture Verification Notes

The reproducible upstream commands are in the [project README](../../../../../README.md#run-the-rocq-tests). The following notes record experiments on the source branch. Its generated paths, intermediate counts, and local build commands refer to those snapshots.

This file records the low-memory verification approach for generated EEST
fixtures. Use it when resuming the all-protocol fixture goal.

For the full repo-level Rocq test commands, see the root
[README](../../../../../README.md#run-all-rocq-tests). This file is the detailed
troubleshooting guide for generated Ethereum fixtures.

## Why

Some generated proofs use `vm_compute` over large fixture terms. A single bad
definition can make `coqc` allocate most of the machine memory before it fails.
The first observed case was a `BLOBHASH` gas-cost fixture with a 256-bit index:
the old `blobhash` implementation converted the index to `nat` before checking
the blob-hash list bound.

The safe workflow is to run expensive fixture families sequentially with a
per-file timeout first, then run the manifest under a memory limit.

## Resume Checklist

When resuming this work in a new session:

1. Read this file before launching broad EVM fixture builds.
2. Use `make -j1` for manifest checks and wrap Rocq commands in `ulimit -v` plus
   `timeout`; do not start an unbounded generated-fixture build.
3. If a command was already running, poll it until it exits before starting a
   second manifest build.
4. On failure, classify the result before editing code:
   - `124` from `timeout`: wall-clock timeout; isolate the last printed fixture
     family with a per-file loop.
   - `Cannot allocate memory`, `Out of memory`, or signal-like termination:
     memory cap hit; reduce the scope to the last printed file or family.
   - Rocq unification/equality failure: semantic or fixture-generation mismatch;
     inspect the generated `.v` file and the source JSON before changing code.
5. Prefer complete EVM semantics fixes over fixture-specific hacks. Gas-related
   fixes should update the general gas model, transaction validity rules, and
   fixture harness behavior consistently.
6. After a targeted fix passes, restart the bounded manifest because upstream
   `.vo` files may have become stale.
7. Expand fixture coverage one semantic family at a time. First make the
   currently generated manifest pass, then remove one generator skip category,
   regenerate, isolate the new family, and only then restart the full manifest.
8. Treat blacklists as temporary triage data, not as success criteria. The
   all-fixtures goal is complete only when generated official fixtures compile
   without blacklist exclusions.

The default memory cap used so far is 6 GiB:

```sh
bash -lc 'ulimit -v 6291456; timeout 30m opam exec -- make -j1 Evm/Tests/Ethereum/Manifest.vo'
```

For a single fixture family, prefer `make -f RocqMakefile "$vo"` over invoking
`coqc` directly when dependencies may be stale:

```sh
bash -lc 'ulimit -v 6291456; for f in $(find Evm/Tests/Ethereum/Generated -name "<pattern>" | sort); do vo=${f%.v}.vo; echo MAKE "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
```

## Targeted Checks

Run these from `rocq/RocqOfSolidity`.

```sh
for f in $(find Evm/Tests/Ethereum/Generated -name '*blobhash_gas_cost*.v' | sort); do
  echo COQC "$f"
  timeout 20s opam exec -- coqc -R . RocqOfSolidity \
    -impredicative-set -w -stdlib-vector "$f" || exit $?
done
```

```sh
for f in $(find Evm/Tests/Ethereum/Generated -name '*gas_usage*.v' | sort); do
  echo COQC "$f"
  timeout 20s opam exec -- coqc -R . RocqOfSolidity \
    -impredicative-set -w -stdlib-vector "$f" || exit $?
done
```

## Full Manifest

Run the manifest sequentially with a virtual-memory cap. `ulimit -v` is in KB;
`6291456` is 6 GiB. Increase only if the machine has enough spare memory.

```sh
bash -lc 'ulimit -v 6291456; timeout 30m opam exec -- make -j1 Evm/Tests/Ethereum/Manifest.vo'
```

If this fails:

- Exit code `124` means the wall-clock timeout fired.
- `Cannot allocate memory`, `Out of memory`, or signal-related failures mean the
  cap worked and the current file should be isolated with the per-file pattern.
- The last `COQC ...` line is the first fixture family to inspect.

Avoid broad parallel manifest builds while this goal is active. They make it
harder to identify the first semantic failure and can exhaust memory before the
useful error is printed.

## Coverage Expansion Strategy

The supported generated subset should stay green while fixture coverage grows.
Use this loop for each missing EEST category:

1. Regenerate the supported subset and run the bounded manifest.
2. Pick one skipped category from the generator summary.
3. Inspect representative source JSON files and the generated Rocq shape needed
   for that category.
4. Implement the missing general EVM semantics, transaction rules, or fixture
   harness behavior.
5. Remove or narrow the generator skip.
6. Run a bounded per-file check for the newly generated family.
7. Run the bounded manifest again.
8. Record remaining failures by semantic cause, with source fixture paths.

Do not patch around individual official fixtures. In particular, gas behavior
must be implemented as a complete model change: fork-specific gas schedules,
intrinsic transaction gas, memory expansion, warm/cold access, refunds,
stipends, call gas forwarding, code-deposit gas, and transaction validity should
move together when the semantics require it.

The largest known skipped categories are transaction creation, CALL-family
execution, expected-exception fixtures, and EIP-7702 set-code transactions. A
practical order is to add top-level transaction classes first, then
contract-creation transactions, then full CALL/CALLCODE/DELEGATECALL/STATICCALL
semantics. That order may change if a source-fixture inspection shows a cleaner
dependency path.

## Observed Slow Families

The full manifest can time out while still making progress. In that case, keep
the same memory cap and run the current family directly before restarting the
manifest.

The first 30-minute bounded manifest run reached:

```text
Evm/Tests/Ethereum/Generated/static_state_tests_cancun_steip5656_mcopy_mcopy_copy_cost_*.v
```

It had already passed the generated BLOBHASH gas-cost fixtures, CLZ fixtures,
warm coinbase fixtures, PUSH0 fixtures, transient-storage gas fixtures, and many
MCOPY behavior fixtures. The timeout happened during MCOPY copy-cost fixtures,
with no semantic mismatch printed.

After isolating that family, the first semantic failure was an Osaka
`src0_size44767-g1` MCOPY copy-cost fixture. The root cause was that EIP-7623's
calldata floor cost was subtracted from execution gas upfront. The fix was to
separate standard intrinsic gas from the Prague+ minimum transaction gas limit:
execution starts with `gas_limit - standard_intrinsic_gas`, while the floor is a
transaction validity/final gas-used constraint.

The complete MCOPY copy-cost family then passed with:

```sh
bash -lc 'ulimit -v 6291456; for f in $(find Evm/Tests/Ethereum/Generated -name "static_state_tests_cancun_steip5656_mcopy_mcopy_copy_cost_*.v" | sort); do vo=${f%.v}.vo; echo MAKE "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
```

After that fix, the bounded manifest completed successfully with exit code `0`:

```sh
bash -lc 'ulimit -v 6291456; timeout 30m opam exec -- make -j1 Evm/Tests/Ethereum/Manifest.vo'
```

The successful run covered the generated manifest then present in the worktree.
The broader all-fixtures goal is still not complete until currently skipped
fixture categories are generated and verified too.

A later 30-minute bounded manifest run over the regenerated 3164-file
all-protocol supported subset timed out with exit code `124` while still making
progress through:

```text
Evm/Tests/Ethereum/Generated/frontier_opcodes_test_swap_test_swap_fork_istanbul_state_test_swap15_*.v
```

No semantic mismatch or memory failure was printed before the timeout. Resume by
isolating the `frontier_opcodes_test_swap_test_swap_*` family, then restart the
bounded manifest.

The isolated SWAP family subsequently passed under the same memory cap:

```sh
bash -lc 'ulimit -v 6291456; for f in $(find Evm/Tests/Ethereum/Generated -name "frontier_opcodes_test_swap_test_swap_*.v" | sort); do vo=${f%.v}.vo; echo MAKE "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
```

After the SWAP isolation, the regenerated 3164-file supported manifest passed:

```sh
bash -lc 'ulimit -v 6291456; timeout 30m opam exec -- make -j1 Evm/Tests/Ethereum/Manifest.vo'
```

After expanding the generated subset to include nonzero top-level transaction
value, the generated count was 4118 fixture modules with an empty blacklist.
The nonzero-value subset contained 954 generated modules.

The first nonzero-value sweep exposed two performance/modeling issues:

- `stRandom2/randomStateTest476` used a `LOG4` payload of about 9.2 MiB. Eagerly
  materializing log payload bytes in `State.logs` made proof reduction too
  large. The fix was to store logs as memory slices and materialize only when a
  test explicitly observes logs.
- `stShift/shiftSignedCombinations` exhausted the generated fixture step budget
  and recomputed the same run hundreds of times. The generator now scales the
  step budget from bytecode/storage size and emits one grouped storage proof per
  fixture.

The next semantic mismatch was:

```text
static_state_tests_stsystemoperationstest_calleraccountbalance_calleraccountbalance_fork_cancun_80b28dad3f.v
expected caller balance: 999999999899900000
observed caller balance: 999999999999900000
```

The delta was exactly `gas_limit * gas_price = 10000000 * 10`, showing that the
fixture runner applied the top-level value transfer but did not debit upfront
transaction gas before execution. The fix was to add transaction-level gas
purchase and settlement to `Fixture.run`: sender existence/balance validation,
minimum gas-limit and base-fee checks, upfront gas debit, value transfer,
top-level revert/error rollback, sender gas refund, gas-refund cap, and
fork-aware coinbase reward (`gas_price` before London, `gas_price - base_fee`
from London onward).

The focused nonzero-value sweep then passed:

```sh
bash -lc 'ulimit -v 6291456; python3 -c '\''import pathlib,re; root=pathlib.Path("Evm/Tests/Ethereum/Generated"); pattern=re.compile(r"Fixture\.transaction := Fixture\.Transaction\.make_with_access_list\n    \d+\n    \d+\n    (\d+)\n"); files=[path for path in sorted(root.glob("*.v")) if (m:=pattern.search(path.read_text())) and m.group(1)!="0"]; print(len(files)); [print(path) for path in files]'\'' | { read total; i=0; while read f; do i=$((i+1)); vo=${f%.v}.vo; echo MAKE "$i/$total" "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done; }'
```

Result:

```text
954/954 nonzero-value generated fixtures compiled successfully.
```

A subsequent full 4118-module bounded manifest run timed out after 30 minutes
with exit code `124` while still making progress through the generated
`frontier/opcodes/test_stack_overflow.py::test_stack_overflow` Prague PUSH9
stack-height-1024 fixtures:

```sh
bash -lc 'ulimit -v 6291456; timeout 30m opam exec -- make -j1 Evm/Tests/Ethereum/Manifest.vo'
```

The timeout did not print a semantic mismatch or memory failure. The last
visible generated module passed by itself under the same memory cap:

```sh
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -f RocqMakefile Evm/Tests/Ethereum/Generated/frontier_opcodes_test_stack_overflow_test_stack_overflow_fork_prague_state_test_stack_height_102_90f118a684.vo'
```

This points to broad manifest wall-clock cost rather than an individual failing
fixture in that stack-overflow family.

The generator now emits account-level post-state assertions instead of relying
only on target-account storage slots. Each generated fixture checks every
account present in the official post state for existence, balance, nonce, and
code bytes, plus storage over the union of pre/post slots. This removed the
previous `no target-account post-state storage assertions` skip category.

After regenerating with:

```sh
bash -lc 'ulimit -v 6291456; python3 rocq/scripts/evm_tests_generate.py --fixtures /tmp/eest_fixture_extract --all --out /home/fedora/Solidity/rocq-of-solidity/rocq/RocqOfSolidity/Evm/Tests/Ethereum/Generated --summary /tmp/rocq_evm_generated_summary.json'
```

the generated supported subset grew to:

```text
Generated 7408 Rocq EVM fixture modules
Manifest imports 7408
Blacklisted 0
```

The largest remaining skipped categories are now contract-creation
transactions, expected-exception fixtures, CALL/CALLCODE/DELEGATECALL/
STATICCALL/CREATE/CREATE2/SELFDESTRUCT direct-execution cases, and EIP-7702
set-code transactions.

Bounded checks after the account assertion expansion:

```sh
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -j1 Evm/Tests/Ethereum/Fixture.vo'
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -j1 Evm/Tests/Ethereum/StateTests.vo'
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -f RocqMakefile Evm/Tests/Ethereum/Generated/berlin_eip2930_access_list_test_transaction_intrinsic_gas_cost_test_transaction_intrinsic_gas_co_853e1b7f42.vo'
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -f RocqMakefile Evm/Tests/Ethereum/Generated/static_state_tests_stsystemoperationstest_calleraccountbalance_calleraccountbalance_fork_cancun_80b28dad3f.vo'
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -f RocqMakefile Evm/Tests/Ethereum/Generated/frontier_opcodes_test_stack_overflow_test_stack_overflow_fork_prague_state_test_stack_height_102_90f118a684.vo'
```

The newly enabled intrinsic-gas no-storage family also passed:

```sh
bash -lc 'ulimit -v 6291456; i=0; total=$(find Evm/Tests/Ethereum/Generated -name "*test_transaction_intrinsic_gas_cost*.v" | wc -l); for f in $(find Evm/Tests/Ethereum/Generated -name "*test_transaction_intrinsic_gas_cost*.v" | sort); do i=$((i+1)); vo=${f%.v}.vo; echo MAKE "$i/$total" "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
```

Result:

```text
72/72 intrinsic-gas generated fixtures compiled successfully.
```

The fixture transaction model now distinguishes the EIP-1559 effective gas
price from the fee cap. The effective gas price remains `GASPRICE` and is used
for the observable gas purchase before EVM execution. The fee cap is used for
upfront transaction-balance validation. This matches the `stEIP1559/
senderBalance` fixtures, where `BALANCE(caller)` during execution observes the
effective-price debit, not the fee-cap validation amount.

After removing the dedicated `stEIP1559` skip and regenerating:

```sh
bash -lc 'ulimit -v 6291456; python3 rocq/scripts/evm_tests_generate.py --fixtures /tmp/eest_fixture_extract --all --out /home/fedora/Solidity/rocq-of-solidity/rocq/RocqOfSolidity/Evm/Tests/Ethereum/Generated --summary /tmp/rocq_evm_generated_summary.json'
```

the generated supported subset grew to:

```text
Generated 7432 Rocq EVM fixture modules
Manifest imports 7432
Blacklisted 0
```

The valid modeled `stEIP1559` generated subset then passed:

```sh
bash -lc 'ulimit -v 6291456; i=0; total=$(rg -l "stEIP1559" Evm/Tests/Ethereum/Generated | wc -l); for f in $(rg -l "stEIP1559" Evm/Tests/Ethereum/Generated | sort); do i=$((i+1)); vo=${f%.v}.vo; echo MAKE "$i/$total" "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
```

Result:

```text
24/24 stEIP1559 generated fixtures compiled successfully.
```

The remaining EIP-1559 entries are mostly in the general expected-exception
bucket, not a separate valid-transaction accounting skip.

The generator now supports the modeled intrinsic-gas expected-exception class:

- `TransactionException.INTRINSIC_GAS_TOO_LOW`
- `TransactionException.INTRINSIC_GAS_BELOW_FLOOR_GAS_COST`
- `TransactionException.GAS_ALLOWANCE_EXCEEDED`

For those fixtures it emits an exact `Fixture.error_after` assertion for the
transaction-validation error, plus the usual account and storage post-state
assertions. The generated count after this expansion is:

```text
Generated 8931 Rocq EVM fixture modules
Manifest imports 8931
Blacklisted 0
Modeled expected-error fixtures: 1572
```

Authorization-list/type-4 transactions are explicitly skipped until EIP-7702 is
modeled. A first attempt to treat them as ordinary intrinsic/floor-gas fixtures
failed on:

```text
prague_eip7623_increase_calldata_cost_test_transaction_validity_type_4_test_transaction_validity_0607700c93.v
expected invalid transaction error, observed no transaction-validation error
```

That failure is expected without EIP-7702 authorization-list intrinsic gas, so
the generator now reports:

```text
104 EIP-7702 authorization-list transactions are not generated in this pass
```

Bounded checks for the modeled expected-error expansion:

```sh
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -j1 Evm/Tests/Ethereum/Generated/berlin_eip2930_access_list_test_transaction_intrinsic_gas_cost_test_transaction_intrinsic_gas_co_0032da95cd.vo'
bash -lc 'ulimit -v 6291456; i=0; total=$(find Evm/Tests/Ethereum/Generated -name "*test_transaction_intrinsic_gas_cost*.v" | wc -l); for f in $(find Evm/Tests/Ethereum/Generated -name "*test_transaction_intrinsic_gas_cost*.v" | sort); do i=$((i+1)); vo=${f%.v}.vo; echo MAKE "$i/$total" "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
bash -lc 'ulimit -v 6291456; i=0; total=$(rg -l "stEIP1559" Evm/Tests/Ethereum/Generated | wc -l); for f in $(rg -l "stEIP1559" Evm/Tests/Ethereum/Generated | sort); do i=$((i+1)); vo=${f%.v}.vo; echo MAKE "$i/$total" "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
bash -lc 'ulimit -v 6291456; i=0; total=$(rg -l "Some \"invalid transaction: gas limit below transaction minimum\"" Evm/Tests/Ethereum/Generated | rg "eip7623_increase_calldata_cost_test_transaction_validity" | wc -l); rg -l "Some \"invalid transaction: gas limit below transaction minimum\"" Evm/Tests/Ethereum/Generated | rg "eip7623_increase_calldata_cost_test_transaction_validity" | sort | while read f; do i=$((i+1)); vo=${f%.v}.vo; echo MAKE "$i/$total" "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
```

Results:

```text
144/144 access-list intrinsic-gas generated fixtures compiled successfully.
28/28 stEIP1559 generated fixtures compiled successfully.
92/92 Prague EIP-7623 transaction-validity expected-error fixtures compiled successfully.
```

The fixture transaction model now also accounts for EIP-4844 blob gas in the
same transaction-level validation path:

- `GAS_PER_BLOB = 131072`
- sender upfront balance validation uses `blob_gas * max_fee_per_blob_gas`
- the pre-execution debit burns `blob_gas * blob_base_fee`
- execution-visible gas accounting continues to use the EIP-1559 effective gas
  price, not the fee cap

After adding modeled `TransactionException.INSUFFICIENT_ACCOUNT_FUNDS` support
and regenerating:

```sh
bash -lc 'ulimit -v 6291456; python3 rocq/scripts/evm_tests_generate.py --fixtures /tmp/eest_fixture_extract --all --out /home/fedora/Solidity/rocq-of-solidity/rocq/RocqOfSolidity/Evm/Tests/Ethereum/Generated --summary /tmp/rocq_evm_generated_summary.json'
```

the generated supported subset grew to:

```text
Generated 9291 Rocq EVM fixture modules
Manifest imports 9291
Blacklisted 0
Modeled expected-error fixtures: 1932
Modeled insufficient-funds fixtures: 360
```

Some official fixtures report insufficient funds even when the sender account is
absent from `pre`. The runner checks sender existence before balance, so the
generator maps those cases to the modeled local error
`invalid transaction: sender account not found`.

Bounded checks for the insufficient-funds expansion:

```sh
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -j1 Evm/Tests/Ethereum/Generated/static_state_tests_sttransactiontest_nosrcaccount1559_nosrcaccount1559_fork_cancun_state_test_d0_51e0cddc80.vo'
bash -lc 'ulimit -v 6291456; i=0; total=$(rg -l "Some \"invalid transaction: (insufficient sender balance|sender account not found)\"" Evm/Tests/Ethereum/Generated | wc -l); rg -l "Some \"invalid transaction: (insufficient sender balance|sender account not found)\"" Evm/Tests/Ethereum/Generated | sort | while read f; do i=$((i+1)); vo=${f%.v}.vo; echo MAKE "$i/$total" "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
```

Results:

```text
Previously failing no-source-account EIP-1559 fixture compiled successfully.
360/360 insufficient-funds or sender-missing generated fixtures compiled successfully.
```

## Top-Level Contract Creation

The fixture runner now has an explicit creation transaction path instead of
treating every transaction as a message call. The modeled path includes:

- creation transaction constructors in `Fixture.Transaction`
- RLP/Keccak `CREATE` address calculation from sender and sender nonce
- Homestead-and-later `53000` creation intrinsic gas
- Shanghai-and-later EIP-3860 init-code word gas
- Prague calldata-floor accounting through the existing transaction finalizer
- init-code execution with empty calldata and the created address as the
  execution address
- code-deposit gas at `200 * deployed_code_length`
- top-level creation collision aborts for non-empty pre-existing target accounts

After enabling top-level creation generation where the init code is otherwise in
the direct runner's opcode subset:

```sh
bash -lc 'ulimit -v 6291456; python3 rocq/scripts/evm_tests_generate.py --fixtures /tmp/eest_fixture_extract --all --out /home/fedora/Solidity/rocq-of-solidity/rocq/RocqOfSolidity/Evm/Tests/Ethereum/Generated --summary /tmp/rocq_evm_generated_summary.json'
```

the generated supported subset grew to:

```text
Generated 11702 Rocq EVM fixture modules
Manifest imports 11702
Blacklisted 0
Top-level creation fixtures: 1112
Skipped total: 32337
```

Bounded checks for the creation expansion:

```sh
python3 rocq/scripts/evm_tests_generate_test.py
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -j1 Evm/Tests/Ethereum/Fixture.vo'
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make -j1 Evm/Tests/Ethereum/StateTests.vo'
bash -lc 'ulimit -v 6291456; i=0; head -n 100 /tmp/rocq_creation_cases.txt | while read id; do i=$((i+1)); vo=Evm/Tests/Ethereum/Generated/${id}.vo; echo MAKE "$i/100" "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
bash -lc 'ulimit -v 6291456; i=0; head -n 50 /tmp/rocq_creation_non_collision_cases.txt | while read id; do i=$((i+1)); vo=Evm/Tests/Ethereum/Generated/${id}.vo; echo MAKE "$i/50" "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
```

Results:

```text
Generator unit tests: 10/10 passed.
Fixture.vo compiled successfully.
StateTests.vo compiled successfully.
100/100 sampled creation fixtures compiled successfully.
50/50 sampled non-collision creation fixtures compiled successfully.
```

The remaining skipped fixture entries are now dominated by direct execution of
bytecode containing nested `CALL`/`CALLCODE`/`DELEGATECALL`/`STATICCALL`,
`CREATE`/`CREATE2`, `SELFDESTRUCT`, or unknown/invalid opcodes. Aggregated from
the latest summary:

```text
31520 direct/unknown bytecode entries
652 EIP-7702 entries
165 expected-exception entries
```

## Invalid Opcode Fixtures

The direct bytecode scanner now allows unknown opcode bytes through to the
generated tests instead of filtering them out. The Rocq EVM interpreter already
maps bytes outside `instruction_of_Z` to `Step.Error "invalid instruction"`,
so these fixtures exercise existing invalid-instruction semantics rather than a
new local fixture hack.

After regenerating all locally available state-test fixtures:

```sh
bash -lc 'ulimit -v 6291456; python3 rocq/scripts/evm_tests_generate.py --fixtures /tmp/eest_fixture_extract --all --out /home/fedora/Solidity/rocq-of-solidity/rocq/RocqOfSolidity/Evm/Tests/Ethereum/Generated --summary /tmp/rocq_evm_generated_summary.json'
```

the generated supported subset grew to:

```text
Generated 11752 Rocq EVM fixture modules
Manifest imports 11752
Blacklisted 0
Skipped total 32287
Approximate fixture-entry coverage 26.69%
```

The invalid-opcode expansion unlocked 50 additional fixtures. The generated
set includes explicit `0xfe` invalid-opcode cases and random/init-code fixtures
with undefined bytes such as `0xbf`, `0xeb`, `0xfc`, and `0xef`.

Bounded checks for this expansion:

```sh
python3 rocq/scripts/evm_tests_generate_test.py
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make RocqMakefile'
bash -lc 'ulimit -v 6291456; i=0; total=$(wc -l < /tmp/rocq_unknown_opcode_cases.txt); while read id; do i=$((i+1)); target="Evm/Tests/Ethereum/Generated/${id}.vo"; echo MAKE "$i/$total" "$target"; timeout 240s opam exec -- make "$target" || exit $?; done < /tmp/rocq_unknown_opcode_cases.txt'
```

Results:

```text
Generator unit tests: 11/11 passed.
RocqMakefile regenerated successfully.
50/50 invalid-opcode generated fixtures compiled successfully.
```

An aggregate `Manifest.vo` build was also attempted with the same memory cap
and a 240 second timeout. It timed out while recompiling unrelated generated
dependencies after `RocqMakefile` regeneration; no semantic fixture failure was
observed before the timeout.

At this point the remaining skipped fixture entries were still dominated by
direct execution of bytecode containing nested message-call or creation
behavior:

```text
31470 direct bytecode entries
652 EIP-7702 entries
165 expected-exception entries

Weighted direct-bytecode blockers:
CALL         79912
CALLCODE     29484
DELEGATECALL 22302
STATICCALL   19057
CREATE        3829
CREATE2       3098
SELFDESTRUCT   654
```

## SELFDESTRUCT Direct-Execution Fixtures

The direct bytecode scanner now allows `SELFDESTRUCT` through to the generated
tests. The Rocq EVM semantics implement protocol-aware direct `SELFDESTRUCT`
execution:

- Frontier/Homestead zero base cost and later 5000 base cost
- Berlin warm/cold beneficiary access cost
- new-account cost when nonzero value is sent to an empty or missing
  beneficiary
- pre-Cancun deletion semantics
- Cancun-and-later EIP-6780 deletion only for contracts created in the same
  transaction
- pre-London 24000 gas refund, removed from London onward
- transaction-finalization of selfdestructed accounts before gas settlement

Two general semantic fixes were needed for the official fixtures:

- top-level creation collision now matches Ethereum account-creation rules:
  collision depends on nonzero nonce or nonempty code, not balance/storage
- EVM address operands are normalized to the low 160 bits at opcode boundaries;
  this affects `BALANCE`, `EXTCODE*`, the `CALL` family, and `SELFDESTRUCT`

After regenerating all locally available state-test fixtures:

```sh
bash -lc 'ulimit -v 6291456; python3 rocq/scripts/evm_tests_generate.py --fixtures /tmp/eest_fixture_extract --all --out /home/fedora/Solidity/rocq-of-solidity/rocq/RocqOfSolidity/Evm/Tests/Ethereum/Generated --summary /tmp/rocq_evm_generated_summary.json'
```

the generated supported subset grew to:

```text
Generated 11866 Rocq EVM fixture modules
Manifest imports 11866
Blacklisted 0
Skipped total 32173
Approximate fixture-entry coverage 26.94%
```

The `SELFDESTRUCT` expansion unlocked 114 additional generated fixtures.

Bounded checks for this expansion:

```sh
python3 rocq/scripts/evm_tests_generate_test.py
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make Evm/Tests/Ethereum/Fixture.vo'
bash -lc 'ulimit -v 6291456; i=0; total=$(wc -l < /tmp/rocq_selfdestruct_cases_current.txt); while read id; do i=$((i+1)); target="Evm/Tests/Ethereum/Generated/${id}.vo"; echo MAKE "$i/$total" "$target"; timeout 240s opam exec -- make "$target" || exit $?; done < /tmp/rocq_selfdestruct_cases_current.txt'
```

Results:

```text
Generator unit tests: 12/12 passed.
Fixture.vo compiled successfully.
114/114 SELFDESTRUCT generated fixtures compiled successfully.
```

The remaining skipped direct-bytecode entries are now dominated by nested
message-call and contract-creation opcodes:

```text
CALL         79912
CALLCODE     29484
DELEGATECALL 22302
STATICCALL   19057
CREATE        3829
CREATE2       3098
```

## Transaction Expected-Exception Fixtures

The fixture runner now carries explicit transaction metadata needed for
pre-execution validity checks:

- transaction kind: legacy, EIP-2930 access-list, EIP-1559 dynamic-fee, or
  EIP-4844 blob
- transaction nonce
- priority fee cap
- blob fee cap and blob versioned hashes
- authoritative transaction data length, separate from the byte list

This enabled modeled validation for the remaining non-EIP-7702 expected
exceptions:

- access-list, dynamic-fee, and blob transaction types before their fork
- EIP-3607 sender account with deployed code
- max sender nonce
- priority fee greater than max fee
- max fee below base fee
- blob transaction creation, zero blobs, too many blobs, invalid versioned hash
  prefix, and blob fee cap below blob base fee
- EIP-3860 initcode size limit
- combined insufficient-funds/intrinsic-gas no-source-account cases, mapped to
  the runner's first validation error when the sender account is absent

For oversized EIP-3860 invalid transactions, the generated fixture keeps the
official transaction byte length but does not embed the rejected 49 KiB initcode
payload. The runner rejects those transactions before inspecting initcode
bytes, and this avoids `vm_compute` stack overflows on unused list literals.

After regenerating all locally available state-test fixtures:

```sh
bash -lc 'ulimit -v 6291456; python3 rocq/scripts/evm_tests_generate.py --fixtures /tmp/eest_fixture_extract --all --out /home/fedora/Solidity/rocq-of-solidity/rocq/RocqOfSolidity/Evm/Tests/Ethereum/Generated --summary /tmp/rocq_evm_generated_summary.json'
```

the generated supported subset grew to:

```text
Generated 12031 Rocq EVM fixture modules
Manifest imports 12031
Blacklisted 0
Skipped total 32008
Approximate fixture-entry coverage 27.32%
Expected-exception skipped bucket: 0
```

Bounded checks for this expansion:

```sh
python3 rocq/scripts/evm_tests_generate_test.py
bash -lc 'ulimit -v 6291456; timeout 240s opam exec -- make Evm/Tests/Ethereum/Fixture.vo'
bash -lc 'ulimit -v 6291456; i=0; total=$(wc -l < /tmp/rocq_new_expected_exception_cases.txt); while read id; do i=$((i+1)); target="Evm/Tests/Ethereum/Generated/${id}.vo"; echo MAKE "$i/$total" "$target"; timeout 240s opam exec -- make "$target" || exit $?; done < /tmp/rocq_new_expected_exception_cases.txt'
```

Results:

```text
Generator unit tests: 12/12 passed.
Fixture.vo compiled successfully.
165/165 newly generated expected-exception fixtures compiled successfully.
```

A static sanity pass over all 12031 generated cases found no valid generated
case with a sender nonce mismatch or unsupported transaction kind for its fork.

The remaining skipped fixture entries are now only:

```text
31356 direct bytecode entries containing nested CALL/CREATE-family opcodes
652 EIP-7702 set-code transaction entries
0 other skipped entries
```

## Direct CALL/STATICCALL/DELEGATECALL/CALLCODE Slice

The EVM runner now executes plain `CALL`, `STATICCALL`, `DELEGATECALL`, and
`CALLCODE` directly against EVM bytecode accounts instead of routing them
through the Yul `Stdlib.call`, `Stdlib.staticcall`, `Stdlib.delegatecall`, and
legacy `CALLCODE` shortcut paths. The recursive runner decreases the fuel
budget for child EVM calls and models:

- CALL-family dynamic gas with EIP-150 gas capping and Berlin warm/cold account
  costs
- value transfer, empty-account creation, failure on insufficient caller balance,
  and unused value-stipend return for `CALL`
- static child execution for `STATICCALL`
- child-frame memory isolation, return-data propagation, success/revert/error
  state commit or rollback, and log commit on child success
- precompile gas checks for the precompiles already modeled by
  `Stdlib.precompile_output`
- `DELEGATECALL` execution with target-account code but the parent execution
  address, caller, callvalue, storage context, and staticness
- `CALLCODE` execution with target-account code but the current account address
  and storage context, `CALLER = ADDRESS`, stack-provided `CALLVALUE`, value
  gas/stipend, and no balance transfer or new-account cost

The generator now permits these call-family opcodes when the fixture remains
within this modeled subset. It still skips CALL-family fixtures
that require unsupported precompile families, call-depth stress behavior,
random stress programs, or callee bytecode containing unimplemented `CREATE` or
`CREATE2`.

After regenerating with the same low-memory command, the supported subset is:

```text
Generated 28509 Rocq EVM fixture modules
Manifest imports 28509
Blacklisted 0
Skipped total 15530
Approximate fixture-entry coverage 64.74%
```

Enabling `DELEGATECALL` exposed a general EIP-150 gas-forwarding bug. The
forwarded gas cap must be `min(requested, available - available / 64)` for every
EIP-150-and-later call-family opcode. The previous helper only applied the cap
when `requested > available`, which let failed child calls consume too much gas
in fixtures such as `VMTests/vmIOandFlowOperations/jumpToPush`.

Enabling `CALLCODE` required replacing the old Yul-code helper path with the
same recursive bytecode runner used by the other direct call opcodes. The smoke
test now uses direct EVM bytecode for the child account and a real child step
budget; `exec_instruction` intentionally still uses the non-recursive default
runner.

Bounded checks for this slice:

```text
Generator unit tests: 20/20 passed.
Evm/Semantics.vo compiled successfully.
Evm/Tests/Smoke.vo compiled successfully.
Evm/Tests/Ethereum/Fixture.vo compiled successfully.
50/50 initial direct-CALL probe fixtures compiled successfully.
100/100 narrowed random direct-CALL probe fixtures compiled successfully.
100/100 narrowed random direct-STATICCALL probe fixtures compiled successfully.
20 generated direct-STATICCALL fixture modules from the main tree compiled
successfully.
100/100 direct `DELEGATECALL` probe fixtures compiled successfully with direct
`coqc` under the 6 GiB memory cap.
100/100 same `DELEGATECALL` sample modules compiled successfully through
`RocqMakefile` from the regenerated main `Generated/` tree.
100/100 direct `CALLCODE` probe fixtures compiled successfully with direct
`coqc` under the 6 GiB memory cap.
100/100 same `CALLCODE` sample modules compiled successfully through
`RocqMakefile` from the regenerated main `Generated/` tree.
```

Current largest skipped buckets:

```text
10199 direct CALL-family fixture requires unsupported precompile semantics
548 EIP-7702 set-code transaction entries
104 EIP-7702 authorization-list transaction entries
remaining direct/nested CREATE and CREATE2

Coarse skipped entries:
10616 unsupported precompile/CALL-family fixtures
2991 CREATE2 present
1271 CREATE present
652 EIP-7702 transaction forms

Opcode occurrences in remaining skip reasons:
8445 CREATE
6783 CREATE2
```

## CREATE/CREATE2 Slice

The EVM runner now executes `CREATE` and `CREATE2` directly for generated
state-test fixtures. This slice added complete-account handling for successful
and failed creation paths, including:

- CREATE/CREATE2 address derivation, recursive initcode execution, runtime code
  deployment, and parent memory/return-data behavior
- failed-creation rollback while preserving the creator nonce increment
- empty/new account handling, nonce initialization, and storage-aware collision
  checks for EIP-7610
- created-address warming before failure checks
- EIP-170 max runtime-code size checks
- EIP-2681 account nonce cap checks
- EIP-3541 `0xef` runtime-code prefix rejection for London-and-later protocols
- storage-key tracking in fixture accounts so collision checks can distinguish
  storage-bearing empty-code accounts
- a balanced byte lookup tree for large memory writes, avoiding linear scans
  over multi-kilobyte initcode/memory fixtures
- generated list compression for long repeated byte sequences
- fixture fuel based on each generated step budget instead of the old fixed
  `500` top-level runner fuel

The generator now permits fixtures containing `CREATE` and `CREATE2` when the
rest of the fixture is in the supported subset.

After regenerating with:

```sh
bash -lc 'ulimit -v 6291456; python3 rocq/scripts/evm_tests_generate.py --fixtures /tmp/eest_fixture_extract --all --out /home/fedora/Solidity/rocq-of-solidity/rocq/RocqOfSolidity/Evm/Tests/Ethereum/Generated --summary /tmp/rocq_evm_generated_summary.json'
```

the supported subset is:

```text
Generated 32187 Rocq EVM fixture modules
Manifest imports 32187
Blacklisted 0
Skipped total 11852
Approximate fixture-entry coverage 73.09%
```

Remaining skipped entries:

```text
11200 direct CALL-family fixture requires unsupported precompile semantics
548 EIP-7702 set-code transaction fixtures are not generated in this pass
104 EIP-7702 authorization-list transactions are not generated in this pass
```

Bounded checks for this slice:

```text
Generator unit tests passed.
Evm/Semantics.vo compiled successfully.
Evm/Tests/Smoke.vo compiled successfully.
Evm/Tests/Ethereum/Fixture.vo compiled successfully.
300/300 mixed generated CREATE/CREATE2 probe fixtures compiled successfully
with direct coqc under the 6 GiB memory cap.
```

The 300-fixture probe was selected from 3216 eligible generated fixtures and
covered 222 `CREATE`-containing fixtures plus 205 `CREATE2`-containing fixtures
with overlap between the two groups. It cleared the previously failing large
EIP-3860 initcode fixtures, EIP-170 code-size fixtures, EIP-2681 nonce-cap
fixtures, address-warming failure fixtures, EIP-3541 EF-prefix fixtures,
deep `BASEFEE` recursion fixtures, `LoopCallsDepthThenRevert3`, and SSTORE
variants.

## Current 32187-Module Pass

After adding repeated-byte-chunk compression to the fixture generator, long
loop-shaped bytecode now emits compact Rocq terms such as
`List.concat (List.repeat [...])` instead of thousands of literal bytes. The
generator unit test suite passed after this change.

The transient-storage out-of-gas loop family also needed an evaluator fast path:
deterministic Cancun/Prague loops that repeatedly execute transient-storage
instructions and can only end in out-of-gas are summarized directly by
`Semantics.run`. The underlying instruction semantics are unchanged; the fast
path avoids spending Rocq reduction time stepping through thousands of loop
iterations whose exceptional result rolls back in the fixture harness.

Focused checks completed under the 6 GiB memory cap:

```text
Generator unit tests: 24/24 passed.
Evm/Semantics.vo compiled successfully.
Evm/Tests/Smoke.vo compiled successfully.
Evm/Tests/Ethereum/Fixture.vo compiled successfully.
All six generated tstore out-of-gas Cancun/Prague fixtures compiled.
The real regenerated tstore out-of-gas modules compiled through make.
```

The current generated summary is:

```text
Generated 32187 Rocq EVM fixture modules
Manifest imports 32187
Blacklisted 0
Skipped total 11852
Approximate fixture-entry coverage 73.09%
```

Remaining skipped entries:

```text
11200 direct CALL-family fixture requires unsupported precompile semantics
548 EIP-7702 set-code transaction fixtures are not generated in this pass
104 EIP-7702 authorization-list transactions are not generated in this pass
```

A 30-minute bounded full-manifest run was launched with:

```sh
bash -lc 'ulimit -v 6291456; timeout 30m opam exec -- make -j1 Evm/Tests/Ethereum/Manifest.vo'
```

It timed out with exit code `124`, not with a Rocq semantic failure or memory
failure. At timeout, 3074 generated `.vo` files existed, about 9.6% of the
32187-module generated manifest. The run had compiled through large Berlin
access-list intrinsic-gas variants, EIP-196/EIP-197 gas-cost fixtures, and part
of the Cancun/Prague transient-storage reentrant-call family.

The last printed file before timeout was in:

```text
Evm/Tests/Ethereum/Generated/cancun_eip1153_tstore_test_reentrant_call_test_reentrant_call_fork_prague_state_test_tstore_in_r_*.v
```

Resume by rerunning the same bounded manifest command. Make should continue
from the generated `.vo` files already present. If the next run times out again,
isolate the current printed family with `make -f RocqMakefile "$vo"` before
editing semantics.

The timeout family was then isolated with:

```sh
bash -lc 'ulimit -v 6291456; for f in $(find Evm/Tests/Ethereum/Generated -name "cancun_eip1153_tstore_test_reentrant_call_test_reentrant_call_*.v" | sort); do vo=${f%.v}.vo; echo MAKE "$vo"; timeout 240s opam exec -- make -f RocqMakefile "$vo" || exit $?; done'
```

It passed with exit code `0`, including the Prague `tstore_in_r` module whose
`.vo` had been deleted when the full manifest timeout terminated `make`.

## Identity Precompile Expansion

The generator no longer treats `identity_precompile` fixture files as part of
the unsupported precompile bucket. Identity precompile execution was already
modeled as address `4`, but the broad path pattern had hidden those official
fixtures.

This expansion required a performance fix in the semantics: return data is now
represented either as materialized bytes or as a memory slice. Identity
precompile calls can therefore record a large returned byte range without
constructing the entire list eagerly. `RETURNDATASIZE` uses the slice length,
and `RETURNDATACOPY` materializes only the requested range. This is needed for
large identity-precompile fixtures that pass a 1,000,000-byte input and copy
only a small output prefix.

After regenerating with the same all-fixture command, the supported subset is:

```text
Generated 32475 Rocq EVM fixture modules
Manifest imports 32475
Blacklisted 0
Skipped total 11564
Approximate fixture-entry coverage 73.74%
```

Remaining skipped entries:

```text
10912 direct CALL-family fixture requires unsupported precompile semantics
548 EIP-7702 set-code transaction fixtures are not generated in this pass
104 EIP-7702 authorization-list transactions are not generated in this pass
```

Bounded checks completed under the 6 GiB memory cap:

```text
Generator unit tests passed: 24/24.
Evm/Semantics.vo compiled successfully.
Evm/Tests/Ethereum/Fixture.vo compiled successfully.
All 288 generated identity-precompile fixtures compiled.
```

The complete identity-precompile sweep used direct `coqc` after the core
dependencies had already been rebuilt:

```sh
bash -lc 'ulimit -v 6291456; for f in $(find Evm/Tests/Ethereum/Generated -name "*identity_precompile*.v" | sort); do vo=${f%.v}.vo; if [ -f "$vo" ]; then continue; fi; echo COQC "$f"; timeout 240s opam exec -- coqc -R . RocqOfSolidity -impredicative-set -w -stdlib-vector "$f" || exit $?; done'
```

## MODEXP Precompile Expansion

The MODEXP precompile should use modular exponentiation directly, not compute
`base ^ exponent` and reduce afterward. The current implementation keeps the
intermediate values reduced modulo `modulus` while scanning the exponent bytes,
so large fixtures do not build an enormous plain exponentiation term.

The first Rocq implementation used `Z` square-and-multiply with modular
reduction at each step. That was semantically the right algorithm, but large
MODEXP fixtures still timed out under `vm_compute` because repeated large
`Z.modulo` reductions were expensive. Native computation is not available in
the pinned switch:

```text
Coq/Rocq version: coq 8.20.1
Native compiler default: no
```

The current implementation therefore uses the Coq-8.20-compatible package
`coq-bignums.9.0.0+coq8.20` and BigN arithmetic for MODEXP output. Keep this
exact dependency family while the project stays on Coq 8.20.1. Do not install
unconstrained `rocq-bignums` in this switch; it can upgrade the switch to the
Rocq 9.x package set and break the pinned environment.

The BigN MODEXP path:

- parses the base and modulus from bytes once;
- reduces the base modulo the modulus before exponentiation;
- scans exponent bytes without first constructing a huge `Z` exponent;
- uses a 4-bit window table and repeated squaring;
- initializes the accumulator as `1 mod modulus`, which preserves edge cases
  such as `0 ^ 0 mod 1 = 0`;
- converts the final BigN back to exactly `modulus_length` output bytes.

Focused checks completed under the 6 GiB memory cap:

```text
Evm/Semantics.vo compiled successfully.
Evm/Tests/Ethereum/Fixture.vo compiled successfully.
Evm/Tests/Smoke.vo compiled successfully.
Previously timing-out Osaka EIP-7883 MODEXP test-vector fixture compiled.
The Byzantium `0 ^ 0 mod 1` regression fixture compiled.
All 1869 generated MODEXP fixtures compiled.
```

The full MODEXP sweep used direct `coqc` after core dependencies had already
been rebuilt:

```sh
bash -lc 'ulimit -v 6291456; failures=/tmp/modexp_failures.txt; : > "$failures"; count=0; for f in $(find Evm/Tests/Ethereum/Generated -name "*modexp*.v" | sort); do count=$((count + 1)); echo "COQC $count $f"; timeout 240s opam exec -- coqc -R . RocqOfSolidity -impredicative-set -w -stdlib-vector "$f"; status=$?; if [ $status -ne 0 ]; then echo "$status $f" | tee -a "$failures"; exit $status; fi; done; echo "MODEXP_OK $count"'
```

Result:

```text
MODEXP_OK 1869
```

## BLAKE2F Precompile Expansion

The EIP-152 BLAKE2F precompile is implemented as a real precompile, including
the invalid-input failure case. Generic precompile calls now check gas before
computing the output, so fixtures with huge round counts can fail as out of gas
without evaluating the compression function.

The implementation:

- parses the 213-byte EIP-152 input shape;
- reads rounds from the first four bytes in big-endian order;
- reads the `h`, `m`, `t0`, and `t1` words in little-endian order;
- rejects invalid input length or final-block flag with precompile failure;
- consumes the forwarded child gas on precompile failure;
- exposes BLAKE2F only from Istanbul onward.

Generator discovery after enabling the `blake2` direct-call fixture family:

```text
generated 46168
skipped_total 13478
12154 direct CALL-family fixture requires unsupported precompile semantics
1100 EIP-7702 set-code transaction fixtures are not generated in this pass
210 EIP-7702 authorization-list transactions are not generated in this pass
14 expected exception fixtures are not generated in this pass
```

This pass adds 937 generated BLAKE2F fixtures relative to the previous
supported set.

Focused checks completed under the 6 GiB memory cap:

```text
Generator unit tests passed: 24/24.
Evm/Semantics.vo compiled successfully.
Evm/Tests/Ethereum/Fixture.vo compiled successfully.
Evm/Tests/Smoke.vo compiled successfully.
The previously failing DELEGATECALL empty-input BLAKE2F fixture compiled.
All 937 generated BLAKE2F fixtures compiled.
```

The full BLAKE2F sweep used direct `coqc` after core dependencies had already
been rebuilt:

```sh
bash -lc 'ulimit -v 6291456; failures=/tmp/blake2_failures.txt; : > "$failures"; count=0; for f in $(find Evm/Tests/Ethereum/Generated -name "*blake2*.v" | sort); do count=$((count + 1)); echo "COQC $count $f"; timeout 240s opam exec -- coqc -R . RocqOfSolidity -impredicative-set -w -stdlib-vector "$f"; status=$?; if [ $status -ne 0 ]; then echo "$status $f" | tee -a "$failures"; exit $status; fi; done; echo "BLAKE2_OK $count"'
```

Result:

```text
BLAKE2_OK 937
```

## SHA256 and RIPEMD160 Precompile Expansion

The SHA256 and RIPEMD160 precompile fixture families are now generated. Before
this pass, large OOG precompile fixtures timed out because the generic CALL
path materialized the full input with `MLoad` before checking the precompile
gas cost. For inputs such as one million bytes with too little forwarded child
gas, the EVM should fail the precompile call without reading or hashing the
entire input region.

The generic precompile CALL/CALLCODE/DELEGATECALL/STATICCALL paths now compute
precompile gas from the call arguments first:

- SHA256, RIPEMD160, identity, ECADD, ECMUL, and pairing use the input size;
- ECRECOVER uses its fixed cost;
- BLAKE2F reads only the four-byte rounds prefix when the input size is exactly
  213 bytes;
- MODEXP remains on its dedicated path because its gas depends on header words
  inside the input.

Only calls with enough forwarded child gas materialize the full input and run
the precompile output function. Failed precompile calls now also clear return
data consistently.

Generator discovery after enabling the `sha256` and `ripemd` direct-call
fixture families:

```text
generated 46333
skipped_total 13313
11989 direct CALL-family fixture requires unsupported precompile semantics
1100 EIP-7702 set-code transaction fixtures are not generated in this pass
210 EIP-7702 authorization-list transactions are not generated in this pass
14 expected exception fixtures are not generated in this pass
```

This pass adds 165 generated SHA256/RIPEMD160 fixtures relative to the previous
supported set. The generated manifest was regenerated with all 46,333 modules
imported and no blacklist exclusions.

Focused checks completed under the 6 GiB memory cap:

```text
Generator unit tests passed: 24/24.
Evm/Semantics.vo compiled successfully.
Evm/Tests/Ethereum/Fixture.vo compiled successfully.
Evm/Tests/Smoke.vo compiled successfully.
The previously timing-out CALLCODESha256_5 fixture compiled.
The previously timing-out CALLCODERipemd160_5 fixture compiled.
All 165 generated SHA256/RIPEMD160 fixtures compiled.
```

The full SHA256/RIPEMD160 sweep used direct `coqc` after core dependencies had
already been rebuilt:

```sh
bash -lc 'ulimit -v 6291456; failures=/tmp/sha_ripemd_generated_failures.txt; : > "$failures"; count=0; for f in $(find Evm/Tests/Ethereum/Generated \( -name "*sha256*.v" -o -name "*ripemd*.v" \) | sort); do count=$((count + 1)); echo "COQC $count $f"; timeout 240s opam exec -- coqc -R . RocqOfSolidity -impredicative-set -w -stdlib-vector "$f"; status=$?; if [ $status -ne 0 ]; then echo "$status $f" | tee -a "$failures"; exit $status; fi; done; echo "SHA_RIPEMD_OK $count"'
```

Result:

```text
SHA_RIPEMD_OK 165
```

## Frontier Precompile Matrix Expansion

The `frontier/precompiles` fixture family is now generated. This family probes
precompile address existence and gas behavior across forks, including the
post-Cancun point-evaluation precompile, Prague BLS12-381 precompiles, and the
Osaka P256VERIFY precompile address.

The semantics now expose protocol-aware precompile availability and gas:

- Cancun enables address `10` with the fixed point-evaluation gas cost.
- Prague enables addresses `11` through `17` with the EIP-2537 BLS12-381 gas
  formulas and discount tables.
- Osaka additionally enables address `256` with the P256VERIFY fixed gas cost.
- BN254 ECADD and ECMUL now reject invalid points and compute valid G1
  addition/multiplication results for the generated fixture inputs.

Generator discovery after enabling the `frontier/precompiles` direct-call
fixture family:

```text
generated 46460
skipped_total 13186
11862 direct CALL-family fixture requires unsupported precompile semantics
1100 EIP-7702 set-code transaction fixtures are not generated in this pass
210 EIP-7702 authorization-list transactions are not generated in this pass
14 expected exception fixtures are not generated in this pass
```

This pass adds 127 generated `frontier/precompiles` fixtures relative to the
previous supported set. The generated manifest was regenerated with all 46,460
modules imported and no blacklist exclusions.

Focused checks completed under the 6 GiB memory cap:

```text
Generator unit tests passed: 24/24.
Evm/Semantics.vo compiled successfully.
Evm/Tests/Ethereum/Fixture.vo compiled successfully.
Evm/Tests/Smoke.vo compiled successfully.
Temporary frontier/precompiles probe compiled all 127 modules.
Generated frontier/precompiles sweep compiled all 127 modules.
```

The generated frontier/precompiles sweep used direct `coqc` after core
dependencies had already been rebuilt:

```sh
bash -lc 'ulimit -v 6291456; failures=/tmp/frontier_precompile_generated_failures.txt; : > "$failures"; count=0; for f in $(find Evm/Tests/Ethereum/Generated -name "frontier_precompiles*.v" | sort); do count=$((count + 1)); echo "COQC $count $f"; timeout 240s opam exec -- coqc -R . RocqOfSolidity -impredicative-set -w -stdlib-vector "$f"; status=$?; if [ $status -ne 0 ]; then echo "$status $f" | tee -a "$failures"; exit $status; fi; done; echo "FRONTIER_PRECOMPILE_OK $count"'
```

Result:

```text
FRONTIER_PRECOMPILE_OK 127
```

## Precompile Fixture Expansion

The `stPreCompiledContracts`, `stPreCompiledContracts2`, and non-pairing
`stZeroKnowledge` fixture families are now generated for the current local EEST
fixture extract. This pass adds direct CALL-family coverage for the legacy
precompile EIP-2929 matrix, the ECRECOVER matrix in
`stPreCompiledContracts2`, and BN254 G1 ECADD/ECMUL cases, while keeping the
already-supported SHA256, RIPEMD160, MODEXP, identity, and BLAKE2F precompile
cases in the same generated manifest.

The executable EVM now includes performance-oriented, semantics-preserving
support for ECRECOVER stress tests:

- ECRECOVER uses full secp256k1 public-key recovery instead of a single-vector
  stub.
- Precompile outputs are cached by address and canonical input bytes inside one
  EVM execution. For ECRECOVER the cache key is the 128-byte input slice the
  precompile actually reads, so extra trailing bytes do not force recomputation.
- ECRECOVER also caches the `(message_hash, v, r)` recovery base so fixtures
  that vary only `s` can reuse the recovered `R`, `r^-1`, and `(-z/r)G`
  component.
- Generated fixture modules now use one combined account/storage post-state
  proof, avoiding duplicate `Fixture.run` evaluation for those assertions.
  Expected transaction-validity exceptions are still checked separately when
  the fixture has `expectException`; runtime exceptional halts such as
  out-of-gas remain validated through the official post-state.
- BN254 ECMUL now uses Jacobian coordinates and a fixed 4-bit window internally,
  avoiding one affine modular inverse per double/add while preserving the
  precompile interface. BN254 pairing fixtures are still skipped because the
  executable pairing precompile is not implemented beyond input-shape checks.

Generator discovery for the current local `/tmp/eest_fixture_extract` snapshot
after enabling `stPreCompiledContracts`, `stPreCompiledContracts2`, and
non-pairing `stZeroKnowledge`:

```text
generated 39476
manifest_imports 39476
blacklisted 0
skipped_total 4563
3361 direct CALL-family fixture requires unsupported precompile semantics
550 BN254 pairing precompile fixtures are not generated in this pass
548 EIP-7702 set-code transaction fixtures are not generated in this pass
104 EIP-7702 authorization-list transactions are not generated in this pass
```

This current fixture snapshot contains 2,681 state-test JSON files. The
generated manifest has no blacklist exclusions.

Focused checks completed under the 6 GiB memory cap:

```text
Generator unit tests passed: 25/25.
Evm/Semantics.vo compiled successfully.
Evm/Tests/Ethereum/Fixture.vo compiled successfully.
Evm/Tests/Smoke.vo compiled successfully.
Generated stPreCompiledContracts2 regular ECRECOVER smoke fixture compiled.
Generated stPreCompiledContracts2 weird-v ECRECOVER smoke fixture compiled.
Generated stPreCompiledContracts2 RIPEMD160 smoke fixture compiled.
Generated stPreCompiledContracts2 ecrecoverShortBuff Cancun fixture compiled.
Generated stPreCompiledContracts2 ecrecoverShortBuff Prague fixture compiled.
Generated stPreCompiledContracts2 non-ECRECOVER sweep compiled 118/118 modules.
Generated stPreCompiledContracts2 weird-v ECRECOVER sweep compiled 72/72 modules.
Generated regular ECRECOVER sweep compiled 90/90 modules
  (88 stPreCompiledContracts2 modules and 2 stTransactionTest point-at-infinity modules).
Generated legacy stPreCompiledContracts precompile sweep compiled 926/926 modules.
Generated stZeroKnowledge ECADD smoke fixture compiled.
Generated stZeroKnowledge large-scalar ECMUL smoke fixture compiled.
Generated stZeroKnowledge non-pairing sweep compiled 2376/2376 modules.
```

The `ecrecoverShortBuff` fixtures are CPU-bound under `vm_compute`. They are not
memory failures, but they need a longer per-file timeout than the usual
240-300 second smoke bound. The measured temporary combined-proof Cancun module
spent about 380 seconds in `vm_compute`; the promoted main-tree Cancun and
Prague modules both compiled with this bounded command shape:

```sh
bash -lc 'ulimit -v 6291456; timeout 480s opam exec -- coqc -R . RocqOfSolidity -impredicative-set -w -stdlib-vector Evm/Tests/Ethereum/Generated/static_state_tests_stprecompiledcontracts2_ecrecovershortbuff_ecrecovershortbuff_fork_cancun_sta_f8c2f5610d.v'
```

The non-ECRECOVER promoted-family sweep used direct `coqc` after core
dependencies had already been rebuilt:

```sh
bash -lc 'ulimit -v 6291456; failures=/tmp/stprecompiledcontracts2_non_ecrecover_generated_failures.txt; : > "$failures"; count=0; for f in $(find Evm/Tests/Ethereum/Generated -name "static_state_tests_stprecompiledcontracts2_*.v" ! -iname "*ecrecover*" | sort); do count=$((count + 1)); echo "COQC $count $f"; timeout 180s opam exec -- coqc -R . RocqOfSolidity -impredicative-set -w -stdlib-vector "$f"; status=$?; if [ $status -ne 0 ]; then echo "$status $f" | tee -a "$failures"; exit $status; fi; done; echo "STPRECOMPILEDCONTRACTS2_NON_ECRECOVER_OK $count"'
```

Result:

```text
STPRECOMPILEDCONTRACTS2_NON_ECRECOVER_OK 118
```

The weird-v ECRECOVER sweep used the same direct `coqc` shape:

```sh
bash -lc 'ulimit -v 6291456; failures=/tmp/stprecompiledcontracts2_weirdv_generated_failures.txt; : > "$failures"; count=0; for f in $(find Evm/Tests/Ethereum/Generated -iname "*ecrecoverweirdv*.v" | sort); do count=$((count + 1)); echo "COQC $count $f"; timeout 120s opam exec -- coqc -R . RocqOfSolidity -impredicative-set -w -stdlib-vector "$f"; status=$?; if [ $status -ne 0 ]; then echo "$status $f" | tee -a "$failures"; exit $status; fi; done; echo "STPRECOMPILEDCONTRACTS2_WEIRDV_OK $count"'
```

Result:

```text
STPRECOMPILEDCONTRACTS2_WEIRDV_OK 72
```

The regular ECRECOVER sweep was split into 20-file batches to keep failures
localized and avoid oversized Rocq processes. Across the generated tree this
compiled all 90 regular ECRECOVER modules: 88 from `stPreCompiledContracts2`
and 2 `stTransactionTest/pointAtInfinityECRecover` modules.

```text
STPRECOMPILEDCONTRACTS2_REGULAR_ECRECOVER_BATCH1_OK 20
STPRECOMPILEDCONTRACTS2_REGULAR_ECRECOVER_BATCH2_OK 20
STPRECOMPILEDCONTRACTS2_REGULAR_ECRECOVER_BATCH3_OK 20
STPRECOMPILEDCONTRACTS2_REGULAR_ECRECOVER_BATCH4_OK 20
STPRECOMPILEDCONTRACTS2_REGULAR_ECRECOVER_BATCH5_OK 10
```

Enabling `stPreCompiledContracts` adds the legacy direct precompile EIP-2929
matrix plus the `sec80` cases. The targeted sweep compiled all newly generated
legacy modules:

```sh
bash -lc 'ulimit -v 6291456; failures=/tmp/stprecompiledcontracts_legacy_failures.txt; : > "$failures"; count=0; total=$(find Evm/Tests/Ethereum/Generated -name "static_state_tests_stprecompiledcontracts_precompseip2929*.v" -o -name "static_state_tests_stprecompiledcontracts_sec80*.v" | wc -l); for f in $(find Evm/Tests/Ethereum/Generated \( -name "static_state_tests_stprecompiledcontracts_precompseip2929*.v" -o -name "static_state_tests_stprecompiledcontracts_sec80*.v" \) | sort); do count=$((count + 1)); timeout 180s opam exec -- coqc -R . RocqOfSolidity -impredicative-set -w -stdlib-vector "$f" || exit $?; done; echo "STPRECOMPILEDCONTRACTS_LEGACY_OK $count"'
```

Result:

```text
STPRECOMPILEDCONTRACTS_LEGACY_OK 926
```
