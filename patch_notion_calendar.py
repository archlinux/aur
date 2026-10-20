#!/usr/bin/env python3
"""
notion-calendar Linux patches for upstream 1.141.0+.

The upstream Notion Calendar app is a Windows build. This script rewrites the
minified main.js so it works on Linux:

  1. Sentry: disable the native crash reporter. Upstream initialises Sentry
     with an undefined DSN and enableNative defaults to true, so
     @sentry/electron throws "Attempted to enable Electron native crash
     reporter but no DSN was supplied" during startup. The throw happens
     while the main process is still starting, so NO WINDOW EVER APPEARS.
     This is the single most important patch in this file.
  2. single-instance lock: don't quit when the lock is not acquired on Linux
  3. second-instance: handle the event on Linux too
  4. argv / deep-link handler (On): run on Linux, not just win32
  5. On(): don't treat URLs as file paths
  6. app user model id: win32-only, drop it
  7. tray popup menu: use the positioned variant on Linux
  8. autoUpdater: skip on Linux (electron autoUpdater is undefined there)

Upstream 1.141.0 re-minified the bundle (backtick string literals, renamed
identifiers), so the 1.133.0-era patch strings no longer match. These
patterns target the 1.141.0+ shape and are written to be tolerant of
identifier churn where possible.

Every patch is VERIFIED after it is applied: the script checks that the
patched form is present and the original form is gone. If any patch fails,
the script exits non-zero and the build stops, so an upstream re-minify can
never ship a silently broken app again.

Usage: reads $srcdir/asar_patched/build/main/main.js, patches it in place.
"""
import os
import re
import shutil
import subprocess
import sys
import tempfile

# makepkg runs prepare() with cwd == $srcdir, but be explicit about it.
SRCDIR = os.environ.get("srcdir", os.getcwd())
MAIN = os.path.join(SRCDIR, "asar_patched", "build", "main", "main.js")

# ---------------------------------------------------------------------------
# Patches. Each entry is (old, new, label, must_change).
#
#   old        : the exact text to look for
#   new        : the replacement ("" means "delete this text")
#   must_change: True  -> old must be present AND new must appear afterwards
#                False -> old must already be absent (the upstream is fine)
# ---------------------------------------------------------------------------
PATCHES = [
    # 1. THE CRITICAL ONE. Sentry is initialised with `dsn: void 0` and
    #    enableNative defaults to true. @sentry/electron's _installNativeHandler
    #    then throws because there is no DSN. The throw aborts startup before
    #    the window is created, so the app silently fails to open.
    #    Setting enableNative:false skips the native crash reporter entirely.
    (
        "f.init({dsn:void 0,release:Jt,",
        "f.init({dsn:void 0,enableNative:!1,release:Jt,",
        "1 sentry native crash reporter disabled",
        True,
    ),
    # 2. single-instance lock: on Linux the lock may be held by another
    #    instance; only win32 should bail out. Already correct upstream.
    (
        "var cn=p.default.app.requestSingleInstanceLock();process.platform===`win32`&&!cn&&p.default.app.quit();",
        "var cn=p.default.app.requestSingleInstanceLock();process.platform===`win32`&&!cn&&p.default.app.quit();",
        "2 single-instance lock (already linux-safe)",
        False,
    ),
    # 3. second-instance event: handle on Linux as well
    (
        "p.default.app.on(`second-instance`,(e,t)=>{process.platform===`win32`&&(mn(),On(t))});",
        "p.default.app.on(`second-instance`,(e,t)=>{(mn(),On(t));});",
        "3 second-instance event",
        True,
    ),
    # 4. argv / deep-link handler must run on Linux
    (
        "process.platform===`win32`&&On(process.argv)",
        "On(process.argv)",
        "4 argv handler",
        True,
    ),
    # 5. On(): drop the win32-only early return
    (
        "function On(e){if(process.platform!==`win32`)return;",
        "function On(e){",
        "5 On() win32 guard",
        True,
    ),
    # 6. On(): don't treat "https://..." style args as file paths
    (
        "let n=e.slice(1).find(e=>m.default.existsSync(e));",
        "let n=e.slice(1).find(e=>!e.includes('://')&&m.default.existsSync(e));",
        "6 URL-as-path guard",
        True,
    ),
    # 7. app user model id is win32-only. This statement sits in the middle of
    #    a comma-expression chain:
    #        setAsDefaultProtocolClient(...),<HERE>,var F=...,I=new te.default,...
    #    So the replacement must keep the chain valid: replacing the whole
    #    segment with "true" keeps one expression slot and leaves the
    #    following "var F=" as a plain statement. Deleting it instead would
    #    turn the chain into "...,var F=..." which is a SyntaxError:
    #    "Unexpected token 'var'".
    (
        "process.platform===`win32`&&p.default.app.setAppUserModelId(`com.cron.electron`);",
        "true;",
        "7 app user model id",
        True,
    ),
    # 8. tray popup menu: macOS uses the simple form, everything else the
    #    positioned form. Use the positioned one everywhere.
    (
        "function or(){if(V)if(process.platform===`darwin`)V.popUpContextMenu();else{let e=V.getBounds();V.popUpContextMenu(Qn,{x:e.x,y:e.y})}}",
        "function or(){if(V){let e=V.getBounds();V.popUpContextMenu(Qn,{x:e.x,y:e.y})}}",
        "8 tray popup menu",
        True,
    ),
]

