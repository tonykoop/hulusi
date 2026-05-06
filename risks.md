# Hulusi — Risks & Verification Tests (Red Team Output)

> *v4 deliverable. Five risk categories — acoustic, structural, ergonomic, supply, fit/finish — each with concrete failure modes and a verification test. The test is what tells you the risk is closed; without a test, the risk is open.*

> Generated 2026-05-05. Update after each prototype build (HUL-P0 through P4).

---

## 1. Acoustic Risks

### A1. Reed pull-down assumption is wrong
**Risk.** `pull_down_cents = −30 ¢` is a starting estimate. Free-reed pull-down depends on tube/reed coupling, which scales with port impedance and reed-slot leakage. If actual pull-down is closer to −10 ¢ or −60 ¢, every reed in the family will be cut to the wrong target frequency.

**Severity.** High. A 30¢ reed-cut error is detectable by ear and pushes hole-position math out of tolerance for the whole instrument.

**Verification test.**
1. Build HUL-P0 reed coupon at the design-default `pull_down_cents = −30`.
2. Sound the reed *off the pipe* with a controlled air column (manometer at 5–10 cm H₂O).
3. Measure with tuner; record in `validation.csv`.
4. Mount on a calibrated test pipe of known acoustic length; measure played pitch.
5. Compute actual pull-down = `played_pitch − reed_free_pitch` in cents.
6. Update `pull_down_cents` in `Master_Inputs`. Re-cut next reed batch.

**Closed when.** Three reeds cut at the updated `pull_down_cents` produce played pitches within ±10 ¢ of `f_tonic`.

---

### A2. K_imperial = 27,300 for brass C26000 is published-data, not measured
**Risk.** The reed-tongue length formula (`L = √(K·t / f)`) hangs entirely on K_imperial. If the actual brass shim has different cold-rolling history, hardness, or alloy mix, K can drift ±15%. Tongue lengths would then be off by ~7%.

**Severity.** Medium. Mostly absorbed by reed filing during voicing, but starting too far off the target wastes material.

**Verification test.**
1. Cut three reeds at three different lengths (e.g. 0.7 / 0.8 / 0.9 in) from one shim batch.
2. Sound each reed off-pipe; measure free frequency.
3. Fit `K = f · L² / t` per reed; average.
4. If average K differs from 27,300 by >5%, update `reed_K_imperial` in `Master_Inputs`.

**Closed when.** Three independent reed cuts agree on K within ±3%.

---

### A3. Drone pipes pull mouth pressure away from melody
**Risk.** Three reeds breathing from one wind chest may load each other's flow. With drones open, the melody pipe may receive less air, dropping its volume or destabilizing pitch. Traditional Dai builds tune for this; a wooden-gourd build with stiffer walls may behave differently.

**Severity.** Medium-low. Player can compensate with breath, but bad coupling makes the instrument tiring to play.

**Verification test.**
1. On HUL-P2, sound each pipe alone (other reed slots taped shut).
2. Sound all three together; remeasure each pipe's pitch and SPL.
3. If any pipe shifts >15 ¢ between solo and ensemble conditions, the wind chest is undersized — increase `gourd_volume_in3`.

**Closed when.** All three pipes pitch-stable within ±15 ¢ between solo and ensemble.

---

