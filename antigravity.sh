#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
_CFGDIR="@cfgdirname@/"
_OPTIONS="@options@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export ELECTRON_OVERRIDE_DIST_PATH="/usr/bin/electron@electronversion@"
export NODE_ENV=production
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export _FLAGS_FILE="${XDG_CONFIG_HOME}/${_CFGDIR}@appname@-flags.conf"
declare -a _USER_FLAGS
_FLAGS_FILE="${XDG_CONFIG_HOME}/@appname@-flags.conf"
declare -a flags
if [[ -f "${_FLAGS_FILE}" ]]; then
    mapfile -t < "${_FLAGS_FILE}"
fi
for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        flags+=("${line}")
    fi
done
_WAYLAND_OPTION=false
for arg in "$@"; do
    if [[ "${arg}" == "--wayland" ]]; then
        _WAYLAND_OPTION=true
        break
    fi
done
if [[ "${_WAYLAND_OPTION}" == true ]]; then
    echo "Forcing Wayland"
    flags+=("--enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL" "--ozone-platform=wayland")
fi
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
if [ "${XDG_SESSION_TYPE}" = "wayland" ]; then
    unset DISPLAY
    exec electron@electronversion@ "${_APPDIR}/out/cli.js" --enable-features=UseOzonePlatform --ozone-platform=wayland "${_APPDIR}/@appname@.js" "$@"
else
    ELECTRON_RUN_AS_NODE=1 exec electron@electronversion@ "${_APPDIR}/out/cli.js" "${_APPDIR}/@appname@.js" "$@"
fi