#!/bin/bash

set -euo pipefail

flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/desktop-plus-flags.conf"
old_flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/github-desktop-plus-flags.conf"
fallback_file="${XDG_CONFIG_HOME:-$HOME/.config}/electron-flags.conf"

lines=()
if [[ -f "${flags_file}" ]]; then
    mapfile -t lines < "${flags_file}"
elif [[ -f "${old_flags_file}" ]]; then
    mapfile -t lines < "${old_flags_file}"
elif [[ -f "${fallback_file}" ]]; then
    mapfile -t lines < "${fallback_file}"
fi

flags=()
for line in "${lines[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        flags+=("${line}")
    fi
done

exec /opt/desktop-plus/desktop-plus "${flags[@]}" "$@"
