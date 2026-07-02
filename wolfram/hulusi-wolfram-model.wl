(* instrument-maker-v4.2 Wolfram packet source *)
ClearAll["Global`*"];

packetDir = "/mnt/c/Users/Tony/Documents/GitHub/instruments/woodwind/hulusi";
metadata = <|
  "PacketName" -> "Hulusi (葫芦丝) — Design Intent & Physics Model",
  "PacketPath" -> ".",
  "GeneratedOn" -> "2026-07-01",
  "Model" -> "StoppedPipe",
  "HasFamilySpec" -> True,
  "HasValidation" -> True,
  "HasCncPlan" -> False
|>;

familySpecPath = FileNameJoin[{packetDir, "family-spec.csv"}];
validationPath = FileNameJoin[{packetDir, "validation.csv"}];
cncPlanPath = FileNameJoin[{packetDir, "cnc", "cnc-plan.json"}];

familySpec = If[FileExistsQ[familySpecPath],
  Import[familySpecPath, "Dataset"],
  Dataset[ImportString["[{\"model_id\": \"HUL-Bb\", \"key\": \"B\\u266d\", \"key_midi\": \"58\", \"tonic_hz\": \"233.08\", \"mel_total_L_in\": \"14.89\", \"dr1_total_L_in\": \"10.05\", \"dr2_total_L_in\": \"7.62\", \"reed_L_mel_in\": \"0.977\", \"reed_L_dr1_in\": \"0.798\", \"reed_L_dr2_in\": \"0.691\", \"mel_bore_ID_in\": \"0.500\", \"gourd_belly_OD_in\": \"4.50\", \"gourd_height_in\": \"6.50\", \"reed_thickness_in\": \"0.008\", \"best_for\": \"low/warm voice\", \"build_priority\": \"4\", \"prototype_stage\": \"deferred\", \"acoustic_law\": \"unknown_requires_measurement\", \"end_condition\": \"one_end_closed_reed\", \"dimension_provenance\": \"measurement_required\"}, {\"model_id\": \"HUL-C\", \"key\": \"C\", \"key_midi\": \"60\", \"tonic_hz\": \"261.63\", \"mel_total_L_in\": \"13.30\", \"dr1_total_L_in\": \"8.99\", \"dr2_total_L_in\": \"6.82\", \"reed_L_mel_in\": \"0.922\", \"reed_L_dr1_in\": \"0.753\", \"reed_L_dr2_in\": \"0.652\", \"mel_bore_ID_in\": \"0.500\", \"gourd_belly_OD_in\": \"4.50\", \"gourd_height_in\": \"6.50\", \"reed_thickness_in\": \"0.008\", \"best_for\": \"vocal/intermediate\", \"build_priority\": \"3\", \"prototype_stage\": \"deferred\", \"acoustic_law\": \"unknown_requires_measurement\", \"end_condition\": \"one_end_closed_reed\", \"dimension_provenance\": \"measurement_required\"}, {\"model_id\": \"HUL-D\", \"key\": \"D\", \"key_midi\": \"62\", \"tonic_hz\": \"293.66\", \"mel_total_L_in\": \"11.89\", \"dr1_total_L_in\": \"8.05\", \"dr2_total_L_in\": \"6.12\", \"reed_L_mel_in\": \"0.871\", \"reed_L_dr1_in\": \"0.711\", \"reed_L_dr2_in\": \"0.616\", \"mel_bore_ID_in\": \"0.500\", \"gourd_belly_OD_in\": \"4.50\", \"gourd_height_in\": \"6.50\", \"reed_thickness_in\": \"0.008\", \"best_for\": \"folk/dance\", \"build_priority\": \"2\", \"prototype_stage\": \"deferred\", \"acoustic_law\": \"unknown_requires_measurement\", \"end_condition\": \"one_end_closed_reed\", \"dimension_provenance\": \"measurement_required\"}, {\"model_id\": \"HUL-F\", \"key\": \"F\", \"key_midi\": \"65\", \"tonic_hz\": \"349.23\", \"mel_total_L_in\": \"10.05\", \"dr1_total_L_in\": \"6.82\", \"dr2_total_L_in\": \"5.20\", \"reed_L_mel_in\": \"0.798\", \"reed_L_dr1_in\": \"0.652\", \"reed_L_dr2_in\": \"0.564\", \"mel_bore_ID_in\": \"0.500\", \"gourd_belly_OD_in\": \"4.50\", \"gourd_height_in\": \"6.50\", \"reed_thickness_in\": \"0.008\", \"best_for\": \"STANDARD\", \"build_priority\": \"1\", \"prototype_stage\": \"HUL-P1 planned\", \"acoustic_law\": \"unknown_requires_measurement\", \"end_condition\": \"one_end_closed_reed\", \"dimension_provenance\": \"measurement_required\"}, {\"model_id\": \"HUL-G\", \"key\": \"G\", \"key_midi\": \"67\", \"tonic_hz\": \"392.00\", \"mel_total_L_in\": \"8.99\", \"dr1_total_L_in\": \"6.12\", \"dr2_total_L_in\": \"4.67\", \"reed_L_mel_in\": \"0.753\", \"reed_L_dr1_in\": \"0.616\", \"reed_L_dr2_in\": \"0.532\", \"mel_bore_ID_in\": \"0.500\", \"gourd_belly_OD_in\": \"4.50\", \"gourd_height_in\": \"6.50\", \"reed_thickness_in\": \"0.008\", \"best_for\": \"bright/festive\", \"build_priority\": \"5\", \"prototype_stage\": \"deferred\", \"acoustic_law\": \"unknown_requires_measurement\", \"end_condition\": \"one_end_closed_reed\", \"dimension_provenance\": \"measurement_required\"}]", "JSON"]]
];

