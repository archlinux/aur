#!/usr/bin/env python3
"""Cut one static instance out of a Commissioner variable font.

Usage:  make_statics.py [--wght W] [--flar F] [--volm V] -o OUTDIR FONT.ttf

Why this exists
---------------
Upstream ships Commissioner as two variable fonts - roman
(Commissioner[FLAR,VOLM,wght].ttf) and italic
(Commissioner-Italic[FLAR,VOLM,wght].ttf) - plus 54 prebuilt statics.
The statics are still useful: font-patcher drops fvar/gvar, some programs
cannot use variable fonts, and a static is hinted on its own, so ttfautohint
derives its blue zones from that exact weight instead of from the default
(Thin) master of the variable font.

The three "voices" of the family are axis settings, verified against
upstream's own statics by rendering them (Commissioner Flare = FLAR 100,
VOLM 0; Commissioner Loud = FLAR 100, VOLM 100; the default voice is
FLAR 0, VOLM 0):

  --flar 0   --volm 0     family "Commissioner"
  --flar 100 --volm 0     family "Commissioner Flare"
  --flar 100 --volm 100   family "Commissioner Loud"

fontTools' instancer writes names from STAT, which labels the instances
differently from the designer's statics ("Thin" instead of RIBBI names), so
the names, style bits and italic metadata are written here to match
upstream's static TTFs:

  nameID 1/2     RIBBI family + style ("Commissioner Thin" / "Italic")
  nameID 16/17   typographic family + subfamily ("Commissioner" / "Bold Italic")
  nameID 4/6/3   full name, PostScript name, unique ID
  OS/2           usWeightClass = wght, fsSelection ITALIC/BOLD/REGULAR
                 (USE_TYPO_METRICS and WWS are kept)
  head.macStyle, post.italicAngle, hhea caret slope for the italics

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


def voice(flar, volm):
    """Family name for an axis position, and the PostScript-safe prefix."""
    if flar == 0 and volm == 0:
        return "Commissioner", "Commissioner"
    if volm == 0:
        return "Commissioner Flare", "CommissionerFlare"
    return "Commissioner Loud", "CommissionerLoud"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--wght", type=num, default=400)
    ap.add_argument("--flar", type=num, default=0)
    ap.add_argument("--volm", type=num, default=0)
    ap.add_argument("-o", "--outdir", required=True)
    ap.add_argument("vf")
    a = ap.parse_args()

    if a.wght not in WEIGHTS:
        sys.exit(f"make_statics.py: wght {a.wght} is not one of {sorted(WEIGHTS)}")
    for name, val in (("flar", a.flar), ("volm", a.volm)):
        if not 0 <= val <= 100:
            sys.exit(f"make_statics.py: {name} must be 0-100, got {val}")
    if a.volm and not a.flar:
        # VOLM only reshapes the serifs FLAR creates; on its own it is a no-op.
        sys.exit("make_statics.py: VOLM needs FLAR (it reshapes FLAR's serifs)")

    font = TTFont(a.vf)
    italic = bool(font["OS/2"].fsSelection & FS_ITALIC)
    limits = {ax.axisTag: ax.defaultValue for ax in font["fvar"].axes}
    limits.update(wght=a.wght, FLAR=a.flar, VOLM=a.volm)
    font = instantiateVariableFont(font, limits, updateFontNames=False)

    wname = WEIGHTS[a.wght]
    family, psprefix = voice(a.flar, a.volm)
    if italic and a.wght == 400:
        sub = "Italic"
    else:
        sub = wname + (" Italic" if italic else "")
    ribbi = a.wght in (400, 700)
    fam1 = family if ribbi else f"{family} {wname}"
    sub2 = ("Bold " if a.wght == 700 else "") + ("Italic" if italic else "")
    sub2 = sub2.strip() or "Regular"
    ps = psprefix + "-" + sub.replace(" ", "")
    version = font["name"].getDebugName(5) or "Version 1.012"

    name = font["name"]
    # Drop the fvar/STAT instance names (IDs >= 256) and the variations
    # PostScript prefix (25): they describe axes this font no longer has.
    name.names = [n for n in name.names if n.nameID < 256 and n.nameID != 25]
    for nid, val in ((1, fam1), (2, sub2), (3, f"1.012;IDKB;{ps}"),
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
    if italic:
        sel |= FS_ITALIC
    elif a.wght == 700:
        sel |= FS_BOLD
    else:
        sel |= FS_REGULAR
    os2.fsSelection = sel
    font["head"].macStyle = (1 if a.wght == 700 else 0) | (2 if italic else 0)
    font["post"].italicAngle = -12.0 if italic else 0.0
    hhea = font["hhea"]
    if italic:
        hhea.caretSlopeRise = 2000
        hhea.caretSlopeRun = round(2000 * math.tan(math.radians(12.0)))
        hhea.caretOffset = 0
    else:
        hhea.caretSlopeRise, hhea.caretSlopeRun = 1, 0

    out = os.path.join(a.outdir, ps + ".ttf")
    font.save(out)
    print(f"  {fam1:22s} {sub2}")


if __name__ == "__main__":
    main()
