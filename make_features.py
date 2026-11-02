#!/usr/bin/env python3
"""Bake OpenType features into a font so that EVERY renderer applies them.

Why this exists
---------------
fontconfig's "fontfeatures" property is read by pango/GTK only. Chromium,
Electron, Qt, kitty, gedit, LibreOffice and every other client shape text
without it, and in a browser the page CSS is the only way to ask for a
feature. A font file cannot declare a feature "on by default" either: a
shaper applies a fixed list (ccmp locl mark mkmk kern calt liga clig rlig
rvrn) and ignores what the LangSys happens to register.

So the only way to get, say, Inter's cv11 single-storey a in Chrome without
CSS is to move that feature's lookups into one of the features the shaper
always applies. This script does that: it copies the lookups of the tags you
name into the target feature (calt by default), which HarfBuzz enables for
every renderer. calt rather than ccmp/locl/rvrn because those run in an
earlier stage, so the substituted glyphs would no longer be seen by
composition (ccmp) and localization (locl).

Two things to know before you use it:

  * The features stay in the font, so CSS can still turn the new forms off
    with font-feature-settings: "calt" 0 (or the negated fontconfig tag
    "-calt"). But asking for the individual tag ("-cv11") no longer turns
    just that one off, because the lookups now belong to calt.

  * Features that are not meant to be on for all text (aalt is a bucket of
    every alternate, ordn turns H2O into H2O with an ordinal o, frac turns
    21/2 into two and a half) are refused unless --allow-risky is given.

One tag can also mean different things in different fonts of the same set.
Apple's ss03 is the centred colon in SF Pro and "un-slash the zero" in SF
Mono; asking for it must not fail the build and must not be dropped for the
fonts that can do what was asked. --skip names those cases, and every font
gets exactly the tags it supports out of the requested list.

Usage
-----
    make_features.py --list FONT...
    make_features.py --features cv11,cv05 -o OUTDIR FONT...
    make_features.py --features cv11,cv05 --family "Inter Alt" -o OUTDIR FONT...
    make_features.py --features ss03 --skip 'ss03=SF ?Mono|it un-slashes the zero there' ...

OUTDIR is a directory; each output keeps its input file name. With --family
the font also gets a new family name, so it can be installed next to the
untouched original instead of replacing it.

--skip TAG=REGEX[|WHY] (repeatable) leaves TAG out of the fonts whose family
name or file name matches REGEX, and bakes it into all the others. The reason
is printed, and so is a per-family summary of what each font ended up with.
"""
import argparse
import os
import re
import sys

from fontTools.ttLib import TTFont
from fontTools.ttLib.tables import otTables

# Applied by every shaper, i.e. usable as a carrier. Ordered by preference:
# calt runs late enough that ccmp/locl still see the original glyphs, liga is
# the fallback for fonts that have no calt.
TARGETS = ("calt", "clig", "liga")

# A feature whose whole point is that it is NOT on by default.
RISKY = {
    "aalt": "every alternate in the font, including the joke ones "
            "(Geologica maps A to ordinals)",
    "ordn": "ordinals: turns H2O into H2O with a superscript o and 1a into a",
    "salt": "a grab bag of alternates, different picks in every font",
    "dlig": "discretionary ligatures, which are discretionary for a reason",
    "hlig": "historical ligatures",
    "hist": "historical forms",
}


class SkipRule:
    """A tag that must not be baked into some fonts of the set.

    The same tag can mean different things in different families: Apple's
    ss03 is colon->colon.uc in SF Pro and zero->zero.1 in SF Mono. Baking it
    into a mixed set would give one family a change nobody asked for, while
    refusing it would throw the tag away for the families that can do exactly
    what was asked. Neither is right, so the tag is baked where it means what
    it should and dropped (with the reason printed) where it does not.
    """

    def __init__(self, raw):
        if "=" not in raw:
            sys.exit(f"make_features.py: --skip '{raw}': expected TAG=REGEX")
        tag, spec = raw.split("=", 1)
        self.raw = raw
        self.tag = tag.strip()
        self.why = ""
        if "|" in spec:
            spec, self.why = spec.split("|", 1)
        if not self.tag:
            sys.exit(f"make_features.py: --skip '{raw}': no tag before '='")
        try:
            self.regex = re.compile(spec)
        except re.error as e:
            sys.exit(f"make_features.py: --skip '{raw}': bad regex: {e}")
        self.hits = 0

    def matches(self, ident):
        return self.regex.search(ident) is not None


