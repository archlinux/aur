#!/bin/sh
set -eu
if [ "${SBXKB_TEST_TRANSPORT:-}" = socketpair ]; then
    exec python3 tests/run_socketpair.py
fi
# Always use a private server: the suite changes keymaps, focus and tray ownership.
work=$(mktemp -d)
xvfb_pid=
cleanup() {
    if [ -n "$xvfb_pid" ]; then kill "$xvfb_pid" 2>/dev/null || :; wait "$xvfb_pid" 2>/dev/null || :; fi
    rm -rf "$work"
}
trap cleanup EXIT HUP INT TERM
Xvfb -displayfd 3 -screen 0 640x480x24 -nolisten tcp 3>"$work/display" >"$work/xvfb.log" 2>&1 &
xvfb_pid=$!
i=0
while [ ! -s "$work/display" ]; do
    i=$((i + 1))
    if [ "$i" -ge 50 ] || ! kill -0 "$xvfb_pid" 2>/dev/null; then tail -20 "$work/xvfb.log"; exit 1; fi
    sleep 0.1
done
DISPLAY=":$(cat "$work/display")" ./tests/test_sbxkb
./sbxkb --help >/dev/null
./sbxkb --version
if DISPLAY= ./sbxkb 2>"$work/error"; then echo 'missing display should fail'; exit 1; fi
if ./sbxkb --icons-dir 2>"$work/error"; then echo 'missing argument should fail'; exit 1; fi
