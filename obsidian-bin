#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

OBSIDIAN_USER_FLAGS=()
if [[ -f "${XDG_CONFIG_HOME}/obsidian-flags.conf" ]]; then
    mapfile -t OBSIDIAN_USER_FLAGS < <(grep -Ev '^\s*#|^\s*$' "${XDG_CONFIG_HOME}/obsidian-flags.conf")
fi

exec /opt/Obsidian/obsidian "${OBSIDIAN_USER_FLAGS[@]}" "$@"
