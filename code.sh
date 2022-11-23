#!/bin/bash

set -euo pipefail

name=code
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${name}-flags.conf"

declare -a flags

if [[ -f "${flags_file}" ]]; then
    mapfile -t < "${flags_file}"
fi

for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]]; then
        flags+=("${line}")
    fi
done

# don't edit the electron binary name here! simply change the variable in the PKGBUILD and we will sed it into the correct one :)
exec electron /usr/lib/code/out/cli.js /usr/lib/code/code.js "${flags[@]}" "$@"
