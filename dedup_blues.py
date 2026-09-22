#!/usr/bin/env python3
"""Sanitise a CFF font's alignment zones so AFDKO otfautohint can hint it.

Usage:  dedup_blues.py IN.otf [OUT.otf]
        (in-place if OUT is omitted)

Why this exists
---------------
Apple's San Francisco fonts (SF Pro Text/Display, SF Compact) ship CFF Private
dicts whose BlueValues/OtherBlues arrays contain DUPLICATE and OVERLAPPING zones,
e.g. SF Pro Text Regular:

    BlueValues = [1078 1097  1443 1477  1443 1477  1506 1525]   # (1443,1477) twice
    OtherBlues = [-379 -360  -34 0  -19 0]                      # (-34,0) ⊃ (-19,0)

AFDKO's otfautohint reads these zones straight out of the Private dict and runs a
*fatal* validation (afdko/otfautohint/fdTools.py, FDDict.buildBlueLists): zones may
not overlap, and adjacent zones must be at least 1 + 2*BlueFuzz units apart. The
duplicate/overlapping pairs above trip the "top of zone X overlaps zone Y" branch
and otfautohint aborts (exit 2) without producing output. (Setting BlueFuzz=0 — the
fix suggested upstream for *too-close* zones — does not help here: BlueFuzz is
already 0 and these zones genuinely overlap.)

The blue-value spec (Adobe Type 1 §5) requires sorted, non-overlapping pairs, so
collapsing exact duplicates and merging overlapping zones yields a SPEC-CONFORMANT
set that hints identically — the dropped pairs were redundant. Glyph outlines are
untouched; only the Private-dict zone arrays are rewritten.

After this pass, otfautohint hints SF Pro cleanly and (unlike the FontForge
AutoHint fallback) preserves the name table, so no name repair is needed.
"""
import sys

from fontTools.ttLib import TTFont


def _merge(vals):
    """Collapse a flat [lo,hi, lo,hi, ...] zone array: dedup + merge overlaps.

    Returns a new flat array with sorted, non-overlapping, touching-merged pairs.
    """
    if not vals:
        return vals
    pairs = sorted({(vals[i], vals[i + 1]) for i in range(0, len(vals) - 1, 2)})
    merged = []
    for lo, hi in pairs:
        if merged and lo <= merged[-1][1]:           # overlaps/touches previous
            merged[-1] = (merged[-1][0], max(merged[-1][1], hi))
        else:
            merged.append((lo, hi))
    out = []
    for lo, hi in merged:
        out += [lo, hi]
    return out


def main(argv):
    if len(argv) not in (2, 3):
        sys.stderr.write(__doc__)
        return 2
    src = argv[1]
    dst = argv[2] if len(argv) == 3 else argv[1]

    try:
        font = TTFont(src)
    except Exception as exc:  # noqa: BLE001
        sys.stderr.write("dedup_blues: cannot open %s: %s\n" % (src, exc))
        return 1

    if "CFF " not in font:
        sys.stderr.write("dedup_blues: %s has no CFF table; nothing to do.\n" % src)
        if dst != src:
            font.save(dst)
        return 0

    cff = font["CFF "].cff
    top = cff[cff.fontNames[0]]

    # Handle both plain CFF (top.Private) and CID-keyed CFF (per-FD Private dicts).
    privs = []
    if hasattr(top, "FDArray"):
        privs = [fd.Private for fd in top.FDArray if hasattr(fd, "Private")]
    elif hasattr(top, "Private"):
        privs = [top.Private]

    changed = False
    for priv in privs:
        for attr in ("BlueValues", "OtherBlues", "FamilyBlues", "FamilyOtherBlues"):
            vals = getattr(priv, attr, None)
            if not vals:
                continue
            new = _merge(vals)
            if new != list(vals):
                setattr(priv, attr, new)
                changed = True

    if changed or dst != src:
        font.save(dst)

    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
