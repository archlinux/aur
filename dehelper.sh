#!/usr/bin/env bash
#
# Launcher script for eusoft-dehelper (Dehelper / 德语助手)
# Ensures proper display platform selection and environment setup.
#

set -e

DEHELPER_BIN="/usr/share/eusoft-dehelper/dehelper"

# 1. Environment & Platform setup
# Upstream bundles Qt5 with xcb platform plugin.
# Force xcb platform to avoid Wayland startup crashes when WAYLAND_DISPLAY is active.
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-xcb}"

# 2. GStreamer plugins configuration for multimedia & voice pronunciation
if [[ -d "/usr/share/eusoft-dehelper/gstreamer-1.0" ]]; then
    export GST_PLUGIN_SYSTEM_PATH="/usr/share/eusoft-dehelper/gstreamer-1.0:${GST_PLUGIN_SYSTEM_PATH}"
    export GST_PLUGIN_PATH="/usr/share/eusoft-dehelper/gstreamer-1.0:${GST_PLUGIN_PATH}"
fi

# 3. Load user custom flags if available
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
USER_FLAGS=()
if [[ -f "${XDG_CONFIG_HOME}/dehelper-flags.conf" ]]; then
    while IFS= read -r line || [[ -n "$line" ]]; do
        line="$(echo "$line" | sed 's/#.*//;s/^[[:space:]]*//;s/[[:space:]]*$//')"
        [[ -n "$line" ]] && USER_FLAGS+=("$line")
    done < "${XDG_CONFIG_HOME}/dehelper-flags.conf"
fi

exec "${DEHELPER_BIN}" "${USER_FLAGS[@]}" "$@"
