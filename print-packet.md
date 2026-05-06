# Hulusi — Print Packet (Shop-Floor Reference)

> *Print this and take it to the bench.  It bundles the design table summary, BOM, cut list, and tuning loop into one shop-friendly document.*

---

## 1. Master_Inputs (set before any cutting)

| Variable | Default | Yours |
|---|---:|---:|
| `key_midi` | 65 (F4) | _____ |
| `mel_bore_ID` | 0.500 in | _____ |
| `mel_hole_dia` | 0.275 in | _____ |
| `dr1_target_offset` | +7 (5th) | _____ |
| `dr2_target_offset` | +12 (oct) | _____ |
| `reed_thickness` | 0.008 in | _____ |
| `reed_tongue_w` | 0.157 in | _____ |
| `pull_down_cents` | −30 ¢ | _____ |
| `correction_pct` | 0 % | _____ |

**If any value above changes, re-print this sheet — every length downstream depends on these.**

---

## 2. Cut targets (F-key default — re-derive from `Pipes` sheet for other keys)

| Part | Length | Bore | Notes |
|---|---:|---:|---|
| Melody tube | **10.05 in** | 0.500 in | + reed_pad already included |
| Drone 1 (5th) | **6.82 in** | 0.500 in | |
| Drone 2 (oct) | **5.20 in** | 0.500 in | leave foot for wax plug |
| Reed tongue mel | **0.798 in** L × 0.157 in W × 0.008 in T | — | brass C26000 |
| Reed tongue dr1 | **0.652 in** L × 0.157 in W × 0.008 in T | — | |
| Reed tongue dr2 | **0.564 in** L × 0.157 in W × 0.008 in T | — | |
| Reed slot opening | 0.163 in × tongue_L + 0.040 in | — | tongue + 0.003 in clearance / side |

---

## 3. Finger-hole positions (F-key, from foot)

| Hole | Note | Frequency | Distance from foot |
|---|---|---:|---:|
| 1 (low front) | G4 | 392.0 Hz | **8.51 in** |
| 2 | A4 | 440.0 Hz | **7.58 in** |
| 3 | A♯4 | 466.2 Hz | **7.16 in** |
| 4 | C5 | 523.3 Hz | **6.38 in** |
| 5 | D5 | 587.3 Hz | **5.68 in** |
| 6 | E5 | 659.3 Hz | **5.06 in** |
| 7 (thumb back) | F5 (octave) | 698.5 Hz | **4.78 in** |

Drill **undersize first** (0.250 in pilot). Ream to 0.275 in only after the acoustic test confirms the hole position is right.

---

## 4. Reed cutting + voicing loop

```text
                    ┌───────────────┐
                    │ Cut tongue   │
                    │ (laser DXF)   │
                    └──────┬────────┘
                           ▼
                    ┌──────────────┐
                    │ Mount on     │
                    │ frame plate  │
                    │ (CA at root) │
                    └──────┬───────┘
                           ▼
                    ┌──────────────┐
                    │ Sound test   │
                    │ off the pipe │
                    └──────┬───────┘
                           ▼
              ┌────────────┴────────────┐
              │ Pitch within ±50 ¢ of   │
              │ Pipes!B18 target?        │
              └────────────┬────────────┘
                  yes ─────│───── no
                           ▼
                    ┌──────────────┐         File tongue:
                    │ Mount on pipe│        ─ TIP to RAISE
                    │ + wax seal   │        ─ ROOT to LOWER
                    └──────┬───────┘         in 0.005 in steps
                           ▼
                    ┌──────────────┐
                    │ Test on full │
                    │ instrument   │
                    └──────┬───────┘
                           ▼
                    Record cents_error
                    in validation.csv
```

---

## 5. BOM checklist (one F-key build)

- [ ] HUL-BOM-001  Walnut gourd blank, 5 in × 8 in
- [ ] HUL-BOM-002  Pakkawood melody tube, 1 in OD × 18 in
- [ ] HUL-BOM-003  Pakkawood drone 1 tube, 1 in OD × 14 in
- [ ] HUL-BOM-004  Pakkawood drone 2 tube, 1 in OD × 10 in
- [ ] HUL-BOM-005  Brass shim 0.008 in × 6 in × 12 in
- [ ] HUL-BOM-006  Brass plate 0.040 in (frame plates × 3)
- [ ] HUL-BOM-007  Beeswax (food grade)
- [ ] HUL-BOM-008  Pine rosin
- [ ] HUL-BOM-009  Boxwood / horn mouthpiece blank
- [ ] HUL-BOM-010  Tassel (optional cosmetic)
- [ ] HUL-BOM-011  Brass binding ring (optional)
- [ ] HUL-BOM-012  Reed file set
- [ ] HUL-BOM-013  Tuner (smartphone Cleartune OK)
- [ ] HUL-BOM-014  CA glue + accelerator
- [ ] HUL-BOM-015  Brad-point drill set (need 7 mm or letter-N for 0.275 in)

---

## 6. Tuning fast-reference

| Symptom | Cause | Fix |
|---|---|---|
| Reed silent | Tongue jammed in slot | File slot or tongue 0.001 in larger |
| Reed warbles | Tongue too tight | Same — clearance issue |
| Reed pitch wrong by 20-50 ¢ | Tongue length off | File **tip** raise / **root** lower |
| Pipe doesn't speak | Air leak at gourd-pipe joint | Re-wax + rosin |
| All 7 holes flat by similar ¢ | Pipe too long globally | Set `correction_pct` positive next build |
| One hole sharp/flat (others OK) | Hole position error | Ream that hole or wax-fill |
| Drones overpowering melody | Drone reed too thin | Sub thicker shim or partially block drone foot |

---

*v4.1 packet generated 2026-05-05 from `hulusi-design-table.xlsx`.*
