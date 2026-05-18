# HUL-P0 / HUL-P1 Free-Reed Empirical Loop

Status: L1_packet -> measurement_required. This is not fabrication authority.

Use this loop before claiming any measured reed pull-down, stopped-pipe law,
full-body movement, or HUL-P1-or-later validation. The current packet contains
targets and measurement templates only; fields marked `TBD` or
`measurement_required` must stay empty until bench evidence exists.

## P0 Reed Coupon (HUL-P0)

1. Source and document the reed candidate in `p0-reed-coupon-log.csv` with
   a traceable `coupon_id`.
2. Deburr any sharp edge at the reed tongue and frame edge before pressure
   checks.
3. Verify mechanical retention (plate, frame, and clip or glue) in the same log.
4. Measure reed-alone pitch and note stable tuning range in `reed_alone_pitch_hz`.
5. Capture onset-pressure sweep with a controlled source.
6. Capture pull-down test for the target pipe note, using an explicit test method.
7. If leakage-like behavior is observed while the plate is retained, label it in
   `notes` and keep `status=measurement-required`.

## P1 Single-Melody-Pipe Control (HUL-P1)

1. Select exactly one P0 source for traceability.
2. Copy the `coupon_id` into `p1-single-melody-pipe-control-log.csv`.
3. Plan chamber sketch assumptions in `windchest-geometry-plan.csv` before
   interpreting coupled pitch.
4. Build only the controlled melody pipe setup (no full gourd/three-pipe body).
5. Capture coupled pitch, blow/draw behavior, leak test method, and leak source
   separation before moving to any full-body planning claim.
6. Only promote from P1 once one linked trial passes `safety-gates.csv`, has
   measured pitch/onset/leak evidence, and closes the relevant rows in
   `validation-loop.csv`.

## Current Authority Boundary

- `family-spec.csv` remains a planning table with
  `acoustic_law=unknown_requires_measurement` for hulusi rows until HUL-P0 and
  HUL-P1 measurements exist.
- `p0-reed-coupon-log.csv` and `p1-single-melody-pipe-control-log.csv` are
  templates. They do not contain measured pull-down, onset, blow/draw, or
  coupled-pitch results yet.
- `validation.csv` may name target notes and frequencies, but blank measured
  columns are intentional and must not be interpreted as passes.
- Drawings, concept images, workbook formulas, and OpenSCAD geometry are
  packet context only until measurement rows link them to physical evidence.

## Stop Conditions

- Any sharp edge or unstable plate retention before safe-pressure checks.
- Unidentified leak that cannot be separated from reed instability.
- P1 trial attempted without passing linked P0 safety checks.
- `safe_pressure_limit_pa` missing at P0 or P1.
