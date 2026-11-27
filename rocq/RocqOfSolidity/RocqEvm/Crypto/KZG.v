(** EIP-4844 point evaluation over BLS12-381. Field elements here are reduced.
    The G2 constants are the generator and the second G2 monomial from the
    Ethereum ceremony, in affine (real, imaginary) coordinates. *)
From Coq Require Import ZArith Bool.
From Bignums Require Import BigN.BigN.
From RocqOfSolidity.RocqEvm.Crypto Require Import PrimeCurve.
Open Scope Z_scope.

Definition modulus := 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab.
Definition order := 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001.
Definition p := of_Z modulus.
Definition generator : point := Some (
  of_Z 3685416753713387016781088315183077757961620795782546409894578378688607592378376318836054947676345821548104185464507,
  of_Z 1339506544944476473020471379941921221584933875938349620426543736416511423956333506472724655353366534992391756441569).

(* IETF BLS compressed G1 encoding. [Some None] is the canonical infinity. *)
Definition decompress (encoded : Z) : option point :=
  let flags := Z.shiftr encoded 381 in
  let x := encoded mod (2 ^ 381) in
  if flags =? 6 then if x =? 0 then Some None else None
  else if ((flags =? 4) || (flags =? 5)) && (x <? modulus) then
    let fx := of_Z x in
    let rhs := add p (mul p fx (mul p fx fx)) (of_Z 4) in
    let y := power (mul p) rhs (Z.to_pos ((modulus + 1) / 4)) in
    if BigN.eqb (mul p y y) rhs then
      let high := modulus <? 2 * BigN.to_Z y in
      let pt := Some (fx, if Bool.eqb high (flags =? 5) then y else sub p zero y) in
      match scale p zero pt order with None => Some pt | _ => None end
    else None
  else None.

(* Fp2 = Fp[i]/(i²+1), Fp6 = Fp2[v]/(v³-(1+i)), Fp12 = Fp6[w]/(w²-v). *)
Definition fp2 := (field * field)%type.
Definition zero2 : fp2 := (zero, zero).
Definition one2 : fp2 := (one, zero).
Definition add2 (x y : fp2) : fp2 := (add p (fst x) (fst y), add p (snd x) (snd y)).
Definition sub2 (x y : fp2) : fp2 := (sub p (fst x) (fst y), sub p (snd x) (snd y)).
Definition scale2 (x : fp2) (c : field) : fp2 := (mul p (fst x) c, mul p (snd x) c).
Definition mul2 (x y : fp2) : fp2 :=
  let a := mul p (fst x) (fst y) in
  let b := mul p (snd x) (snd y) in
  (sub p a b, sub p (sub p (mul p (add p (fst x) (snd x)) (add p (fst y) (snd y))) a) b).
Definition xi (x : fp2) : fp2 := (sub p (fst x) (snd x), add p (fst x) (snd x)).

Definition fp6 := (fp2 * fp2 * fp2)%type.
Definition zero6 : fp6 := (zero2, zero2, zero2).
Definition one6 : fp6 := (one2, zero2, zero2).
Definition add6 (x y : fp6) : fp6 :=
  let '(a,b,c) := x in let '(d,e,f) := y in (add2 a d, add2 b e, add2 c f).
Definition sub6 (x y : fp6) : fp6 :=
  let '(a,b,c) := x in let '(d,e,f) := y in (sub2 a d, sub2 b e, sub2 c f).
Definition times_v (x : fp6) : fp6 := let '(a,b,c) := x in (xi c, a, b).
Definition mul6 (x y : fp6) : fp6 :=
  let '(a,b,c) := x in let '(d,e,f) := y in
  let ad := mul2 a d in let be := mul2 b e in let cf := mul2 c f in
  let cross := fun a b d e ad be => sub2 (sub2 (mul2 (add2 a b) (add2 d e)) ad) be in
  (add2 ad (xi (cross b c e f be cf)),
   add2 (cross a b d e ad be) (xi cf),
   add2 (cross a c d f ad cf) be).

