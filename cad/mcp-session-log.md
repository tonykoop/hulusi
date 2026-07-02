# MCP Session Log

No MCP-generated V5 artifacts were produced for this Round 4 migration.

The current hulusi packet contains a workbook, OpenSCAD starter, SVG previews,
concept images, print/site review surfaces, and empirical-loop templates. It
does not contain production STEP/STL/DXF/G-code exports, measured HUL-P0/HUL-P1
prototype data, or runtime evidence that would justify L3/build-ready claims.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-30-r4-ben-local | none | `README.md`; `design.md`; `capstone-manifest.json`; `validation-loop.csv`; `family-spec.csv`; `v4-audit.md`; `cad/hulusi-design-table.txt` | `README.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | v5_migration_inventory | reference_only | self_checked | Local text/CSV migration only. `git pull --ff-only origin main` was run first and reported already up to date. qmd CLI search found the catalog reconciliation note for hulusi; qmd query hung and was stopped. No GitHub, push, MCP, CAD, Blender, Illustrator, Photoshop, OpenSCAD runtime, SolidWorks, or Wolfram runtime session was run. |
| future-openscad-review | OpenSCAD or CAD review tool | `hulusi-design-table.xlsx`; `family-spec.csv`; `cad/hulusi_master.scad` | `cad/*.stl`; `drawings/*.dxf`; review screenshots or exported drawings | cad_authoring | pending_measurement | unreviewed | Planned only. Add a real session row before claiming generated geometry, STL, or DXF authority. |
| future-reed-dxf-export | OpenSCAD, CAD/CAM, or laser-vector tool | `hulusi-design-table.xlsx`; `cad/hulusi_master.scad`; measured HUL-P0 evidence | `cnc/reed-tongue.dxf`; `cnc/reed-frame.dxf` | dxf_export | pending_measurement | unreviewed | Planned only. Current DXF paths are absent and must remain blocked until generated and reviewed against reed coupon measurements. |
| future-visual-refresh | image-generation, Blender, Illustrator, Photoshop, or camera workflow | `photo-shotlist.md`; prototype/shop photos; `images/hero-concept.svg` | `images/hero-*`; `images/family-*`; updated site images | concept_render_or_photo_refine | concept_only | unreviewed | Planned only. Generated images remain non-dimensional; shop photos become reference evidence only when tied to build records. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | README.md (status-line honesty per hulusi-bawu stopped-pipe free-reed guidance) | README.md | packet_refresh | reference_only | self_checked | Corrected README status line from "L2 V5 build-packet candidate" to "L1 concept packet": every acoustic-law row in family-spec.csv/p0-reed-coupon-log.csv/p1-single-melody-pipe-control-log.csv is still unknown_requires_measurement, which per the skill's hulusi/bawu reference means the packet stays L1_packet-equivalent until HUL-P0/HUL-P1 bench data exists. No dimension changes. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | hulusi-design-table.xlsx, family-spec.csv | cad/hulusi_master.scad | cad_authoring | pending_measurement | self_checked | Existing master kept as-is (no rewrite). openscad render check: pass (openscad -o STL, exit 0). |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + generate_wolfram_packet.py | hulusi-design-table.xlsx, family-spec.csv, validation.csv | wolfram/hulusi-wolfram-model.wl | analysis_source | derived_preview | unreviewed | Generated via $SKILL/generate_wolfram_packet.py (not executed — no --execute passed); renamed from instrument-model.wl; source-only L2 evidence, distinct from existing hulusi-starter.wl. |

## Promotion Notes

- `visual-output-register.csv` is the V5 authority map for this repo.
- `pending_measurement` rows block L3 promotion until HUL-P0 reed coupon and
  HUL-P1 single-pipe evidence are recorded and reviewed.
- Production CAD, DXF, STEP, STL, and G-code remain deferred until measured
  prototype data supports them.
