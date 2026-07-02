# Design Intent — hulusi rev A

- Master CAD: `cad/hulusi_master.scad` (sha256: 09122c5d95fe8ca64bc4ffd42cb419d3c381c7d547291c67cc4f469978cc8437), driven by `hulusi-design-table.xlsx` (sha256: 96e78c1af470efa0f7b07dfe98b2f6359d96213cd88ba5c72c2b699771b92a35)
- Function: Wooden cucurbit stopped-pipe free-reed flute (hulusi/bawu class) — a gourd wind chest feeds one melody pipe (7 finger holes) and two drone pipes, each with a free brass reed mounted at the pipe head that is pulled toward the played pitch by the coupled tube. Five-key family (Bb/C/D/F/G); F-key is the primary prototype target. Per the skill's hulusi-bawu-stopped-pipe-free-reed reference, this stays `unknown_requires_measurement` until HUL-P0 (reed coupon) and HUL-P1 (single melody-pipe control) produce measured pull-down, onset-pressure, and leak evidence.
- Environment: hand-held, breath-pressure-driven wind instrument; reed pull-down and pipe response are pressure- and humidity-sensitive; gourd is a two-half glued shell under cyclic pressure/humidity load (risks.md structural risk).
- Target qty: 1 (F-key prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Melody pipe total length (F-key) | 10.05 in | measured HUL-P1 all-closed pitch vs. target 349.23 Hz | intonation | family-spec.csv HUL-F (measurement_required) |
| Reed tongue length (melody, F-key) | 0.798 in | `L = sqrt(K*t/f)`; K drifts ±15% by shim lot (risks.md A2) | tuning | family-spec.csv (measurement_required) |
| Reed thickness | 0.008 in | brass C26000 shim spec (bom.csv HUL-BOM-005) | reed stiffness/pitch | design table Master_Inputs (measurement_required) |
| Pull-down | -30 cents (estimate) | measured via HUL-P0 coupon before any pipe is cut (risks.md A1) | tube/reed coupling accuracy | p0-reed-coupon-log.csv (measurement_required) |
| Finger-hole span (F-key, 6 front holes) | 3.7 in (4.78-8.51 in from foot) | ergonomic fit check vs. 5th-percentile hand span (risks.md ergonomic risk) | playability | cad/hulusi_master.scad ECHO output (measurement_required) |
| Onset pressure | TBD | must stay below logged safe limit during sweep (safety-gates.csv SAFE-003) | safety / reed survival | p0-reed-coupon-log.csv (measurement_required) |

## Incidental (free for DFM)

- Gourd exterior shaping/finish, mouthpiece cosmetic material (boxwood vs. horn), tassel/decorative tubing choices (risks.md fit/finish risks).

## Must-nots (DFM may never violate)

- Do not treat any reed, pipe, or hole-position value as fabrication authority until HUL-P0 (reed coupon) and HUL-P1 (single-pipe control) produce measured data (hulusi-bawu reference; visual-output-register.csv notes throughout).
- No image, DXF, or PDF may be treated as cut-ready before the empirical loop completes (safety-gates.csv SAFE-007 authority_overclaim gate).
- Do not exceed the logged safe onset pressure during any P0 sweep; stop and revise gap/source if exceeded (safety-gates.csv SAFE-003).
- Do not handle reed tongue/frame edges before deburring (safety-gates.csv SAFE-001); do not test with an unregulated/manual air source (SAFE-004).
- Do not cut real reeds/pipes from the -30 cent pull-down estimate — it is a starting estimate only, sensitive to tube/reed coupling and port impedance (risks.md A1).

## Material intent

- Preferred: pakkawood pipes, brass C26000 reed shim, walnut gourd, beeswax/rosin seal, per bom.csv.
- Acceptable subs: dried Lagenaria gourd for traditional build (bom.csv HUL-BOM-001 note), hard maple if pipe-stock supply changes (risks.md supply risk).
- Forbidden: none recorded beyond deferring production CAD/DXF until measured evidence exists.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable. HUL-P0/HUL-P1 measured evidence remains outstanding; packet stays at README status L1 concept packet.
