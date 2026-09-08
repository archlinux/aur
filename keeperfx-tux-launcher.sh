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

# The folders the user installs content into must be their own, not links into the
# read-only package. The engine's wrapper does this for the whole game directory,
# but it only runs when the GAME is launched -- and installing a workshop map
# happens in the launcher, which a user can open without ever starting the game.
# Left to the engine's wrapper, "Install" fails until the player happens to launch
# the game once, with an error naming a folder they never chose.
#
# Only the drop folders are handled here; the rest of the assembly stays where it
# belongs. Same reason version.txt is refreshed below rather than seeded once: the
# launcher is what users open first.
for drop in levels/personal levels/legacy; do
    target="$GAMEDIR/$drop"
    src="/usr/share/keeperfx-tux-data/$drop"
    [ -d "$src" ] || continue
    if [ -L "$target" ]; then
        rm -f "$target"            # removing a link never touches what it points at
    fi
    mkdir -p "$target" 2>/dev/null || continue
    cp -rn "$src/." "$target/" 2>/dev/null || true
done
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

# The launcher loads its 7-Zip library from beside its own binary, so it has to
# be staged into the game directory too. Refreshed on mismatch, like the binary
# above: installs that predate this carry an old library left over from the
# AppImage era -- including one that cannot decompress RAR, which is what made
# RAR workshop items fail to install.
LIB_SRC="/usr/lib/keeperfx-tux/7z.so"
LIB_DST="$GAMEDIR/7z.so"
if [ -f "$LIB_SRC" ] && { [ ! -e "$LIB_DST" ] || ! cmp -s "$LIB_SRC" "$LIB_DST"; }; then
    cp -f "$LIB_SRC" "$LIB_DST" 2>/dev/null || true
fi

cd "$GAMEDIR"
exec "$DST" "$@"
