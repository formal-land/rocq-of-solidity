(** EIP-7951, P256VERIFY. All five arguments are unsigned 32-byte words. *)
From Coq Require Import ZArith Bool.
From Bignums Require Import BigN.BigN.
From RocqOfSolidity.RocqEvm.Crypto Require Import PrimeCurve.
Open Scope Z_scope.

Definition modulus := 0xffffffff00000001000000000000000000000000ffffffffffffffffffffffff.
Definition order := 0xffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551.
Definition p := of_Z modulus.
Definition a := of_Z (modulus - 3).
Definition b := of_Z 0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b.
Definition generator : point := Some (
  of_Z 0x6b17d1f2e12c4247f8bce6e563a440f277037d812deb33a0f4a13945d898c296,
  of_Z 0x4fe342e2fe1a7f9b8ee7eb4a7c0f9e162bce33576b315ececbb6406837bf51f5).

Definition verify (hash r s qx qy : Z) : bool :=
  (0 <? r) && (r <? order) && (0 <? s) && (s <? order) &&
  (0 <=? qx) && (qx <? modulus) && (0 <=? qy) && (qy <? modulus) &&
  on_curve p a b (of_Z qx) (of_Z qy) &&
  let inverse := BigN.to_Z (inv (of_Z order) (of_Z s)) in
  let u := (hash * inverse) mod order in
  let v := (r * inverse) mod order in
  match point_add p a (scale p a generator u) (scale p a (Some (of_Z qx, of_Z qy)) v) with
  | Some (x, _) => BigN.to_Z x mod order =? r
  | None => false
  end.
