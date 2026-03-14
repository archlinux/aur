#!/usr/bin/env python3
# patch_meson_sources.py — Step 6
# Add nvk_nv_low_latency2.c to NVK's meson.build source list.
# Run from the mesa source root.
import re, pathlib, sys

p = pathlib.Path('src/nouveau/vulkan/meson.build')
if not p.exists():
    print("==> meson.build not found — skipping NVK meson patch.", file=sys.stderr)
    sys.exit(0)

s = p.read_text()

if 'nvk_nv_low_latency2.c' in s:
    print("==> meson.build: nvk_nv_low_latency2.c already listed — skipping.")
    sys.exit(0)

anchors = [
    r"'nvk_device\.c'",
    r"'nvk_buffer\.c'",
    r"'nvk_cmd_buffer\.c'",
    r"'nvk_physical_device\.c'",
]

inserted = False
for anchor in anchors:
    m = re.search(anchor, s)
    if m:
        insert_pos = m.start()
        s = s[:insert_pos] + "'nvk_nv_low_latency2.c',\n  " + s[insert_pos:]
        p.write_text(s)
        print(f"==> meson.build: inserted nvk_nv_low_latency2.c before '{m.group()}'.")
        inserted = True
        break

if not inserted:
    print("==> meson.build: WARNING — could not find NVK source list anchor.", file=sys.stderr)
    print("==>              Trying to append to files() call...", file=sys.stderr)
    m = re.search(r"(files\([^)]+)\)", s, re.DOTALL)
    if m:
        close = m.end() - 1
        s = s[:close] + "\n  'nvk_nv_low_latency2.c',\n" + s[close:]
        p.write_text(s)
        print("==> meson.build: appended nvk_nv_low_latency2.c (fallback).")
    else:
        print("==> meson.build: FATAL — could not patch meson.build!", file=sys.stderr)
        sys.exit(1)
