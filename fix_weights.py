#!/usr/bin/env python3
"""Normalise MiSans Latin's OS/2 usWeightClass to the standard CSS/OpenType scale.

Usage:  fix_weights.py FONT.ttf [FONT.ttf ...]      (edited in place)

Why this exists
---------------
Xiaomi ships MiSans Latin with non-standard weight classes:

    Thin 150  ExtraLight 200  Light 250  Normal 305  Regular 330
    Medium 380  Demibold 450  Semibold 520  Bold 630  Heavy 700

fontconfig maps usWeightClass onto its own scale by interpolation, which turns
Regular (330) into weight 53 and Medium (380) into 75. A plain "regular" request
(fontconfig weight 80) therefore matches *Medium*, and "bold" (200) matches
*Heavy*, since Bold (630) lands at 186 while Heavy (700) lands exactly on 200.
Verified with fc-match against the stock 4.007 files:

    fc-match "MiSans Latin"       -> Medium
    fc-match "MiSans Latin:bold"  -> Heavy

Rewriting the weight classes to the conventional values fixes both, and keeps
all ten weights distinct and in order. Only OS/2.usWeightClass is touched; the
name table and outlines are left alone.

The weight is looked up by the font's own subfamily name (nameID 17, falling
back to nameID 2), never by filename.
"""
import sys

from fontTools.ttLib import TTFont

WEIGHTS = {
    "thin": 100,
    "extralight": 200,
    "light": 300,
    "normal": 350,
    "regular": 400,
    "medium": 500,
    "demibold": 550,
    "semibold": 600,
    "bold": 700,
    "heavy": 900,
}


def _subfamily(font):
    name = font["name"]
    for name_id in (17, 2):
        rec = name.getName(name_id, 3, 1, 0x409) or name.getName(name_id, 1, 0, 0)
        if rec is not None:
            return str(rec).strip()
    return None


def fix(path):
    font = TTFont(path)
    sub = _subfamily(font)
    if sub is None:
        sys.stderr.write("fix_weights: %s: no subfamily name, skipped\n" % path)
        return 1
    key = sub.replace(" ", "").replace("-", "").lower()
    if key not in WEIGHTS:
        sys.stderr.write("fix_weights: %s: unknown subfamily %r, skipped\n" % (path, sub))
        return 1
    old, new = font["OS/2"].usWeightClass, WEIGHTS[key]
    if old != new:
        font["OS/2"].usWeightClass = new
        font.save(path)
    print("  %-12s %4d -> %d" % (sub, old, new))
    return 0


def main(argv):
    if len(argv) < 2:
        sys.stderr.write(__doc__)
        return 2
    rc = 0
    for path in argv[1:]:
        try:
            rc |= fix(path)
        except Exception as exc:  # noqa: BLE001 - report and continue
            sys.stderr.write("fix_weights: %s: %s\n" % (path, exc))
            rc = 1
    return rc


if __name__ == "__main__":
    sys.exit(main(sys.argv))