### A4. End-correction coefficient mismatch
**Risk.** Default `end_corr_k = 0.6` is the unflanged Levine-Schwinger value. Real pipe-foot conditions (flush in a stand, near body, partly muted by player's leg) may push effective k toward 0.85 or below 0.5.

**Severity.** Low. Whole-instrument flat by ~10 ¢ if mis-applied; absorbed by `correction_pct`.

**Verification test.**
1. After HUL-P1 measurements come in, fit `end_corr_k` from the all-holes-closed pitch error.
2. Compare to default; document delta.

**Closed when.** Fitted `end_corr_k` documented in design.md "Empirical Corrections" section.

---

## 2. Structural Risks

### S1. Pakkawood tube splits during boring
**Risk.** Pakkawood is dyed and resin-stabilized. Long deep-bore drilling generates heat; resin can soften and gum the bit, or the dowel can split along its grain if clamping is uneven.

**Severity.** Medium. One ruined blank costs $10–15 and a lost hour.

**Verification test.**
1. Drill the bore on the *first* pipe blank with a 0.500 in twist drill, peck cycle (0.25 in advance + retract every cycle), feed rate 2 in/min.
2. Inspect for heat discoloration, gumming, and split lines.
3. If gumming: sub a brad-point bit or apply mineral-oil flood.
4. If splitting: rotate dowel 90° and re-clamp on flats.

**Closed when.** Three consecutive bores complete with no splits, no heat scoring, and concentricity at both ends within 0.005 in.

---

### S2. Reed shim cracks at root over time
**Risk.** Brass C26000 0.008 in shim subjected to repeated flexing at the root will work-harden and crack. Lifetime varies — could be hours or years.

**Severity.** Medium. Reeds are consumables; design supports replacement.

**Verification test.**
1. Mount a HUL-P0 reed and sound it for 60 minutes total play time.
2. Inspect tongue root with 10× loupe weekly during the next 12 weeks.
3. Document any cracking with calendar date and play hours.

**Closed when.** Reed lifetime estimate (in play hours) recorded; replacement procedure in assembly-manual.md.

---

### S3. Walnut gourd halves separate at glue line
**Risk.** Two-half hollow gourd is glued along an equator joint. Pressure stresses (from blowing) and humidity cycling can pop the joint, causing leaks and ruining tuning.

**Severity.** High. A leaky gourd makes the instrument unplayable.

**Verification test.**
1. Glue HUL-P2 gourd halves with hide glue.
2. Pressure-test by submerging gourd (mouth + sockets sealed) in water and pulling slow vacuum (~10 inHg) externally — bubbles indicate leaks.
3. Re-test after 30, 60, 90 days under varied humidity.

**Closed when.** No leaks at 90-day inspection. If leaks appear, switch to epoxy or add interior sealant.

---

### S4. Reed frame plate flexes and breaks wax seal
**Risk.** 0.040 in brass frame plate may flex under playing pressure, breaking the beeswax-rosin seal between plate and pipe top. Air leaks → flat pitch and mushy attack.

**Severity.** Medium. Detectable by listening; fix is to re-wax.

**Verification test.**
1. Apply pressure (5 cm H₂O) at the mouthpiece while watching the frame-plate seal under raking light.
2. Listen for air-hiss leaks at each pipe-to-frame joint.
3. Repeat after 30, 90 days.

**Closed when.** No detectable hiss or visible plate flex at any pipe-to-frame joint after 90 days.

---

## 3. Ergonomic Risks

### E1. Finger holes computed by physics may not match hand
**Risk.** `Holes!E:E` places hole positions where the *acoustics* says they belong. For an F-key hulusi these are 4.78 in to 8.51 in from the foot — that's 3.7 in of finger-hole span across 6 front holes. A 5th-percentile-female hand (4.5 in span fingertip-to-fingertip with fingers extended) may struggle.

**Severity.** Medium. Adult average hand spans accommodate easily; kids and small hands may not.

**Verification test.**
1. After HUL-P1 hole layout is locked, hand the instrument to three players: one large-hand (>7.5 in span), one average (~6.5 in), one small (~5 in).
2. Each plays the diatonic scale at moderate tempo.
3. Document any discomfort or missed-hole errors per player.

**Closed when.** All three players play the scale without strain or position errors. If small-hand player struggles, design a "compact" variant with reduced bore (`mel_bore_ID = 0.45 in`) to shorten the pipe.

---

### E2. Drone 2 wax-plug fingernail action is awkward
**Risk.** Traditional waxable drone control requires the player to scrape wax with a fingernail mid-phrase. Wax hardness, plug geometry, and nail length all factor in.

**Severity.** Low. Instrument is playable without the wax-control feature; it's a refinement.

**Verification test.**
1. After HUL-P3 wax plug is shaped, play a 30-second phrase with at least 3 mute/unmute transitions.
2. Document: fingernail catches plug? Plug too soft (smears)? Too hard (won't scrape)?
3. Adjust wax:rosin ratio (default 4:1; try 5:1 softer or 3:1 harder).

**Closed when.** Player can mute/unmute drone 2 cleanly within one beat of intent.

---

### E3. Mouthpiece geometry uncomfortable for extended playing
**Risk.** Default mouthpiece is a 0.5 in OD boxwood/horn cylinder with 0.25 in bore. Lip fatigue or tooth-chatter from extended play (>10 min sessions) will register before formal validation.

**Severity.** Low. Easy to swap mouthpiece insert.

**Verification test.**
1. After HUL-P2 build, play 15-minute continuous session.
2. Note any lip/tongue/jaw fatigue or saliva pooling issues.
3. If issues: try thinner-walled mouthpiece (0.4 in OD with 0.27 in bore) or angled mouthpiece.

**Closed when.** Player completes 30-minute session with no ergonomic complaints.

---

## 4. Supply Risks

### V1. Pakkawood availability is single-sourced
**Risk.** Cousineau Wood Products and Bell Forest Products are the named suppliers in `sourcing.csv`. Both are small specialty operations; either could discontinue 1-inch round dowel stock. Substitution moves to hard maple change tone color.

**Severity.** Medium. Design works in maple; voicing will need re-validation.

**Verification test.**
1. Build one HUL-P1 in pakkawood and one in hard maple at the same key.
2. Compare measured pitches and tonal character.
3. Document dimensional/sonic differences.

**Closed when.** Maple-substitution data (cents shift, tonal note) added to `sourcing.csv` for reference.

---

### V2. Brass shim 0.008 in has alloy variation across vendors
**Risk.** McMaster 9534K27 spec is "C26000 cartridge brass" but cold-roll temper can vary. Different reels may have different K constants (see A2).

**Severity.** Low. K is updateable in `Master_Inputs`.

**Verification test.**
1. Document supplier and lot number on every reed batch.
2. Run A2 verification on each new lot.
3. Compare K constants across lots; flag if drift >5%.

**Closed when.** Two independent lots verified within ±3% of each other on K.

---

### V3. Beeswax + rosin ratio drift
**Risk.** Beeswax and rosin from natural sources vary in hardness. A summer-harvested beeswax behaves differently from winter; "violin grade" rosin from different makers has different melt points.

**Severity.** Low. Easy to re-cook the wax mix.

**Verification test.**
1. Document wax + rosin source/date on every wax-batch label.
2. Test new batch by cooling on a slate slab and pressing thumb at room temp — should leave a faint print but not deform.

**Closed when.** Recipe document in `assembly-manual.md` includes a temperature + vendor reference for "right" hardness.

---

## 5. Fit & Finish Risks

### F1. Finger-hole edges raise too much when reamed
**Risk.** Reaming undersized holes to final 0.275 in dia can tear or chip the pakkawood interior, creating sharp edges that hurt the player's fingertip and disrupt airflow.

**Severity.** Medium. Easy to fix with a chamfer; bad if not noticed.

**Verification test.**
1. After hole reaming, run a fingertip across each hole interior.
2. Inspect with 10× loupe for tear-out.
3. Apply 0.030 in chamfer with a deburring tool.

**Closed when.** All 7 holes pass the fingertip-feel test and visual inspection.

---

### F2. Wax seal ages and yellows visibly at gourd-pipe joints
**Risk.** Beeswax-rosin mix oxidizes and yellows over years. Functional, but visually distracting on a hardwood gourd.

**Severity.** Cosmetic. Doesn't affect play.

**Verification test.**
1. Photograph wax joints at build time, 30, 90, 365 days.
2. Document color shift.
3. Optional refinement: cover wax with a thin walnut veneer collar.

**Closed when.** Decision documented: leave wax visible (functional aesthetic) or cover with collar (refined aesthetic).

---

### F3. Drone 2 wax plug looks unfinished
**Risk.** A blob of yellow wax at one pipe foot reads as "unfinished" to first-time viewers. This is the *traditional* hulusi look but may not match the rest of the build's aesthetic.

**Severity.** Cosmetic.

**Verification test.**
1. Photograph the finished HUL-P2 with and without wax plug.
2. Show to 3 viewers; document first impression.
3. Optional: shape wax into a turned dome, or recess plug into a counterbore.

**Closed when.** Aesthetic decision documented and reflected in `assembly-manual.md`.

---

### F4. Tassel and binding-ring detail clash with restrained build aesthetic
**Risk.** Traditional hulusi has bright silk tassel + decorative tubing. Tony's typical build aesthetic is more restrained walnut + brass.

**Severity.** Cosmetic / personal preference.

**Verification test.**
1. Build HUL-P2 first without tassel; photograph.
2. Add tassel; photograph.
3. Decide which to ship.

**Closed when.** Decision documented in README hero image caption.

---

## Summary

| Category | Open risks | Highest-severity item |
|---|---:|---|
| Acoustic | 4 | A1 (reed pull-down assumption) |
| Structural | 4 | S3 (gourd glue-line failure) |
| Ergonomic | 3 | E1 (finger-hole hand-fit) |
| Supply | 3 | V1 (pakkawood single-sourced) |
| Fit & finish | 4 | F1 (hole-edge tear-out) |
| **Total** | **18** | |

The highest-leverage tests in time-order are:
1. **A1 + A2 (HUL-P0)** — settles `pull_down_cents` and `reed_K_imperial` for the entire family.
2. **S1 (HUL-P0/P1)** — confirms pakkawood machining process before committing all 3 tubes.
3. **S3 (HUL-P2)** — gourd glue-line is a single point of failure for the whole instrument.

Test these three before committing any further. Everything else can be deferred to its corresponding prototype stage.
