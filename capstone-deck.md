# Hulusi (葫芦丝) — Wooden Cucurbit Free-Reed Flute Family (HUL-001) — Build Packet
- Musical instrument documentation capstone — v4.1 scaffold
- Packet: github.com/tonykoop/hulusi
- Generated: 2026-05-05

---

# How To Use This Packet
- Start with `design.md` for intent and the stopped-pipe + free-reed physics.
- Open `hulusi-design-table.xlsx` and confirm the `Master_Inputs` block before any cutting.
- Use `bom.csv`, `sourcing.csv`, and `cut-list.csv` before buying or cutting.
- Use `drawing-brief.md` and the `cad/`, `cnc/`, `drawings/` folders before machining.
- Print the packet for shopping, shop work, and validation.

---

# What's new in v4.1
- `Master_Inputs` sheet with 33 named globals — single source of truth.
- Every other workbook sheet derives from named globals via formula — no static numbers.
- SolidWorks global-var parity sheet (`cad/hulusi-design-table.txt`) keeps Excel ↔ SW link self-documenting.
- `Family` sheet recomputes all 5 keys live; change one input → all keys update.
- Empirical knobs (`pull_down_cents`, `correction_pct`) absorb measured pitch drift.
- Validation log auto-fills cents-error when measured Hz is entered.

---

# File Map
- `design.md`: physics, intent, prototype ladder, cultural lineage.
- `hulusi-design-table.xlsx`: parametric workbook — 7 sheets, 33 named globals, 113 formulas.
- `bom.csv`: 15-item bill of materials.
- `sourcing.csv`: supplier/search tracker with substitution rules.
- `cut-list.csv`: 12 cuts including family scaling row.
- `validation.csv`: target/measured/cents-error log scaffolded for HUL-P0..P3.
- `assembly-manual.md`: 14-step shop sequence with failure-mode notes.
- `drawing-brief.md`: required views + critical dimensions table.
- `visual-bom-brief.md`: one-page exploded BOM art direction.
- `supplier-rfq.md`: copy-paste RFQ template.
- `wolfram-starter.wl`: physics sanity-check notebook.
- `cad/hulusi_master.scad`: parametric OpenSCAD starter, family-aware.
- `cad/hulusi-design-table.txt`: SW global-var parity reference.
- `drawings/hulusi-section.svg`, `hulusi-family-scale.svg`, `reed-detail.svg`: dimensioned drawings.

---

# Build Workflow
1. Confirm `Master_Inputs` cells; verify SW design-table link refreshed.
2. Cut and bore three pakkawood tube blanks per `Pipes` sheet.
3. Drill finger holes on melody (undersized first).
4. Lathe-turn walnut gourd halves; glue; bore three pipe sockets.
5. Laser-cut brass reed tongues + frame plates per `cnc/reed-tongue.dxf`.
6. Mount reeds on frame plates (CA glue at root); voice-test each reed alone.
7. Wax-seal reed assemblies onto pipe tops.
8. Press-fit pipes into gourd sockets with wax-rosin seal.
9. First acoustic test → record in `validation.csv`.
10. Tune by wax addition, hole reaming, or reed re-filing.
11. Add wax foot-plug to Drone 2 for waxable-drone behavior.
12. Final validation after 24-hour humidity stabilization.

---

# Sourcing And BOM
- BOM gives 15 line items with drawing references.
- Sourcing tracks pakkawood, brass shim, walnut blank, beeswax + rosin, boxwood mouthpiece.
- McMaster part numbers cited for brass; specialty wood from Cousineau / Bell Forest.

---

# Shop Packet
- Cut list with rough/final dimensions and tolerances.
- Assembly manual for away-from-keyboard work.
- Validation log for measured pitch and cents-error per pipe per stage.

---

# Drawings, CAD, CNC
- `drawing-brief.md` defines six required drawing sheets (HUL-DRW-001..006).
- `cad/` holds the OpenSCAD master and the SW global-var parity reference.
- `cnc/` will hold reed-tongue and reed-frame DXFs for the Epilog laser (after first reed-coupon validation).
- `drawings/` holds three SVG drawings: section, family-scale, reed detail.

---

# Images And Screenshots
- `images/hero-concept.svg` (placeholder until HUL-P2 prototype photographed)
- `images/family-overview-concept.svg` (placeholder)

---

# Cultural Note
- The hulusi (葫芦丝) belongs to the Dai people of Yunnan, with related instruments across the Lahu, Wa, Achang, De'ang, and across the border into northern Thailand and Laos.
- Lineage and naming are credited in README and `design.md`, separate from any product-marketing copy.

---

# Next Actions
- Build HUL-P0 reed coupon to validate brass-cut process.
- Build HUL-P1 melody pipe (F-key) to validate stopped-pipe + finger-hole layout.
- Replace concept renders with HUL-P2 photos once finished.
- Fit `pull_down_cents` to measured P0 data; set `correction_pct` from P1 if pipes drift.
- Generate Tier-3 production CAD (.step, .stl, .dxf) only after P1/P2 validate.
