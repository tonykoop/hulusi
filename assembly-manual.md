# Hulusi Assembly Manual

## Scope

This manual covers wooden-gourd hulusi prototypes driven by `hulusi-design-table.xlsx`, starting with the F-key standard and expanding to a B♭/C/D/G family. Reeds are brass C26000 cantilever free reeds, laser-cut and hand-tuned.

## Tools

- SolidWorks (parametric model linked to the design table via global variables).
- ShopBot CNC router (or lathe drill jig) for tube boring + cutoff.
- Wood lathe (12 in+ swing) for gourd halves and mouthpiece.
- Drill press with stop block + indexing fence (for finger holes).
- Epilog laser cutter (brass-shim reed tongues + frame plates from `cnc/reed-tongue.dxf`).
- Calipers, dial indicator, square, deep-bore depth gauge.
- Reed file set (fine needle files, six-piece minimum).
- Tuner / mic / DAW for validation.
- Beeswax + rosin double-boiler for luthier's wax.
- Standard hand tools: chisel, scraper, sandpaper to 400, CA glue + accelerator.

## Process

1. **Confirm design table inputs**
   - Open `hulusi-design-table.xlsx`, set `key_midi` to target key (65 = F4 standard).
   - Verify SolidWorks design table is linked and has refreshed (`Tools → Equations → Manage`).
   - Print `Pipes` and `Holes` sheets — these are the shop reference.

2. **Cut and bore tubes (HUL-CUT-004 / 005 / 006)**
   - Cut three pakkawood tube blanks to total cut lengths from `Pipes!B15:D15`.
   - Bore 0.500 in ID through each. Verify bore concentricity with dial indicator at both ends.
   - Square both ends; mark "REED" end on each (the upper end where the brass mounts).

3. **Drill finger holes on melody pipe (HUL-CUT-007)**
   - Index off the open foot (bottom). Use stop block at each `Holes!E:E` distance.
   - **Drill undersize first** (0.250 in pilot); ream to `mel_hole_dia` only after acoustic test in step 11.
   - Holes 1-6 on front (in-line); hole 7 on back, slightly offset for thumb comfort.

4. **Lathe-turn gourd halves (HUL-CUT-001 / 002)**
   - Turn outer profile from `gourd_belly_OD` and `gourd_height` parameters.
   - Hollow each half to `gourd_volume_in3` cumulative — verify by water-fill at leather-glue stage.
   - Glue halves with hide glue (reversible) or epoxy. Clamp 24 hours.

5. **Bore pipe sockets in gourd (HUL-CUT-003)**
   - Drill three 1.0 in sockets through gourd lower half: melody centered, drones at ±30° angle on either side.
   - Socket depth = 0.50 in (matches `mel_reed_pad`); bushing inserts give the press-fit seal.
   - Test-fit each tube dry before any glue.

6. **Cut reed frame plates (HUL-CUT-008)**
   - Laser-cut brass plates (0.040 in stock) on the Epilog using `cnc/reed-frame.dxf`.
   - Slot opening per `Pipes!B21:D21` (default 0.163 in for 4 mm tongue + 0.003 clearance × 2).
   - Deburr edges with #400 sandpaper.

7. **Cut reed tongues (HUL-CUT-009)**
   - Laser-cut brass shim 0.008 in tongues using `cnc/reed-tongue.dxf`.
   - Lengths per `Pipes!B19:D19` (default F-key: melody 0.80 in, drone1 0.65 in, drone2 0.56 in).
   - Cut **3-4× spares per pipe** — reeds are consumables until voicing locked.

8. **Mount reeds on frame plates**
   - CA-glue tongue to frame plate at the *root only* (a 0.05 in glue line).
   - Center the tongue in the slot; visual gap ~0.003 in per side.
   - Sound test by blowing across the tongue — should sound a pure note within 50 ¢ of `Pipes!B18:D18` target (sharp by `pull_down_cents`).
   - File tip to raise pitch, file root to lower pitch. Work in 0.005 in increments.

9. **Mount reed assemblies onto pipes**
   - Beeswax-rosin seal between reed-plate underside and pipe top (REED-marked end).
   - Reed faces *inward* (into pipe / gourd chest). Air flow: mouthpiece → gourd → pipe top → reed → pipe → open foot.
   - Press firmly; the wax should ooze 1-2 mm at the joint, then trim flush.

10. **Press-fit pipes into gourd**
    - Wax-and-rosin seal each pipe-to-socket joint.
    - Melody centered; drone 1 (5th) on player's right; drone 2 (octave/wax) on player's left (traditional Dai layout).
    - Mouthpiece insert into gourd neck, also wax-sealed.

11. **First acoustic test — solo each pipe**
    - Cover all melody finger holes; play each note from `Holes` sheet sequentially (open hole 1, then 2, …).
    - Record measured frequency for each in `validation.csv`.
    - Drone 1 and Drone 2 produce continuous tones; record both.
    - Compute cents-error per row (formula in `Validation!H:H`).

12. **Tune by wax addition or hole reaming**
    - **Sharp by < 25 ¢**: leave alone — within tolerance.
    - **Sharp by 25-50 ¢**: ream the offending hole 0.005 in larger (raises hole pitch).
    - **Flat by 25-50 ¢**: add wax pastille to hole *edge* on the foot side (lowers hole pitch by partially closing the hole).
    - **All pipes flat by similar amount**: set `correction_pct` positive in Master_Inputs and re-cut next build's pipes. Don't re-cut current build.
    - **Reed flat (whole pipe flat regardless of holes)**: re-file reed tongue tip to raise.

13. **Drone 2 wax foot plug (HUL-P3 stage)**
    - Mix luthier's wax: 4 parts beeswax + 1 part pine rosin by mass; melt + cool to soft pastille.
    - Apply pastille at drone 2 open foot, leaving a small uncovered slot.
    - Player can scrape the wax with a fingernail mid-phrase to "open" or "close" the drone.
    - Tune the wax-covered pitch separately — typically a 4th or 5th below the open drone.

14. **Final validation**
    - Re-measure all `validation.csv` rows after a 24-hour rest (humidity stabilization).
    - Hand to second player to verify ergonomic comfort.
    - Photograph for `images/` and update README hero.

## Failure Modes To Watch

- **Reed silent or warbling**: tongue too tight in slot — file slot wider, or tongue too loose — re-cut.
- **Reed sounds but pipe doesn't speak**: gourd-to-pipe seal leak — re-wax. Or mouth-pressure too low — try harder breath.
- **One pipe overpowers the others**: reed too thin (high airflow, low impedance match) — try thicker shim. Or pipe wall too thin — sub a thicker wall blank.
- **All pipes consistently flat post-build**: set `correction_pct` positive in `Master_Inputs` for next build.
- **Hole notes uneven (some sharp, some flat)**: hole position error from off-by-one drill stop. Re-measure each hole's `dist_from_foot` against `Holes!E:E`.
- **Drone 2 wax falls off**: ratio of rosin too low (try 5:1 wax:rosin instead of 4:1) or wax not fully cooled before applying.
- **Reed cracks at root**: brass too thin or too brittle — try 0.010 in shim, or anneal the brass first (heat dull red, air-cool).
