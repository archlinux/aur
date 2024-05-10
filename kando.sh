#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/kando"
_RUNNAME="${_APPDIR}/app"
_CFGDIR="Kando/"
_OPTIONS="env ELECTRON_OZONE_PLATFORM_HINT=auto"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export ELECTRON_OVERRIDE_DIST_PATH="/usr/bin/electron28"
export NODE_ENV=production
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
_FLAGS_FILE="${XDG_CONFIG_HOME}/${_CFGDIR}kando-flags.conf"
declare -a _USER_FLAGS
if [[ -f "${_FLAGS_FILE}" ]]; then
    while read -r line; do
        if [[ ! "${line}" =~ ^[[:space:]]*#.* ]]; then
            _USER_FLAGS+=("${line}")
        fi
    done < "${_FLAGS_FILE}"
fi
cd "${_APPDIR}"
if [[ "${EUID}" -ne 0 ]] || [[ "${ELECTRON_RUN_AS_NODE}" ]]; then
    exec electron28 "${_RUNNAME}" "${_OPTIONS}" "${_USER_FLAGS}" "$@"
else
    exec electron28 "${_RUNNAME}" "${_OPTIONS}" --no-sandbox "${_USER_FLAGS}" "$@"
fi