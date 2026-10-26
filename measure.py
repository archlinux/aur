#!/usr/bin/env python3
"""Measure FreeType rendering of Geologica builds (README.md section 3).

Usage:  measure.py FONT.ttf MODE '{"wght":400}' 12,13,14 [METRICS]

  MODE     none    FT_LOAD_NO_HINTING (the designed outline, no grid fitting)
           slight  FT_LOAD_TARGET_LIGHT -> FreeType's light autohinter
                   (this is what hintstyle hintslight uses, the Arch default)
           medium  FT_LOAD_TARGET_NORMAL|FT_LOAD_NO_AUTOHINT -> the font's own
                   TrueType bytecode, i.e. what ttfautohint produced
           auto    FT_LOAD_TARGET_NORMAL -> the full autohinter (what
                   fontconfig does with autohint=true + hintmedium)
  COORDS   JSON with axis values, e.g. '{"wght":700,"SHRP":100}'
  METRICS  comma-separated subset of glued,height,xshift,ink,dev
           (default: all)

Metrics, per (font, mode, coordinates):
  glued   i/j/ï/ä/ö/ü/ë/ё/ϊ/ϋ/ΐ/ΰ rendered on an integer origin, where no pixel
          row below 25% coverage separates the mark from the letter body
  height  flat and round letters disagree on x-height (Latin xzvwun vs oecsa,
          Greek ικντ vs οσεα) or cap height (HEIT vs OCG) at 50% coverage
  xshift  mean (hinted - unhinted) y of the topmost outline point of x/o/H, in
          px: how far the grid fit moves the height it snaps to
  ink     summed coverage of "Hamburgefonstiv Αλφάβητο 0123", averaged
  dev     summed |hinted - 8x supersampled unhinted| / reference ink, in %,
          best 1/8 px alignment (lower = closer to the designed outline)

The sibling ttf-inter-hinted and ttf-roboto-flex-hinted packages use the same
method, which is why the numbers in README.md can be compared with theirs.

Environment: FREETYPE_PROPERTIES="autofitter:no-stem-darkening=0" enables
stem darkening for MODE=slight (=1 keeps it off, which is the default on
Arch). Note that freetype-py ships its own libfreetype; to measure the system
one, put a copy of the package without libfreetype.so first in PYTHONPATH.
"""
import sys, itertools, json
import numpy as np
import freetype as ft

F_NOHINT = ft.FT_LOAD_NO_HINTING
F_LIGHT = ft.FT_LOAD_TARGET_LIGHT
F_NORMAL = ft.FT_LOAD_TARGET_NORMAL
F_NOAUTO = ft.FT_LOAD_NO_AUTOHINT

DOTS = "ijïäöüëёϊϋΐΰ"
FLAT_X, ROUND_X = "xzvwun", "oecsa"
FLAT_GX, ROUND_GX = "ικντ", "οσεα"
FLAT_C, ROUND_C = "HEIT", "OCG"
TEXT = "Hamburgefonstiv Αλφάβητο 0123"

MODES = {"none": F_NOHINT, "slight": F_LIGHT,
         "medium": F_NORMAL | F_NOAUTO, "auto": F_NORMAL}


class Face:
    def __init__(self, path):
        self.f = ft.Face(path)

    def setvar(self, coords):
        """Design coordinates; no-op for the static builds (no fvar)."""
        try:
            info = self.f.get_variation_info()
        except Exception:
            return
        if not info.axes:
            return
        vals = [float(coords.get(a.tag, a.default)) for a in info.axes]
        self.f.set_var_design_coords(vals)

    def bitmap(self, ch, ppem, flags):
        self.f.set_pixel_sizes(0, ppem)
        self.f.load_char(ch, flags | ft.FT_LOAD_RENDER)
        g = self.f.glyph
        b = g.bitmap
        a = (np.array(b.buffer, dtype=np.float32).reshape(b.rows, b.pitch)[:, :b.width] / 255.0
             if b.rows else np.zeros((0, 0), np.float32))
        return a, g.bitmap_left, g.bitmap_top

    def outline_top(self, ch, ppem, flags):
        """(top, bottom) of the outline, in 1/64 px."""
        self.f.set_pixel_sizes(0, ppem)
        self.f.load_char(ch, flags | ft.FT_LOAD_NO_BITMAP)
        ys = [p[1] for p in self.f.glyph.outline.points]
        if not ys:
            return None
        return max(ys), min(ys)


