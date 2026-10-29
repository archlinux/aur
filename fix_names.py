#!/usr/bin/env python3
"""Repair the name table of a Nerd Fonts-patched font, and optionally rename.

Two things break when font-patcher runs an Apple font through FontForge, and
both are visible from fontconfig:

1. Garbage typographic family. nameID 1/2/3/4/6 stay correct
   ("SFPro Nerd Font Propo Text", "Regular", "SFProNFP-Text") but FontForge
   writes some of its own internal strings into nameID 16 and 17:

       nameID 16, platform 3: '最攀਀ऀ攀砀挀氀愀洀愀琀椀漀渀洀愀爀欀⸀洀'  (UTF-16 of "sage.fill\\n")
       nameID 16, platform 1: 's\\x00s\\x00a\\x00g\\x00e\\x00.\\x00f\\x00i\\x00l\\x00l\\x00\\n'

   fontconfig prefers nameID 16 over nameID 1, so a patched SF Pro advertises
   that string as its family:

       fc-scan --format '%{family}' ... -> 最攀਀ऀ...,SFPro Nerd Font Propo Text

   Every Apple font has nameID 16 == nameID 1 and nameID 17 == nameID 2 (checked
   on all 78 installed faces; only SF Mono has no nameID 16), so the repair is
   exact: copy the bytes of 1 and 2 into 16 and 17, and likewise 21/22, for each
   platform/encoding/language that has a broken record.

   This also silently broke the 80-$pkgname.conf shipped with a patched build:
   the family list is read out of the fonts, so it listed the "sage.fill" name
   and never matched a real font (bytecode hinting was never enabled).

2. An oversized name table. Apple stores the licence (nameID 13) once, as
   UTF-16: 60 084 bytes, i.e. a 62 KB name table, just inside the format's
   64 KB string-storage limit. FontForge adds a second, Mac-Roman copy of the
   same text (30 042 bytes), which pushes the storage to 92 KB - past the
   limit, so the offsets no longer fit in the format's uint16 fields and
   fontTools refuses to write the table back at all:

       ValueError: Value 91040 does not fit in format H for offset

   That would make any later step that saves the font impossible, baking
   included. The Mac copy is a duplicate of a string that is also present as
   UTF-16, so it is dropped - and only when the table really does not compile,
   so fonts that are fine are left byte-for-byte alone.

With --suffix, every font also gets that suffix appended to its family, so a
build installs next to the stock fonts instead of replacing them
("SF Pro Text" -> "SF Pro Text Alt", PostScript "SFProTextAlt-Regular"). This
package does that here rather than with make_features.py --family because one
build ships up to thirteen families, one suffix each, and because the rename
must happen even for a family that carries none of the baked features (SF Mono
has no ss06/cv07/case, but must still not collide with the stock instal).

Usage: fix_names.py [--suffix SUFFIX] FONT [FONT...]
"""
import argparse
import sys

from fontTools.ttLib import TTFont

# (id to repair, id it must equal)
PAIRS = ((16, 1), (17, 2), (21, 1), (22, 2))
# Long text records: a Mac-Roman copy of one of these is what overflows the table
LONG_IDS = (10, 13, 14)
# Records that carry the family name and have to follow a rename
FAMILY_IDS = (1, 3, 4, 6, 16, 21, 25)
# pango strips these from the end of a family name and reads them as a style,
# so a suffix like " Bold" would silently turn into a Bold face instead of a
# family called "... Bold".
PANGO_STYLE_WORDS = {
    "thin", "hairline", "light", "book", "regular", "normal", "medium",
    "bold", "heavy", "black", "italic", "oblique", "condensed", "expanded",
    "roman", "semi-light", "ultra-light", "extra-light", "demi-light",
    "semi-bold", "demi-bold", "ultra-bold", "extra-bold", "ultra-heavy",
    "ultra-black", "extra-black", "small-caps", "all-small-caps",
}


def compiles(name_table, font):
    try:
        name_table.compile(font)
        return True, len(name_table.compile(font))
    except Exception as exc:                      # struct.error / ValueError
        return False, str(exc)


def repair_typographic_ids(name):
    fixed = []
    by_key = {}
    for rec in name.names:
        by_key.setdefault((rec.platformID, rec.platEncID, rec.langID), {})[rec.nameID] = rec
    for key, ids in by_key.items():
        for want, source in PAIRS:
            rec, src = ids.get(want), ids.get(source)
            if rec is None or src is None or rec.string == src.string:
                continue
            fixed.append((want, key, rec.toUnicode()[:40]))
            rec.string = src.string
    return fixed


def drop_duplicate_mac_records(name):
    """Remove platform-1 copies of long records that also exist as UTF-16."""
    unicode_text = {r.nameID: r.toUnicode() for r in name.names
                    if r.platformID == 3 and r.nameID in LONG_IDS}
    keep, dropped = [], []
    for rec in name.names:
        if (rec.platformID == 1 and rec.nameID in LONG_IDS
                and rec.nameID in unicode_text
                and rec.toUnicode() == unicode_text[rec.nameID]):
            dropped.append((rec.nameID, len(rec.string)))
            continue
        keep.append(rec)
    name.names = keep
    return dropped


def suffix_family(font, suffix):
    """Append suffix to the family name, everywhere it stands for the family."""
    if suffix.split()[-1].lower() in PANGO_STYLE_WORDS:
        sys.exit(f"fix_names.py: pango reads the last word of '{suffix}' as a "
                 f"style and drops it from the family name; pick another suffix")
    name = font["name"]
    base = name.getDebugName(16) or name.getDebugName(1)
    if not base:
        sys.exit("fix_names.py: no family name in the font")
    pairs = [(base, base + suffix),
             (base.replace(" ", ""), base.replace(" ", "") + suffix.replace(" ", ""))]
    for rec in name.names:
        if rec.nameID not in FAMILY_IDS:
            continue
        old = rec.toUnicode()
        new = old
        for a, b in pairs:
            new = new.replace(a, b)
        if new != old:
            rec.string = new.encode(rec.getEncoding(), errors="replace")
    return base


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("fonts", nargs="+")
    ap.add_argument("--suffix", default="",
                    help="append this to every family name (e.g. ' Alt')")
    a = ap.parse_args()

    if a.suffix and not a.suffix.strip():
        sys.exit("fix_names.py: --suffix is empty")
    for path in a.fonts:
        font = TTFont(path)
        name = font["name"]
        ok, info = compiles(name, font)
        fixed = repair_typographic_ids(name)
        dropped = []
        if not ok:
            dropped = drop_duplicate_mac_records(name)
            ok, info = compiles(name, font)
        renamed = suffix_family(font, a.suffix) if a.suffix else None
        short = path.split("/")[-1]
        if not (fixed or dropped or renamed):
            print(f"  {short}: name table intact, nothing to do")
            continue
        if not ok:
            sys.exit(f"fix_names.py: {short}: name table still does not compile "
                     f"({info}); refusing to write a broken font")
        font.save(path)
        bits = []
        if fixed:
            bits.append(f"repaired {len(fixed)} mangled record(s)")
        if dropped:
            bits.append(f"dropped {len(dropped)} duplicate Mac licence record(s)")
        if renamed:
            bits.append(f"'{renamed}' -> '{renamed}{a.suffix}'")
        print(f"  {short}: " + ", ".join(bits)
              + f"  [name table now {compiles(font['name'], font)[1]} bytes]")


if __name__ == "__main__":
    main()
