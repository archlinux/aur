#!/bin/sh
# Launcher for the Vortex game client (playvortex.io).
#
# By default the game runs from a per-user copy of the AppImage so its
# built-in self-updater can replace it. The copy is (re)seeded from
# /opt/playvortex when missing or when the packaged version is newer than
# the last seed.
#
# Set PLAYVORTEX_NO_SELF_UPDATE=1 to run the read-only packaged AppImage
# instead, with the game's updater disabled (updates come only via pacman).
set -eu

seed=/opt/playvortex/Vortex.AppImage

if [ "${PLAYVORTEX_NO_SELF_UPDATE:-0}" = 1 ]; then
    export VORTEX_NO_UPDATE=1
    exec "$seed" "$@"
fi

seed_ver=$(cat /opt/playvortex/version)

dir="${XDG_DATA_HOME:-$HOME/.local/share}/playvortex"
app="$dir/Vortex.AppImage"
marker="$dir/seeded-version"

user_ver=$(cat "$marker" 2>/dev/null || echo 0)

if [ ! -x "$app" ] || [ "$(vercmp "$seed_ver" "$user_ver")" -gt 0 ]; then
    mkdir -p "$dir"
    cp -f "$seed" "$app.tmp"
    chmod 755 "$app.tmp"
    mv -f "$app.tmp" "$app"
    printf '%s\n' "$seed_ver" > "$marker"
fi

exec "$app" "$@"
