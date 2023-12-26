#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_ASAR="${_APPDIR}/@appasar@"
export PATH="${_APPDIR}:${PATH}"
export ELECTRON_IS_DEV=0
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/@appname@-flags.conf"
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
    cd "${_APPDIR}"
    exec electron@electronversion@ "${_ASAR}" "$@" "${flags[@]}"
else
    cd "${_APPDIR}"
    exec electron@electronversion@ "${_ASAR}" --no-sandbox "$@" "${flags[@]}"
fi