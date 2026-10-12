#!/bin/sh
# Launch PI-Desktop with the system Electron.

# A parent Electron app (e.g. VS Code's terminal) may leak this, which would
# make Electron run app.asar as a plain Node script and exit immediately.
unset ELECTRON_RUN_AS_NODE

flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/pi-desktop-flags.conf"
if [ -r "$flags_file" ]; then
  # One flag per line; lines starting with # are ignored.
  set -- $(grep -v '^[[:space:]]*#' "$flags_file") "$@"
fi

exec /usr/bin/@ELECTRON@ /usr/lib/pi-desktop/app.asar "$@"