def identity(font, path):
    """Everything that names this font, for SkipRule matching.

    The file name is included because Nerd Fonts-patched fonts carry
    FontForge's own strings in nameID 16 ("sage.fill"), so the family name
    alone is not reliable there, and because the patched name drops the space
    ("SFMono Nerd Font Mono") - a rule written as 'SF ?Mono' matches both.
    """
    parts = [os.path.basename(path)]
    for nid in (1, 16):
        value = font["name"].getDebugName(nid)
        if value:
            parts.append(value)
    return "  ".join(parts)


def family_of(font):
    """The name to show in the summary: the typographic family if it is
    readable, else the legacy one.

    nameID 16 first so a weight does not split the summary into one line per
    style ("Inter", not "Inter Black"), but only when it is plain ASCII:
    font-patcher leaves FontForge's own internal strings in nameID 16
    ('sage.fill'), which fix_names.py repairs only after this script has run.
    """
    for nid in (16, 1):
        value = font["name"].getDebugName(nid)
        if value and value.isascii() and value.isprintable():
            return value
    return "?"


def records_of(gsub, tag):
    return [fr for fr in gsub.FeatureList.FeatureRecord if fr.FeatureTag == tag]


def lookups_of(gsub, tag):
    out = set()
    for fr in records_of(gsub, tag):
        out |= set(fr.Feature.LookupListIndex)
    return out


def coverage(gsub, tag):
    """{script: [langtags]} for the languages that register this feature."""
    out = {}
    for sr in gsub.ScriptList.ScriptRecord:
        langs = [("dflt", sr.Script.DefaultLangSys)]
        for lr in (sr.Script.LangSysRecord or []):
            langs.append((lr.LangSysTag, lr.LangSys))
        for ltag, ls in langs:
            if not ls:
                continue
            tags = {gsub.FeatureList.FeatureRecord[i].FeatureTag
                    for i in ls.FeatureIndex}
            if tag in tags:
                out.setdefault(sr.ScriptTag, []).append(ltag)
    return out


def all_features(gsub):
    return sorted({fr.FeatureTag for fr in gsub.FeatureList.FeatureRecord})


def add_target(gsub, tag):
    """Create an (empty) feature record for tag and register it everywhere.

    Needed for fonts that have no calt at all (Roboto Flex: calt is not in
    the font). The index is appended, so existing FeatureVariations indices
    stay valid.
    """
    fr = otTables.FeatureRecord()
    fr.FeatureTag = tag
    fr.Feature = otTables.Feature()
    fr.Feature.FeatureParams = None
    fr.Feature.LookupListIndex = []
    fr.Feature.LookupCount = 0
    gsub.FeatureList.FeatureRecord.append(fr)
    gsub.FeatureList.FeatureCount = len(gsub.FeatureList.FeatureRecord)
    index = len(gsub.FeatureList.FeatureRecord) - 1
    for sr in gsub.ScriptList.ScriptRecord:
        langs = [sr.Script.DefaultLangSys] + \
                [lr.LangSys for lr in (sr.Script.LangSysRecord or [])]
        for ls in langs:
            if not ls:
                continue
            ls.FeatureIndex.append(index)
            ls.FeatureCount = len(ls.FeatureIndex)
    return index


def sort_feature_list(gsub):
    """Put FeatureList back in tag order and remap every index that points
    into it. The format wants FeatureRecords sorted by tag; appending one
    (add_target) breaks that, and a strict sanitizer rejects the font."""
    records = gsub.FeatureList.FeatureRecord
    order = sorted(range(len(records)), key=lambda i: records[i].FeatureTag)
    if order == list(range(len(records))):
        return
    new = {old: pos for pos, old in enumerate(order)}
    gsub.FeatureList.FeatureRecord = [records[i] for i in order]

    for sr in gsub.ScriptList.ScriptRecord:
        langs = [sr.Script.DefaultLangSys] + \
                [lr.LangSys for lr in (sr.Script.LangSysRecord or [])]
        for ls in langs:
            if not ls:
                continue
            ls.FeatureIndex = sorted(new[i] for i in ls.FeatureIndex)
            ls.FeatureCount = len(ls.FeatureIndex)
            req = getattr(ls, "ReqFeatureIndex", 0xFFFF)
            if req not in (0xFFFF, None):
                ls.ReqFeatureIndex = new[req]

    fv = getattr(gsub, "FeatureVariations", None)
    if fv:
        for rec in fv.FeatureVariationRecord:
            subs = rec.FeatureTableSubstitution.SubstitutionRecord
            for s in subs:
                s.FeatureIndex = new[s.FeatureIndex]
            subs.sort(key=lambda s: s.FeatureIndex)


