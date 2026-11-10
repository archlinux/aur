#!/usr/bin/env python3
"""Emit the CSS rules that differ between two compiled libadwaita stylesheets.

Usage: gen-stylesheet-supplement.py old-gtk.css new-gtk.css > supplement.css

The output is meant to be appended to a theme's libadwaita-<old>/gtk.css when the
theme has no directory for the newer libadwaita: it carries the rules that are
new in the new version plus the rules whose declarations changed, so the older
theme stylesheet covers the newer built-in selector set.
"""
import re
import sys


def rules(path):
    """Return [(normalized_selector, raw_rule_text)] for top-level non-@ rules."""
    text = open(path, encoding="utf-8", errors="replace").read()
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    out = []
    i, n = 0, len(text)
    while i < n:
        m = re.compile(r"[{}]").search(text, i)
        if not m:
            break
        if text[m.start()] != "{":
            i = m.start() + 1
            continue
        start = text.rfind("\n", 0, m.start())
        start = 0 if start < 0 else start + 1
        selector = text[start:m.start()].strip()
        depth, k = 1, m.end()
        while k < n and depth:
            if text[k] == "{":
                depth += 1
            elif text[k] == "}":
                depth -= 1
            k += 1
        if selector and not selector.startswith("@"):
            out.append((" ".join(selector.split()), text[start:k].rstrip("\n")))
        i = k
    return out


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    old = {}
    for sel, raw in rules(sys.argv[1]):
        old.setdefault(sel, []).append(raw)
    new = {}
    for sel, raw in rules(sys.argv[2]):
        new.setdefault(sel, []).append(raw)

    emitted = [sel for sel in new if sel not in old]
    emitted += [sel for sel in new if sel in old and new[sel] != old[sel]]
    for sel in emitted:
        for raw in new[sel]:
            print(raw)
    sys.stderr.write(
        f"{sum(len(new[s]) for s in emitted)} rules: "
        f"{sum(1 for s in new if s not in old)} new, "
        f"{sum(1 for s in new if s in old and new[s] != old[s])} changed\n"
    )


if __name__ == "__main__":
    main()
