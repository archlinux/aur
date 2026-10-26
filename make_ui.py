#!/usr/bin/env python3
"""Derive "Geologica UI" from the Geologica variable font: the same font with
its weight scale shifted, so that Regular (wght 400) draws a lighter weight.

Usage:  make_ui.py --regular W [--family NAME] -o OUT.ttf VF.ttf

Why this exists
---------------
Setting 'Geologica Thin 11' as the desktop font does not give Thin: GTK3 and
GTK4 keep only family and size from gsettings font-name and take the weight
from CSS (400), and pango sets the variable font's wght straight from that
weight. Labels therefore render at 400 (verified: a GTK3/GTK4 label's font
description is "Geologica 11"). Fixing OS/2.usWeightClass, as fix_weights.py
does for MiSans, cannot help: fontconfig already picks the right face here,
it is the axis value that pango sends.

An avar table can. It maps the user wght that a program asks for onto the
design wght that is drawn, inside the font file, so every renderer applies it
(pango, Firefox, Chromium, Qt), with no fontconfig rule. The segment map is
piecewise linear through these points (user -> design):

    100 -> 100     the axis ends stay where they are
    400 -> W       Regular draws weight W (--regular)
    700 -> 700     Bold stays Bold, so bold labels and headings keep contrast
    900 -> 900

For W=100: Light and Regular both draw Thin, Medium draws 300, SemiBold 500.
The font becomes its own family ("Geologica UI"), installed next to the
untouched Geologica, so applications that ask for Geologica keep all its
weights. The family name must not end in a pango style word (Thin, Light,
Bold, Italic, Condensed, ...): pango would read it as a style and drop it
from the family, which is how 'Geologica Thin 11' lost its weight.
"""
import argparse
import sys

from fontTools.ttLib import TTFont, newTable

PANGO_STYLE_WORDS = {
    "thin", "hairline", "light", "book", "regular", "normal", "medium",
    "bold", "heavy", "black", "italic", "oblique", "condensed", "expanded",
    "roman", "semi-light", "ultra-light", "extra-light", "demi-light",
    "semi-bold", "demi-bold", "ultra-bold", "extra-bold", "ultra-heavy",
    "ultra-black", "extra-black", "small-caps", "all-small-caps",
}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--regular", type=int, required=True,
                    help="design weight drawn for Regular (100-400)")
    ap.add_argument("--family", default="Geologica UI")
    ap.add_argument("-o", "--output", required=True)
    ap.add_argument("vf")
    a = ap.parse_args()

    if not 100 <= a.regular <= 400:
        sys.exit("make_ui.py: --regular must be 100-400")
    if a.family.split()[-1].lower() in PANGO_STYLE_WORDS:
        sys.exit(f"make_ui.py: pango would read the last word of "
                 f"'{a.family}' as a style")

    font = TTFont(a.vf)
    if "avar" in font:
        sys.exit("make_ui.py: the font already has an avar table")
    axes = font["fvar"].axes
    wght = next(ax for ax in axes if ax.axisTag == "wght")
    lo, default, hi = wght.minValue, wght.defaultValue, wght.maxValue
    if (lo, default, hi) != (100, 100, 900):
        sys.exit(f"make_ui.py: expected wght 100/100/900, got {lo}/{default}/{hi}")

    def norm(v):  # default == min, so wght only has a positive side
        return (v - default) / (hi - default)

    avar = newTable("avar")
    avar.segments = {ax.axisTag: {-1.0: -1.0, 0.0: 0.0, 1.0: 1.0} for ax in axes}
    avar.segments["wght"] = {-1.0: -1.0, 0.0: 0.0,
                             norm(400): norm(a.regular),
                             norm(700): norm(700),
                             1.0: 1.0}
    font["avar"] = avar

    # Rename: "Geologica" -> family everywhere it is the family or the
    # PostScript prefix. Instance names (IDs >= 256) are style names and stay.
    ps_old, ps_new = "Geologica", a.family.replace(" ", "")
    name = font["name"]
    for rec in name.names:
        if rec.nameID in (1, 4, 16):
            rec.string = rec.toUnicode().replace("Geologica", a.family, 1)
        elif rec.nameID in (3, 6, 25):
            rec.string = rec.toUnicode().replace(ps_old, ps_new, 1)

    font.save(a.output)
    print(f"  {a.family}: Regular draws wght {a.regular}")


if __name__ == "__main__":
    main()
