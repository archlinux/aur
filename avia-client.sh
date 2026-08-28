#!/bin/bash
# Wrapper script for Avia Client
# Thank you to stoat-desktop on the AUR for 90% of this script

export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"

# Set proper trash for desktop environment if not set already
if [ -z "${ELECTRON_TRASH}" ]; then
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
            # default
            ;;
    esac
fi

_XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
_FLAG_SOURCES=(
    # Electron flags
    "${_XDG_CONFIG_HOME}/electron-flags.conf"
    "${_XDG_CONFIG_HOME}/electron43-flags.conf/"

    # Stoat flags
    "${_XDG_CONFIG_HOME}/stoat-desktop-flags.conf"
    "${_XDG_CONFIG_HOME}/stoat-desktop/stoat-desktop-flags.conf"

    # Avia flags
    "${_XDG_CONFIG_HOME}/aviaclient-desktop-flags.conf"
    "${_XDG_CONFIG_HOME}/aviaclient-desktop/aviaclient-desktop-flags.conf"
)

unset _XDG_CONFIG_HOME

declare -a flags
for _FILE in "${_FLAG_SOURCES[@]}"; do
    if [ -f "${_FILE}" ]; then
        echo "Loading flags from ${_FILE}"
        while read -r line || [ -n "$line" ]; do
            read -ra line_flags <<< "$line"
            flags+=("${line_flags[@]}")
        done
    fi
done

if [ "${EUID}" -eq 0 ] && [ "${ELECTRON_RUN_AS_NODE}" != "1" ]; then
    flags+=("--no-sandbox")
fi

_target_file="/usr/local/bin/avia-client.bin"
if [ ! -f "$_target_file" ]; then
    _target_file="/usr/bin/avia-client.bin"
fi

exec "$_target_file" "${flags[@]}" "$@"
