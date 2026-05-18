# Hulusi (葫芦丝) — Design Intent & Physics Model

## Source

- Design table: [`hulusi-design-table.xlsx`](hulusi-design-table.xlsx)
- Sheets: `Master_Inputs` (named globals), `Acoustics`, `Pipes`, `Holes`, `Family`, `BOM`, `Validation`
- Workflow generation: v4.1 — single-source-of-truth `Master_Inputs` block, every other sheet derived via formulas, named ranges match SolidWorks global-variable names exactly.

## Design Intent

Build a slip-cast-quality wooden hulusi family with predictable pitch across keys (B♭ / C / D / F / G), a repeatable reed-cutting procedure, and a parametric workbook that drives the SolidWorks model directly. The first production target is the F-key (the modern standard), followed by family scaling.

The hulusi is **three independent stopped-pipe + free-reed systems sharing a gourd wind chest**. Volume and shape of the gourd are not strongly resonant — the gourd's job is to pressurize and distribute breath. Pitch comes from each pipe's effective length, finger-hole positions on the melody pipe, and the cantilever-tuned brass reeds.

## Governing Model

### Stopped pipe (each tube, reed at top, open foot)

```text
f_pipe = c / (4 · L_eff)
L_eff  = L_acoustic + 0.6 · r_bore        (open-end correction)
```

Speed of sound `c = 13552 in/s` at 68 °F (workbook variable `c_speed`).

### Finger holes (melody pipe only)

Each opened hole shortens the effective length:

```text
dist_from_foot(hole_n) = L_acoustic · (f_fund / f_hole_n)
```

This is the same shortening rule used in the duduk and quena sheets of the master workbook. End correction at the bottom is preserved; no second end correction is applied at the open hole because the pipe doesn't truly terminate there — the open hole is a weak boundary.

### Free reed (cantilever)

```text
f_reed = K · t / L_tongue²
```

Brass C26000 → `K_imperial ≈ 27,300` (with `t` in inches, `L` in inches, output in Hz). The cantilever model is exact for a clamped-free beam; in practice the brass tongue oscillates against a slot in a frame plate, and pull-down behaviour from the tube means the reed is **cut sharp** by `pull_down_cents` (default −30 ¢ relative to pipe target). The pipe then pulls the reed down to its own resonance frequency.

### Pull-down empirical loop

`pull_down_cents` and `correction_pct` in `Master_Inputs` are the two empirical knobs:

- `pull_down_cents` — how sharp to cut the reed relative to the pipe target. Free-reed builders typically tune the reed alone first (off the gourd), then find the playing pitch is a fixed offset below that. Start at −30 ¢; refine after HUL-P0 reed coupon.
- `correction_pct` — global pipe-length scale factor. If every pipe in the family lands consistently flat after the first build, set this positive; the workbook re-emits all pipe lengths automatically.

This separation matches the udu repo's spirit (parametric inputs + empirical correction column) but adds the named-global pattern Tony's design conventions call for.

### HUL-P0 / HUL-P1 empirical loop (Round 23 B0)

Before any full hulusi body progress, this packet requires an explicit two-step loop:

1. Run one HUL-P0 reed coupon in `p0-reed-coupon-log.csv` and capture pull-down, onset, and safe handling checks in one row.
2. Carry the traced `coupon_id` into `p1-single-melody-pipe-control-log.csv` and capture coupled pitch, leak status, and pressure behavior for one controlled melody-pipe trial.
3. Record windchest assumptions in `windchest-geometry-plan.csv` before moving to chamber claims.
4. Gate every next step through `validation-loop.csv` and `safety-gates.csv` before any branch promotion.

`free-reed-empirical-loop.md` is the procedural source of truth for step sequencing and stop conditions.

## Current Workbook Inputs (defaults)

| Group | Field | Value | Notes |
|---|---|---:|---|
| Constants | `c_speed` | 13,552 in/s | 68 °F |
| | `A4_ref` | 440.0 Hz | concert pitch |
| Key | `key_midi` | 65 | F4 = standard |
| Gourd | `gourd_volume_in3` | 25 | wind chest |
| | `gourd_belly_OD` | 4.50 in | lathe-turned |
| | `gourd_height` | 6.50 in | neck base → belly base |
| | `gourd_wall` | 0.20 in | wood, not resonant |
| | `gourd_species` | Walnut | dropdown |
| Melody pipe | `mel_bore_ID` | 0.500 in | 12.7 mm |
| | `mel_wall` | 0.125 in | 3.2 mm |
| | `mel_hole_dia` | 0.275 in | 7 mm |
| | `mel_hole_count` | 7 | 6 front + 1 thumb |
| | `mel_reed_pad` | 0.50 in | reed mount allowance |
| | `mel_wood` | Pakkawood | dropdown |
| Drone 1 | `dr1_bore_ID` | 0.500 in | match melody |
| | `dr1_target_offset` | +7 | perfect 5th |
| Drone 2 | `dr2_bore_ID` | 0.500 in | |
| | `dr2_target_offset` | +12 | octave (waxable) |
| Reed | `reed_E_psi` | 14.5 × 10⁶ | brass |
| | `reed_thickness` | 0.008 in | 8 mil shim |
| | `reed_tongue_w` | 0.157 in | 4 mm |
| | `reed_K_imperial` | 27,300 | derived constant |
| | `reed_material` | Brass C26000 | dropdown |
| Empirical | `pull_down_cents` | −30 ¢ | reed cut sharp |
| | `correction_pct` | 0 % | post-build calibration |
| | `end_corr_k` | 0.6 | unflanged Levine-Schwinger |

