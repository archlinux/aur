#!/bin/sh
# OrbbecViewer reads ./config, ./res and ./nvmflash.sh relative to the
# current directory and writes ./config/*.ini, ./imgui.ini, ./Log and
# ./output there. Run it from a writable per-user directory instead of
# the read-only /opt tree.
appdir=/opt/orbbec-viewer
datadir="${XDG_DATA_HOME:-$HOME/.local/share}/orbbec-viewer"

mkdir -p "$datadir/Log" "$datadir/output"

# Keep the user's settings across upgrades: seed config only on first run.
if [ ! -d "$datadir/config" ]; then
  cp -a "$appdir/config" "$datadir/config"
fi
# Static assets follow the package.
[ -e "$datadir/res" ] || ln -s "$appdir/res" "$datadir/res"

cd "$datadir" || exit 1
# libOrbbecSDK dlopen()s libdepthengine.so at runtime; make sure the
# private library directory is searched even outside the RPATH lookup.
LD_LIBRARY_PATH="$appdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH
exec "$appdir/OrbbecViewer" "$@"
