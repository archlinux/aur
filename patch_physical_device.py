#!/usr/bin/env python3
# patch_physical_device.py — Step 7
# Advertise VK_NV_low_latency2 in nvk_physical_device.c.
# Run from the mesa source root.
import re, pathlib, sys

p = pathlib.Path('src/nouveau/vulkan/nvk_physical_device.c')
if not p.exists():
    print("==> nvk_physical_device.c not found — skipping extension patch.", file=sys.stderr)
    sys.exit(0)

s = p.read_text()

if 'NV_low_latency2' in s:
    print("==> nvk_physical_device.c: NV_low_latency2 already present — skipping.")
    sys.exit(0)

NEW_LINE = '\n      .NV_low_latency2 = true,'

# Strategy 1: insert after the last .NV_<n> = <bool>, line
nv_pat = re.compile(r'(\.NV_[A-Za-z0-9_]+\s*=\s*(?:true|false)\s*,)')
last_nv = None
for m in nv_pat.finditer(s):
    last_nv = m

if last_nv:
    pos = last_nv.end()
    s = s[:pos] + NEW_LINE + s[pos:]
    p.write_text(s)
    print(f"==> nvk_physical_device.c: NV_low_latency2 inserted after '{last_nv.group()}'.")
    sys.exit(0)

# Strategy 2: insert after .KHR_swapchain = true,
m = re.search(r'(\.KHR_swapchain\s*=\s*true\s*,)', s)
if m:
    pos = m.end()
    s = s[:pos] + NEW_LINE + s[pos:]
    p.write_text(s)
    print("==> nvk_physical_device.c: NV_low_latency2 inserted after .KHR_swapchain.")
    sys.exit(0)

# Strategy 3: insert before the closing brace of the last extension block
ext_block = re.compile(
    r'((?:^\s*\.[A-Z][A-Za-z0-9_]+\s*=\s*(?:true|false)[^\n]*\n)+)',
    re.MULTILINE,
)
last_block = None
for m in ext_block.finditer(s):
    last_block = m

if last_block:
    pos = last_block.end()
    s = s[:pos] + NEW_LINE + '\n' + s[pos:]
    p.write_text(s)
    print("==> nvk_physical_device.c: NV_low_latency2 inserted (strategy 3).")
    sys.exit(0)

print("==> nvk_physical_device.c: FATAL — could not locate extension table!", file=sys.stderr)
sys.exit(1)