def edges(a, top, thr=0.5):
    rows = np.where(a.max(axis=1) >= thr)[0] if a.size else []
    if len(rows) == 0:
        return None
    return top - rows[0], top - rows[-1]


def glued(a):
    if not a.size:
        return False
    prof = a.max(axis=1)
    ink = np.where(prof >= 0.25)[0]
    inner = prof[ink[0]:ink[-1] + 1]
    return not (inner < 0.25).any()


def height_mismatch(face, ppem, flags):
    bad = 0
    for flat, rnd in ((FLAT_X, ROUND_X), (FLAT_GX, ROUND_GX), (FLAT_C, ROUND_C)):
        tops, bots = set(), set()
        for ch in flat + rnd:
            a, l, t = face.bitmap(ch, ppem, flags)
            e = edges(a, t)
            if e:
                tops.add(e[0]); bots.add(e[1])
        bad += (len(tops) > 1) + (len(bots) > 1)
    return bad


def xshift(face, ppem, flags, chars="xoH"):
    d = []
    for ch in chars:
        h = face.outline_top(ch, ppem, flags)
        u = face.outline_top(ch, ppem, F_NOHINT)
        if h and u:
            d.append((h[0] - u[0]) / 64.0)
    return float(np.mean(d)) if d else 0.0


def ink(face, ppem, flags):
    tot = 0.0
    for ch in TEXT.replace(" ", ""):
        a, l, t = face.bitmap(ch, ppem, flags)
        tot += a.sum()
    return round(tot, 2)


def deviation(face, ppem, flags):
    tot_d = tot_ink = 0.0
    for ch in TEXT.replace(" ", ""):
        a, l, t = face.bitmap(ch, ppem, flags)
        r, rl, rt = face.bitmap(ch, ppem * 8, F_NOHINT)
        if not r.size or not a.size:
            continue
        best = None
        for dx, dy in itertools.product(range(8), range(8)):
            H = (r.shape[0] + dy + 7) // 8 * 8 + 16
            W = (r.shape[1] + dx + 7) // 8 * 8 + 16
            canvas = np.zeros((H, W), np.float32)
            canvas[dy:dy + r.shape[0], dx:dx + r.shape[1]] = r
            ds = canvas.reshape(H // 8, 8, W // 8, 8).mean(axis=(1, 3))
            ox = int(np.floor((rl - dx) / 8.0)); oy = int(np.ceil((rt + dy) / 8.0))
            big = np.zeros((ds.shape[0] + a.shape[0] + 8, ds.shape[1] + a.shape[1] + 8), np.float32)
            bh = np.zeros_like(big)
            x0 = min(l, ox) - 2; y0 = max(t, oy) + 2
            def put(dst, img, il, it):
                y = y0 - it; x = il - x0
                dst[y:y + img.shape[0], x:x + img.shape[1]] += img
            put(big, ds, ox, oy); put(bh, a, l, t)
            d = np.abs(big - bh).sum()
            if best is None or d < best:
                best = d
        tot_d += best; tot_ink += r.sum() / 64.0
    return 100.0 * tot_d / tot_ink


def run(path, mode, coords, sizes, metrics=("glued", "height", "xshift", "dev")):
    face = Face(path)
    face.setvar(coords)
    flags = MODES[mode]
    out = {"glued": 0, "height": 0, "xshift": [], "ink": [], "dev": []}
    for ppem in sizes:
        if "glued" in metrics:
            out["glued"] += sum(glued(face.bitmap(c, ppem, flags)[0]) for c in DOTS)
        if "height" in metrics:
            out["height"] += height_mismatch(face, ppem, flags)
        if "xshift" in metrics:
            out["xshift"].append(round(xshift(face, ppem, flags), 2))
        if "ink" in metrics:
            out["ink"].append(ink(face, ppem, flags))
        if "dev" in metrics:
            out["dev"].append(deviation(face, ppem, flags))
    out["ink"] = round(float(np.mean(out["ink"])), 2) if out["ink"] else None
    out["dev"] = round(float(np.mean(out["dev"])), 1) if out["dev"] else None
    return out


if __name__ == "__main__":
    metrics = sys.argv[5].split(",") if len(sys.argv) > 5 else ("glued", "height", "xshift", "dev")
    label = sys.argv[6] if len(sys.argv) > 6 else sys.argv[1]
    r = run(sys.argv[1], sys.argv[2], json.loads(sys.argv[3]),
            [int(float(x)) for x in sys.argv[4].split(",")], metrics)
    print(f"{label}\t{json.dumps(r)}")
