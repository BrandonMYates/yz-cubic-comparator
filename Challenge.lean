/-
Copyright (c) 2026 Brandon Yates. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Challenge: no low-degree polynomial family for `yz(y+z) = x³ + x² + 3x − 1`

This file is the human-auditable statement. It imports only Mathlib, and it
introduces no definitions: `Polynomial ℚ`, `Polynomial.comp` and
`Polynomial.natDegree` are all stock Mathlib.

## The statement

Write `f = X³ + X² + 3X − 1`. A *polynomial family* for the Diophantine equation

`y·z·(y + z) = f(x)`

is a triple of polynomials `(g, u, v)` over `ℚ` with `g` nonconstant satisfying
the identity `u·v·(u + v) = f ∘ g`; substituting any value of the parameter into
such a triple produces a solution of the equation over `ℚ`, and this is the
standard way a Diophantine equation of this shape gets *solved*: one exhibits a
parametric family and the question is closed.

The single advertised theorem is that **no such family exists with
`deg g ≤ 4`**.

## What this does and does not settle

The equation is stated over `ℚ`, which is the stronger reading: an integer
family is in particular a rational one, so ruling out rational families with
`deg g ≤ 4` rules out integer families with `deg g ≤ 4` as well.

**This theorem does not decide whether the equation has integer solutions, and
makes no claim to.** Whether `y·z·(y + z) = x³ + x² + 3x − 1` is solvable in
integers is, at the time of writing, open; it is recorded on MathOverflow
(question 509449) as the smallest cubic equation of open solvability under
Grechuk's size ordering `H(P) = Σ|aᵢ|·2^{dᵢ}`, with `H = 35`. A solution could
still exist sporadically, or in a family with `deg g ≥ 5`, or in no family at
all. The theorem below closes one specific and standard route to a positive
answer, at low degree, and nothing more.

## Scope of the degree bound

`deg g = 5` is **not** covered and is not claimed: it admits slot-degree shapes
that the argument for `deg g ≤ 4` does not reach. The bound in the statement is
exactly the bound that is proved.
-/

namespace SmallestOpenCubic

open Polynomial

/-- **No polynomial family of degree at most four.**

There is no triple of rational polynomials `(g, u, v)` with `g` nonconstant of
degree at most `4` satisfying

`u · v · (u + v) = (X³ + X² + 3X − 1) ∘ g`.

Equivalently: the Diophantine equation `y·z·(y + z) = x³ + x² + 3x − 1` admits no
polynomial parametrization `(x, y, z) = (g(t), u(t), v(t))` over `ℚ` in which the
`x`-coordinate has degree between `1` and `4`.

The hypothesis `0 < g.natDegree` excludes constant `g`, for which the identity
degenerates to a single rational point of the equation rather than a family, and
carries no information about the equation's solvability in integers.

This statement concerns polynomial families only. It does **not** assert that the
equation has no integer solutions, and it does not depend on any unproved
hypothesis. -/
theorem no_polynomial_family_deg_le_four
    (g u v : Polynomial ℚ) (hg : 0 < g.natDegree) (hg4 : g.natDegree ≤ 4)
    (h : u * v * (u + v) = (X ^ 3 + X ^ 2 + 3 * X - 1 : Polynomial ℚ).comp g) :
    False := by
  sorry

end SmallestOpenCubic
