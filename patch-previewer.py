#!/usr/bin/env python3
"""Make `hvigorw test` fail fast on Linux instead of hanging forever.

Upstream's local-unit-test driver
(@ohos/coverage/lib/src/commandLine/localTest/previewer.js) resolves its
promise ONLY when the SDK Previewer prints a completion marker on stdout:
the child's exit code and stderr are ignored and there is no timeout. On
Linux the Previewer can never complete a test run — its `-d` debug entry
point is a compile-time stub that prints "Linux is not supported" and
returns without exiting the process — so `hvigorw test` hung silently
after "Finished :entry:default@UnitTestArkTS" and never finished.

This patch keeps the success path untouched (the completion marker still
resolves normally) and only adds failure paths:

  1. the child exiting  -> reject with code/signal
  2. the child failing to spawn -> reject
  3. stderr forwarded to the logger (upstream drops it, which is why the
     real error, e.g. a missing .so, was invisible)
  4. the "Linux is not supported" stub line -> reject immediately with an
     actionable message (the process itself never exits)
  5. an env-overridable timeout as a last-resort backstop

Idempotent; a pattern miss only warns (upstream layout may have changed).

Usage: patch-previewer.py <path/to/previewer.js>
"""

import sys

MARKER = "_prevFail"


def sub(src, old, new, what):
    if src.count(old) != 1:
        print("  previewer: %s — pattern not found/unique, skipped" % what)
        return src, False
    return src.replace(old, new), True


def main():
    if len(sys.argv) != 2:
        print(__doc__.strip().splitlines()[-1], file=sys.stderr)
        return 2

    path = sys.argv[1]
    try:
        src = open(path).read()
    except OSError as exc:
        print("  previewer: cannot read %s (%s)" % (path, exc))
        return 0

    if MARKER in src:
        print("  previewer: already patched")
        return 0

    # 1) + 2) + 3) + 5): replace the do-nothing close handler with real
    #     failure handling plus a timeout backstop.
    old_close = """        child.on('close', () => {
            portSet.delete(portNum);
        });"""
    new_close = """        let _prevSettled = false;
        let _prevTimer = null;
        const _prevFail = (err) => {
            if (_prevSettled) {
                return;
            }
            _prevSettled = true;
            if (_prevTimer) {
                clearTimeout(_prevTimer);
            }
            // Kill the child, otherwise it outlives the rejection and keeps
            // this process's event loop alive (hvigor then never exits).
            try {
                child.kill();
            }
            catch (e) {
                // already gone
            }
            if (child.unref) {
                child.unref();
            }
            reject(err);
        };
        const _prevTimeoutMs = Number(process.env.DEVECO_PREVIEWER_TIMEOUT_MS || 120000);
        _prevTimer = setTimeout(() => {
            _prevFail(new Error(`Previewer did not report test completion within ${_prevTimeoutMs / 1000}s; killed. See ${logPath}`));
        }, _prevTimeoutMs);
        child.on('close', (code, signal) => {
            portSet.delete(portNum);
            _prevFail(new Error(`Previewer exited (code=${code} signal=${signal}) without reporting test completion. See ${logPath}`));
        });
        child.on('error', (err) => {
            _prevFail(new Error(`Failed to start Previewer (${previewerPath}): ${err.message}`));
        });
        if (child.stderr) {
            child.stderr.on('data', (data) => {
                Logger.error(data.toString().trim());
            });
        }"""

    # 4) the Linux stub: reject immediately instead of waiting for the
    #    process (which never exits) or the timeout.
    old_stdout = """            if (!isShouldKillPreviewer(data, Logger)) {
                return;
            }
            child.kill();"""
    new_stdout = """            if (data.toString().indexOf('Linux is not supported') > -1) {
                _prevFail(new Error('The SDK Previewer cannot run ArkTS tests on Linux: its debug entry point ("-d") is a compile-time stub that reports "Linux is not supported" and returns. Run instrumented tests on a device/emulator instead (entry/src/ohosTest + `hdc shell aa test`). See ' + logPath));
                return;
            }
            if (!isShouldKillPreviewer(data, Logger)) {
                return;
            }
            _prevSettled = true;
            if (_prevTimer) {
                clearTimeout(_prevTimer);
            }
            child.kill();"""

    src, ok1 = sub(src, old_close, new_close, "fail-fast handlers")
    if ok1:
        src, ok2 = sub(src, old_stdout, new_stdout, "Linux stub detection")
    else:
        ok2 = False

    # All-or-nothing: applying only one of the two edits would leave the
    # other referencing symbols that do not exist, i.e. broken JS.
    if ok1 and ok2:
        open(path, "w").write(src)
        print("  previewer: patched (fail fast instead of hanging)")
    else:
        print("  previewer: NOT patched — upstream previewer.js changed shape")
    return 0


if __name__ == "__main__":
    sys.exit(main())
