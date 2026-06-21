#!/usr/bin/env bash

set -euo pipefail

name=@PKGNAME@
ver=@PKGVER@
electron=@ELECTRON@

# Support .config/discord-flags.conf file
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${name}-flags.conf"

if [[ -r "${flags_file}" ]]; then
	mapfile -t < "${flags_file}"
fi

declare -a flags
for line in "${MAPFILE[@]}"; do
	if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
		flags+=("${line}")
	fi
done

exec /usr/bin/${electron} \
	/usr/share/${name}/resources/app.asar \
	"${flags[@]}" "$@"
