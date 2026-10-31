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
as letter-spacing. Measured on SF Pro Rounded Regular, 20 capital "H" at 32px,
only the trak table differing (README section 11):

  program                     what it does with the trak table
  --------------------------  ------------------------------------------------
  pango / GTK                 applies it (13px text: 353 px with, 319 without)
  Chromium / Skia (HarfBuzz)  applies it as written: +22 units/glyph at 32px
                              (the table says 24)
  Firefox (HarfBuzz)          applies it at ~5x the value: +115 units/glyph at
                              32px, +171 at 13px, which is +20% line width in
                              body text

448 px is what the hmtx advances say (20 x 1432/2048 x 32), so "without trak" is
the design width. Stripping the table makes the three agree within 1%, but it
also takes Apple's tracking away from GTK and Chromium, so body text ends up
about 10% tighter than it was.

`--bake SIZE` gives that tracking back in a form every program reads the same
way: before the table is removed, its normal track (0.0) is interpolated at SIZE
points and added to every advance width in hmtx. The result is one constant
tracking at all sizes (the table itself varies with size), chosen for the size
body text is read at; larger text is a little looser than Apple would set it.

`add_stat.py` is the other option: it *adds* a STAT table so that HarfBuzz picks
the table up. Both cannot be on at once; the PKGBUILD turns the STAT step off
when this one runs.
"""

import sys
from fontTools.ttLib import TTFont


def describe(font):
    """One line about what is being removed, so the build log says why."""
    try:
        data = font["trak"].horizData
        normal = next((t for t in data if float(t) == 0.0), None)
        if normal is None:
            return "trak (no normal track)"
        values = data[normal]
        sizes = sorted(values)
        pairs = ", ".join(f"{s:g}pt {values[s]:+d}" for s in sizes if s in (12, 13, 16, 32, 80))
        return f"trak (track 0.0: {pairs} units/glyph)"
    except Exception:                                    # noqa: BLE001 - cosmetic
        return "trak"


def tracking_at(font, size):
    """Normal-track (0.0) tracking in font units at `size` pt, or None."""
    try:
        data = font["trak"].horizData
        values = data[next(t for t in data if float(t) == 0.0)]
    except Exception:                                    # noqa: BLE001
        return None
    sizes = sorted(values)
    if not sizes:
        return None
    if size <= sizes[0]:
        return values[sizes[0]]
    if size >= sizes[-1]:
        return values[sizes[-1]]
    for lo, hi in zip(sizes, sizes[1:]):
        if lo <= size <= hi:
            f = (size - lo) / (hi - lo)
            return values[lo] + (values[hi] - values[lo]) * f


def bake(font, size):
    """Add the tracking at `size` pt to every advance. Returns a log string."""
    if "fvar" in font:
        return "not baked (variable font: HVAR would override hmtx)"
    track = tracking_at(font, size)
    if track is None:
        return "nothing to bake"
    add = round(track)
    hmtx = font["hmtx"]
    for name, (adv, lsb) in list(hmtx.metrics.items()):
        if adv > 0:
            hmtx.metrics[name] = (adv + add, lsb)
    return f"baked {add:+d} units/glyph ({size:g}pt)"


def main():
    args = sys.argv[1:]
    size = None
    if args[:1] == ["--bake"]:
        try:
            size = float(args[1])
        except (IndexError, ValueError):
            sys.exit("strip_trak.py: --bake needs a size in points")
        args = args[2:]
    if not args:
        sys.exit("strip_trak.py: give me font files")
    removed = kept = failed = 0
    for path in args:
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
        if size is not None:
            what += "; " + bake(font, size)
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
