#!/usr/bin/env python3
"""Cut one static instance out of an Xmind variable font.

Usage:  make_statics.py --wght W [--italic] -o OUTDIR VF.ttf

Why this exists
---------------
Google Fonts ships Xmind as two one-axis variable fonts (Xmind[wght].ttf and
Xmind-Italic[wght].ttf, wght 100-900, default 400). Static fonts are needed for
Nerd Fonts patching (font-patcher drops fvar/gvar) and for programs that cannot
use variable fonts. A static is also hinted on its own, so ttfautohint derives
its blue zones from that exact weight: Xmind's x-height is 1040 units from Thin
to Regular but 1076 at Bold and 1100 at Black (2048 upem), and the VF can only
carry the zones of its default master (Regular).

fontTools' instancer can write names from STAT, but the naming of a static
family needs the RIBBI split (nameID 1/2 vs 16/17), so the names, style bits and
italic metadata are written here:

  nameID 1/2     RIBBI family + style ("Xmind SemiBold" / "Italic")
  nameID 16/17   typographic family + subfamily ("Xmind" / "SemiBold Italic")
  nameID 4/6/3   full name, PostScript name, unique ID
  OS/2           usWeightClass = wght, fsSelection ITALIC/BOLD/REGULAR
                 (USE_TYPO_METRICS is kept)
  head.macStyle  bold/italic bits

The STAT table is kept, so the style names stay machine-readable.
"""
import argparse
import os
import sys

from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont

WEIGHTS = {100: "Thin", 200: "ExtraLight", 300: "Light", 400: "Regular",
           500: "Medium", 600: "SemiBold", 700: "Bold", 800: "ExtraBold",
           900: "Black"}

FS_ITALIC, FS_BOLD, FS_REGULAR = 1 << 0, 1 << 5, 1 << 6


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--wght", type=int, required=True)
    ap.add_argument("--italic", action="store_true")
    ap.add_argument("-o", "--outdir", required=True)
    ap.add_argument("vf")
    a = ap.parse_args()

    if a.wght not in WEIGHTS:
        sys.exit(f"make_statics.py: wght {a.wght} is not one of {sorted(WEIGHTS)}")

    font = TTFont(a.vf)
    if ("post" in font and (font["post"].italicAngle != 0)) != a.italic:
        sys.exit(f"make_statics.py: {a.vf} does not look like the "
                 f"{'italic' if a.italic else 'roman'} font")
    font = instantiateVariableFont(font, {"wght": a.wght}, updateFontNames=False)

    italic = a.italic
    wname = WEIGHTS[a.wght]
    family = "Xmind"
    if italic and a.wght == 400:
        sub = "Italic"
    else:
        sub = wname + (" Italic" if italic else "")
    ribbi = a.wght in (400, 700)
    fam1 = family if ribbi else f"{family} {wname}"
    sub2 = ("Bold " if a.wght == 700 else "") + ("Italic" if italic else "")
    sub2 = sub2.strip() or "Regular"
    ps = family + "-" + sub.replace(" ", "")
    version = font["name"].getDebugName(5) or "Version 1.001"
    ver = version.replace("Version ", "").split(";")[0]

    name = font["name"]
    # Drop the fvar/STAT instance names (IDs >= 256) and the variations
    # PostScript prefix (25): they describe axes this font no longer has.
    name.names = [n for n in name.names if n.nameID < 256 and n.nameID != 25]
    for nid, val in ((1, fam1), (2, sub2), (3, f"{ver};XMIND;{ps}"),
                     (4, f"{family} {sub}"), (6, ps), (16, family), (17, sub)):
        name.removeNames(nameID=nid)
        if nid in (16, 17) and ribbi and (fam1, sub2) == (family, sub):
            continue  # RIBBI names already say it; 16/17 would be redundant
        name.setName(val, nid, 3, 1, 0x409)
        name.setName(val, nid, 1, 0, 0)

    os2 = font["OS/2"]
    os2.usWeightClass = a.wght
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

    out = os.path.join(a.outdir, ps + ".ttf")
    font.save(out)
    print(f"  {fam1:20s} {sub2}")


if __name__ == "__main__":
    main()
