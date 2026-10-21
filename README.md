# Bounds for the sign uncertainty constant in dimension one

Certificates and checking programs for the paper
*Bounds for the sign uncertainty constant in dimension one* by Tejasvi Singh Tomar
(Zenodo, [doi:10.5281/zenodo.23536160](https://doi.org/10.5281/zenodo.23536160)).

## Theorem

Normalize `f̂(ξ) = ∫ f(x) e^{−2πixξ} dx` and let `A(f) = inf{r > 0 : f(x) ≥ 0 for all |x| ≥ r}`.
Let `𝒜` be the set of nonzero even functions `f : ℝ → ℝ` with `f, f̂ ∈ L¹(ℝ)`, `f(0) ≤ 0` and `f̂(0) ≤ 0`, and
let `A₊(1) = inf_{f ∈ 𝒜} √(A(f) A(f̂))`. Then

    2751/5000 < A₊(1) ≤ 5509/10000,   so   0.30272004 < C_6.11 = A₊(1)² ≤ 30349081/100000000 = 0.30349081,

where `C_6.11` is the constant of Problem 6.11 of Georgiev, Gómez-Serrano, Tao and Wagner (arXiv:2511.02864),
defined with `f(0) < 0` and `f̂(0) < 0`. `C_6.11 = A₊(1)²` is Lemma 2.4 of the paper. For `≤`, the lemma uses a result
of Gonçalves, Oliveira e Silva and Ramos (J. Geom. Anal. 31 (2021), Proposition 3 of arXiv:2003.10765). The previous
bounds were
`0.2025 ≤ C_6.11` (Gonçalves, Oliveira e Silva and Steinerberger, J. Math. Anal. Appl. 451 (2017)) and
`C_6.11 ≤ 0.3089` (Chung, Du and Wesley, arXiv:2608.23691v2). The upper bound proves the first assertion of
Conjecture 1.7 of Gonçalves, Oliveira e Silva and Ramos (Discrete Anal. 2023), `A₊(1) < 0.555`. The upper bounds also
have a Lean 4 proof (`lean/`, see "Lean proof of the upper bound").

## Proof outline

Lower bound:

1. **Reduction** (Lemma 2.2). An extremizer exists (Gonçalves, Oliveira e Silva and Steinerberger, Theorem 3), so it
   suffices to show that every even self-dual `g ∈ L¹` with `g(0) ≤ 0` and `g ≥ 0` on `|x| > r` vanishes.
2. **Criterion** (Theorem 3.4). A certificate consists of Gaussian pairs `(a, s, c)`, cosine terms `(β, d)` with
   `β ≥ r`, `d ≥ 0`, and an even polynomial `ψ`. With
   `b(x) = e^{−πa(x−s)²} + e^{−πa(x+s)²}`, `b̂(y) = 2a^{−1/2} e^{−πy²/a} cos(2πsy)`,

       v   = Σ c (b − b̂) + Σ d cos(2πβ·),       φ = (1 − v + ψ) on [−r, r],  0 outside,
       W   = 1 − v + φ̂,                          ρ = φ̂ − ψ on [−r, r],
       κ(r) = (2r² + Si(4πr²)/(2π))^{1/2},

   the conditions `κ(r) < 1`, `W ≥ m` on `(r, ∞)`, `|ρ| ≤ e` on `[0, r]` and `m > 2re/(1 − κ(r))` imply
   `A₊(1) > r`. The proof uses the identity `g(0) = ∫_{|y|>r} gW + Σ d g(β) + ∫_{−r}^{r} gρ` for self-dual `g`
   and the bound `‖(Id − K)⁻¹‖ ≤ 1/(1 − κ(r))` for the integral operator `K` with kernel `cos(2πxy)` on `[−r, r]`.
3. **Verification.** Programs 1 and 2 check the four conditions for `certs/cert_r05502_K35.json` in ball arithmetic.

Upper bound (Lemma 5.1): if `g = Σ c (b + b̂)` satisfies `g(0) < 0` and `g ≥ 0` on `[r, ∞)`, then `g` is an even
self-dual function in both classes and `A(g) A(ĝ) ≤ r²`. Programs 3 and 4 check the two inequalities for
`certs/pcert_r05509_NR2.json` (`r = 5509/10000`).

## Files

| Path | Content |
|---|---|
| `certs/cert_r05502_K35.json` | lower bound, `r = 2751/5000`: 530 Gaussian pairs, 5 cosine terms, `ψ` of degree 40 |
| `certs/cert_r05485_X30.json` | lower bound without cosine terms, `r = 1097/2000` (450 Gaussian pairs) |
| `certs/cert_r0548_X30.json` | lower bound without cosine terms, `r = 137/250` (450 Gaussian pairs) |
| `certs/pcert_r05509_NR2.json` | upper bound, `r = 5509/10000`: 1808 Gaussian pairs (1605 on a grid, 202 narrow pairs with centers in [2/5, 3], and one wide pair) |
| `certs/controls/` | perturbed copies of the two main certificates (see Controls) |
| `checker/check_cert_pm.py` | program 1 (Gauss–Legendre quadrature with a Bernstein-ellipse error bound, 192-bit balls) |
| `checker/check_cert.py` | program 1 for certificates without cosine terms (the same code without them) |
| `checker/indep_check_pm.py` | program 2 (closed forms with the complex error function, 256-bit balls) |
| `checker/indep_check.py` | earlier version of program 2 for certificates without cosine terms |
| `checker/check_primal.py` | program 3 (upper bound: Taylor bounds on `[r, Y]`, dominant-Gaussian tail, 192-bit balls) |
| `checker/indep_primal.py` | program 4 (upper bound: interpolation bounds on `[r, 2Y]`, vertex tail bound, Arb and mpmath) |
| `logs/` | logs of the runs in Table 1 of the paper and of the controls |
| `search/` | the linear programs and certificate generators (not needed for checking) |
| `tests/` | floating-point checks used in the remarks of the paper (not part of the proof) |
| `lean/` | the Lean 4 proof of the upper bounds (see "Lean proof of the upper bound") |

SHA-256 checksums of all files are in `SHA256SUMS`.

Programs 1 and 2 were written separately, as were programs 3 and 4. Within each pair the two programs share only the
certificate format, the statement they check and one-line helpers. In the docstrings of programs 1 and 2 this
statement is called "Lemma certificate" (Theorem 3.4 of the paper).

## Certificate formats

All numbers are strings of exact fractions. The programs convert them to exact fractions and then to balls, so no
certificate number passes through floating point.

Lower bound:

- `"r"`: the radius, for example `"2751/5000"`;
- `"gauss"`: entries `[a, s, c, 0]` (Gaussian pair with width `a > 0`, center `s ≥ 0`, coefficient `c`; the fourth
  entry must be `0`);
- `"pm"`: entries `[β, d]` (cosine term `d cos(2πβx)`, with `β ≥ r` and `d ≥ 0`); absent if there are none;
- `"psi"`: `[q_0, …, q_20]` with `ψ(x) = Σ_k q_k x^{2k}`.

Upper bound: `"r"` and `"gauss"` with entries `[a, s, c]`, defining `g = Σ c (b + b̂)`. The pair with the smallest
`a` must be unique, with `c > 0` and the largest center. Programs 3 and 4 use it for the tail.

## Checking

The programs need Python 3 (we used 3.12.13) and `python-flint` (we used 0.9.0). Program 4 also needs `mpmath`
(we used 1.4.1):

    pip install python-flint==0.9.0 mpmath

Lower bound (`r = 2751/5000`):

    python3 checker/check_cert_pm.py certs/cert_r05502_K35.json --m 1/10000 --e 1/10000000 \
        --N 1600 --rho 11/10 --YT 1500 --w0 1/500 --workers 32
    python3 checker/indep_check_pm.py certs/cert_r05502_K35.json --m 3/50000 --e 1/500000 --hrho 1/150000 \
        --YT 1500 --nibp 8 --h0far 1/50 --workers 10

The result lines must read `RESULT: PASS => A_+(1) > 2751/5000 and C_6.11 > 7568001/25000000 = 0.30272004` and
`[indep] RESULT: PASS  (A_+(1) > 2751/5000)`, and both programs exit with status 0. The logged runs took 735 s and 1697 s
of wall-clock time on a shared server.

Upper bound (`r = 5509/10000`):

    python3 checker/check_primal.py certs/pcert_r05509_NR2.json --workers 24
    python3 checker/indep_primal.py certs/pcert_r05509_NR2.json --workers 20

The result lines must read `RESULT: PASS => A_+(1) <= 5509/10000 and C_6.11 <= 30349081/100000000 = 0.30349081` and
`[indep-primal] RESULT: PASS  (A_+(1) <= 5509/10000, C_6.11 <= 30349081/100000000 = 0.30349081)`. The logged runs
took 109 s and 302 s.

Certificates without cosine terms:

    python3 checker/check_cert.py certs/cert_r05485_X30.json --m 1/500 --e 1/10000000 --N 500 --YT 300 \
        --w0 1/500 --workers 40
    python3 checker/indep_check.py certs/cert_r05485_X30.json --m 1/1000 --e 1/40000 --YT 300 --nibp 8 --workers 30
    python3 checker/check_cert.py certs/cert_r0548_X30.json --m 1/400 --e 1/10000000 --N 500 --YT 300 \
        --w0 1/500 --workers 40
    python3 checker/indep_check.py certs/cert_r0548_X30.json --m 1/500 --e 1/20000 --YT 300 --nibp 8 --workers 30

`check_cert_pm.py` also accepts certificates without cosine terms, since the `"pm"` list is optional.

Several input checks are `assert` statements: for example β ≥ r and d ≥ 0, the tail conditions of programs 3 and 4,
and κ(r) < 1 in program 2. Since `python -O` would remove them, each program stops at start-up under `-O` with
the message `this checker relies on assert statements; run it without -O`.

### What the logs contain

| Log (`logs/`) | Certificate | Program | Key lines |
|---|---|---|---|
| `program1_cert_r05502_K35.log` | `cert_r05502_K35.json` | 1 | κ < 0.943802; W ≥ 0.0001 on [r, 1500] (805,759 interval evaluations); W ≥ 0.0427 on [1500, ∞); sup\|ρ\| ≤ 1.486e−10 |
| `program1_cert_r05502_K35_rerun.log` | `cert_r05502_K35.json` | 1 | independent rerun (see Provenance) |
| `program2_cert_r05502_K35.log` | `cert_r05502_K35.json` | 2 | W ≥ 0.00006 on [r, 1500] (192,401 intervals); W ≥ 0.0427 on [1500, ∞); \|ρ\| ≤ 2e−6 |
| `program1_cert_r05485_X30.log` | `cert_r05485_X30.json` | 1 | W ≥ 0.002 on [r, 300] (187,420 interval evaluations); W ≥ 0.6733 on [300, ∞) |
| `program2_cert_r05485_X30.log` | `cert_r05485_X30.json` | 2 | W ≥ 0.001 on [r, 300] (209,781 intervals); W ≥ 0.6762 on [300, ∞) |
| `program1_cert_r0548_X30.log` | `cert_r0548_X30.json` | 1 | W ≥ 0.0025 on [r, 300] (168,332 interval evaluations); W ≥ 0.6742 on [300, ∞) |
| `program2_cert_r0548_X30.log` | `cert_r0548_X30.json` | 2 | W ≥ 0.002 on [r, 300] (180,951 intervals); W ≥ 0.6770 on [300, ∞) |
| `program3_pcert_r05509_NR2.log` | `pcert_r05509_NR2.json` | 3 | g(0) < −1.000006e−8; g > 0 on [r, 92] (36,254 intervals, smallest bound 9.96e−9); g/G ≥ 1.93021e−5 on [92, ∞) |
| `program3_pcert_r05509_NR2_rerun.log` | `pcert_r05509_NR2.json` | 3 | independent rerun (see Provenance) |
| `program4_pcert_r05509_NR2.log` | `pcert_r05509_NR2.json` | 4 | g(0) in Arb and mpmath; g > 0 on [r, 184] (107,499 intervals); g/G ≥ 1.93021e−5 on [92, ∞) |

See Provenance for how these logs relate to the programs in `checker/`.

### Controls

Each control must fail under the programs that check it (`RESULT: FAIL`, or `rejected` when an input condition fails). Logs are in `logs/controls/`.
A negative lower bound on a small interval shows that the check fails there, but does not by itself prove that the
function is negative.

| Control | Programs 1/3 | Programs 2/4 |
|---|---|---|
| primary lower-bound data with `--m 17/100000`, above the value `W(2.9194477) < 0.0001633` | program 1 fails near y = 2.9195 (`program1_m000017.log`) | not run |
| `controls/neg_K35b_r05507.json`: lower-bound data with `r = 5507/10000` (cosine at β = r moved with it) | program 1 fails the checks of W (lower bound −0.038 near y = 32.49) and ρ (`program1_neg_K35b_r05507.log`) | program 2 fails the checks of W (lower bound −0.028 in [26.80, 27.05]) and ρ (`program2_neg_K35b_r05507.log`) |
| `controls/neg_K35b_perturb.json`: one coefficient `c` increased by 0.1 | program 1 fails the checks of W (lower bound −0.059 near y = 20.17) and ρ (`program1_neg_K35b_perturb.log`) | program 2 fails the checks of W (lower bound −0.02 in [19.80, 20.05]) and ρ (`program2_neg_K35b_perturb.log`) |
| `controls/neg_K35b_beta_inside.json`: the cosine at β = 2751/5000 moved to β = 5499/10000 < r | rejected on input | rejected on input |
| `controls/upper_r05505.json`: upper-bound data with `r = 1101/2000`, below the last zero of g (≈ 0.5508999) | program 3 fails at y ≈ 0.5508999 | program 4 fails at y ≈ 0.5508999 |
| `controls/upper_g0pos.json`: the coefficient of `(a, s) = (1, 0)` raised so that g(0) = +1.0e−8 | fails (g(0) ≥ 0) | fails |
| `controls/upper_dip70.json`: the coefficient of `(16, 70)` lowered by 0.001 | fails (failing intervals in [0.5859, 1.0309], [2.3109, 3.0759], [3.9109, 4.0309] and [69.7159, 70.2759]) | fails (negative lower bounds near y = 0.80, 1.03, 2.55, 2.80, 3.05, 3.07, 4.03 and in [69.55, 70.30]) |
| `controls/upper_wide_hat.json`: an extra pair `(4096, 1/4, 1e−12)`, which makes g negative far out | rejected (tail conditions) | rejected (tail conditions) |
| `controls/upper_tail_neg.json`: the coefficient of the wide pair made negative | rejected | rejected |

## Floating-point checks (`tests/`)

These support statements in the remarks of the paper and are not part of the proof.

- `wmin_eval.py`: value of `W` in ball arithmetic (program 2's closed form) at numerically located minimizers:
  `W(2.9194477) = 0.000163201886287 ± 3.0e−17` for the primary certificate, so `0.0001 ≤ inf W < 0.0001633`.
- `identity_test.py`: the identity `g(0) = ∫_{|y|>r} gW + Σ d g(β) + ∫_{−r}^{r} gρ` for eight self-dual test
  functions (Hermite functions `h_0, h_4, h_8, h_12` and four sums `b + b̂`), relative error below `1e−12`.
- `wshape.py`: a scan of `W` on `[r, 40]` (the intervals where `W < 0.0015`).
- `v0_baseline2.py`: the certificate with no Gaussian pairs and no cosine terms, for which `W = 1 + φ̂` stays positive for
  `r < 0.45355`.
- `cert_properties.py`: every property of the certificates stated in the paper (numbers of pairs, widths and centers,
  sizes and denominators of the coefficients, cosine terms, `ψ`, the wide pair of the upper bound), computed from the
  JSON files in exact arithmetic with the standard library (`logs/tests/cert_properties.log`).

Usage: `python3 -B tests/<script>.py <certificate>`. For `wmin_eval.py` the argument is the `checker/` directory.
`wshape.py` also takes `Ymax step threshold` and optionally a point at which to print `W`, for example
`40 0.0005 0.0015 2.9194477`, and `v0_baseline2.py` takes no argument.

## How the certificates were found (`search/`)

The checks do not depend on how the certificates were found. The scripts need `numpy`, `scipy`, `mpmath` and `highspy`.

Lower bound. For fixed `r`, Gaussian pairs and cosine frequencies, `φ` is replaced by the Nyström solution of
`(Id − K)φ = 1 − v`, so that `W` is affine in the coefficients. The linear program maximizes `t` subject to `W ≥ t`
on a grid of `[r, 1500]`, `|c| ≤ 1000`, `d ≥ 0` and `Σ d ≤ 0.95`, and adds the local minima of `W` on a finer grid as
cutting planes. `lp_g2.py` holds the closed forms (Faddeeva function). `hsolve.py` and `hsolve2.py` call the HiGHS
interior point method, and `hsolve2.py` retries failed solves with other settings. `gen_cert.py` and `gen_cert3.py`
round the solution to rationals and compute `ψ` from the moments of `φ`.

Primary certificate. We used `lp_cgd10.py`, a version of `lp_cgd6.py` that scales the columns for the interior point
method and uses a finer coarse grid:

    cd search
    python3 lp_cgd10.py --r 0.5502 --X 35 --cmax 1000 --ds 0.2 --widths 2,8,32 --pm 0.56:2.5:0.01 \
        --pmnear 0,0.0001,0.0005,0.001,0.002,0.003,0.005,0.0075 --dsum 0.95 --iters 30 --out k_X35_0.5502.json
    python3 gen_cert3.py k_X35_0.5502.json cert_r05502_K35.json 2751/5000

The runs in `lp_outputs/log_S30_5502.txt` and `lp_outputs/log_T45_5503.txt`, which returned negative values of `t` for
`r = 0.5502` and `r = 0.5503` (Section 7 of the paper), come from an earlier version of these scripts.

Certificates without cosine terms:

    python3 lp_cg.py --r 0.5485 --X 30 --ds 0.2 --out cg_r0.5485_X30.json
    python3 gen_cert.py cg_r0.5485_X30.json cert_r05485_X30.json 1097/2000

Applied to the recorded `lp_outputs/k_X35_0.5502.json`, `gen_cert3.py` reproduces the Gaussian pairs and cosine terms
of `certs/cert_r05502_K35.json` exactly. Depending on the floating-point library, the coefficients of `ψ` can differ in
the 16th significant digit. This changes only the residual `ρ`, which the checks bound.

Upper bound (`search/upper/`). `primal5.py` maximizes `ε` subject to `g ≥ ε w` on a grid of `[r, Y]`, `g(0) ≤ 0` and
`|c| ≤ cmax`, where `w = 1` up to the largest center `X` and `w` decays like the wide pair beyond it. Cutting planes
are added as above. `gen_primal.py` rounds the coefficients to multiples of `1e−12` and lowers the coefficient of the
pair `(1, 0)` so that `g(0)` is about `−1e−8`. `primal_lp.py` holds the basis functions. `primal7.py` is a version of
`primal5.py` with sparse matrices that also accepts narrow pairs (`--extra a:s0:s1:ds`). We used

    cd search/upper
    python3 primal7.py --X 80 --ds 0.25 --widths 1,2,4,8,16 --A 2048 --extra 64:0.4:3:0.02 \
        --extra 256:0.5:1.2:0.01 --rs 0.5509 --out pr7_NR2_0.5509.json
    python3 gen_primal.py pr7_NR2_0.5509_r0.5509.json pcert_r05509_NR2.json 5509/10000

Applied to the recorded `lp_outputs/pr7_NR2_0.5509_r0.5509.json`, `gen_primal.py` reproduces
`certs/pcert_r05509_NR2.json` exactly. `tests/cert_properties.py` computes the properties of `pcert_r05509_NR2.json`
stated in the paper, including `max |c| = 0.999999977971` and the adjusted `(1, 0)` coefficient, which is the only one
that is not a multiple of `1e−12`.

## Lean proof of the upper bound (`lean/`)

`lean/` contains a proof in Lean 4, with Mathlib, of

    def UpperStatement : Prop :=
      Aplus2 ≤ ENNReal.ofReal ((5509 / 10000) ^ 2) ∧ C611 ≤ ENNReal.ofReal ((5509 / 10000) ^ 2)

(`SignUnc.upperK : UpperStatement`, file `SignUnc/UpperMainK.lean`; the definitions are in `SignUnc/Defs.lean`). Here
`ft f` is Mathlib's Fourier transform of `f` (the normalization above) and `A f ∈ [0, ∞]` is the infimum of the
`r > 0` such that `f(x)` is real and nonnegative for `|x| ≥ r`. `Aplus2` is the infimum of `A(f) A(f̂)` over the class
`𝒜` above, with `f` continuous (the continuous versions), and `C611` is the infimum over the even integrable real `f` that are
continuous at `0` with `f(0) < 0` and `Re f̂(0) < 0`, that is, the class of Problem 6.11 for real-valued `f`. The
class for real-valued `f` is part of the class for complex-valued `f`, so the bound for `C611` also bounds the
infimum over complex-valued `f`. `SignUnc/APos.lean`
proves `A(f) > 0` and `A(f̂) > 0` on both classes, so that no product `A(f) A(f̂)` in the infima is `0 · ∞`. The lower
bound is not formalized; `SignUnc/Defs.lean` also states the lower bounds (`LowerStatementWeak`,
`MainStatement`), but they are not proved here.

The proof follows Section 5 of the paper:

- `SignUnc/Gauss.lean`: the Fourier transforms of `b` and `b̂`, from Mathlib's `fourier_gaussian_pi'` and Fourier
  inversion;
- `SignUnc/Upper.lean`: Lemma 5.1;
- `SUCert/IvalCore.lean` and `SignUnc/Ival/`: ball arithmetic with dyadic centres and radii, and its soundness;
- `SUCert/Jet.lean`, `SUCert/JetK.lean` (with definitions from `SUCert/Chk.lean`, `Chk3.lean` and `Grid.lean`): the
  checker. `[r, 92]` is covered by consecutive segments, each with a Taylor order `n`, a list of terms of `g` that are
  left out on it, and a subdivision into pieces. The checker bounds the omitted terms on the whole segment. On a piece
  `[y₀ − η, y₀ + η]` it computes the Taylor polynomial of order `n` at `y₀` of the sum of the remaining terms, from
  their moments grouped by width, bounds the Taylor coefficient of order `n + 1` on the piece, and verifies in exact
  integer arithmetic, by bisection and Taylor shifts, that the polynomial minus these bounds is positive on the piece.
  The base check tests `g(0) < 0` and the tail bound of Section 5 on `[92, ∞)`, and that the segments are contiguous
  and cover `[r, 92]`;
- `SignUnc/Jets.lean`, `JetSound.lean`, …, `JetSound4.lean`, `OmitSound.lean`, `PolySound.lean`, `TaylorN.lean`,
  `TaylorK.lean`, `PieceSound.lean` and `UpperK.lean`, with `Calc.lean`, `Calc3.lean`, `Tail.lean`, `ChkSound.lean`
  and `GridSound.lean`: the soundness of the checker (`SignUnc.Chk.upper_v4_sound`);
- `SUCert/DataGroups.lean`: the 1808 pairs of `certs/pcert_r05509_NR2.json`, grouped by width; `SUCert/UpperCfgK.lean`
  and `SignUnc/UpperShardsK/S0.lean`, …, `S729.lean`: 730 consecutive segments that cover `[r, 92]`, with Taylor orders
  from 6 to 16 and 2,569 pieces in all, each segment checked by one `decide +kernel`; `SignUnc/UpperShardsK/Base.lean`:
  the base check;
  `SignUnc/UpperMainK.lean`: the theorem.

`decide +kernel` has the Lean kernel itself evaluate each of the 731 checks, so the Lean compiler is not part of the
trusted base:
`#print axioms SignUnc.upperK` lists only `propext`, `Classical.choice` and `Quot.sound` (`results/axioms_shipped.txt`).
The lemmas `A_pos_classA`, `A_ft_pos_classA`, `A_pos_class611` and `A_ft_pos_class611` of `SignUnc/APos.lean` depend on
the same three axioms.

To build (toolchain `leanprover/lean4:v4.35.0-rc3` from `lean/lean-toolchain`, Mathlib `v4.35.0-rc3`):

    cd lean
    lake exe cache get          # prebuilt Mathlib
    lake build                  # SignUnc.UpperMainK and everything it imports
    lake env lean Axioms.lean   # prints the statements and their axioms

`results/axioms_shipped.txt` is the output of the last command for this tree. With the Mathlib build in place, plain
`lake build` took 7 minutes on a machine with 128 virtual CPUs (11.5 CPU-hours); building `SignUnc.UpperMainK` alone
took 6 minutes with 192 virtual CPUs (9.2 CPU-hours). A shard module needs up to about 8 GB of memory (4.6 GB for the
median one) and the base check about 11 GB. `lake build` runs one job per core, so on a machine with less than about 9
GB of memory per core, limit the number of jobs with the environment variable `LEAN_NUM_THREADS` (about the memory in GB
divided by 9). If `lake exe cache get` stops with "No file descriptors available (os error 24)", raise the limit on open
files (for example `ulimit -n 65536`). The library roots `SignUnc.lean` and `SUCert.lean` import only the modules of
this proof. `lakefile.toml` still builds `SUCert` with `precompileModules = true`, and its comment there mentions
`native_decide`, which this proof does not use: `decide +kernel` does not run the compiled code. The executables
declared in `lakefile.toml` (benchmarks and the generator `genjet`) are not included and are not needed for the proof.

In `lean/`, the commands

    python3 tools/gen_upper_groups.py ../certs/pcert_r05509_NR2.json SUCert/DataGroups.lean
    python3 toolsk/gen_shards_k.py data/v4_gen/sweep . 120 345

regenerate `SUCert/DataGroups.lean`, `SUCert/UpperCfgK.lean`, the shard modules, `SignUnc/UpperMainK.lean` and
`data/k_shards.check` byte for byte. The files in `data/v4_gen/sweep/` were written by a compiled Lean program that is
not included (`genjet`). For each of 105 segments of `[r, 92]` and three or four orders `n`, a line gives the segment
start, the terms left out in each group, the piece widths, whether a compiled run of the checker accepted the segment
and how long it took. The second script takes for each segment the fastest order, copies its pieces and choice of
terms into the Lean files, and splits the 105 segments into 730. The proof does not depend on these files: the kernel
checks every segment, and the base check checks that the segments are contiguous and cover `[r, 92]`.

## Provenance

The logs listed under "What the logs contain" were produced by the independently reviewed versions of the six programs.
The exception is `program3_pcert_r05509_NR2.log`, which comes from the program in `checker/`. The files here differ from
the versions we ran in two places:

- `checker/`: every program stops at start-up under `python -O` (see Checking), and one docstring sentence in
  `check_cert.py`, `check_cert_pm.py` and `check_primal.py` now deduces the bound on `C_6.11` directly from the
  definitions instead of from the equality `C_6.11 = A₊(1)²` (Lemma 2.4).
- `search/upper/primal5.py` and `search/upper/gen_primal.py`: a line that added a local directory to `sys.path` has been
  removed.

The Lean files in `lean/` are those of the formalization at the version we built, except `Axioms.lean`,
`results/axioms_shipped.txt` and the library roots `SignUnc.lean` and `SUCert.lean`, which are written here, and two
comment lines that named modules by their earlier names.

`logs/release_reruns/` holds the output of the programs in `checker/` on the certificates of Table 1 of the paper. These
logs reproduce the corresponding logs above. The two `_rerun` logs in `logs/` come from separate runs of the same
programs on separate copies of the certificates, and they are identical to the logs above apart from the times and
the last digits of the ball that program 1 prints for ∫|φ⁽⁶⁾|, which depend on the order of summation.

## License

Code: Apache-2.0 (see `LICENSE`). Paper and data: CC BY 4.0.
