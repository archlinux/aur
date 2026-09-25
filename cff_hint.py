#!/usr/bin/env python3
"""Autohint a static OTF/CFF font using FontForge, preserving CFF outlines.

Usage:  cff_hint.py IN.otf OUT.otf

This is the no-new-dependency fallback for CFF/PostScript hinting when AFDKO's
'otfautohint' is not installed. It runs FontForge's AutoHint over all glyphs and
re-emits an OpenType/CFF font, so the output stays OTF (no TTF conversion).

Quality note: otfautohint (AFDKO >= 4.0) generally produces better PostScript
hints than FontForge's AutoHint; prefer it when available (HINT_ENGINE=cff picks
otfautohint automatically if installed). This script keeps the CFF path working
on a stock fontforge install.

About the FontForge noise this used to surface:
  * "glyph named X is mapped to U+YYYY but its name indicates ..." — harmless
    informational notices; the font is unaffected.
  * "Mac and Windows entries in the 'name' table differ" — Apple ships different
    per-platform license strings; expected and harmless.
  * "Ignoring 'MERG'/'meta'/'trak' table" — Apple-only tables FontForge does not
    round-trip; not needed in the output.
  * "Internal Error: ... 'kern' ... too big / output into a 16-bit field" — the
    Apple fonts carry kerning in a large OpenType GPOS table. When FontForge tries
    to ALSO synthesise a legacy 'kern' table it overflows the old 16-bit format and
    SKIPS it. The real kerning (GPOS) is preserved, so nothing is lost; we also
    explicitly drop any legacy 'kern' afterwards to be safe.

Name-table preservation:
  FontForge's generate() rewrites the 'name' table and, on these Apple fonts,
  mangles the typographic family/subfamily records (nameID 16/17) into garbage
  sliced out of other strings — e.g. nameID 16 becomes 'is.message.' instead of
  'SF Pro Text'. fontconfig and most toolkits PREFER nameID 16/17 when present, so
  the corrupted records make the family unselectable under its real name. FontForge
  only ever damages these names (it never legitimately changes them), so we snapshot
  the original 'name' table before hinting and restore it verbatim afterwards.

To keep build logs readable we silence FontForge's C-level stderr during open/
generate, and re-raise only on an actual failure (non-existent / empty output).
"""
import os
import sys

try:
    import fontforge
except ImportError:
    sys.stderr.write("cff_hint: fontforge Python module not available\n")
    sys.exit(3)

from fontTools.ttLib import TTFont


class _SilencedStderr:
    """Redirect the process-level fd 2 to /dev/null for the duration of a block.

    FontForge writes its notices straight to C stderr, so Python-level capture is
    not enough; we swap the file descriptor itself.
    """

    def __enter__(self):
        self._saved = os.dup(2)
        self._null = os.open(os.devnull, os.O_WRONLY)
        os.dup2(self._null, 2)
        return self

    def __exit__(self, *exc):
        os.dup2(self._saved, 2)
        os.close(self._null)
        os.close(self._saved)
        return False


def main(argv):
    if len(argv) != 3:
        sys.stderr.write(__doc__)
        return 2
    src, dst = argv[1], argv[2]

    # Snapshot the source 'name' table before FontForge gets to mangle it.
    try:
        _orig_name = TTFont(src)["name"]
    except Exception as exc:  # noqa: BLE001
        sys.stderr.write("cff_hint: could not read source name table from %s: %s\n"
                         % (src, exc))
        _orig_name = None

    try:
        with _SilencedStderr():
            font = fontforge.open(src)
            font.selection.all()
            font.autoHint()                       # PostScript/CFF hints
            font.generate(dst, flags=("opentype",))
            font.close()
    except Exception as exc:  # noqa: BLE001
        sys.stderr.write("cff_hint: FontForge failed on %s: %s\n" % (src, exc))
        return 1

    if not os.path.exists(dst) or os.path.getsize(dst) == 0:
        sys.stderr.write("cff_hint: no output produced for %s\n" % src)
        return 1

    # Post-process the output: restore the original 'name' table (FontForge mangles
    # nameID 16/17) and drop any legacy 'kern' table (GPOS is canonical).
    try:
        tt = TTFont(dst)
        if _orig_name is not None:
            tt["name"] = _orig_name
        if "kern" in tt:
            del tt["kern"]
        tt.save(dst)
    except Exception as exc:  # noqa: BLE001 - non-fatal cleanup
        sys.stderr.write("cff_hint: warning, post-process skipped for %s: %s\n"
                         % (dst, exc))

    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
