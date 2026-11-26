#!/bin/sh
# Without this the launcher creates its Data folder in whatever directory it was started from.
: "${LANCOMMANDER_DATA_DIR:=${XDG_DATA_HOME:-$HOME/.local/share}/LANCommander}"
export LANCOMMANDER_DATA_DIR

exec /usr/lib/lancommander-launcher/LANCommander.Launcher "$@"
