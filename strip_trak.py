#!/usr/bin/env python3
"""Remove Apple's `trak` (tracking) table from a font.

Why a package would do that
---------------------------
SF Pro (Text, Display, Rounded), SF Compact and New York carry an AAT `trak`
table: size-specific tracking that macOS applies to keep small text legible.
The table holds three tracks (-1.0 tight, 0.0 normal, 2.0 loose) and, for each,
a value per point size. For the normal track (0.0) SF Pro Rounded Regular reads
174 units at 6pt, 92 at 12pt, 52 at 16pt, 24 at 32pt, 0 at 80pt and above - i.e.
positive tracking (looser) below 80pt, zero above.

On Linux nothing agrees on what to do with it, and the disagreement is visible
as letter-spacing:

  program                     what it does with the trak table
  --------------------------  ------------------------------------------------
  pango / GTK (cairo)         ignores it: identical widths with and without
  Chromium / Skia (HarfBuzz)  applies it correctly: +22 units/glyph at 32px
                              (the table says 24)
  Firefox (HarfBuzz)          applies it at ~5x the value: +115 units/glyph at
                              32px, +171 at 13px, which is +20% line width in
                              body text

Measured on SF Pro Rounded Regular, 32px, twenty "H" (fontconfig path, only
the trak table differing between the two files):

  chromium  with trak 455 px   without 448 px
  firefox   with trak 484 px   without 448 px

and the same sentence at 13px:

  firefox   with trak 377 px   without 315 px

448 px is what the hmtx advances say (20 x 1432/2048 x 32), so "without trak" is
the design width. GTK renders 353 px at 13px either way - it ignores the table
and rounds hinted advances to whole pixels, which is a separate matter.

So stripping the table costs GTK nothing, makes the two browsers agree with each
other exactly, and removes the Firefox-only letterspacing.

`add_stat.py` is the opposite option: it *adds* a STAT table so that HarfBuzz
picks the tracking up. Both cannot be on at once; the PKGBUILD turns the STAT
step off when this one runs.
"""

import sys
from fontTools.ttLib import TTFont


def describe(font):
    """One line about what is being removed, so the build log says why."""
    try:
        data = font["trak"].horizData
        normal = next((t for t in data.tracks if float(t) == 0.0), None)
        if normal is None:
            return "trak (no normal track)"
        values = data.values[normal]
        sizes = sorted(values)
        pairs = ", ".join(f"{s:g}pt {values[s]:+d}" for s in sizes if s in (12, 13, 16, 32, 80))
        return f"trak (track 0.0: {pairs} units/glyph)"
    except Exception:                                    # noqa: BLE001 - cosmetic
        return "trak"


def main():
    if len(sys.argv) < 2:
        sys.exit("strip_trak.py: give me font files")
    removed = kept = failed = 0
    for path in sys.argv[1:]:
        try:
            font = TTFont(path)
        except Exception as exc:                          # noqa: BLE001
            print(f"  {path.split('/')[-1]}: cannot open ({exc})")
            failed += 1
            continue
        if "trak" not in font:
            print(f"  {path.split('/')[-1]}: no trak table, unchanged")
            kept += 1
            continue
        what = describe(font)
        del font["trak"]
        try:
            font.save(path)
        except Exception as exc:                          # noqa: BLE001
            print(f"  {path.split('/')[-1]}: FAILED to save ({exc})")
            failed += 1
            continue
        print(f"  {path.split('/')[-1]}: removed {what}")
        removed += 1
    print(f"== {removed} stripped, {kept} had none, {failed} failed")
    if failed:
        sys.exit(1)


if __name__ == "__main__":
    main()
