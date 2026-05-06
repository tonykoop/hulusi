(* Hulusi — Stopped-Pipe + Free-Reed Notebook Starter *)
(* Mirrors hulusi-design-table.xlsx Master_Inputs.       *)
(* Run this to sanity-check the Excel formulas and       *)
(* visualize the family scaling across keys.             *)

ClearAll["Global`*"];

(* --- Acoustic constants --- *)
cSpeed = 13552;       (* in/s @ 68 F *)
A4ref  = 440;         (* Hz *)

(* --- Helper functions --- *)
midiToHz[m_] := A4ref * 2^((m - 69)/12);
centsError[meas_, tgt_] := 1200 * Log[2, meas/tgt];

(* Stopped pipe with end correction *)
pipeLengthIn[freq_, bore_, endCorrK_: 0.6, correctionPct_: 0,
             reedPad_: 0.5] := Module[{Lacoustic, Leff, Lcorr},
   Lacoustic = cSpeed / (4 * freq);
   Leff = Lacoustic - endCorrK * (bore/2);
   Lcorr = Leff * (1 + correctionPct/100);
   Lcorr + reedPad
];

(* Free reed cantilever — solve for tongue length *)
reedTongueLen[freq_, K_: 27300, t_: 0.008] := Sqrt[K * t / freq];

reedTargetFreq[fPipe_, pullDownCents_: -30] :=
   fPipe * 2^(pullDownCents/1200);

(* --- Single-pipe model (per pipe) --- *)
hulusipipeModel[name_, freq_, bore_, reedPad_] :=
 Module[{fReedTarget},
  fReedTarget = reedTargetFreq[freq];
  <|
   "Pipe" -> name,
   "TargetHz" -> freq,
   "PipeLengthIn" -> pipeLengthIn[freq, bore, 0.6, 0, reedPad],
   "ReedTargetHz" -> fReedTarget,
   "ReedTongueLenIn" -> reedTongueLen[fReedTarget],
   "ReedSlotWidthIn" -> 0.157 + 2 * 0.003
  |>
 ];

(* --- Family model: all 5 keys --- *)
familyModel[keyMidi_] :=
 Module[{fTonic, fDr1, fDr2},
  fTonic = midiToHz[keyMidi];
  fDr1   = fTonic * 2^(7/12);   (* perfect 5th *)
  fDr2   = fTonic * 2^(12/12);  (* octave *)
  <|
   "Key" -> keyMidi,
   "TonicHz" -> fTonic,
   "Melody"  -> hulusipipeModel["Mel",  fTonic, 0.500, 0.5],
   "Drone1"  -> hulusipipeModel["Dr1",  fDr1,   0.500, 0.5],
   "Drone2"  -> hulusipipeModel["Dr2",  fDr2,   0.500, 0.5]
  |>
 ];

(* Build family for Bb / C / D / F / G *)
family = familyModel /@ {58, 60, 62, 65, 67};

Dataset[family]

(* --- Finger hole positions (melody pipe, F-key default) --- *)
holeOffsets = {2, 4, 5, 7, 9, 11, 12};

holeDistFromFoot[fTonic_, semitoneOffset_, bore_: 0.500,
                 endCorrK_: 0.6] :=
 Module[{Lacoustic, Leff, fHole},
  Lacoustic = cSpeed / (4 * fTonic);
  Leff = Lacoustic - endCorrK * (bore/2);
  fHole = fTonic * 2^(semitoneOffset/12);
  Leff * (fTonic / fHole)
 ];

fKey = midiToHz[65];
holeTable = Table[
   <|
    "Hole" -> i,
    "SemitoneOffset" -> holeOffsets[[i]],
    "FreqHz" -> fKey * 2^(holeOffsets[[i]]/12),
    "DistFromFootIn" -> holeDistFromFoot[fKey, holeOffsets[[i]]]
    |>,
   {i, 1, Length[holeOffsets]}];

Dataset[holeTable]

(* --- Reed pull-down empirical placeholder --- *)
(* Replace with measured fit once HUL-P0 reed coupon yields data. *)
reedPullDownEmpirical[fReedFree_, fPipe_, kCouple_: 0.05] :=
 Module[{eigs},
  (* simple 2-mode coupling matrix — placeholder *)
  eigs = Eigenvalues[
    {{fReedFree^2, kCouple * fReedFree * fPipe},
     {kCouple * fReedFree * fPipe, fPipe^2}}
  ];
  Sqrt[Min[eigs]]
 ];
