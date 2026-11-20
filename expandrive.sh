#!/bin/sh
# Run natively on Wayland when available (falls back to X11 otherwise).
# Extra flags can be set in ~/.config/expandrive-flags.conf (one per line, # for comments).
FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/expandrive-flags.conf"
USER_FLAGS=""
[ -f "$FLAGS_FILE" ] && USER_FLAGS="$(sed 's/#.*//' "$FLAGS_FILE" | tr '\n' ' ')"
exec /opt/ExpanDrive/expandrive --ozone-platform-hint=auto $USER_FLAGS "$@"
