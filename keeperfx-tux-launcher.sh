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

# Assemble the game directory exactly as the engine's wrapper does, without
# starting the game. The launcher is what players open first -- it is the
# "KeeperFX" menu entry -- and it decides whether KeeperFX is installed by looking
# for the engine in this directory. This used to seed only keeperfx.cfg,
# version.txt and the two drop folders here and leave the rest to the first GAME
# launch, so on a fresh install the launcher found no engine: it offered to
# download and install all of KeeperFX again (~400 MB, into a directory the
# package owns) and never offered to copy in the Dungeon Keeper files, the one
# thing it is opened for first. The assembly also refreshes version.txt on every
# run, which the launcher compares against the newest release.
#
# keeperfx-tux is only an optional dependency of this package, and a failure here
# must not keep the launcher from starting: it reports what is missing itself.
if [ -x /usr/bin/keeperfx-tux ]; then
    KEEPERFX_TUX_ASSEMBLE_ONLY=1 /usr/bin/keeperfx-tux \
        || echo "keeperfx-tux-launcher: could not fully assemble $GAMEDIR" >&2
fi

# Refreshed when the PACKAGED launcher changes (a pacman upgrade), not whenever the
# copy differs from it: comparing the two files replaced a launcher that had
# updated itself in place on every single start, so it updated again, and again.
# The stamp records which packaged build the copy came from.
STAMP="$GAMEDIR/.keeperfx-launcher-qt.packaged"
pkgsum="$(sha256sum "$SRC" | cut -d' ' -f1)"
if [ ! -e "$DST" ] || [ "$(cat "$STAMP" 2>/dev/null || true)" != "$pkgsum" ]; then
    cp -f "$SRC" "$DST"
    chmod u+rwx "$DST"
    printf '%s\n' "$pkgsum" > "$STAMP"
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
