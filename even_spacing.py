#!/usr/bin/env python3
"""Even out the optical spacing of letter pairs with a GPOS kern lookup.

A font can have sidebearings that look right glyph by glyph but give uneven gaps
between pairs. For every pair of lowercase letters (and of uppercase letters) of the
chosen scripts this measures the area between the outlines inside a zone (x-height /
cap height), clamps each side's profile at a depth so open shapes (ς, λ, c, ε) are not
over-credited, and adds a kern lookup moving each pair towards the median gap.
Accented letters share the correction of their base letter (class kerning), and the
font's own kerning is kept and pairs it already kerns are left alone.

  even_spacing.py [--script latin,greek,cyrillic|all] [--ppem 16] [--report PAIRS]
                  [--stats] -o OUTDIR FONT...

Calibration: depth and strength are fitted per font to the pairs the designer kerned
by hand (the metric should ask for roughly those kerns); --max/--min follow the target
size (1 px / 0.1 px). Any of --depth --strength --max --min overrides its fit.
"""
import argparse, os, statistics, unicodedata
from fontTools.ttLib import TTFont
from fontTools.pens.basePen import BasePen
from fontTools.otlLib.builder import buildPairPosClassesSubtable, buildValue
from fontTools.ttLib.tables import otTables as ot

SCRIPTS = ("latin", "greek", "cyrillic")


def base_letters(cmap, script):
    """{base codepoint: [member codepoints]} for lowercase and uppercase letters."""
    out = {"lower": {}, "upper": {}}
    for cp in cmap:
        if cp > 0x24F and script == "latin": continue
        ch = chr(cp)
        cat = unicodedata.category(ch)
        if cat not in ("Ll", "Lu"): continue
        try:
            if not unicodedata.name(ch).startswith(script.upper()): continue
        except ValueError: continue
        d = unicodedata.normalize("NFD", ch)
        if unicodedata.decomposition(ch).startswith("<"): continue   # ligatures etc
        b = ord(d[0])
        if b not in cmap or unicodedata.category(chr(b)) != cat: continue
        out["lower" if cat == "Ll" else "upper"].setdefault(b, []).append(cp)
    for k in out:   # base letter first, only keep groups whose base is itself a letter
        out[k] = {b: m for b, m in out[k].items() if b in m}
    return out


class Flat(BasePen):
    def __init__(self, gs):
        super().__init__(gs); self.segs = []; self.cur = self.start = None
    def _moveTo(self, p): self.cur = self.start = p
    def _lineTo(self, p): self.segs.append((self.cur, p)); self.cur = p
    def _curveToOne(self, a, b, c):
        p0 = self.cur
        for i in range(1, 9):
            t = i / 8; u = 1 - t
            self._lineTo((u**3*p0[0] + 3*u*u*t*a[0] + 3*u*t*t*b[0] + t**3*c[0],
                          u**3*p0[1] + 3*u*u*t*a[1] + 3*u*t*t*b[1] + t**3*c[1]))
    def _qCurveToOne(self, a, c):
        p0 = self.cur
        for i in range(1, 9):
            t = i / 8; u = 1 - t
            self._lineTo((u*u*p0[0] + 2*u*t*a[0] + t*t*c[0], u*u*p0[1] + 2*u*t*a[1] + t*t*c[1]))
    def _closePath(self):
        if self.cur != self.start: self._lineTo(self.start)
    _endPath = _closePath


def profile(gs, name, adv, top, rows=40):
    pen = Flat(gs); gs[name].draw(pen)
    L, R = [], []
    step = top / rows
    for i in range(rows):
        y = (i + .5) * step; xs = []
        for (x0, y0), (x1, y1) in pen.segs:
            if (y0 <= y < y1) or (y1 <= y < y0):
                xs.append(x0 + (y - y0) * (x1 - x0) / (y1 - y0))
        L.append(min(xs) if xs else None); R.append(adv - max(xs) if xs else None)
    return L, R


