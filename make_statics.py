#!/usr/bin/env python3
"""Cut one static instance out of the Roboto Flex variable font.

Usage:  make_statics.py --wght W [--wdth D] [--slnt S] [--opsz O] -o OUTDIR VF.ttf

Why this exists
---------------
Upstream ships Roboto Flex only as one 13-axis variable font. Static fonts are
needed for Nerd Fonts patching (font-patcher drops fvar/gvar) and for apps that
cannot use variable fonts. Each static is hinted on its own, so ttfautohint
derives its blue zones from that exact instance instead of the default master.

fontTools' instancer can name instances from STAT, but Roboto Flex's STAT has no
value for slnt=-10, so italics would come out unnamed. The names, style bits
and italic metadata are therefore written here:

  nameID 1/2     RIBBI family + style ("Roboto Flex SemiBold" / "Italic")
  nameID 16/17   typographic family + subfamily ("Roboto Flex" / "SemiBold Italic")
  nameID 4/6/3   full name, PostScript name, unique ID
  OS/2           usWeightClass = wght, usWidthClass from wdth, fsSelection
                 ITALIC/BOLD/REGULAR (USE_TYPO_METRICS is kept)
  head.macStyle, post.italicAngle, hhea caret slope for the italics

A width other than 100 becomes part of the family ("Roboto Flex Condensed"),
like the static Roboto Condensed, so fontconfig never mixes widths in one
family. The other axes (GRAD and the parametric ones) stay at their defaults.
"""
import argparse
import math
import os
import sys

from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont

WEIGHTS = {100: "Thin", 200: "ExtraLight", 300: "Light", 400: "Regular",
           500: "Medium", 600: "SemiBold", 700: "Bold", 800: "ExtraBold",
           900: "Black", 1000: "ExtraBlack"}
# Names and OS/2 usWidthClass for the widths Roboto Flex's STAT lists.
WIDTHS = {25: ("SuperCondensed", 1), 50: ("UltraCondensed", 1),
          62.5: ("ExtraCondensed", 2), 75: ("Condensed", 3),
          87.5: ("SemiCondensed", 4), 100: ("", 5), 112.5: ("SemiExpanded", 6),
          125: ("Expanded", 7), 150: ("ExtraExpanded", 8), 151: ("ExtraExpanded", 8)}

FS_ITALIC, FS_BOLD, FS_REGULAR = 1 << 0, 1 << 5, 1 << 6


def num(s):
    v = float(s)
    return int(v) if v.is_integer() else v


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--wght", type=num, required=True)
    ap.add_argument("--wdth", type=num, default=100)
    ap.add_argument("--slnt", type=num, default=0)
    ap.add_argument("--opsz", type=num, default=14)
    ap.add_argument("-o", "--outdir", required=True)
    ap.add_argument("vf")
    a = ap.parse_args()

    if a.wght not in WEIGHTS:
        sys.exit(f"make_statics.py: wght {a.wght} is not one of {sorted(WEIGHTS)}")
    if a.wdth not in WIDTHS:
        sys.exit(f"make_statics.py: wdth {a.wdth} is not one of {sorted(WIDTHS)}")
    if a.slnt not in (0, -10):
        sys.exit("make_statics.py: slnt must be 0 or -10")

    font = TTFont(a.vf)
    limits = {ax.axisTag: ax.defaultValue for ax in font["fvar"].axes}
    limits.update(wght=a.wght, wdth=a.wdth, slnt=a.slnt, opsz=a.opsz)
    font = instantiateVariableFont(font, limits, updateFontNames=False)
    if "STAT" in font:
        del font["STAT"]

    italic = a.slnt != 0
    wname = WEIGHTS[a.wght]
    width_name, width_class = WIDTHS[a.wdth]
    family = "Roboto Flex" + (" " + width_name if width_name else "")
    if wname == "Regular":
        sub = "Italic" if italic else "Regular"
    else:
        sub = wname + (" Italic" if italic else "")
    ribbi = a.wght in (400, 700)
    fam1 = family if ribbi else f"{family} {wname}"
    sub2 = ("Bold " if a.wght == 700 else "") + ("Italic" if italic else "")
    sub2 = sub2.strip() or "Regular"
    ps = family.replace(" ", "") + "-" + sub.replace(" ", "")
    version = font["name"].getDebugName(5) or "Version 3.200"

    name = font["name"]
    # Drop the fvar/STAT instance names (IDs >= 256) and the variations
    # PostScript prefix (25): they describe axes this font no longer has.
    name.names = [n for n in name.names if n.nameID < 256 and n.nameID != 25]
    for nid, val in ((1, fam1), (2, sub2), (3, f"3.200;GOOG;{ps}"),
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
    os2.usWidthClass = width_class
    sel = os2.fsSelection & ~(FS_ITALIC | FS_BOLD | FS_REGULAR)
    if italic:
        sel |= FS_ITALIC
    if a.wght == 700:
        sel |= FS_BOLD
    if not italic and a.wght != 700:
        sel |= FS_REGULAR
    os2.fsSelection = sel
    font["head"].macStyle = (1 if a.wght == 700 else 0) | (2 if italic else 0)
    font["post"].italicAngle = float(a.slnt)
    hhea = font["hhea"]
    if italic:
        hhea.caretSlopeRise = font["head"].unitsPerEm
        hhea.caretSlopeRun = round(hhea.caretSlopeRise * math.tan(math.radians(-a.slnt)))
    else:
        hhea.caretSlopeRise, hhea.caretSlopeRun = 1, 0

    out = os.path.join(a.outdir, ps + ".ttf")
    font.save(out)
    print(f"  {family:28s} {sub}")


if __name__ == "__main__":
    main()
