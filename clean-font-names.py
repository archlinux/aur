#!/usr/bin/env python3
"""Strip leading dots from family/full/PostScript name records in fonts.

Usage: clean-font-names.py DIRECTORY
Rewrites .ttf/.otf/.ttc/.otc files in place, only if something changed.
"""
import os
import sys
import tempfile

from fontTools.ttLib import TTCollection, TTFont

EXTENSIONS = (".ttf", ".otf", ".ttc", ".otc")

# Standard IDs (custom IDs >= 256 are handled in clean_font):
# 1 family, 4 full name, 6 PostScript name, 16 typographic family,
# 18 compat full name, 20 PS CID findfont name, 21 WWS family, 25 var PS prefix
NAME_IDS = {1, 4, 6, 16, 18, 20, 21, 25}


def clean_font(font):
    """Strip leading dots from selected name records; return count changed."""
    if "name" not in font:
        return 0
    table = font["name"]

    # Variable fonts: named-instance PostScript/subfamily names live in custom
    # name records (ID >= 256) referenced from fvar.
    ids = set(NAME_IDS)
    if "fvar" in font:
        for inst in font["fvar"].instances:
            for attr in ("postscriptNameID", "subfamilyNameID"):
                nid = getattr(inst, attr, 0xFFFF)
                if nid != 0xFFFF:
                    ids.add(nid)

    changed = 0
    for record in list(table.names):
        if record.nameID not in ids and record.nameID < 256:
            continue
        try:
            name = record.toUnicode()
        except Exception:
            continue
        if not name.startswith("."):
            continue
        new = name.lstrip(".")
        if not new:
            continue
        table.setName(new, record.nameID, record.platformID,
                      record.platEncID, record.langID)
        changed += 1
    return changed


def process(path, directory, ext):
    with open(path, "rb") as fh:
        is_collection = fh.read(4) == b"ttcf"

    fd, temp_path = tempfile.mkstemp(prefix=".font-clean-", suffix=ext,
                                     dir=directory)
    os.close(fd)
    try:
        if is_collection:
            collection = TTCollection(path, lazy=False)
            changed = sum(clean_font(f) for f in collection.fonts)
            if changed:
                collection.save(temp_path)
            collection.close()
        else:
            with TTFont(path) as font:
                changed = clean_font(font)
                if changed:
                    font.save(temp_path)
        if changed:
            os.replace(temp_path, path)
        return changed
    finally:
        if os.path.exists(temp_path):
            os.unlink(temp_path)


def main():
    if len(sys.argv) != 2:
        sys.exit(f"usage: {sys.argv[0]} DIRECTORY")

    total = 0
    for directory, _, filenames in os.walk(sys.argv[1]):
        for filename in filenames:
            ext = os.path.splitext(filename)[1].lower()
            if ext not in EXTENSIONS:
                continue
            path = os.path.join(directory, filename)
            try:
                total += process(path, directory, ext)
            except Exception as exc:
                print(f"Failed on {path}: {exc}", file=sys.stderr)
                raise

    print(f"Renamed {total} dot-prefixed name records.")


if __name__ == "__main__":
    main()