#!/usr/bin/bash

set -euo pipefail

flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/%%FLAGFILENAME%%-flags.conf"

declare -a flags

if [[ -f "${flags_file}" ]]; then
	mapfile -t < "${flags_file}"
fi

for line in "${MAPFILE[@]}"; do
	if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
		flags+=("${line}")
	fi
done

ELECTRON_FORCE_IS_PACKAGED=true BEEKEEPER_DISABLE_UPDATES=true exec %%ELECTRON%% "${flags[@]}" /usr/lib/%%PKGNAME%%/app.asar "$@"
