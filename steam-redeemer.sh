#!/bin/sh
# The PyInstaller build keeps .state/ and config.yaml next to its own executable,
# so it can't run from /opt or /usr/bin. Run a per-user copy instead and refresh
# it whenever the packaged binary changes.
set -eu

packaged=/opt/steam-redeemer/steam-redeemer
dir="${XDG_DATA_HOME:-$HOME/.local/share}/steam-redeemer"
copy="$dir/steam-redeemer"

mkdir -p "$dir"
if ! cmp -s "$packaged" "$copy"; then
    cp "$packaged" "$copy.tmp"
    chmod 755 "$copy.tmp"
    mv -f "$copy.tmp" "$copy"
fi
exec "$copy" "$@"
