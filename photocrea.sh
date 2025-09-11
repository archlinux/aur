#!/usr/bin/env bash

FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/photocrea-flags.conf"

if [[ -f "${FLAGS_FILE}" ]]; then
    mapfile -t < "${FLAGS_FILE}"
fi
for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        flags+=("${line}")
    fi
done

exec electron /usr/lib/photocrea "${flags[@]}" "$@"