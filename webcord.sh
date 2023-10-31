#!/bin/bash

ELECTRON='@ELECTRON@'
APP_DIR='@APP_DIR@'
ELECTRON_FLAGS_FILE="${XDG_CONFIG_HOME:-"${HOME}/.config"}/${ELECTRON}-flags.conf"

[ -f "${ELECTRON_FLAGS_FILE}" ] || exec "${ELECTRON}" "${APP_DIR}" "$@"

mapfile -t ELECTRON_FLAGS_LINES < "${ELECTRON_FLAGS_FILE}"
declare -a ELECTRON_FLAGS

for line in "${ELECTRON_FLAGS_LINES[@]}"; do
    [[ "${line}" =~ ^[[:space:]]*#.* ]] && continue
    ELECTRON_FLAGS+=("${line}")
done

exec "${ELECTRON}" "${ELECTRON_FLAGS[@]}" "${APP_DIR}" "$@"
