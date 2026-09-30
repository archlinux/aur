#!/usr/bin/bash
set -euo pipefail
_name=@ELECTRON@
_flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${_name}-flags.conf"
_fallback_file="${XDG_CONFIG_HOME:-$HOME/.config}/electron-flags.conf"
lines=()
if [[ -f "${_flags_file}" ]]; then
	mapfile -t lines < "${_flags_file}"
elif [[ -f "${_fallback_file}" ]]; then
	mapfile -t lines < "${_fallback_file}"
fi
flags=()
for _line in "${lines[@]}"; do
	if [[ ! "${_line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${_line}" ]]; then
		flags+=("${_line}")
	fi
done
: ${ELECTRON_IS_DEV:=0}
export ELECTRON_IS_DEV
: ${ELECTRON_FORCE_IS_PACKAGED:=true}
export ELECTRON_FORCE_IS_PACKAGED
exec "/usr/lib/${_name}/electron" "${flags[@]}" "$@"