PANGO_STYLE_WORDS = {
    "thin", "hairline", "light", "book", "regular", "normal", "medium",
    "bold", "heavy", "black", "italic", "oblique", "condensed", "expanded",
    "roman", "semi-light", "ultra-light", "extra-light", "demi-light",
    "semi-bold", "demi-bold", "ultra-bold", "extra-bold", "ultra-heavy",
    "ultra-black", "extra-black", "small-caps", "all-small-caps",
}


def rename(font, new_family):
    """Replace the family name in every place it stands for the family."""
    if new_family.split()[-1].lower() in PANGO_STYLE_WORDS:
        sys.exit(f"make_features.py: pango would read the last word of "
                 f"'{new_family}' as a style and drop it from the family name; "
                 f"pick another name")
    name = font["name"]
    n16 = name.getDebugName(16)
    n1 = name.getDebugName(1)
    base = n16 or n1
    if not base:
        sys.exit("make_features.py: no family name in the font")
    pairs = [(base, new_family),
             (base.replace(" ", ""), new_family.replace(" ", ""))]
    for rec in name.names:
        if rec.nameID not in (1, 3, 4, 6, 16, 21, 25):
            continue
        old = rec.toUnicode()
        new = old
        for a, b in pairs:
            new = new.replace(a, b)
        if new != old:
            rec.string = new
    return base


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("fonts", nargs="+")
    ap.add_argument("--features", default="",
                    help="comma/space separated GSUB tags to apply by default")
    ap.add_argument("--target", default="calt",
                    help="carrier feature (default: calt; created if absent)")
    ap.add_argument("--family", default="",
                    help="install as this family name instead of editing in place")
    ap.add_argument("--list", action="store_true",
                    help="list the features the font has, with script coverage")
    ap.add_argument("--allow-risky", action="store_true")
    ap.add_argument("--skip", action="append", default=[], metavar="TAG=REGEX[|WHY]",
                    help="leave TAG out of the fonts whose family or file name "
                         "matches REGEX, and bake it everywhere else (repeatable). "
                         "For a tag that means something else in another family.")
    ap.add_argument("-o", "--outdir", help="output directory (default: in place)")
    a = ap.parse_args()

    tags = [t for t in a.features.replace(",", " ").split()]
    present = {t: [] for t in tags}          # tags found, per tag
    rules = [SkipRule(r) for r in a.skip]
    dropped = {}                             # tag -> [(file, why)]
    absent_in = {}                           # tag -> [files without it]
    results = []                             # (family, applied tags, file)

    for path in a.fonts:
        if not os.path.exists(path):
            sys.exit(f"make_features.py: {path}: no such file")
        font = TTFont(path)

        if a.list:
            print(f"== {os.path.basename(path)}  "
                  f"family={font['name'].getDebugName(16) or font['name'].getDebugName(1)!r}")
            if "GSUB" not in font:
                print("   no GSUB table: nothing can be baked")
                continue
            gsub = font["GSUB"].table
            for tag in all_features(gsub):
                cov = coverage(gsub, tag)
                scripts = ",".join(sorted(cov)) or "unregistered"
                mark = ""
                if tag in TARGETS:
                    mark = "  <- carrier"
                elif tag in RISKY:
                    mark = "  <- risky"
                print(f"   {tag:5} {len(lookups_of(gsub, tag)):3} lookups  "
                      f"[{scripts}]{mark}")
            continue

        if not tags:
            sys.exit("make_features.py: --features is empty (see --list)")
        if "GSUB" not in font:
            sys.exit(f"make_features.py: {path}: no GSUB table")

        gsub = font["GSUB"].table
        have = all_features(gsub)
        # A weight or a cut may simply not carry a tag: Inter's italic has no
        # cv11 (no single-storey a), Roboto's italic no ss01. Skip it for this
        # file, but complain if no file has it at all (that is a typo).
        missing = [t for t in tags if t not in have]
        for tag in missing:
            absent_in.setdefault(tag, []).append(os.path.basename(path))
            if len(a.fonts) == 1:
                print(f"  note: {os.path.basename(path)} has no '{tag}' "
                      f"feature; skipped for this file")
        file_tags = [t for t in tags if t in have]

        # Then the tags that are present but must not be baked here (see
        # SkipRule): applied to every other font of the set instead.
        ident = identity(font, path)
        short = os.path.basename(path)
        kept = []
        for tag in file_tags:
            hit = next((r for r in rules if r.tag == tag and r.matches(ident)), None)
            if hit is None:
                kept.append(tag)
            else:
                hit.hits += 1
                dropped.setdefault(tag, []).append((short, hit.why))
                if len(a.fonts) == 1:
                    print(f"  note: {short}: '{tag}' left out on purpose"
                          + (f" - {hit.why}" if hit.why else ""))
        file_tags = kept

        for tag in file_tags:
            present[tag].append(os.path.basename(path))
            if tag in RISKY and not a.allow_risky:
                sys.exit(f"make_features.py: '{tag}' is not a feature to turn on "
                         f"for all text: {RISKY[tag]}.\n"
                         f"  Pass --allow-risky if you really mean it.")
            if tag == a.target:
                sys.exit(f"make_features.py: '{tag}' is the carrier itself")

        if not file_tags:                     # nothing to bake here: copy as is
            if a.outdir:
                os.makedirs(a.outdir, exist_ok=True)
                out = os.path.join(a.outdir, os.path.basename(path))
                with open(path, "rb") as fi, open(out, "wb") as fo:
                    fo.write(fi.read())
            results.append((family_of(font), (), short))
            continue

        if a.target not in have:
            if a.target not in TARGETS:
                sys.exit(f"make_features.py: no '{a.target}' feature to extend")
            add_target(gsub, a.target)
            created = " (created: the font had none)"
        else:
            created = ""

        # Merge the lookups of every requested tag into every carrier record,
        # keeping the font's own lookup order.
        for fr in records_of(gsub, a.target):
            lookups = set(fr.Feature.LookupListIndex)
            for tag in file_tags:
                lookups |= lookups_of(gsub, tag)
            fr.Feature.LookupListIndex = sorted(lookups)
            fr.Feature.LookupCount = len(lookups)

        # Report script mismatches instead of hiding them: a tag registered
        # for fewer scripts than the carrier means the lookups now run for
        # scripts that never asked for them (usually harmless, because the
        # lookup coverage is script specific, but it is worth seeing).
        carrier = coverage(gsub, a.target)
        for tag in file_tags:
            cov = coverage(gsub, tag)
            extra = sorted(set(carrier) - set(cov))
            if extra:
                print(f"  note: {tag} is not registered for "
                      f"{','.join(extra)}; its lookups now reach that text too")

        sort_feature_list(gsub)

        base = None
        if a.family:
            base = rename(font, a.family)

        out = path
        if a.outdir:
            os.makedirs(a.outdir, exist_ok=True)
            out = os.path.join(a.outdir, os.path.basename(path))
        font.save(out)

        name = font["name"].getDebugName(16) or font["name"].getDebugName(1)
        detail = ",".join(file_tags)
        arrow = f" (was {base!r})" if base else ""
        print(f"  {os.path.basename(out)}: {name!r}{arrow} "
              f"{a.target}{created} += {detail}")
        results.append((family_of(font), tuple(file_tags), short))

    # ---- what each family ended up with --------------------------------
    # Only for a set: with one file the lines above already say everything.
    if a.features and len(a.fonts) > 1 and results:
        print("== summary")
        groups = {}
        for fam, applied, base in results:
            groups.setdefault((fam, applied), []).append(base)
        for (fam, applied), files in sorted(groups.items()):
            what = ",".join(applied) if applied else "nothing it could use"
            print(f"  {fam:<28} {len(files):3} file(s)  {what}")
        for tag in sorted(absent_in):
            print(f"  '{tag}' missing from {len(absent_in[tag])} file(s), "
                  f"skipped there")
        for tag in sorted(dropped):
            why = next((w for _, w in dropped[tag] if w), "")
            print(f"  '{tag}' left out of {len(dropped[tag])} file(s) that have it"
                  + (f": {why}" if why else ""))
        for rule in rules:
            if rule.hits == 0:
                print(f"  note: --skip '{rule.raw}' matched no font in this set")

    # A tag every font refused (only possible through --skip) is not a typo,
    # it is a tag this set cannot honour; a tag no font has at all is.
    never = [t for t in tags if dropped.get(t) and not present[t]]
    if never:
        print(f"  note: {', '.join(never)}: every font in this set that has it "
              f"was excluded, so nothing was baked for it - not a typo, the "
              f"families simply cannot do what the tag means elsewhere")
    absent = [t for t in tags if not present[t] and not dropped.get(t)]
    if absent:
        sys.exit(f"make_features.py: no font in this set has "
                 f"{', '.join(absent)}; nothing was baked for it")


if __name__ == "__main__":
    main()
