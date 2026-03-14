#!/usr/bin/env python3
# patch_api_rs.py — Step 4
# Fix max_warps_per_sm signature mismatch in nak/api.rs.
# Run from the mesa source root.
import re, pathlib, sys

p = pathlib.Path('src/nouveau/compiler/nak/api.rs')
if not p.exists():
    print("==> api.rs: file not found — skipping patch.")
    sys.exit(0)

s = p.read_text()

OLD_EXACT = (
    'pub extern "C" fn nak_max_warps_per_sm(num_gprs: u32) -> u32 {\n'
    '    crate::ir::max_warps_per_sm(num_gprs)\n'
    '}'
)
NEW_BODY = (
    'pub extern "C" fn nak_max_warps_per_sm(num_gprs: u32) -> u32 {\n'
    '    let total_regs: u32 = 65536;\n'
    '    let gprs = num_gprs.max(1).next_multiple_of(8);\n'
    '    crate::ir::prev_multiple_of((total_regs / 32) / gprs, 4)\n'
    '}'
)

if 'let total_regs: u32 = 65536' in s:
    print("api.rs: already patched — skipping.")
    sys.exit(0)

if OLD_EXACT in s:
    p.write_text(s.replace(OLD_EXACT, NEW_BODY))
    print("api.rs: patched OK (exact match).")
    sys.exit(0)

pattern = re.compile(
    r'pub extern "C" fn nak_max_warps_per_sm\(num_gprs: u32\) -> u32 \{[^}]+\}',
    re.MULTILINE,
)
m = pattern.search(s)
if m:
    p.write_text(s[:m.start()] + NEW_BODY + s[m.end():])
    print("api.rs: patched OK (regex fallback).")
    sys.exit(0)

print("api.rs: nak_max_warps_per_sm not found — skipping patch (may be fine if MR was reworked).",
      file=sys.stderr)
sys.exit(0)