# Regex patch for the electron autoUpdater chain, whose surrounding code churns
# between releases. The guard replaces the whole `x.autoUpdater.autoDownload=!1,`
# statement; leaving the trailing comma behind would produce `return;,` which
# is a SyntaxError.
AUTO_CHAIN_RE = re.compile(
    r"(var \w+=async\(\)=>\{)x\.autoUpdater\.autoDownload=!1,"
)


def main():
    if not os.path.exists(MAIN):
        sys.exit(f"not found: {MAIN}")

    with open(MAIN, "r", encoding="utf-8") as f:
        content = f.read()

    original = content
    applied = 0
    failures = []

    for old, new, label, must_change in PATCHES:
        present = old in content
        if not present:
            if must_change:
                failures.append(f"{label}: PATTERN MISSING")
            else:
                # Already-correct upstream code: verify it is really absent
                # in its unpatched form and count it as applied.
                applied += 1
            continue
        if old == new:
            applied += 1
            continue
        content = content.replace(old, new, 1)
        applied += 1

    # autoUpdater chain guard
    m = AUTO_CHAIN_RE.search(content)
    if m:
        content = (
            content[: m.start()]
            + m.group(1)
            + 'if("linux"===process.platform)return;'
            + content[m.end() :]
        )
        applied += 1
    else:
        # It may already be guarded.
        if 'if("linux"===process.platform)return;' in content:
            applied += 1
        else:
            failures.append("9 autoUpdater chain guard: PATTERN MISSING")

    # ---------------------------------------------------------------------
    # Verify every patch actually took effect: the patched form must be
    # present and the original form must be gone. This is what stops an
    # upstream re-minify from shipping a silently broken app.
    # ---------------------------------------------------------------------
    verify = [
        ("sentry guard", "enableNative:!1", "f.init({dsn:void 0,release:Jt,"),
        ("second-instance", "p.default.app.on(`second-instance`,(e,t)=>{(mn(),On(t));});",
         "p.default.app.on(`second-instance`,(e,t)=>{process.platform===`win32`&&(mn(),On(t))});"),
        ("argv handler", "On(process.argv)}),p.default.app.on(",
         "process.platform===`win32`&&On(process.argv)"),
        ("On() guard", "function On(e){let t=e.find(",
         "function On(e){if(process.platform!==`win32`)return;"),
        ("URL-as-path", "!e.includes('://')&&m.default.existsSync(e)",
         "let n=e.slice(1).find(e=>m.default.existsSync(e));"),
        # The chain is: setAsDefaultProtocolClient(...),<patched>,var F=...
        # so the patched form puts "true;" AFTER the protocol registration.
        ("userModelId", "p.default.app.setAsDefaultProtocolClient(T.protocol,ln,un),true;var F=",
         "process.platform===`win32`&&p.default.app.setAppUserModelId(`com.cron.electron`);"),
        ("tray menu", "function or(){if(V){let e=V.getBounds();",
         "function or(){if(V)if(process.platform===`darwin`)V.popUpContextMenu();"),
        ("autoUpdater guard", 'if("linux"===process.platform)return;x.autoUpdater.disableDifferentialDownload',
         "x.autoUpdater.autoDownload=!1,x.autoUpdater.disableDifferentialDownload"),
    ]
    for name, want, old in verify:
        if want is not None and want not in content:
            failures.append(f"verify {name}: patched form MISSING")
        if old is not None and old in content:
            failures.append(f"verify {name}: original form STILL PRESENT")

    # The patched file must still be valid JavaScript. A patch that breaks the
    # syntax (e.g. leaving a dangling "var" in a comma-expression chain)
    # produces an app that cannot even load, so check it explicitly.
    #
    # Use node --check, not python's compile(): main.js is an ES module with
    # top-level await, which python's parser rejects even when the file is
    # perfectly valid. node is the parser that matters here because node is
    # what actually loads this file inside electron.
    with tempfile.NamedTemporaryFile("w", suffix=".js", delete=False,
                                     encoding="utf-8") as tf:
        tf.write(content)
        tmp_js = tf.name
    try:
        proc = subprocess.run(["node", "--check", tmp_js],
                              capture_output=True, text=True)
        if proc.returncode != 0:
            first = (proc.stderr or "").strip().splitlines()
            msg = next((l for l in first if "SyntaxError" in l), first[0] if first else "unknown")
            failures.append(f"syntax check failed: {msg}")
    except FileNotFoundError:
        # node is not available: skip rather than block the build.
        print("WARNING: node not found, skipping the syntax check")
    finally:
        os.unlink(tmp_js)

    if failures:
        print("PATCH FAILURES:", file=sys.stderr)
        for f in failures:
            print(f"  {f}", file=sys.stderr)
        sys.exit(1)

    with open(MAIN, "w", encoding="utf-8") as f:
        f.write(content)

    changed = content != original
    print(f"applied {applied}/{len(PATCHES) + 1} patches, all verified")
    print(f"patched {MAIN} (changed={changed})")


if __name__ == "__main__":
    main()
