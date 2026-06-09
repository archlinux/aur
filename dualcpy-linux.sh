#!/usr/bin/env bash
# Launcher wrapper for DualCPY-Linux.
#
# The app (main.py) insists that bin/, config/, and logs/ sit next to it, and it
# *writes* to config/ and logs/. /opt is root-owned and read-only for users, so we
# build a writable runtime tree in the user's home and symlink the read-only app
# parts into it, then run main.py from there.

set -euo pipefail

APP_DIR="/opt/dualcpy-linux"
RUNTIME_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/dualcpy-linux"

# Writable dirs the app needs to create/modify
mkdir -p "$RUNTIME_DIR/config" "$RUNTIME_DIR/logs"

# Seed config from the packaged defaults on first run only (don't clobber user edits)
if [ -d "$APP_DIR/config.default" ]; then
    for f in "$APP_DIR/config.default/"*; do
        [ -e "$f" ] || continue
        base="$(basename "$f")"
        [ -e "$RUNTIME_DIR/config/$base" ] || cp -r "$f" "$RUNTIME_DIR/config/"
    done
fi

# Symlink the read-only app pieces into the runtime dir so main.py finds them beside itself
for item in main.py src bin assets; do
    [ -e "$APP_DIR/$item" ] || continue
    ln -sfn "$APP_DIR/$item" "$RUNTIME_DIR/$item"
done

cd "$RUNTIME_DIR"
exec python main.py "$@"