## Family Targets (live from workbook)

All five rows recompute when any `Master_Inputs` value changes.

| Model | Key | All-closed note | Mel L | Dr1 (5th) L | Dr2 (oct) L | Reed L (mel) |
|---|---|---|---:|---:|---:|---:|
| HUL-B♭ | B♭ | F3 (175 Hz)  | 14.89 in | 10.05 in | 7.62 in | 0.98 in |
| HUL-C  | C  | G3 (196 Hz)  | 13.30 in |  8.99 in | 6.82 in | 0.92 in |
| HUL-D  | D  | A3 (220 Hz)  | 11.89 in |  8.05 in | 6.12 in | 0.87 in |
| HUL-F  | F  | C4 (262 Hz)* | 10.05 in |  6.82 in | 5.20 in | 0.80 in |
| HUL-G  | G  | D4 (294 Hz)  |  8.99 in |  6.12 in | 4.67 in | 0.75 in |

\* The F-row in the table actually shows the all-closed pitch as F4 (349 Hz) under the "modern Western" convention used in this build. Traditional Dai tuning has all-closed = sol (one fifth below the key letter), which can be re-derived by setting `key_midi = tonic_MIDI - 5`. Both conventions are documented in the `Holes` sheet.

## Critical Design Features

- **Reed slot tolerance.** The brass tongue must clear the frame slot by ~0.003 in per side (0.075 mm). Tighter and the reed fouls; looser and the seal leaks and pitch drops.
- **Reed-pad clearance** above the acoustic top of each tube absorbs the reed mount and beeswax fillet. The default 0.50 in is a build-time allowance, not an acoustic parameter.
- **Hole comfort.** The melody-pipe hole positions in the `Holes` sheet are correct acoustically but may not be ergonomic — the design table gives the *target* positions; small ergonomic shifts (±0.10 in) are absorbed by reed-tuning.
- **Gourd-to-tube seal** is wax + rosin ("luthier's wax"). Leaks here drop pitch and steal volume from every pipe equally.
- **Drone 2 wax plug.** The traditional waxable drone has a wax cap covering its open foot. Player can scrape part of the wax with a fingernail to "open" the drone mid-phrase. Build the wax plug after first acoustic test, not before.

## Cultural Note

The hulusi (葫芦丝, *húlúsī*) belongs to the Dai people of Yunnan, with cousin instruments across Yunnan's other ethnic groups (Lahu, Wa, Achang, De'ang) and across the border into northern Thailand and Laos (the *naw* and *peeloo*). The traditional instrument uses a real dried bottle gourd (*Lagenaria siceraria*) and bamboo pipes. This project uses lathe-turned hardwood gourds and pakkawood pipes for build repeatability and bench durability.

The lineage attribution belongs in the README and any product-facing copy. Build documentation should keep the cultural note visible and separate from marketing.

## Mold / Construction Strategy

Unlike the udu (slip-cast ceramic), the hulusi is fully turned/machined wood and brass:

- **Gourd:** Lathe-turned in two halves from walnut blank, hollowed via deep-bore tool or split-and-glue. Joined with three through-pipe sockets.
- **Pipes:** ShopBot CNC bore on the long axis (or hand drill jig); finger holes drilled with stop-blocks per `Holes!E:E`.
- **Reeds:** Brass shim sheets laser-cut on Epilog using `cnc/reed-tongue.dxf`. Each reed is hand-tuned with a needle file: scrape at the *tip* to raise pitch, scrape near the *root* to lower it.
- **Assembly:** Reeds CA-glued onto frame plates, frame plates beeswax-sealed into pipe tops, pipes wax-sealed into gourd sockets. Mouthpiece insert in gourd neck.

## Prototype Ladder

| Prototype | Goal | Success criteria |
|---|---|---|
| **HUL-P0** reed coupon | Validate brass-shim cutting, slot fit, reed filing | Reed sounds cleanly at predicted f ±50 ¢; consistent across 3 cuts |
| **HUL-P1** single melody pipe (F-key) | Validate stopped-pipe model + finger-hole layout | All 7 hole notes within ±25 ¢ of target after wax tuning |
| **HUL-P2** full F-key hulusi | Hit family target with gourd + 3 pipes | Tonic, 5th drone, oct drone all in tune; air seal at gourd joints |
| **HUL-P3** waxable second drone | Implement removable-wax drone control | Player can mute/unmute Dr2 mid-phrase without leakage |
| **HUL-P4** family molds/jigs | Scale to B♭/C/D/G | Predictable pitch trend; reed-cut jig usable for all 5 keys |

## Open Assumptions

- `reed_K_imperial = 27,300` is computed from brass C26000 published moduli; verify against measured natural frequency on the HUL-P0 coupon.
- The `pull_down_cents = −30` value is a starting estimate. Free-reed pull-down depends on reed-to-tube coupling strength, which scales with port impedance; expect this to drift across keys until `correction_pct` is calibrated.
- Workbook costs in `bom.csv` are estimates and have not been date-checked.
- The "all-closed = tonic" naming convention assumed here is the modern Western/factory standard. Many traditional Dai hulusis follow "all-closed = sol", which is one perfect-fifth lower for the same letter-name. Both are reachable from the same workbook by adjusting `key_midi`.
- Hand position and finger comfort are not modelled — the workbook places holes where the *physics* says they belong; final ergonomic shifts are absorbed by wax tuning during HUL-P1/P2.
