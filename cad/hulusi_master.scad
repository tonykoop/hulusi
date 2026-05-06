// =============================================================
// Hulusi (葫芦丝) — Parametric OpenSCAD Master-Shape Starter
// =============================================================
// Generated 2026-05-05 from hulusi-design-table.xlsx (v4.1).
// Units: inches. All variable names match the Master_Inputs
// named globals in the Excel design table AND the SolidWorks
// global-variable list in cad/hulusi-design-table.txt.
//
// This is a master-shape STARTER — captures gourd profile,
// three pipes with finger holes, reed slot envelopes, and
// mouthpiece. NOT final production CAD: rim radii, ergonomic
// finger comfort, and reed-frame mounting must be refined in
// SolidWorks before machining.
//
// Family: B♭ / C / D / F / G — switch via key_midi.
// =============================================================

$fn = 96;

// --------- INPUT PARAMETERS (must match Master_Inputs) ---------

// Acoustic constants
c_speed         = 13552;     // in/s @ 68°F
A4_ref          = 440;       // Hz

// Key (58=Bb, 60=C, 62=D, 65=F, 67=G)
key_midi        = 65;
f_tonic         = A4_ref * pow(2, (key_midi - 69) / 12);

// Gourd
gourd_volume_in3 = 25.0;
gourd_neck_OD    = 1.10;
gourd_belly_OD   = 4.50;
gourd_height     = 6.50;
gourd_wall       = 0.20;

// Melody pipe
mel_bore_ID      = 0.500;
mel_wall         = 0.125;
mel_hole_dia     = 0.275;
mel_hole_count   = 7;
mel_reed_pad     = 0.50;

// Drone 1 (5th)
dr1_bore_ID         = 0.500;
dr1_target_offset   = 7;
dr1_reed_pad        = 0.50;

// Drone 2 (octave / wax)
dr2_bore_ID         = 0.500;
dr2_target_offset   = 12;
dr2_reed_pad        = 0.50;

// Reed
reed_K_imperial  = 27300;
reed_thickness   = 0.008;
reed_tongue_w    = 0.157;
reed_slot_clear  = 0.003;

// Empirical
pull_down_cents  = -30;
correction_pct   = 0;
end_corr_k       = 0.6;

// ---------------------- FUNCTIONS ------------------------------

function pipe_total_length(bore, reed_pad, semitone_offset) =
    let(
        f = f_tonic * pow(2, semitone_offset / 12),
        L_acoustic = c_speed / (4 * f),
        L_eff = L_acoustic - end_corr_k * (bore / 2),
        L_corrected = L_eff * (1 + correction_pct / 100)
    )
    L_corrected + reed_pad;

function reed_tongue_length(semitone_offset) =
    let(
        f_pipe = f_tonic * pow(2, semitone_offset / 12),
        f_reed_target = f_pipe * pow(2, pull_down_cents / 1200)
    )
    sqrt(reed_K_imperial * reed_thickness / f_reed_target);

// Hole positions on melody pipe (semitones above tonic)
hole_offsets = [2, 4, 5, 7, 9, 11, 12];

function hole_dist_from_foot(semitone_offset) =
    let(
        L_eff = c_speed / (4 * f_tonic) - end_corr_k * (mel_bore_ID / 2),
        f_hole = f_tonic * pow(2, semitone_offset / 12)
    )
    L_eff * (f_tonic / f_hole);

// ---------------------- GEOMETRY -------------------------------

module gourd_outer() {
    // Egg/pot profile — narrow at neck, wide at belly.
    hull() {
        translate([0, 0, gourd_height * 0.10])
            scale([gourd_belly_OD/2, gourd_belly_OD/2, gourd_height * 0.40])
                sphere(r = 1);
        translate([0, 0, gourd_height * 0.85])
            scale([gourd_neck_OD * 0.6, gourd_neck_OD * 0.6, gourd_height * 0.18])
                sphere(r = 1);
        // Flat-ish base for stability
        translate([0, 0, 0])
            scale([gourd_belly_OD/2 * 0.85, gourd_belly_OD/2 * 0.85, gourd_height * 0.04])
                sphere(r = 1);
    }
}

