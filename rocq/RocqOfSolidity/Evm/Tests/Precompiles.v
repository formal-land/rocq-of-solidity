Require Import RocqOfSolidity.RocqOfSolidity.
Require Import RocqOfSolidity.simulations.RocqOfSolidity.
Require Import RocqOfSolidity.Evm.Semantics.

(* Ethereum execution-spec-tests, verify_kzg_proof_case_correct_proof_31ebd010e6098750. *)
Definition commitment := 0x8f59a8d2a1a625a17f3fea0fe5eb8c896db3764f3185481bc22f91b4aaffcca25f26936857bc3a7c2539ea8ec3a952b7.
Definition z := 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000000.
Definition y := 0x1522a4a7f34e1ea350ae07c29c96c7e79655aa926122e95fe69fcbd932ca49e9.
Definition proof_point := 0xa62ad71d14c5719385c0686f1871430475bf3a00f0aa3f7b8dd99a9abc2160744faf0070725e00b60ad9a026a15b1a8c.

Example verifies_nonconstant_polynomial : KZG.verify commitment z y proof_point = true.
Proof. vm_compute. reflexivity. Qed.

Example rejects_wrong_evaluation : KZG.verify commitment z (y + 1) proof_point = false.
Proof. vm_compute. reflexivity. Qed.

(* EIP-7951, Wycheproof EcdsaP1363Verify SHA-256 vector 1. *)
Definition p256_input :=
  List.concat (List.map Memory.u256_as_bytes [
    0xbb5a52f42f9c9261ed4361f59422a1e30036e7c32b270c8807a419feca605023;
    0x2ba3a8be6b94d5ec80a6d9d1190a436effe50d85a1eee859b8cc6af9bd5c2e18;
    0x4cd60b855d442f5b3c7b11eb6c4e0ae7525fe710fab9aa7c77a67f79e6fadd76;
    0x2927b10512bae3eddcfe467828128bad2903269919f7086069c8c4df6c732838;
    0xc7787964eaac00e5921fb1498a60f4606766b3d9685001558d1a974e7341513e
  ]).
Example p256_activates_at_osaka :
  (available_precompile_output Protocol.Prague 256 p256_input,
   available_precompile_output Protocol.Osaka 256 p256_input) =
  (None, Some (Memory.u256_as_bytes 1)).
Proof. vm_compute. reflexivity. Qed.

Example rejects_noncanonical_kzg_infinity :
  KZG.decompress (7 * 2 ^ 381) = None.
Proof. vm_compute. reflexivity. Qed.

Example rejects_kzg_scalar_at_modulus :
  KZG.verify commitment KZG.order y proof_point = false.
Proof. vm_compute. reflexivity. Qed.

Example rejects_p256_with_trailing_byte :
  available_precompile_output Protocol.Osaka 256 (p256_input ++ [0]) = Some [].
Proof. vm_compute. reflexivity. Qed.

Definition modexp_lengths (base exponent modulus : Z) :=
  Memory.u256_as_bytes base ++ Memory.u256_as_bytes exponent ++ Memory.u256_as_bytes modulus.

Example osaka_modexp_operand_limits :
  (Stdlib.modexp_lengths_valid Protocol.Osaka (modexp_lengths 1024 1024 1024),
   available_precompile_output Protocol.Osaka 5 (modexp_lengths 1025 0 0),
   available_precompile_output Protocol.Osaka 5 (modexp_lengths 0 1025 0),
   available_precompile_output Protocol.Osaka 5 (modexp_lengths 0 0 1025),
   available_precompile_output Protocol.Prague 5 (modexp_lengths 1025 0 0)) =
  (true, None, None, None, Some []).
Proof. vm_compute. reflexivity. Qed.
