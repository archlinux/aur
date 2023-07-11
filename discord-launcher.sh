#!/usr/bin/bash

set -euo pipefail

name=@PKGNAME@
electron=@ELECTRON@
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${name}-flags.conf"

declare -a flags

if [[ -f "${flags_file}" ]]; then
    mapfile -t < "${flags_file}"
fi

for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        flags+=("${line}")
    fi
done

exec /usr/bin/${electron} /usr/lib/${name}/app.asar "${flags[@]}" "$@"
