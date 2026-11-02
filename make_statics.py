#!/usr/bin/env python3
"""Cut one static instance out of the TikTok Sans variable font.

Usage:  make_statics.py --wght W [--wdth D] [--opsz O] [--italic] -o OUTDIR VF.ttf

Why this exists
---------------
Google Fonts ships TikTok Sans as ONE variable font with four axes
(opsz 12-36, default 36; slnt -6-0, default 0; wdth 75-150, default 100;
wght 300-900, default 300). Static fonts are needed for Nerd Fonts patching
(font-patcher drops fvar/gvar) and for programs that cannot use variable
fonts. Each static is hinted on its own, so ttfautohint derives its blue zones
from that exact weight/width/optical size.

Axes pinned: wght, wdth, opsz (one value per file) and slnt (0 or -6 with
--italic). The upstream hinting program (cvt/cvar/glyph instructions) is
kept here; the PKGBUILD replaces it when HINTING=true.

Naming (RIBBI-compatible):
  nameID 1/2     "TikTok Sans[ Width][ Weight]" / Regular|Bold|Italic|Bold Italic
  nameID 16/17   "TikTok Sans[ Width]" / "Weight[ Italic]"
Width 100 adds nothing to the family; 75/125/150 add Condensed/Expanded/
ExtraExpanded. opsz is not in the name: use one opsz per installed set.
"""
import argparse
import os
import sys

from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont

WEIGHTS = {300: "Light", 400: "Regular", 500: "Medium", 600: "SemiBold",
           700: "Bold", 800: "ExtraBold", 900: "Black"}
WIDTHS = {75: "Condensed", 100: "", 125: "Expanded", 150: "ExtraExpanded"}

FS_ITALIC, FS_BOLD, FS_REGULAR = 1 << 0, 1 << 5, 1 << 6


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--wght", type=int, required=True)
    ap.add_argument("--wdth", type=int, default=100)
    ap.add_argument("--opsz", type=float, default=14)
    ap.add_argument("--italic", action="store_true")
    ap.add_argument("-o", "--outdir", required=True)
    ap.add_argument("vf")
    a = ap.parse_args()

    if a.wght not in WEIGHTS:
        sys.exit(f"make_statics.py: wght {a.wght} is not one of {sorted(WEIGHTS)}")
    if a.wdth not in WIDTHS:
        sys.exit(f"make_statics.py: wdth {a.wdth} is not one of {sorted(WIDTHS)}")
    if not 12 <= a.opsz <= 36:
        sys.exit("make_statics.py: opsz must be 12-36")

    font = TTFont(a.vf)
    font = instantiateVariableFont(
        font, {"wght": a.wght, "wdth": a.wdth, "opsz": a.opsz,
               "slnt": -6 if a.italic else 0}, updateFontNames=False)

    italic = a.italic
    wname = WEIGHTS[a.wght]
    family = "TikTok Sans" + (" " + WIDTHS[a.wdth] if WIDTHS[a.wdth] else "")
    if italic and a.wght == 400:
        sub = "Italic"
    else:
        sub = wname + (" Italic" if italic else "")
    ribbi = a.wght in (400, 700)
    fam1 = family if ribbi else f"{family} {wname}"
    sub2 = ("Bold " if a.wght == 700 else "") + ("Italic" if italic else "")
    sub2 = sub2.strip() or "Regular"
    ps = family.replace(" ", "") + "-" + sub.replace(" ", "")
    version = font["name"].getDebugName(5) or "Version 4.000"
    ver = version.replace("Version ", "").split(";")[0]

    name = font["name"]
    name.names = [n for n in name.names if n.nameID < 256 and n.nameID != 25]
    for nid, val in ((1, fam1), (2, sub2), (3, f"{ver};TIKTOK;{ps}"),
                     (4, f"{family} {sub}"), (6, ps), (16, family), (17, sub)):
        name.removeNames(nameID=nid)
        if nid in (16, 17) and ribbi and (fam1, sub2) == (family, sub):
            continue
        name.setName(val, nid, 3, 1, 0x409)
        name.setName(val, nid, 1, 0, 0)

    os2 = font["OS/2"]
    os2.usWeightClass = a.wght
    os2.usWidthClass = {75: 3, 100: 5, 125: 7, 150: 9}[a.wdth]
    sel = os2.fsSelection & ~(FS_ITALIC | FS_BOLD | FS_REGULAR)
    if italic:
        sel |= FS_ITALIC
    elif a.wght == 700:
        sel |= FS_BOLD
    else:
        sel |= FS_REGULAR
    os2.fsSelection = sel
    font["head"].macStyle = (1 if a.wght == 700 else 0) | (2 if italic else 0)

    out = os.path.join(a.outdir, ps + ".ttf")
    font.save(out)
    print(f"  {fam1:28s} {sub2}")


if __name__ == "__main__":
    main()