def clamp(P, depth):
    vals = [v for v in P if v is not None]
    if not vals: return None
    lim = min(vals) + depth
    return [min(lim, v) if v is not None else lim for v in P]


def kern_lookup(gpos):
    fr = [x for x in gpos.FeatureList.FeatureRecord if x.FeatureTag == "kern"]
    subs = []
    for i in sorted({i for x in fr for i in x.Feature.LookupListIndex}):
        for st in gpos.LookupList.Lookup[i].SubTable:
            st = getattr(st, "ExtSubTable", st)
            if hasattr(st, "Coverage") and hasattr(st, "Format") and (
                    hasattr(st, "PairSet") or hasattr(st, "Class1Record")): subs.append(st)
    def k(a, b):
        tot = 0
        for st in subs:
            if a not in st.Coverage.glyphs: continue
            if st.Format == 1:
                for r in st.PairSet[st.Coverage.glyphs.index(a)].PairValueRecord:
                    if r.SecondGlyph == b and r.Value1: tot += getattr(r.Value1, "XAdvance", 0) or 0
            else:
                v = st.Class1Record[st.ClassDef1.classDefs.get(a, 0)].Class2Record[
                    st.ClassDef2.classDefs.get(b, 0)].Value1
                if v: tot += getattr(v, "XAdvance", 0) or 0
        return tot
    return k


def raw_gaps(prof, depth, top, kern, cmap):
    """{(l, r): (gap without kern, existing kern)} for one script/case block."""
    cl = {}
    for b, (L, R) in prof.items():
        cl[b] = (clamp(L, depth * top), clamp(R, depth * top))
    out = {}
    for l in cl:
        if l == 0x3C2: continue              # final sigma: no right neighbour
        for r in cl:
            g = sum(x + y for x, y in zip(cl[l][1], cl[r][0])) / len(cl[l][1])
            out[l, r] = (g, kern(cmap[l], cmap[r]))
    return out


def calibrate(blocks, kern, cmap, a):
    """Fit depth and strength to the designer's own kerning.

    For the pairs the font already kerns (by hand, so intent), the correction the
    metric would ask for (median - gap) should line up with the kern value. The depth
    with the best correlation wins, the least-squares slope becomes the strength."""
    best = None
    for depth in (0.10, 0.14, 0.18, 0.22, 0.28, 0.35, 0.45):
        xs, ys = [], []
        for prof, top in blocks:
            g = raw_gaps(prof, depth, top, kern, cmap)
            med = statistics.median(v[0] for v in g.values())
            for v, k in g.values():
                if k: xs.append(med - v); ys.append(k)
        if len(xs) < 30: return None
        mx, my = statistics.fmean(xs), statistics.fmean(ys)
        sxx = sum((x - mx) ** 2 for x in xs); syy = sum((y - my) ** 2 for y in ys)
        sxy = sum((x - mx) * (y - my) for x, y in zip(xs, ys))
        if sxx == 0 or syy == 0: continue
        r = sxy / (sxx * syy) ** .5
        slope = sum(x * y for x, y in zip(xs, ys)) / sum(x * x for x in xs)
        if best is None or r > best[0]: best = (r, depth, slope, len(xs))
    return best


