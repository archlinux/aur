#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"

# Base environment variables
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export NODE_ENV=production
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"

# 1. Display System Optimization (X11 & Wayland)
# Use 'auto' to allow modern Electron (v20+) to detect the best platform
# This helps with Wayland window decorations, fractional scaling, and GPU acceleration
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"

# 2. Desktop Environment (DE) Compatibility
# Set CHROME_DESKTOP to match the .desktop file for correct taskbar icon grouping
export CHROME_DESKTOP="@appname@.desktop"

# Fix for Electron's trash implementation on different DEs
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
        # Default fallback
        ;;
esac

# 3. Load user-defined flags
# The script checks for flags in the following order (later files override/append to earlier ones):
# 1. System-wide Electron flags: $XDG_CONFIG_HOME/electron-flags.conf
# 2. Version-specific Electron flags: $XDG_CONFIG_HOME/electron@electronversion@-flags.conf
# 3. App-specific global flags: $XDG_CONFIG_HOME/@appname@-flags.conf
# 4. App-specific directory flags: $XDG_CONFIG_HOME/@cfgdirname@/@appname@-flags.conf
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

# 4. Sandbox and Execution Permissions
# Disable sandbox if running as root without ELECTRON_RUN_AS_NODE
_SANDBOX_ARG=()
if [[ "${EUID}" -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
    _SANDBOX_ARG=("--no-sandbox")
fi

cd "${_APPDIR}"
exec electron@electronversion@ "${flags[@]}" "${_SANDBOX_ARG[@]}" "${_RUNNAME}" "$@"