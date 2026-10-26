#!/usr/bin/env python3
"""Cut one static instance out of the Geologica variable font.

Usage:  make_statics.py --wght W [--crsv C] [--shrp S] [--slnt T] -o OUTDIR VF.ttf

Why this exists
---------------
Upstream ships Geologica as one 4-axis variable font. Static fonts are needed
for Nerd Fonts patching (font-patcher drops fvar/gvar) and for programs that
cannot use variable fonts. More importantly, a static is hinted on its own, so
ttfautohint derives its blue zones from that exact weight: Geologica's x-height
grows from 960 (Thin) to 1040 (Black) font units, while the VF can only ship
one set of zones, taken from its default master, which is Thin.

fontTools' instancer can write names from STAT, but Geologica's STAT labels
slnt=-12 + CRSV=1 as "Cursive Oblique", while the designer's own static files
are called "Italic", and CRSV=0/1 with SHRP=0/100 needs a family split
("Geologica" / "Geologica Sharp"). The names, style bits and italic metadata
are therefore written here, matching upstream's static TTFs:

  nameID 1/2     RIBBI family + style ("Geologica SemiBold" / "Italic")
  nameID 16/17   typographic family + subfamily ("Geologica" / "SemiBold Italic")
  nameID 4/6/3   full name, PostScript name, unique ID
  OS/2           usWeightClass = wght, fsSelection ITALIC/BOLD/REGULAR
                 (USE_TYPO_METRICS and WWS are kept)
  head.macStyle, post.italicAngle, hhea caret slope for the italics

SHRP=100 becomes its own family, "Geologica Sharp", as in the Monokrom release.
The STAT table is kept, so the style names stay machine-readable.
"""
import argparse
import math
import os
import sys

from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont

WEIGHTS = {100: "Thin", 200: "ExtraLight", 300: "Light", 400: "Regular",
           500: "Medium", 600: "SemiBold", 700: "Bold", 800: "ExtraBold",
           900: "Black"}

FS_ITALIC, FS_BOLD, FS_REGULAR = 1 << 0, 1 << 5, 1 << 6


def num(s):
    v = float(s)
    return int(v) if v.is_integer() else v


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--wght", type=num, required=True)
    ap.add_argument("--crsv", type=num, default=0)
    ap.add_argument("--shrp", type=num, default=0)
    ap.add_argument("--slnt", type=num, default=0)
    ap.add_argument("-o", "--outdir", required=True)
    ap.add_argument("vf")
    a = ap.parse_args()

    if a.wght not in WEIGHTS:
        sys.exit(f"make_statics.py: wght {a.wght} is not one of {sorted(WEIGHTS)}")
    if a.shrp not in (0, 100):
        sys.exit("make_statics.py: shrp must be 0 or 100")
    if a.crsv not in (0, 1):
        sys.exit("make_statics.py: crsv must be 0 or 1")
    if a.slnt not in (0, -12):
        sys.exit("make_statics.py: slnt must be 0 or -12")
    if (a.crsv == 1) != (a.slnt == -12):
        sys.exit("make_statics.py: the italic is CRSV=1 with slnt=-12; "
                 "pass both or neither")

    font = TTFont(a.vf)
    limits = {ax.axisTag: ax.defaultValue for ax in font["fvar"].axes}
    limits.update(wght=a.wght, CRSV=a.crsv, SHRP=a.shrp, slnt=a.slnt)
    font = instantiateVariableFont(font, limits, updateFontNames=False)

    italic = a.slnt != 0
    wname = WEIGHTS[a.wght]
    family = "Geologica Sharp" if a.shrp else "Geologica"
    if italic and a.wght == 400:
        sub = "Italic"
    else:
        sub = wname + (" Italic" if italic else "")
    ribbi = a.wght in (400, 700)
    fam1 = family if ribbi else f"{family} {wname}"
    sub2 = ("Bold " if a.wght == 700 else "") + ("Italic" if italic else "")
    sub2 = sub2.strip() or "Regular"
    ps = family.replace(" ", "") + "-" + sub.replace(" ", "")
    version = font["name"].getDebugName(5) or "Version 1.010"

    name = font["name"]
    # Drop the fvar/STAT instance names (IDs >= 256) and the variations
    # PostScript prefix (25): they describe axes this font no longer has.
    name.names = [n for n in name.names if n.nameID < 256 and n.nameID != 25]
    for nid, val in ((1, fam1), (2, sub2), (3, f"1.010;MNKR;{ps}"),
                     (4, f"{family} {sub}"), (6, ps), (16, family), (17, sub)):
        name.removeNames(nameID=nid)
        if nid in (16, 17) and ribbi and (fam1, sub2) == (family, sub):
            continue  # RIBBI names already say it; 16/17 would be redundant
        name.setName(val, nid, 3, 1, 0x409)
        name.setName(val, nid, 1, 0, 0)
    name.removeNames(nameID=5)
    name.setName(version, 5, 3, 1, 0x409)
    name.setName(version, 5, 1, 0, 0)

    os2 = font["OS/2"]
    os2.usWeightClass = a.wght
    os2.usWidthClass = 5
    sel = os2.fsSelection & ~(FS_ITALIC | FS_BOLD | FS_REGULAR)
    # Spec-conforming: REGULAR only when neither BOLD nor ITALIC is set.
    # Upstream's own static files also set REGULAR on the italics, which
    # fontTools rejects as "bits 0 (italic) and 5 (bold) must be clear".
    if italic:
        sel |= FS_ITALIC
    elif a.wght == 700:
        sel |= FS_BOLD
    else:
        sel |= FS_REGULAR
    os2.fsSelection = sel
    font["head"].macStyle = (1 if a.wght == 700 else 0) | (2 if italic else 0)
    font["post"].italicAngle = float(a.slnt)
    hhea = font["hhea"]
    if italic:
        hhea.caretSlopeRise = 1000
        hhea.caretSlopeRun = round(1000 * math.tan(math.radians(-a.slnt)))
        hhea.caretOffset = 0
    else:
        hhea.caretSlopeRise, hhea.caretSlopeRun = 1, 0

    out = os.path.join(a.outdir, ps + ".ttf")
    font.save(out)
    print(f"  {fam1:22s} {sub2}")


if __name__ == "__main__":
    main()