module gourd_inner() {
    hull() {
        translate([0, 0, gourd_height * 0.10])
            scale([gourd_belly_OD/2 - gourd_wall,
                   gourd_belly_OD/2 - gourd_wall,
                   gourd_height * 0.40 - gourd_wall])
                sphere(r = 1);
        translate([0, 0, gourd_height * 0.85])
            scale([gourd_neck_OD * 0.6 - gourd_wall,
                   gourd_neck_OD * 0.6 - gourd_wall,
                   gourd_height * 0.18])
                sphere(r = 1);
        translate([0, 0, 0])
            scale([gourd_belly_OD/2 * 0.85 - gourd_wall,
                   gourd_belly_OD/2 * 0.85 - gourd_wall,
                   gourd_height * 0.04 - gourd_wall])
                sphere(r = 1);
    }
}

module mouthpiece_bore() {
    translate([0, 0, gourd_height * 0.95])
        cylinder(h = gourd_height * 0.20,
                 d = gourd_neck_OD * 0.70,
                 center = false);
}

module pipe_with_reed_slot(total_L, bore, semitone_offset, with_holes = false) {
    difference() {
        // outer tube
        cylinder(h = total_L, d = bore + 2 * mel_wall, center = false);
        // bore
        translate([0, 0, -0.01])
            cylinder(h = total_L + 0.02, d = bore, center = false);
        // reed slot (top)
        slot_w = reed_tongue_w + 2 * reed_slot_clear;
        slot_L = reed_tongue_length(semitone_offset) + 0.040;
        translate([0, 0, total_L - mel_reed_pad - slot_L/2])
            rotate([0, 0, 90])
                cube([slot_w, bore + 2 * mel_wall + 0.02, slot_L], center = true);
        // finger holes (only on melody)
        if (with_holes) {
            for (off = hole_offsets) {
                d = hole_dist_from_foot(off);
                translate([0, 0, d])
                    rotate([0, 90, 0])
                        cylinder(h = bore + 2 * mel_wall + 0.02,
                                 d = mel_hole_dia,
                                 center = true);
            }
        }
    }
}

module hulusi() {
    // Gourd
    difference() {
        gourd_outer();
        gourd_inner();
        mouthpiece_bore();
    }

    // Three pipes hanging off gourd base
    mel_L = pipe_total_length(mel_bore_ID, mel_reed_pad, 0);
    dr1_L = pipe_total_length(dr1_bore_ID, dr1_reed_pad, dr1_target_offset);
    dr2_L = pipe_total_length(dr2_bore_ID, dr2_reed_pad, dr2_target_offset);

    // Melody (centered, hanging down)
    translate([0, 0, -mel_L])
        pipe_with_reed_slot(mel_L, mel_bore_ID, 0, true);

    // Drone 1 (player's right, ±30°)
    translate([gourd_belly_OD * 0.30, 0, 0])
        rotate([0, 15, 0])
            translate([0, 0, -dr1_L])
                pipe_with_reed_slot(dr1_L, dr1_bore_ID, dr1_target_offset, false);

    // Drone 2 (player's left, ±30°)
    translate([-gourd_belly_OD * 0.30, 0, 0])
        rotate([0, -15, 0])
            translate([0, 0, -dr2_L])
                pipe_with_reed_slot(dr2_L, dr2_bore_ID, dr2_target_offset, false);

    // Echo computed dimensions for sanity check
    echo(str("=== Hulusi key_midi=", key_midi, " (f_tonic=", f_tonic, " Hz) ==="));
    echo(str("  mel_total_L  = ", mel_L, " in"));
    echo(str("  dr1_total_L  = ", dr1_L, " in"));
    echo(str("  dr2_total_L  = ", dr2_L, " in"));
    echo(str("  reed_L_mel   = ", reed_tongue_length(0), " in"));
    echo(str("  reed_L_dr1   = ", reed_tongue_length(dr1_target_offset), " in"));
    echo(str("  reed_L_dr2   = ", reed_tongue_length(dr2_target_offset), " in"));
    for (i = [0 : len(hole_offsets) - 1]) {
        echo(str("  hole_", i + 1, "_dist_from_foot = ",
                 hole_dist_from_foot(hole_offsets[i]), " in"));
    }
}

// ----------------------- DEFAULT PREVIEW -----------------------

hulusi();
