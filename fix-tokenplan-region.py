#!/usr/bin/env python3
"""
Patch 9router's test-connection handler so that xiaomi-tokenplan
uses the connection's providerSpecificData.region to select the
correct endpoint (CN/SGP/AMS) instead of hardcoding SGP.

Target file: app/.next-cli-build/server/chunks/2231.js
"""
import glob
import os
import sys

dest = sys.argv[1] if len(sys.argv) > 1 else "."

OLD = '"xiaomi-tokenplan":"https://token-plan-sgp.xiaomimimo.com/v1"'
NEW = (
    '"xiaomi-tokenplan":('
    '{"cn":"https://token-plan-cn.xiaomimimo.com/v1",'
    '"sgp":"https://token-plan-sgp.xiaomimimo.com/v1",'
    '"ams":"https://token-plan-ams.xiaomimimo.com/v1"}'
    ')[a.providerSpecificData?.region]'
    '||"https://token-plan-sgp.xiaomimimo.com/v1"'
)

pattern = os.path.join(dest, "app", ".next-cli-build", "server", "chunks", "2231.js")
files = glob.glob(pattern)

if not files:
    print(f"[fix-tokenplan-region] No 2231.js found under {dest}")
    sys.exit(0)

for f in files:
    with open(f, "r") as fh:
        content = fh.read()

    if OLD not in content:
        print(f"[fix-tokenplan-region] Pattern not found in {f} (already patched or different version)")
        continue

    content = content.replace(OLD, NEW)
    with open(f, "w") as fh:
        fh.write(content)
    print(f"[fix-tokenplan-region] Patched {f}")
