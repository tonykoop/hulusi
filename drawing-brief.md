# Hulusi Drawing Brief

## Required Views

- **Front view** with overall height, gourd belly OD, mouthpiece position, and three pipe outlets at gourd base.
- **Side view** showing pipe-axis angles (melody centered, drones at ±30°), gourd profile, and finger-hole face on melody pipe.
- **Top view** showing mouthpiece end, gourd-neck collar, and visible binding ring (if used).
- **Bottom view** showing pipe-foot openings, side-by-side, with foot diameter labels.
- **Section view through gourd centerline** — reveals wind chest volume, three pipe sockets, mouthpiece bore, and reed assembly clearances.
- **Reed-slot detail (×4 enlargement)** — tongue thickness, slot width, frame plate, mounting glue line, beeswax fillet.
- **Family-scale view** — silhouettes of B♭ / C / D / F / G with dimensional labels driven by `Family` sheet.

## Critical Dimensions

| Dimension | Source | Tolerance intent |
|---|---|---|
| Pipe total cut length (×3) | `Pipes!B15:D15` (named globals) | Tuning critical (±0.010 in) |
| Pipe bore ID | `mel_bore_ID`, `dr1_bore_ID`, `dr2_bore_ID` | Tuning critical (±0.005 in) |
| Finger hole positions | `Holes!E6:E12` | Tuning critical (±0.010 in) |
| Finger hole diameter | `mel_hole_dia` | Tuning + ergonomics (±0.005 in) |
| Reed tongue length (×3) | `Pipes!B19:D19` | Tuning critical (±0.003 in) |
| Reed slot width | `Pipes!B21:D21` | Reed seal critical (±0.002 in) |
| Reed tongue thickness | `reed_thickness` | Pitch + voice (sheet-stock tolerance) |
| Gourd belly OD | `gourd_belly_OD` | Cosmetic / ergonomic |
| Gourd internal volume | `gourd_volume_in3` | Pressure stability (±5 in³ acceptable) |
| Pipe-socket bore | 1.000 in (per HUL-CUT-003) | Air seal (±0.005 in for press-fit) |
| Mouthpiece bore | `gourd_neck_OD` | Air seal |

## Notes For CAD

- Use a SolidWorks design table linked to `hulusi-design-table.xlsx`. Global-variable names must match the `Master_Inputs!C` column **exactly** (e.g. `c_speed`, `mel_bore_ID`, `dr1_target_offset`).
- Parametrize the family configuration as a single `key_midi` configuration variable; SW should regenerate every dimension when switched between B♭/C/D/F/G.
- Keep finger-hole positions as a feature *array* indexed off the pipe foot, not absolute Y coordinates — this matches the `Holes!E:E` formula and avoids drift if `mel_reed_pad` changes.
- The reed assembly is a separate sub-assembly (`reed-assembly.SLDASM`) so the same model serves all three pipes by configuration.
- **`cad/hulusi-design-table.txt`** is the SW global-var parity reference — keep it up to date with the Excel file.
- The waxable Drone 2 foot plug is **not** parametrically modelled — it's a hand-shaped feature added after first acoustic test.
- For drawings export: use SVG for `drawings/` repo files, and DXF for laser-cuttable parts under `cnc/`.

## Drawing Sheet Layout

| Sheet | Title | Views | Scale |
|---|---|---|---|
| HUL-DRW-001 | Gourd Wind Chest | Front, side, section, mold-split | 1:1 |
| HUL-DRW-002 | Tube Set + Holes | Three tubes side-by-side, hole detail, foot detail | 1:1 |
| HUL-DRW-003 | Reed Assembly | Reed plate, tongue, slot, mounted view | 4:1 |
| HUL-DRW-004 | Sealant Application | Wax fillet sections at gourd-pipe + reed-frame | 2:1 |
| HUL-DRW-005 | Mouthpiece Insert | Lathe profile + bore section | 2:1 |
| HUL-DRW-006 | Family Scale | B♭/C/D/F/G silhouettes with dim table | 1:2 |
