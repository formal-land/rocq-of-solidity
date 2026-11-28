(** Arithmetic for short Weierstrass curves over odd prime fields. *)
From Coq Require Import ZArith Znumtheory Bool.
From Bignums Require Import BigN.BigN.

Open Scope Z_scope.

Definition field := BigN.t.
Definition of_Z (x : Z) : field := BigN.of_N (Z.to_N x).
Definition zero := BigN.zero.
Definition one := BigN.one.

(* Both operands are reduced field elements. *)
Definition add (p x y : field) : field :=
  let z := BigN.add x y in if BigN.ltb z p then z else BigN.sub z p.
Definition sub (p x y : field) : field :=
  if BigN.ltb x y then BigN.sub p (BigN.sub y x) else BigN.sub x y.
Definition mul (p x y : field) : field := BigN.modulo (BigN.mul x y) p.
Definition inv (p x : field) : field :=
  let modulus := BigN.to_Z p in
  let '(u, _, _) := extgcd (BigN.to_Z x) modulus in of_Z (u mod modulus).

Fixpoint power {T : Type} (multiply : T -> T -> T) (x : T) (n : positive) : T :=
  match n with
  | xH => x
  | xO k => let y := power multiply x k in multiply y y
  | xI k => let y := power multiply x k in multiply (multiply y y) x
  end.

Definition point := option (field * field)%type.
Definition negate (p : field) (pt : point) : point :=
  option_map (fun xy => (fst xy, sub p zero (snd xy))) pt.

(* Jacobian coordinates x = X/Z², y = Y/Z³. The line coefficients
   (A,B,C) are for A*y + B*x + C through the two affine points. A
   vertical line may be omitted by the BLS pairing's denominator elimination. *)
Definition jacobian := (field * field * field)%type.
Definition coefficients := option (field * field * field)%type.
Definition infinity : jacobian := (zero, one, zero).
Definition project (pt : point) : jacobian :=
  match pt with None => infinity | Some (x,y) => (x,y,one) end.
Definition affine (p : field) (pt : jacobian) : point :=
  let '(x,y,z) := pt in
  if BigN.eqb z zero then None else
    let iz := inv p z in let zz := mul p iz iz in
    Some (mul p x zz, mul p y (mul p zz iz)).

Definition double_line (p a : field) (pt : jacobian) : jacobian * coefficients :=
  let '(x,y,z) := pt in
  if BigN.eqb z zero || BigN.eqb y zero then (infinity, None) else
  let twice := fun v => add p v v in
  let xx := mul p x x in let yy := mul p y y in let zz := mul p z z in
  let m := add p (add p (twice xx) xx) (mul p a (mul p zz zz)) in
  let s := twice (twice (mul p x yy)) in
  let nx := sub p (mul p m m) (twice s) in
  let ny := sub p (mul p m (sub p s nx)) (twice (twice (twice (mul p yy yy)))) in
  let nz := twice (mul p y z) in
  ((nx, ny, nz), Some (mul p nz zz, sub p zero (mul p m zz), sub p (mul p m x) (twice yy))).

Definition add_line (p a : field) (pt : jacobian) (base : point) : jacobian * coefficients :=
  let '(x,y,z) := pt in
  match base with
  | None => (pt, None)
  | Some (u,v) =>
    if BigN.eqb z zero then (project base, None) else
    let zz := mul p z z in let zzz := mul p z zz in
    let h := sub p (mul p u zz) x in let r := sub p (mul p v zzz) y in
    if BigN.eqb h zero then
      if BigN.eqb r zero then double_line p a pt else (infinity, None)
    else
      let hh := mul p h h in let hhh := mul p hh h in let t := mul p x hh in
      let nx := sub p (sub p (mul p r r) hhh) (add p t t) in
      let ny := sub p (mul p r (sub p t nx)) (mul p y hhh) in
      ((nx,ny,mul p z h), Some (mul p h zzz, sub p zero (mul p r zz),
                                sub p (mul p r x) (mul p h y)))
  end.

Fixpoint scale_positive (p a : field) (base : point) (k : positive) : jacobian :=
  match k with
  | xH => project base
  | xO n => fst (double_line p a (scale_positive p a base n))
  | xI n => fst (add_line p a (fst (double_line p a (scale_positive p a base n))) base)
  end.

Definition scale (p a : field) (pt : point) (n : Z) : point :=
  match n with Zpos k => affine p (scale_positive p a pt k) | _ => None end.

Definition on_curve (p a b x y : field) : bool :=
  BigN.eqb (mul p y y) (add p (mul p x (add p (mul p x x) a)) b).

Definition point_add (p a : field) (left right : point) : point :=
  affine p (fst (add_line p a (project left) right)).
