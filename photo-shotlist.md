# Hulusi — Photography Shot List

> *v4 deliverable. The shot list for the build-log site, capstone deck, and visual BOM. Capture each shot as the build progresses; replace concept renders with shop photos as soon as they exist.*

> Camera: phone is fine; tripod + soft window light is better.
> Format: shoot RAW + JPG; landscape unless noted; 4:3 or 3:2 ratio.
> Background: shop neutral OR clean white seamless OR walnut-board pad.

---

## Hero shots (recruiter-grade)

### S01 — Hero, F-key full instrument, 3/4 view
- HUL-P2 finished and tuned.
- Light: soft, single-source, slightly above and right.
- Background: walnut-board pad with subtle wood grain.
- Frame: full instrument with 10% padding all sides; tassel visible.
- Use: README hero image, capstone deck title slide, site index hero.

### S02 — Family overview, all 5 keys laid out
- All 5 instruments (B♭, C, D, F, G) lined up horizontally on neutral background, longest left.
- Top-down, perfect alignment along gourd center axis.
- Use: README family table, capstone deck "family targets" slide, site family page.

### S03 — F-key playing portrait
- Player holding instrument in playing position, 3/4 view from front.
- Hands on melody pipe, drone pipes visible.
- Use: capstone deck "ergonomics" slide.

---

## Process shots (build-log narrative)

### S04 — Pakkawood blanks pre-bore
- Three 1 in OD round dowels stacked on shop bench; blank label tags visible.
- Caption: "Cut to Pipes!B15:D15 from Master_Inputs."
- Use: site build-log step 1.

### S05 — ShopBot CNC boring melody pipe
- Action shot during deep-bore peck cycle; shavings visible.
- Show clamping fixture and ShopBot bed.
- Use: site build-log step 2, capstone deck "manufacturing" slide.

### S06 — Walnut gourd halves on lathe
- One half on the lathe with Forstner bit advancing; second half resting alongside.
- Show grain pattern in the cut.
- Use: site build-log step 4, manufacturing slide.

### S07 — Brass shim sheet on Epilog laser bed
- Sheet on bed mid-cut; tongues visible in pattern.
- Show DXF file projected on laser monitor in background.
- Use: site build-log step 6.

### S08 — Reed assembly close-up (10× macro)
- Single completed reed: brass tongue + frame plate + glue line + slot.
- Macro lens or phone macro mode.
- Caption: "0.798 in × 0.157 in × 0.008 in brass tongue."
- Use: visual-BOM, capstone deck reed-detail slide.

### S09 — Beeswax + rosin double-boiler in action
- Shop process shot; thermometer visible; mixing stick.
- Use: site build-log step 9.

### S10 — All three reeds installed in pipes (top-down)
- Looking down into pipe tops with reed assemblies in place.
- Show wax fillet at each frame-plate joint.
- Use: visual-BOM "subassemblies" panel.

### S11 — Gourd-to-pipes joint detail
- Side view of gourd belly with three pipe tops emerging; brass binding ring (if used).
- Use: drawing-brief.md HUL-DRW-001 photo placeholder.

### S12 — Drone 2 waxable foot plug
- Macro shot of the wax plug at drone 2 foot.
- Player's fingernail in frame for scale.
- Use: capstone deck "playing techniques" slide, site step 11.

---

## Reference shots (for measurement and re-derivation)

### S13 — Caliper measurement of finger-hole positions
- Calipers on melody pipe; tape measure or rule for absolute distances.
- Each hole measured against `Holes!E:E`.
- Use: validation.csv reference.

### S14 — Tuner readout for each pipe note
- Phone tuner (Cleartune) showing measured Hz.
- One photo per condition (all-closed + 7 hole-open + 2 drones).
- Use: validation.csv photo evidence.

---

## Capture cadence

| Stage | Shots to capture |
|---|---|
| HUL-P0 reed coupon | S08 |
| HUL-P1 single melody pipe | S04, S05, S07, S08, S13, S14 |
| HUL-P2 full F-key build | S01, S03, S06, S09, S10, S11, S14 |
| HUL-P3 waxable Drone 2 | S12 |
| HUL-P4 family scaling | S02 |

---

## Style notes

- Phone is fine; tripod for product shots, handheld OK for process shots.
- Soft natural light (north window) preferred over flash.
- Walnut tone is warm — don't crush blacks; preserve grain detail.
- Brass should hold highlight without burning; underexpose by 1/3 stop if needed.
- Avoid logos, brand names, or messy backgrounds in any product shot.
- All photos: shoot 5–10 takes, pick best in post.

## File naming

`hulusi_<stage>_<shot-id>_<short-description>.jpg`

Examples:
- `hulusi_p2_s01_hero-3q.jpg`
- `hulusi_p1_s05_shopbot-bore.jpg`
- `hulusi_p2_s10_reeds-installed-topdown.jpg`

Save to `images/` (replacing concept-render placeholders) and `site/photos/` (web-resized 1600px max).
