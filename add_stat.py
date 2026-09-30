#!/usr/bin/env python3
"""Add a minimal STAT table so HarfBuzz applies Apple's size-specific tracking.

Usage:  add_stat.py FONT [FONT ...]      (edited in place; .otf or .ttf)

Why this exists
---------------
SF Pro Text, SF Pro Display, SF Pro Rounded and New York ship an AAT `trak`
table: Apple's optical-size letter-spacing, e.g. SF Pro Text track 0 is
+12/2048 em at 11pt, 0 at 12pt, -12 at 13pt and -47 at 17pt (the values in
Apple's HIG typography tables). macOS applies it automatically.

HarfBuzz can apply `trak` too, but only when the font also has a STAT table
(hb-ot-shape.cc: plan.apply_trak = has_tracking && STAT->has_data()). Apple's
static fonts have none, so on Linux the tracking is silently ignored.
Measured with pango on SF Pro Text Regular, "Hamburgefonstiv Αλφάβητο
ελληνικά", after adding STAT:

     9pt +4.3%   11pt +0.8%   12pt 0   13pt -1.0%   17pt -4.0%   20pt -5.9%

pango hands HarfBuzz the size in points; Chrome hands it CSS px as points
(like Safari does), so a 16px web font gets the 16pt track.

The table describes only what the font already is: a wght axis carrying
usWeightClass and an ital axis (0/1), each with one axis value named after
the subfamily. Fonts without `trak`, fonts that already have STAT and
variable fonts are left alone. Run it after fix_weights.py so the weight
value is the corrected one.
"""
import sys

from fontTools.otlLib.builder import buildStatTable
from fontTools.ttLib import TTFont

WEIGHT_NAMES = {
    100: "Ultralight", 200: "Thin", 300: "Light", 400: "Regular",
    500: "Medium", 600: "Semibold", 700: "Bold", 800: "Heavy", 900: "Black",
}
ELIDABLE = 0x2  # AxisValue flag: omit this name when composing style names


def add(path):
    font = TTFont(path)
    if "trak" not in font or "STAT" in font or "fvar" in font:
        return 0
    weight = font["OS/2"].usWeightClass
    italic = bool(font["OS/2"].fsSelection & 0x1)
    wname = WEIGHT_NAMES.get(weight, str(weight))
    axes = [
        dict(tag="wght", name="Weight", values=[
            dict(value=weight, name=wname, flags=ELIDABLE if weight == 400 else 0)]),
        dict(tag="ital", name="Italic", values=[
            dict(value=1, name="Italic") if italic
            else dict(value=0, name="Roman", flags=ELIDABLE)]),
    ]
    buildStatTable(font, axes, elidedFallbackName="Regular")
    font.save(path)
    print("  %-28s %s%s" % (font["name"].getDebugName(1), wname, " Italic" if italic else ""))
    return 0


def main(argv):
    if len(argv) < 2:
        sys.stderr.write(__doc__)
        return 2
    rc = 0
    for path in argv[1:]:
        try:
            rc |= add(path)
        except Exception as exc:  # noqa: BLE001 - report and continue
            sys.stderr.write("add_stat: %s: %s\n" % (path, exc))
            rc = 1
    return rc


if __name__ == "__main__":
    sys.exit(main(sys.argv))
