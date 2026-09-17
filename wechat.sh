#!/usr/bin/env bash
#
# Launcher script for tencent-wechat
# Provides native Wayland auto-detection, Fcitx5 text-input-v3 support,
# chat data preservation, and a lightweight privacy sandbox using bubblewrap.
#

set -e

WECHAT_BIN="/opt/wechat/wechat"

# 1. Environment & Platform Auto-detection
if [[ -n "${WAYLAND_DISPLAY}" && -S "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}" ]]; then
    export QT_QPA_PLATFORM="wayland;xcb"
    # Enable native Wayland text-input-v3 for proper IME candidate popup placement
    export QT_IM_MODULE="text-input-unstable-v3"
    unset QT_IM_MODULES GTK_IM_MODULE
else
    export QT_QPA_PLATFORM="xcb"
fi

# 2. Chat Data Protection & Global Symlink Integrity
# If user has an existing active data store in WeChat_Data, ensure standard links point to it
REAL_DATA_DIR="${HOME}/Documents/WeChat_Data/xwechat_files"
DOC_LINK="${HOME}/Documents/xwechat_files"
HOME_LINK="${HOME}/xwechat_files"

if [[ -d "${REAL_DATA_DIR}" ]]; then
    if [[ ! -L "${DOC_LINK}" ]] && [[ ! -e "${DOC_LINK}" ]]; then
        ln -sf "${REAL_DATA_DIR}" "${DOC_LINK}"
    fi
    if [[ ! -L "${HOME_LINK}" ]] && [[ ! -e "${HOME_LINK}" ]]; then
        ln -sf "${REAL_DATA_DIR}" "${HOME_LINK}"
    fi
fi

# 3. Privacy Sandbox via Bubblewrap (if installed)
# - Direct host $HOME mapping ensures drag-and-drop file sending works seamlessly
# - Mask ~/.ssh and ~/.gnupg with empty tmpfs to protect user keys from proprietary software
# - Pass through GPU (/dev/dri) and Audio (/dev/snd) for hardware acceleration and calls
# - Isolated PID namespace and read-only system root
if command -v bwrap >/dev/null 2>&1; then
    BWRAP_ARGS=(
        --ro-bind / /
        --dev /dev
        --dev-bind-try /dev/dri /dev/dri
        --dev-bind-try /dev/snd /dev/snd
        --tmpfs /dev/shm
        --proc /proc
        --ro-bind-try /sys /sys
        --tmpfs /tmp
        --bind /run /run
        --bind "${HOME}" "${HOME}"
        --tmpfs "${HOME}/.ssh"
        --tmpfs "${HOME}/.gnupg"
        --unshare-pid
    )
    for dev_node in /dev/video*; do
        [[ -e "$dev_node" ]] && BWRAP_ARGS+=(--dev-bind "$dev_node" "$dev_node")
    done

    exec bwrap "${BWRAP_ARGS[@]}" "${WECHAT_BIN}" "$@"
else
    exec "${WECHAT_BIN}" "$@"
fi
