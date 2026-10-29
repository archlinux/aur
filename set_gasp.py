#!/usr/bin/env python3
"""Rewrite the 'gasp' table of a TrueType font to a named strategy.

Usage:  set_gasp.py MODE FONT.ttf [FONT.ttf ...]

MODE:
  sized    Microsoft size-based recommendation:
             ppem <= 8   -> grayscale only          (0x0002)
             9..16       -> grid-fit only            (0x0001)
             17+         -> grid-fit + grayscale     (0x0003)
  smooth   all sizes smooth / anti-aliased: {0xFFFF: 0x000F}
             (GRIDFIT|DOGRAY|SYMMETRIC_GRIDFIT|SYMMETRIC_SMOOTHING)
             This is the gftools 'fix-nonhinting' blanket value.
  gridfit  all sizes grid-fit + grayscale: {0xFFFF: 0x0003}
  keep     leave the gasp table untouched (no-op; here for completeness)

The font is edited in place. A gasp table is created if missing.
Reference: OpenType spec 'gasp' table; fontTools _g_a_s_p.
"""
import sys
from fontTools.ttLib import TTFont, newTable

# gasp behaviour flags (OpenType spec)
GRIDFIT             = 0x0001
DOGRAY             = 0x0002
SYMMETRIC_GRIDFIT  = 0x0004
SYMMETRIC_SMOOTHING = 0x0008

MODES = {
    # MS size-based strategy (version-0 flags only, broadly compatible)
    "sized": ({8: DOGRAY, 16: GRIDFIT, 0xFFFF: GRIDFIT | DOGRAY}, 0),
    # blanket "all smooth" (needs gasp v1 for the symmetric flags)
    "smooth": ({0xFFFF: GRIDFIT | DOGRAY | SYMMETRIC_GRIDFIT | SYMMETRIC_SMOOTHING}, 1),
    # blanket grid-fit + grayscale
    "gridfit": ({0xFFFF: GRIDFIT | DOGRAY}, 0),
}


def set_gasp(path, mode):
    ranges, version = MODES[mode]
    font = TTFont(path)
    if "gasp" not in font:
        font["gasp"] = newTable("gasp")
    gasp = font["gasp"]
    gasp.version = version
    gasp.gaspRange = dict(ranges)
    font.save(path)


def main(argv):
    if len(argv) < 3:
        sys.stderr.write(__doc__)
        return 2
    mode = argv[1]
    if mode == "keep":
        return 0
    if mode not in MODES:
        sys.stderr.write("set_gasp: unknown mode %r\n" % mode)
        return 2
    rc = 0
    for path in argv[2:]:
        try:
            set_gasp(path, mode)
        except Exception as exc:  # noqa: BLE001 - report and continue
            sys.stderr.write("set_gasp: %s: %s\n" % (path, exc))
            rc = 1
    return rc


if __name__ == "__main__":
    sys.exit(main(sys.argv))