def process(path, a):
    f = TTFont(path); gs = f.getGlyphSet(); cmap = f.getBestCmap(); hmtx = f["hmtx"]
    upm = f["head"].unitsPerEm; os2 = f["OS/2"]
    zone = {"lower": getattr(os2, "sxHeight", 0) or upm // 2,
            "upper": getattr(os2, "sCapHeight", 0) or int(upm * .7)}
    sc = upm / 1000
    gpos = f["GPOS"].table; kern = kern_lookup(gpos)
    scripts = SCRIPTS if a.script == "all" else a.script.split(",")
    blocks, members = [], []      # blocks: (profiles, zone height); members: base -> glyph set
    for script in scripts:
        for case, groups in base_letters(cmap, script).items():
            top = zone[case]; prof, mem = {}, {}
            for b, cps in groups.items():
                n = cmap[b]
                L, R = profile(gs, n, hmtx[n][0], top)
                if all(v is None for v in L): continue
                prof[b] = (L, R); mem[b] = tuple(sorted({cmap[c] for c in cps}))
            if len(prof) >= 3: blocks.append((prof, top)); members.append(mem)
    depth, strength = a.depth, a.strength
    if depth is None or strength is None:
        cal = calibrate(blocks, kern, cmap, a)
        if cal and cal[0] >= 0.25:
            r, d, sl, n = cal
            depth = d if depth is None else depth
            strength = min(1.0, max(0.4, sl)) if strength is None else strength
            print(f"  calibrated on {n} designer-kerned pairs: depth {depth}, strength {strength:.2f} (r={r:.2f})")
        else:
            depth = 0.22 if depth is None else depth
            strength = 0.8 if strength is None else strength
            print(f"  calibration inconclusive ({'no data' if not cal else 'r=%.2f' % cal[0]}); using depth {depth}, strength {strength}")
    pairs = {}; before, after = [], []
    for (prof, top), mem in zip(blocks, members):
        g = raw_gaps(prof, depth, top, kern, cmap)
        gap = {k: v[0] + v[1] for k, v in g.items()}
        kerned = {k for k, v in g.items() if v[1]}
        target = statistics.median(gap.values())
        for (l, r), gv in gap.items():
            d = max(-a.max * sc, min(a.max * sc, (target - gv) * strength))
            if abs(d) < a.min * sc or (l, r) in kerned: d = 0
            before.append(gv); after.append(gv + d)
            if d: pairs[mem[l], mem[r]] = (buildValue({"XAdvance": int(round(d))}), buildValue({}))
            if a.report and chr(l) + chr(r) in a.report:
                print(f"  {chr(l)}{chr(r)}: gap {gv:6.1f}  target {target:6.1f}  kern {d:+6.1f}")
    if a.stats and before:
        print(f"  gap spread (std, units/1000): {statistics.pstdev(before)/sc:.1f} -> "
              f"{statistics.pstdev(after)/sc:.1f}   ({len(pairs)} class pairs)")
    if not a.out: return
    if pairs:
        sub = buildPairPosClassesSubtable(pairs, f.getReverseGlyphMap())
        lk = ot.Lookup(); lk.LookupType = 2; lk.LookupFlag = 0; lk.SubTable = [sub]; lk.SubTableCount = 1
        gpos.LookupList.Lookup.append(lk); gpos.LookupList.LookupCount += 1
        n = gpos.LookupList.LookupCount - 1
        for fr in gpos.FeatureList.FeatureRecord:
            if fr.FeatureTag == "kern":
                fr.Feature.LookupListIndex.append(n); fr.Feature.LookupCount += 1
    os.makedirs(a.out, exist_ok=True)
    f.save(os.path.join(a.out, os.path.basename(path)))
    print(f"==> even_spacing: {os.path.basename(path)}: {len(pairs)} class-pair corrections")


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("fonts", nargs="+"); p.add_argument("-o", "--out")
    p.add_argument("--script", default="all", help="comma list of latin,greek,cyrillic, or all")
    p.add_argument("--ppem", type=float, default=16, help="target size; sets --max (~1px) and --min (~0.1px)")
    p.add_argument("--strength", type=float, default=None, help="default: fitted to the font's own kerning")
    p.add_argument("--depth", type=float, default=None, help="profile depth as fraction of the zone (default: fitted)")
    p.add_argument("--max", type=float, default=None, help="max |kern| in units/1000 em (default 1000/ppem)")
    p.add_argument("--min", type=float, default=None, help="skip corrections below this (default 100/ppem)")
    p.add_argument("--report", type=lambda v: v.split(","), help="comma list of pairs to print")
    p.add_argument("--stats", action="store_true")
    a = p.parse_args()
    a.max = 1000 / a.ppem if a.max is None else a.max
    a.min = 100 / a.ppem if a.min is None else a.min
    for fp in a.fonts: process(fp, a)
