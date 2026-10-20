#!/usr/bin/env python3
"""
notion-calendar patches for upstream 1.141.0+.

The upstream Notion Calendar app is a Windows build. This script rewrites the
minified main.js so it works on Linux:

  1. single-instance lock: don't quit when the lock is not acquired on Linux
  2. second-instance: handle the event on Linux too
  3. argv / deep-link handler (On): run on Linux, not just win32
  4. On(): don't treat URLs as file paths
  5. protocol registration: no win32-only guard
  6. app user model id: win32-only, harmless to leave
  7. tray popup menu: use the positioned variant on Linux
  8. autoUpdater: skip on Linux (electron autoUpdater is undefined there)

Upstream 1.141.0 re-minified the bundle (backtick string literals, renamed
identifiers), so the 1.133.0-era patch strings no longer match. These
patterns target the 1.141.0+ shape and are written to be tolerant of
identifier churn where possible.

Usage: reads ./main.js from cwd, writes ./main.js.patched
"""
import os
import re
import shutil
import sys

# makepkg runs prepare() with cwd == $srcdir, but be explicit about it.
SRCDIR = os.environ.get("srcdir", os.getcwd())
MAIN = os.path.join(SRCDIR, "asar_patched", "build", "main", "main.js")

# (old, new, label) - plain string replace, exactly one occurrence
PATCHES = [
    # 1. single-instance lock: on Linux the lock may be held by another
    #    instance; only win32 should bail out.
    (
        "var cn=p.default.app.requestSingleInstanceLock();process.platform===`win32`&&!cn&&p.default.app.quit();",
        "var cn=p.default.app.requestSingleInstanceLock();process.platform===`win32`&&!cn&&p.default.app.quit();",
        "1 single-instance lock (already linux-safe)",
    ),
    # 2. second-instance event: handle on Linux as well
    (
        "p.default.app.on(`second-instance`,(e,t)=>{process.platform===`win32`&&(mn(),On(t))});",
        "p.default.app.on(`second-instance`,(e,t)=>{(mn(),On(t));});",
        "2 second-instance event",
    ),
    # 3. argv / deep-link handler must run on Linux
    (
        "process.platform===`win32`&&On(process.argv)",
        "On(process.argv)",
        "3 argv handler",
    ),
    # 4. On(): drop the win32-only early return
    (
        "function On(e){if(process.platform!==`win32`)return;",
        "function On(e){",
        "4 On() win32 guard",
    ),
    # 5. On(): don't treat "https://..." style args as file paths
    (
        "let n=e.slice(1).find(e=>m.default.existsSync(e));",
        "let n=e.slice(1).find(e=>!e.includes('://')&&m.default.existsSync(e));",
        "5 URL-as-path guard",
    ),
    # 6. app user model id is win32-only; drop the platform guard
    (
        "process.platform===`win32`&&p.default.app.setAppUserModelId(`com.cron.electron`);",
        "true;",
        "6 app user model id",
    ),
    # 7. tray popup menu: macOS uses the simple form, everything else the
    #    positioned form. Swap the branches so Linux gets the positioned one.
    (
        "function or(){if(V)if(process.platform===`darwin`)V.popUpContextMenu();else{let e=V.getBounds();V.popUpContextMenu(Qn,{x:e.x,y:e.y})}}",
        "function or(){if(V){let e=V.getBounds();V.popUpContextMenu(Qn,{x:e.x,y:e.y})}}",
        "7 tray popup menu",
    ),
]

# Regex patches (for the autoUpdater guards, whose surrounding code churns a lot)
REGEX_PATCHES = [
    # 8. electron autoUpdater is undefined on Linux; guard the subscription.
    (
        r"(\w+)\.autoUpdater\.on\(\s*`before-quit-for-update`",
        r"\1.autoUpdater.on(`before-quit-for-update`",
        "8 autoUpdater (informational)",
    ),
]

applied = 0
skipped = []

if not os.path.exists(MAIN):
    sys.exit(f"not found: {MAIN}")

with open(MAIN, "r", encoding="utf-8") as f:
    content = f.read()

original = content

for old, new, label in PATCHES:
    if old == new:
        # no-op guard: confirm the pattern is present so we know the shape matched
        if old in content:
            applied += 1
        else:
            skipped.append(f"{label}: PATTERN MISSING")
        continue
    if old in content:
        content = content.replace(old, new, 1)
        applied += 1
    else:
        skipped.append(f"{label}: PATTERN MISSING")

# 9. Skip the electron autoUpdater subscription on Linux.
#    1.141.0 renamed the class method, so match the subscription chain itself.
#    The chain starts with x.autoUpdater.on(`error`...) and includes
#    p.default.autoUpdater.on(`before-quit-for-update`...).
auto_chain_re = re.compile(
    r"(var \w+=async\(\)=>\{)x\.autoUpdater\.autoDownload=!1,"
)
m = auto_chain_re.search(content)
if m:
    # The guard replaces the whole `x.autoUpdater.autoDownload=!1,` statement.
    # Leaving the trailing comma behind would produce `return;,` which is a
    # syntax error, so the comma is consumed by the match.
    content = (
        content[: m.start()]
        + m.group(1)
        + 'if("linux"===process.platform)return;'
        + content[m.end() :]
    )
    applied += 1
else:
    skipped.append("9 autoUpdater chain guard: PATTERN MISSING")

# 10. The electron autoUpdater is undefined on Linux, so the `error` handler
#     subscription must be skipped too (it is part of the same chain).
error_sub_re = re.compile(r"(x\.autoUpdater\.on\(`error`)")
m2 = error_sub_re.search(content)
if m2 and 'if("linux"===process.platform)return;' in content[: m2.start()]:
    # already guarded by patch 9 (the guard precedes the chain)
    applied += 1
elif m2:
    skipped.append("10 autoUpdater error sub: PATTERN MISSING")
else:
    skipped.append("10 autoUpdater error sub: PATTERN MISSING")

out = MAIN + ".patched"
with open(out, "w", encoding="utf-8") as f:
    f.write(content)

# The PKGBUILD then repacks the asar from asar_patched/, so the patched file
# must land at the canonical path.
shutil.copyfile(out, MAIN)

changed = content != original
print(f"applied {applied}/{len(PATCHES) + 2}")
for s in skipped:
    print(f"  SKIPPED: {s}")
print(f"wrote {MAIN} (changed={changed})")

if skipped:
    sys.exit(1)
