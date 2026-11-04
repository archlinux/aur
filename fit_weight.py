#!/usr/bin/env python3
"""Find the Regular weight whose horizontal bars land on whole pixels.

With ttfautohint stem-width-mode 'nnn' (and FreeType's v40 interpreter, which
only hints y) a horizontal bar keeps its design thickness. At 16 ppem a 1.33px
bar is one solid row plus a faint one (blurry); a 1.1-1.2px bar is practically
one clean row. Snapping bars harder (nns/sss) breaks the stroke ratio instead,
so the remaining lever is the weight itself.

This script measures the bars (the '=' glyph) and the vertical stems (the 'l'
glyph) straight from the outlines of instances cut along the wght axis. No
rasteriser is needed: with nnn the pixel thickness is thickness * ppem / upem.
It prints a table and the wght closest to --base that puts the bar within
--tolerance of a whole number of pixels.

  fit_weight.py [--ppem 16] [--tolerance 0.25] [--base 400] [--lo 100]
                [--bar-glyph equal] [--stem-glyph l] [--quiet] FONT.ttf

--quiet prints only the wght (for scripts). Exit 1 if no weight fits.
Works for any font with a 'wght' axis (other axes stay at their defaults).
"""
import argparse
import sys

from fontTools.pens.recordingPen import DecomposingRecordingPen
from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont


def contour_boxes(font, name):
    gs = font.getGlyphSet()
    pen = DecomposingRecordingPen(gs)
    gs[name].draw(pen)
    boxes, pts = [], []
    for op, args in pen.value:
        pts += [p for p in args if p]
        if op in ("closePath", "endPath"):
            if pts:
                xs, ys = [p[0] for p in pts], [p[1] for p in pts]
                boxes.append((min(xs), min(ys), max(xs), max(ys)))
            pts = []
    return boxes


def measure(vf_path, wght, bar_glyph, stem_glyph):
    f = instantiateVariableFont(TTFont(vf_path), {"wght": wght}, inplace=False)
    cmap = f.getBestCmap()
    upem = f["head"].unitsPerEm

    def glyph(g):
        return cmap[ord("=")] if g == "equal" else (g if g in f.getGlyphOrder() else cmap[ord(g)])

    bars = contour_boxes(f, glyph(bar_glyph))
    stems = contour_boxes(f, glyph(stem_glyph))
    bar = min(b[3] - b[1] for b in bars)       # thickness of one bar
    stem = min(s[2] - s[0] for s in stems)     # width of the stem
    return bar / upem, stem / upem


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("font")
    ap.add_argument("--ppem", type=float, default=16.0)
    ap.add_argument("--tolerance", type=float, default=0.25)
    ap.add_argument("--base", type=int, default=400)
    ap.add_argument("--lo", type=int, default=100)
    ap.add_argument("--step", type=int, default=5)
    ap.add_argument("--bar-glyph", default="equal")
    ap.add_argument("--stem-glyph", default="l")
    ap.add_argument("--quiet", action="store_true")
    a = ap.parse_args()

    axes = {x.axisTag: x for x in TTFont(a.font)["fvar"].axes}
    if "wght" not in axes:
        sys.exit("fit_weight.py: no wght axis")
    lo = max(a.lo, int(axes["wght"].minValue))
    base = a.base

    # Instancing is slow: cut every 50 units and interpolate in between
    # (stroke thickness is close to linear in wght within an axis segment).
    knots = sorted({base, lo, *range((lo + 49) // 50 * 50, base, 50)})
    meas = {w: measure(a.font, w, a.bar_glyph, a.stem_glyph) for w in knots}

    def interp(w, i):
        for k0, k1 in zip(knots, knots[1:]):
            if k0 <= w <= k1:
                t = (w - k0) / (k1 - k0)
                return meas[k0][i] + t * (meas[k1][i] - meas[k0][i])

    rows = {w: (interp(w, 0) * a.ppem, interp(w, 1) * a.ppem)
            for w in range(base, lo - 1, -a.step)}

    best = None
    for w, (bar, stem) in rows.items():  # descending from base: first fit wins
        n = round(bar)
        if n >= 1 and abs(bar - n) <= a.tolerance:
            best = w
            break

    if a.quiet:
        if best is None:
            sys.exit(1)
        print(best)
        return
    print(f"{a.font}: bars/stems at {a.ppem:g} ppem (nnn keeps design thickness)")
    print("  wght   bar px  stem px  bar/stem  bar off-grid")
    for w, (bar, stem) in rows.items():
        mark = "  <-- fit" if w == best else ""
        if w % 50 == 0 or w == best or w == base:
            print(f"  {w:4d}   {bar:5.2f}   {stem:5.2f}    {bar/stem:4.2f}      "
                  f"{abs(bar - round(bar)):4.2f}{mark}")
    if best is None:
        print(f"no wght in {lo}-{base} puts the bar within {a.tolerance}px of a whole pixel")
        sys.exit(1)
    print(f"recommended Regular wght: {best}  (ink {rows[best][1]/rows[base][1]:.0%} of wght {base})")


if __name__ == "__main__":
    main()
