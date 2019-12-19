#!/usr/bin/env sh

# it will get only the first instance of sway
SWAY_PID="$(pgrep "^sway$" | head -n1)"
USER_ID="$(stat -c "%u" "/proc/${SWAY_PID}/")"
USER="$(id -nu "${USER_ID}")"

SWAYSOCK="/run/user/${USER_ID}/sway-ipc.${USER_ID}.${SWAY_PID}.sock" su "${USER}" -c "swaymsg $*"
