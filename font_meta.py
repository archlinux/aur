#!/usr/bin/env python3
"""Read identity metadata out of the Apple font files themselves.

Everything here reads the OpenType `name` table rather than trusting filenames,
because Apple re-spins the DMGs without warning and has already changed both the
installer layout and the file naming between releases. The name table is the one
thing that has stayed stable across every re-spin we have seen.

Subcommands
-----------
version FILE...
    Print the highest font version found, normalised to a pacman-safe dotted
    number (``Version 22.0d5e4`` -> ``22.0.5.4``). Apple's scheme is
    ``<major>.<minor>d<dev>e<edit>``; each component is compared numerically so
    22.0d5e4 > 22.0d5e3 > 18.0d1e1, which keeps pkgver monotonic across re-spins.

families FILE...
    Print ``<file>\t<typographic family>`` for each font, e.g.
    ``SF-Pro-Text-Bold.otf<TAB>SF Pro Text``. Used to select subfamilies by what
    the font says it is rather than by filename pattern.
"""

import argparse
import os
import re
import sys

try:
    from fontTools.ttLib import TTFont
except ImportError:
    sys.exit("font_meta.py: python-fonttools is required")

# Apple's version strings look like "Version 22.0d5e4" or occasionally
# "Version 1.00". Capture the numeric parts in order; anything we cannot parse
# is skipped rather than allowed to corrupt pkgver.
_VER_RE = re.compile(
    r"(?:Version\s+)?(\d+)\.(\d+)(?:d(\d+))?(?:e(\d+))?", re.IGNORECASE
)


def _names(path):
    """Return {nameID: value} for the Windows platform, falling back to Mac."""
    font = TTFont(path, lazy=True, fontNumber=0)
    try:
        out = {}
        # Prefer platformID 3 (Windows/Unicode); fall back to whatever exists so
        # a font with only Macintosh names still yields usable metadata.
        for want_platform in (3, None):
            for rec in font["name"].names:
                if want_platform is not None and rec.platformID != want_platform:
                    continue
                if rec.nameID in out:
                    continue
                try:
                    out[rec.nameID] = str(rec)
                except Exception:
                    continue
            if out:
                break
        return out
    finally:
        font.close()


def _parse_version(text):
    """Turn an Apple version string into a comparable tuple, or None."""
    if not text:
        return None
    m = _VER_RE.search(text)
    if not m:
        return None
    return tuple(int(g) if g is not None else 0 for g in m.groups())


def cmd_version(paths):
    best = None
    for path in paths:
        try:
            names = _names(path)
        except Exception:
            # A single unreadable font must not sink the whole build; the caller
            # fails only if *nothing* was parseable.
            continue
        # nameID 5 is the version string; nameID 3 (unique ID) carries it too and
        # serves as a fallback when 5 is missing or unparseable.
        parsed = _parse_version(names.get(5)) or _parse_version(names.get(3))
        if parsed and (best is None or parsed > best):
            best = parsed
    if best is None:
        return 1
    # Trailing zero components carry no information; drop them so a plain
    # "Version 1.00" becomes "1.0" instead of "1.0.0.0".
    parts = list(best)
    while len(parts) > 2 and parts[-1] == 0:
        parts.pop()
    print(".".join(str(p) for p in parts))
    return 0


def cmd_families(paths):
    ok = False
    for path in paths:
        try:
            names = _names(path)
        except Exception:
            continue
        # nameID 16 is the typographic family ("SF Pro Text"); nameID 1 is the
        # legacy family, which for these fonts collapses weights into the family
        # ("SF Pro Text" too, but not guaranteed). Prefer 16, fall back to 1.
        family = names.get(16) or names.get(1)
        if not family:
            continue
        print("{}\t{}".format(os.path.basename(path), family.strip()))
        ok = True
    return 0 if ok else 1


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("version", "families"):
        p = sub.add_parser(name)
        p.add_argument("paths", nargs="+")
    args = ap.parse_args()
    return {"version": cmd_version, "families": cmd_families}[args.cmd](args.paths)


if __name__ == "__main__":
    sys.exit(main())