validationData = If[FileExistsQ[validationPath],
  Import[validationPath, "Dataset"],
  Dataset[ImportString["[{\"build_id\": \"HUL-P0\", \"stage\": \"reed-coupon\", \"date\": \"\", \"model\": \"coupon\", \"key\": \"F\", \"pipe\": \"Mel\", \"condition\": \"free-reed\", \"target_note\": \"F4+pull_down\", \"target_freq_hz\": \"343.23\", \"measured_freq_hz\": \"\", \"cents_error\": \"\", \"wax_added_g\": \"\", \"tongue_filed_in\": \"\", \"action\": \"file tongue tip to raise pitch; root to lower\", \"result\": \"\", \"notes\": \"Validate brass cut + slot fit before committing to full build.\"}, {\"build_id\": \"HUL-P1\", \"stage\": \"single-pipe\", \"date\": \"\", \"model\": \"solo\", \"key\": \"F\", \"pipe\": \"Mel\", \"condition\": \"all-closed\", \"target_note\": \"F4 (tonic)\", \"target_freq_hz\": \"349.23\", \"measured_freq_hz\": \"\", \"cents_error\": \"\", \"wax_added_g\": \"\", \"tongue_filed_in\": \"\", \"action\": \"tune reed sharp by ~30 cents; let pipe pull down\", \"result\": \"\", \"notes\": \"F-key prototype only.\"}, {\"build_id\": \"HUL-P1\", \"stage\": \"single-pipe\", \"date\": \"\", \"model\": \"solo\", \"key\": \"F\", \"pipe\": \"Mel\", \"condition\": \"hole-1\", \"target_note\": \"G4\", \"target_freq_hz\": \"392.00\", \"measured_freq_hz\": \"\", \"cents_error\": \"\", \"wax_added_g\": \"\", \"tongue_filed_in\": \"\", \"action\": \"measure with hole-1 open only\", \"result\": \"\", \"notes\": \"\"}, {\"build_id\": \"HUL-P1\", \"stage\": \"single-pipe\", \"date\": \"\", \"model\": \"solo\", \"key\": \"F\", \"pipe\": \"Mel\", \"condition\": \"hole-7\", \"target_note\": \"F5\", \"target_freq_hz\": \"698.46\", \"measured_freq_hz\": \"\", \"cents_error\": \"\", \"wax_added_g\": \"\", \"tongue_filed_in\": \"\", \"action\": \"octave check\", \"result\": \"\", \"notes\": \"\"}, {\"build_id\": \"HUL-P2\", \"stage\": \"full-build\", \"date\": \"\", \"model\": \"F-key\", \"key\": \"F\", \"pipe\": \"Mel\", \"condition\": \"all-closed\", \"target_note\": \"F4\", \"target_freq_hz\": \"349.23\", \"measured_freq_hz\": \"\", \"cents_error\": \"\", \"wax_added_g\": \"\", \"tongue_filed_in\": \"\", \"action\": \"wax tune at hole edges if cents_error > 25\", \"result\": \"\", \"notes\": \"\"}, {\"build_id\": \"HUL-P2\", \"stage\": \"full-build\", \"date\": \"\", \"model\": \"F-key\", \"key\": \"F\", \"pipe\": \"Mel\", \"condition\": \"hole-1\", \"target_note\": \"G4\", \"target_freq_hz\": \"392.00\", \"measured_freq_hz\": \"\", \"cents_error\": \"\", \"wax_added_g\": \"\", \"tongue_filed_in\": \"\", \"action\": \"\", \"result\": \"\", \"notes\": \"\"}, {\"build_id\": \"HUL-P2\", \"stage\": \"full-build\", \"date\": \"\", \"model\": \"F-key\", \"key\": \"F\", \"pipe\": \"Mel\", \"condition\": \"hole-2\", \"target_note\": \"A4\", \"target_freq_hz\": \"440.00\", \"measured_freq_hz\": \"\", \"cents_error\": \"\", \"wax_added_g\": \"\", \"tongue_filed_in\": \"\", \"action\": \"\", \"result\": \"\", \"notes\": \"\"}, {\"build_id\": \"HUL-P2\", \"stage\": \"full-build\", \"date\": \"\", \"model\": \"F-key\", \"key\": \"F\", \"pipe\": \"Mel\", \"condition\": \"hole-3\", \"target_note\": \"A#4\", \"target_freq_hz\": \"466.16\", \"measured_freq_hz\": \"\", \"cents_error\": \"\", \"wax_added_g\": \"\", \"tongue_filed_in\": \"\", \"action\": \"\", \"result\": \"\", \"notes\": \"\"}]", "JSON"]]
];

