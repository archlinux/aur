#!/usr/bin/env bash
# Launcher shim for the packaged KeeperFX Tux Edition launcher.
#
# The launcher resolves keeperfx.cfg, keeperfx-launcher-qt.cfg and the game binary
# against QCoreApplication::applicationDirPath(), so it expects to live inside the
# game directory. Unlike the engine -- which derives its runtime directory from
# argv[0] and can therefore be symlinked -- Qt reads /proc/self/exe, which always
# resolves to the real file. A symlink from the game directory reports the target's
# directory, verified by running it through one.
#
# So the binary is copied into the game directory rather than linked, which is what
# the AppImage's AppRun already does for the same reason. It is refreshed whenever
# the packaged build differs, so a pacman upgrade reaches the copy, but the
# launcher's own in-place self-update is left alone in between.
set -euo pipefail

BINDIR=/usr/lib/keeperfx-tux
GAMEDIR="${KEEPERFX_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/keeperfx-alpha}"
SRC="$BINDIR/keeperfx-launcher-qt"
DST="$GAMEDIR/keeperfx-launcher-qt"

mkdir -p "$GAMEDIR"

# The launcher reads keeperfx.cfg and version.txt from the game directory to show
# the current settings and version, so seed those if the game has never been run.
# The engine's wrapper assembles the rest of the directory on first launch.
if [ ! -e "$GAMEDIR/keeperfx.cfg" ] && [ -e /usr/share/keeperfx-tux/keeperfx.cfg ]; then
    cp /usr/share/keeperfx-tux/keeperfx.cfg "$GAMEDIR/keeperfx.cfg"
    chmod u+w "$GAMEDIR/keeperfx.cfg"
fi
# Refresh it every time, not just when missing. pacman upgrades the engine
# without touching the game directory, so a seed-once copy leaves version.txt
# reporting whatever was installed the first time the launcher ever ran. The
# launcher compares that file against the newest release to decide whether to
# offer an update -- so a stale copy makes it offer one that is already
# installed, download the whole payload, and fail trying to extract it over
# root-owned package files. The engine's own wrapper (keeperfx-tux.sh) already
# refreshes it on every run; this only ever ran first because the launcher is
# what users open.
cp -f /usr/share/keeperfx-tux/version.txt "$GAMEDIR/version.txt" 2>/dev/null || true

if [ ! -e "$DST" ] || ! cmp -s "$SRC" "$DST"; then
    cp -f "$SRC" "$DST"
    chmod u+rwx "$DST"
fi

cd "$GAMEDIR"
exec "$DST" "$@"
