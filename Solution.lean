/-
Copyright (c) 2026 Brandon Yates. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import YZCubic.Main

/-!
# Solution

The proof development lives in the `YZCubic` library, pinned by commit in
`lakefile.toml`. This file restates the Challenge theorem verbatim and discharges it by
direct application of the library's theorem. The polynomial `X ^ 3 + X ^ 2 + 3 * X - 1`
appears literally in both statements; the `example` below records that it is
*definitionally* the library's `YZCubic.fq`, so no translation step is involved.
-/

namespace SmallestOpenCubic

open Polynomial

/-- Definitional bridge: the Challenge's inline polynomial is the library's `fq`. -/
example : (X ^ 3 + X ^ 2 + 3 * X - 1 : Polynomial ℚ) = YZCubic.fq := rfl

theorem no_polynomial_family_deg_le_four
    (g u v : Polynomial ℚ) (hg : 0 < g.natDegree) (hg4 : g.natDegree ≤ 4)
    (h : u * v * (u + v) = (X ^ 3 + X ^ 2 + 3 * X - 1 : Polynomial ℚ).comp g) :
    False :=
  YZCubic.no_polynomial_family_deg_le_four g u v hg hg4 h

end SmallestOpenCubic
