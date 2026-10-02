#!/usr/bin/env python3
"""Measure FreeType rendering of Roboto Flex variants (README.md §3).

Usage:  measure.py FONT.ttf MODE '{"wght":400,"opsz":9.75}' 12,13,14

modes: none | slight (LIGHT -> autohinter) | medium (NORMAL, bytecode if any)
metrics per (font, mode):
  glued   dots/diaereses with no row < 25% coverage between mark and body
  height  flat vs round letters disagree on x-height / cap height / baseline
  dev     sum |hinted - 8x supersampled unhinted| / ref ink, % (best 1/8 px shift)
"""
import sys, itertools
import numpy as np
import freetype as ft

F_NOHINT = ft.FT_LOAD_NO_HINTING
F_LIGHT = ft.FT_LOAD_TARGET_LIGHT
F_NORMAL = ft.FT_LOAD_TARGET_NORMAL
F_FORCE = ft.FT_LOAD_FORCE_AUTOHINT
F_NOAUTO = ft.FT_LOAD_NO_AUTOHINT

DOTS = "ijïäöüϊϋëΐΰ"
FLAT_X, ROUND_X = "xzvwun", "oecsa"
FLAT_GX, ROUND_GX = "ικντ", "οσεα"
FLAT_C, ROUND_C = "HEIT", "OCG"
TEXT = "Hamburgefonstiv Αλφάβητο 0123"


class Face:
    def __init__(self, path):
        self.f = ft.Face(path)

    def setvar(self, coords):
        info = self.f.get_variation_info()
        vals = []
        for a in info.axes:
            vals.append(float(coords.get(a.tag, a.default)))
        self.f.set_var_design_coords(vals)

    def bitmap(self, ch, ppem, flags):
        self.f.set_pixel_sizes(0, ppem)
        self.f.load_char(ch, flags | ft.FT_LOAD_RENDER)
        g = self.f.glyph
        b = g.bitmap
        a = np.array(b.buffer, dtype=np.float32).reshape(b.rows, b.pitch)[:, :b.width] / 255.0 \
            if b.rows else np.zeros((0, 0), np.float32)
        return a, g.bitmap_left, g.bitmap_top


def edges(a, top, thr=0.5):
    rows = np.where(a.max(axis=1) >= thr)[0] if a.size else []
    if len(rows) == 0:
        return None
    return top - rows[0], top - rows[-1]  # y of top row, y of bottom row


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


def deviation(face, ppem, flags):
    tot_d = tot_ink = 0.0
    for ch in TEXT.replace(" ", ""):
        a, l, t = face.bitmap(ch, ppem, flags)
        r, rl, rt = face.bitmap(ch, ppem * 8, F_NOHINT)
        if not r.size or not a.size:
            continue
        best = None
        for dx, dy in itertools.product(range(8), range(8)):
            # place ref on an 8x grid with shift, downsample
            H = (r.shape[0] + dy + 7) // 8 * 8 + 16
            W = (r.shape[1] + dx + 7) // 8 * 8 + 16
            canvas = np.zeros((H, W), np.float32)
            canvas[dy:dy + r.shape[0], dx:dx + r.shape[1]] = r
            ds = canvas.reshape(H // 8, 8, W // 8, 8).mean(axis=(1, 3))
            # align origins roughly: ref left/top in 1x px
            ox = int(np.floor((rl - dx) / 8.0)); oy = int(np.ceil((rt + dy) / 8.0))
            big = np.zeros((ds.shape[0] + a.shape[0] + 8, ds.shape[1] + a.shape[1] + 8), np.float32)
            bh = np.zeros_like(big)
            # common frame: x0 = min(l, ox) ; y top = max(t, oy)
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


def run(path, mode, coords, sizes, metrics=("glued", "height", "dev")):
    face = Face(path)
    face.setvar(coords)
    flags = {"none": F_NOHINT, "slight": F_LIGHT, "medium": F_NORMAL | F_NOAUTO,
             "medium-auto": F_NORMAL}[mode]
    out = {"glued": 0, "height": 0, "dev": []}
    for ppem in sizes:
        if "glued" in metrics:
            out["glued"] += sum(glued(face.bitmap(c, ppem, flags)[0]) for c in DOTS)
        if "height" in metrics:
            out["height"] += height_mismatch(face, ppem, flags)
        if "dev" in metrics:
            out["dev"].append(deviation(face, ppem, flags))
    out["dev"] = float(np.mean(out["dev"])) if out["dev"] else None
    return out


if __name__ == "__main__":
    import json
    print(json.dumps(run(sys.argv[1], sys.argv[2], json.loads(sys.argv[3]),
                         [int(x) for x in sys.argv[4].split(",")])))