Definition fp12 := (fp6 * fp6)%type.
Definition one12 : fp12 := (one6, zero6).
Definition mul12 (x y : fp12) : fp12 :=
  let '(a,b) := x in let '(c,d) := y in
  let ac := mul6 a c in let bd := mul6 b d in
  (add6 ac (times_v bd), sub6 (sub6 (mul6 (add6 a b) (add6 c d)) ac) bd).
Definition eq2 (x y : fp2) : bool := BigN.eqb (fst x) (fst y) && BigN.eqb (snd x) (snd y).
Definition eq6 (x y : fp6) : bool :=
  let '(a,b,c) := x in let '(d,e,f) := y in eq2 a d && eq2 b e && eq2 c f.

Definition twist_point := (fp2 * fp2)%type.
Definition g2 : twist_point := (
  (of_Z 352701069587466618187139116011060144890029952792775240219908644239793785735715026873347600343865175952761926303160,
   of_Z 3059144344244213709971259814753781636986470325476647558659373206291635324768958432433509563104347017837885763365758),
  (of_Z 1985150602287291935568054521177171638300868978215655730859378665066344726373823718423869104263333984641494340347905,
   of_Z 927553665492332455747201965776037880757740193453592970025027978793976877002675564980949289727957565575433344219582)).
Definition setup_g2_1 : twist_point := (
  (of_Z 0x185cbfee53492714734429b7b38608e23926c911cceceac9a36851477ba4c60b087041de621000edc98edada20c1def2,
   of_Z 0x15bfd7dd8cdeb128843bc287230af38926187075cbfbefa81009a2ce615ac53d2914e5870cb452d2afaaab24f3499f72),
  (of_Z 0x14353bdb96b626dd7d5ee8599d1fca2131569490e28de18e82451a496a9c9794ce26d105941f383ee689bfbbb832a99,
   of_Z 0x1666c54b0a32529503432fcae0181b4bef79de09fc63671fda5ed1ba9bfa07899495346f3d7ac9cd23048ef30d0a154f)).

(* Tate pairing with the Miller loop on G1. Evaluate the chord at the untwisted
   point (qx/w²,qy/w³) and scale by w³. This scale and vertical denominators
   belong to proper subfields and disappear under the final exponentiation. *)
Definition evaluate_line (l : coefficients) (q : twist_point) : fp12 :=
  match l with
  | Some (a,b,c) => ((scale2 (snd q) a, zero2, zero2),
                     (scale2 (fst q) b, (c,zero), zero2))
  | None => one12
  end.

Fixpoint miller (n : positive) (pt : point) (q : twist_point) : jacobian * fp12 :=
  match n with
  | xH => (project pt, one12)
  | xO k =>
    let '(u, f) := miller k pt q in
    let '(v, l) := double_line p zero u in (v, mul12 (mul12 f f) (evaluate_line l q))
  | xI k =>
    let '(u, f) := miller k pt q in
    let '(v, tangent) := double_line p zero u in let '(s, secant) := add_line p zero v pt in
    (s, mul12 (mul12 (mul12 f f) (evaluate_line tangent q)) (evaluate_line secant q))
  end.

Definition verify (commitment z y proof : Z) : bool :=
  (0 <=? z) && (z <? order) && (0 <=? y) && (y <? order) &&
  match decompress commitment, decompress proof with
  | Some c, Some pi =>
    (* e(C - yG + z*pi, G2) * e(-pi, [s]G2) = 1. *)
    let left := point_add p zero (point_add p zero c (negate p (scale p zero generator y)))
                                 (scale p zero pi z) in
    match left, pi with
    | None, None => true
    | Some _, Some _ =>
      let product := mul12 (snd (miller (Z.to_pos order) left g2))
                           (snd (miller (Z.to_pos order) (negate p pi) setup_g2_1)) in
      let result := power mul12 product (Z.to_pos ((modulus ^ 12 - 1) / order)) in
      eq6 (fst result) one6 && eq6 (snd result) zero6
    | _, _ => false
    end
  | _, _ => false
  end.
