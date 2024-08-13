#!/usr/bin/env bash

set -euo pipefail

name=@PKGNAME@
ver=@PKGVER@
electron=@ELECTRON@

declare -a flags
declare -l PATCH_KRISP

[[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/${name}.conf" ]] && source "${XDG_CONFIG_HOME:-$HOME/.config}/${name}.conf"

flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${name}-flags.conf"
krisp_bin="${DISCORD_USER_DATA_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/${name}}/${ver}/modules/${name}_krisp/${name}_krisp.node"

if [[ "${PATCH_KRISP:-}" == true ]] && [[ -w "${krisp_bin}" ]]; then
	if hash python &> /dev/null && python -c 'import capstone; import elftools' &> /dev/null; then
		# Patch Krisp binary to ignore signature check
		echo -n 'Running Krisp patcher... '
		python /usr/share/${name}/krisp-patcher.py "${krisp_bin}"
	fi
fi

if [[ -r "${flags_file}" ]]; then
	mapfile -t < "${flags_file}"
fi

for line in "${MAPFILE[@]}"; do
	if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
		flags+=("${line}")
	fi
done

exec /usr/bin/${electron} \
	/usr/share/${name}/resources/app.asar \
	--ozone-platform-hint=auto \
	"${flags[@]}" "$@"
