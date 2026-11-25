#!/usr/bin/bash
set -euo pipefail
_name=@ELECTRON@
_config="${XDG_CONFIG_HOME:-$HOME/.config}"
lines=(); flags=()
if [[ -f "${_config}/${_name}-flags.conf" ]]; then mapfile -t lines < "${_config}/${_name}-flags.conf"
elif [[ -f "${_config}/electron-flags.conf" ]]; then mapfile -t lines < "${_config}/electron-flags.conf"; fi
for _line in "${lines[@]}"; do
	if [[ ! "${_line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${_line}" ]]; then flags+=("${_line}"); fi
done
export ELECTRON_IS_DEV="${ELECTRON_IS_DEV:-0}" ELECTRON_FORCE_IS_PACKAGED="${ELECTRON_FORCE_IS_PACKAGED:-true}"
exec "/usr/lib/${_name}/electron" "${flags[@]}" "$@"