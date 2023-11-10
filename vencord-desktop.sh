#!/bin/bash
_ELECTRON=/usr/bin/electron27
APPDIR="/usr/lib/vencord-desktop"
export PATH="${APPDIR}:${APPDIR}/usr/sbin:${PATH}"
export LD_LIBRARY_PATH="${APPDIR}/usr/lib":"${APPDIR}/swiftshader":"${LD_LIBRARY_PATH}"
_ASAR="${APPDIR}/app.asar"
_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/vencord-desktop-flags.conf"
declare -a flags
if [[ -f "${_FLAGS_FILE}" ]]; then
    mapfile -t < "${_FLAGS_FILE}"
fi
for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        flags+=("${line}")
    fi
done
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@" "${flags[@]}"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@" "${flags[@]}"
fi