frequencyFromMidi[midi_, a4_: 440] := a4*2^((midi - 69)/12);
centsError[measured_, target_] := 1200*Log[2, measured/target];
openPipeLengthIn[freq_, c_: 13552, radius_: 0] := c/(2*freq) - 2*0.6*radius;
stoppedPipeLengthIn[freq_, c_: 13552, radius_: 0] := c/(4*freq) - 0.6*radius;
helmholtzFrequency[area_, volume_, leff_, c_: 13552] :=
  (c/(2*Pi))*Sqrt[area/(volume*leff)];
cantileverFrequency[k_, thickness_, length_] := k*thickness/length^2;
stringFrequency[length_, tension_, linearDensity_] :=
  1/(2*length)*Sqrt[tension/linearDensity];

modelExplorer = Switch[metadata["Model"],
  "Helmholtz",
    Manipulate[
      helmholtzFrequency[portArea, chamberVolume, effectiveLength],
      {{portArea, 0.4, "port area (in^2)"}, 0.05, 4},
      {{chamberVolume, 40, "volume (in^3)"}, 5, 400},
      {{effectiveLength, 0.6, "effective length (in)"}, 0.05, 3}
    ],
  "OpenPipe",
    Manipulate[
      openPipeLengthIn[f, 13552, radius],
      {{f, 440, "target Hz"}, 80, 1200},
      {{radius, 0.375, "bore radius (in)"}, 0, 1.5}
    ],
  "StoppedPipe",
    Manipulate[
      stoppedPipeLengthIn[f, 13552, radius],
      {{f, 220, "target Hz"}, 40, 1000},
      {{radius, 0.375, "bore radius (in)"}, 0, 1.5}
    ],
  "CantileverBeam",
    Manipulate[
      cantileverFrequency[k, thickness, length],
      {{k, 24000, "K constant"}, 1000, 80000},
      {{thickness, 0.25, "thickness (in)"}, 0.05, 1},
      {{length, 4.5, "length (in)"}, 0.5, 24}
    ],
  _,
    Manipulate[
      frequencyFromMidi[midi],
      {{midi, 69, "MIDI note"}, 24, 96, 1}
    ]
];

audioPreview[f_: 440, seconds_: 1.5] :=
  AudioNormalize[
    AudioAdd[
      AudioGenerator[{"Sin", f}, seconds],
      .35 AudioGenerator[{"Sin", 2 f}, seconds],
      .18 AudioGenerator[{"Sin", 3 f}, seconds]
    ]
  ];

validationRows = Normal[validationData];
validationPlot = Quiet@Check[
  ListPlot[
    DeleteMissing[
      ToExpression /@ Lookup[validationRows, "Cents Error", Missing[]]
    ],
    PlotTheme -> "Scientific",
    Frame -> True,
    FrameLabel -> {{"Cents error", None}, {"Measurement row", metadata["PacketName"]}}
  ],
  "No numeric validation cents-error values yet."
];

packetNotebook[] := CreateDocument[
  {
    TextCell[metadata["PacketName"], "Title"],
    TextCell["instrument-maker v4.2 computational packet", "Subtitle"],
    TextCell["Metadata", "Section"],
    ExpressionCell[metadata, "Input"],
    TextCell["Family/design data", "Section"],
    ExpressionCell[familySpec, "Input"],
    TextCell["Model explorer", "Section"],
    ExpressionCell[modelExplorer, "Input"],
    TextCell["Audio preview", "Section"],
    ExpressionCell[audioPreview[440], "Input"],
    TextCell["Validation", "Section"],
    ExpressionCell[validationPlot, "Input"]
  },
  WindowTitle -> metadata["PacketName"]
];

packetNotebook[];
