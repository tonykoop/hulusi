# HUL-P0 / HUL-P1 Free-Reed Empirical Loop

Status: L2 validation protocol. This is not fabrication authority.

Use this loop before claiming any full-body movement for `HUL-P1` or later.

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
6. Only promote from P1 once one linked trial passes `safety-gates.csv` and
   gate checks in `validation-loop.csv`.

## Stop Conditions

- Any sharp edge or unstable plate retention before safe-pressure checks.
- Unidentified leak that cannot be separated from reed instability.
- P1 trial attempted without passing linked P0 safety checks.
- `safe_pressure_limit_pa` missing at P0 or P1.
