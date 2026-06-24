#!/usr/bin/env python3
"""Patch 9router to add region selector for xiaomi-tokenplan in the web UI.

The Q2 builder (module 65276) checks e.regions at the top level of each
provider entry in the t.A array.  In v0.5.8 the xiaomi-tokenplan entry
moved regions inside transport.regions (as a URL map), so the Q2 object
no longer gets a regions property and the UI hides the selector.

This script injects a top-level regions array (in the {id,label} format
the UI expects) right after hasProviderSpecificData in the t.A entry.
"""

import sys, os, glob

TARGETS = [
    "505-189215c1255c77e3.js",  # legacy Q2 export (module 65276)
    "1321-18fb8a2c6ea8f9e8.js",  # active Q2 export (module 88105)
]
OLD = (
    '"xiaomi-tokenplan",priority:300,alias:"xiaomi-tokenplan",'
    'aliases:["xmtp"],uiAlias:"xmtp",display:{name:"Xiaomi MiMo (Token Plan)",'
    'icon:"smart_toy",color:"#FF6700",textIcon:"XT",website:"https://mimo.xiaomi.com",'
    'notice:{text:"Xiaomi MiMo Token Plan subscription (API key starts with tp-). '
    'Token Plan keys are cluster-specific \u2014 select the region matching your subscription.",'
    'apiKeyUrl:"https://mimo.xiaomi.com"}},category:"apikey",hasProviderSpecificData:!0'
)
NEW = OLD + (
    ',regions:[{id:"sgp",label:"Singapore"},{id:"cn",label:"China"},'
    '{id:"ams",label:"Europe"}],defaultRegion:"sgp"'
)


def main():
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <destdir>", file=sys.stderr)
        sys.exit(1)

    destdir = sys.argv[1]
    found_any = False
    import fnmatch

    for root, dirs, files in os.walk(destdir):
        for fn in files:
            if fn in TARGETS:
                path = os.path.join(root, fn)
                with open(path, "r") as f:
                    content = f.read()

                count = content.count(OLD)
                if count == 0:
                    print(f"[fix-tokenplan-ui-region] already patched or pattern changed: {path}")
                    continue
                if count > 1:
                    print(f"[fix-tokenplan-ui-region] ERROR: {count} matches in {path}, aborting")
                    sys.exit(1)

                content = content.replace(OLD, NEW)
                with open(path, "w") as f:
                    f.write(content)
                print(f"[fix-tokenplan-ui-region] Patched {path}")
                found_any = True

    if not found_any:
        print(f"[fix-tokenplan-ui-region] WARNING: no target files ({', '.join(TARGETS)}) found, skipping")


if __name__ == "__main__":
    main()
