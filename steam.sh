#!/bin/sh
# Valve's steam.sh offers the 64-bit client only to the client beta, so opt every install into it.
beta="${XDG_DATA_HOME:-$HOME/.local/share}/Steam/package/beta"
[ -s "$beta" ] || { mkdir -p "${beta%/*}" && echo @BRANCH@ > "$beta"; }
export STEAM_FORCE_CLIENT="${STEAM_FORCE_CLIENT-steamrt64}"
# Proton runs 32-bit Windows games in a 64-bit process, needing no lib32 drivers.
export PROTON_USE_WOW64="${PROTON_USE_WOW64-1}"
exec /usr/lib/steam/steam "$@"
