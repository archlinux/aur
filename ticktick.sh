#!/usr/bin/env bash
#
# A helper script to allow the use of custom flags
#
# ------------------------------------------------------------------------------
# Usage
# ------------------------------------------------------------------------------
# Add one flag per line into the file
# Comment lines will be ignored

TICKTICK_USER_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/ticktick/user-flags.conf"

# Allow users to override command-line options
if [[ -f "${TICKTICK_USER_FLAGS_FILE}" ]]; then
    mapfile -t TICKTICK_USER_FLAGS <<<"$(grep -v '^#' "${TICKTICK_USER_FLAGS_FILE}")"
    echo "User flags:" "${TICKTICK_USER_FLAGS[@]}"
fi

# Launch TickTick
exec /opt/TickTick/ticktick "${TICKTICK_USER_FLAGS[@]}" "${@}"
