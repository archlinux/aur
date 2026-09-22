#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@appname@.js"
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export NODE_ENV=production
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export PATH="${_APPDIR}:${PATH}"
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"
export CHROME_DESKTOP="@appname@.desktop"
case "${XDG_CURRENT_DESKTOP}" in
    KDE)
        export ELECTRON_TRASH="kioclient5"
        ;;
    GNOME)
        export ELECTRON_TRASH="gio"
        ;;
    XFCE)
        export ELECTRON_TRASH="gvfs-trash"
        ;;
    *)
        ;;
esac
_FLAG_SOURCES=(
    "${XDG_CONFIG_HOME}/electron-flags.conf"
    "${XDG_CONFIG_HOME}/electron@electronversion@-flags.conf"
    "${XDG_CONFIG_HOME}/@appname@-flags.conf"
    "${XDG_CONFIG_HOME}/@cfgdirname@/@appname@-flags.conf"
)
declare -a flags
for _FLAGS_FILE in "${_FLAG_SOURCES[@]}"; do
    if [[ -f "${_FLAGS_FILE}" ]]; then
        echo "Loading flags from ${_FLAGS_FILE}"
        while read -r line || [[ -n "$line" ]]; do
            [[ "${line}" =~ ^[[:space:]]*#.* ]] || [[ -z "${line}" ]] || {
                read -ra line_flags <<< "$line"
                flags+=("${line_flags[@]}")
            }
        done < "${_FLAGS_FILE}"
    fi
done
_SANDBOX_ARG=()
if [[ "${EUID}" -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
    _SANDBOX_ARG=("--no-sandbox")
fi
cd "${_APPDIR}"
exec electron@electronversion@ "${flags[@]}" "${_SANDBOX_ARG[@]}" "${_RUNNAME}" "$@"