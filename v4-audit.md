# v4 Audit — Hulusi Repo

> *Generated 2026-05-05 by instrument-maker-v4 skill against the current `hulusi/` tree. Marks every v4 deliverable as ✓ present, ⚠ partial, or ✗ missing, with an action for each gap.*

## Mode

**Mode A — Project repo at root.** Single-instrument repo, files at top level. Matches gemshorn / udu / tongue-drum reference repos.

## v4 Deliverables Checklist

### Core packet (Mode A common files)

| # | Deliverable | Status | Notes |
|---|---|---|---|
| 1 | `README.md` | ✗ stubbed | Linter/user reduced to `# hulusi` line. Restore to v4 standard. |
| 2 | `LICENSE` | ✓ MIT | User switched from CC-BY-4.0 to MIT — keep. |
| 3 | `.gitignore` | ✓ generic | User replaced with C/C++ template — keep. |
| 4 | `design.md` | ✓ done | physics + lineage + prototype ladder. |
| 5 | `hulusi-design-table.xlsx` | ✓ done | 7 sheets, 33 named globals, 113 formulas, 0 errors. |
| 6 | `bom.csv` | ✓ done | 15 line items. |
| 7 | `sourcing.csv` | ✓ done | 8 rows with substitution rules. |
| 8 | `cut-list.csv` | ✓ done | 12 cuts incl. family scaling row. |
| 9 | `validation.csv` | ✓ done | scaffolded for HUL-P0..P3. |
| 10 | `assembly-manual.md` | ✓ done | 14-step shop sequence. |
| 11 | `drawing-brief.md` | ✓ done | required views + dim table. |
| 12 | `visual-bom-brief.md` | ✓ done | layout brief. |
| 13 | `supplier-rfq.md` | ✓ done | RFQ template. |
| 14 | `hulusi-starter.wl` | ✓ done | physics sanity-check notebook. |
| 15 | `capstone-manifest.json` | ✓ done | orientation manifest. |

### v4-specific additions (the gaps the user flagged)

| # | Deliverable | Status | Notes |
|---|---|---|---|
| 16 | `risks.md` | ✗ missing | **v4 explicit requirement.** 5 risk categories × verification tests. |
| 17 | `family-spec.csv` | ✗ missing | **v4 family-aware design.** Drives N packet generations from one row each. |
| 18 | `photo-shotlist.md` | ✗ missing | Photography plan for build-log site. |
| 19 | Per-family-member SVG drawings | ⚠ partial | Have generic `family-scale.svg`; v4 wants one dimensioned drawing per key (Bb/C/D/F/G). |
| 20 | `site/index.html` | ✗ missing | **v4 build-log static site.** Recruiter-grade artifact. |
| 21 | `capstone-deck.pptx` | ⚠ md only | Have markdown source; v4 in Cowork mode wants real `.pptx`. |
| 22 | `print-packet.pdf` | ⚠ md only | Have markdown source; v4 in Cowork mode wants real `.pdf`. |
| 23 | Visual BOM image | ⚠ brief only | Have layout brief; production image deferred until shop photos exist (acceptable). |

### CAD / drawing artifacts

| # | Deliverable | Status | Notes |
|---|---|---|---|
| 24 | `cad/hulusi_master.scad` | ✓ done | parametric, family-aware via `key_midi`. |
| 25 | `cad/hulusi-design-table.txt` | ✓ done | SW global-var parity reference. |
| 26 | `drawings/hulusi-section.svg` | ✓ done | centerline section. |
| 27 | `drawings/hulusi-family-scale.svg` | ✓ done | 5-key silhouettes. |
| 28 | `drawings/reed-detail.svg` | ✓ done | reed slot ×4. |
| 29 | `images/hero-concept.svg` | ✓ done | placeholder. |
| 30 | `images/family-overview-concept.svg` | ✓ done | placeholder. |

### Empirical-loop & catalog hooks (v4 plumbing)

| # | Deliverable | Status | Notes |
|---|---|---|---|
| 31 | `validation.csv` cents-error column | ✓ done | auto-fill formula in workbook. |
| 32 | Per-family corrections (`pull_down_cents`, `correction_pct`) | ✓ done | named globals in Master_Inputs. |
| 33 | `data/` folder (measurements over time) | ⚠ deferred | Will be populated as builds proceed. |
| 34 | DoE protocol stub | ⚠ deferred | Reasonable to defer until HUL-P1 yields first data. |

## Gap Resolution Plan

The user asked for thoroughness before they begin building. Resolving (in order):

1. **Restore `README.md`** — v4-standard with hero, family table, prototype ladder, status table, MIT license note.
2. **`risks.md`** — full red-team walk: acoustic / structural / ergonomic / supply / fit-finish, each with verification test.
3. **`family-spec.csv`** — drives the 5 family members from one row each; dimensions resolved from Master_Inputs.
4. **`photo-shotlist.md`** — 14 shots: process + hero + family + finished detail + close-ups.
5. **Per-family SVG drawings** — `hulusi-Bb.svg`, `hulusi-C.svg`, `hulusi-D.svg`, `hulusi-F.svg`, `hulusi-G.svg`.
6. **`site/index.html`** + `site/style.css` — single-folder static site, recruiter-facing.
7. **`capstone-deck.pptx`** — 12-slide deck.
8. **`print-packet.pdf`** — combined shop packet PDF.
9. **Re-run verification** — every v4 quality gate, render every output.

After this pass the repo will be at the **gemshorn / udu *done bar*** for the v4 (mode A) scaffold and ready for the HUL-P0 reed coupon as the first physical step.
