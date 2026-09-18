#!/usr/bin/env bash
#
# Launcher script for tencent-qq
# Provides native Wayland auto-detection, Fcitx5 text-input-v3 support,
# user flags loading, and a lightweight privacy sandbox using bubblewrap.
#

set -e

QQ_BIN="/opt/QQ/qq"

# 1. Clean up known vulnerable libraries and crash files
if [[ -d "${HOME}/.config/QQ/versions" ]]; then
    find "${HOME}/.config/QQ/versions" -name libssh2.so.1 -type f -exec rm -f {} \; 2>/dev/null || true
fi
rm -rf "${HOME}/.config/QQ/crash_files"/* 2>/dev/null || true

# 2. Environment & Platform Auto-detection
QQ_FLAGS=()

if [[ -n "${WAYLAND_DISPLAY}" && -S "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}" ]]; then
    QQ_FLAGS+=(
        "--ozone-platform=wayland"
        "--enable-wayland-ime"
        "--wayland-text-input-version=3"
        "--enable-features=UseOzonePlatform"
    )
else
    QQ_FLAGS+=(
        "--ozone-platform=x11"
    )
fi

# 3. Load User Custom Flags if available
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
if [[ -f "${XDG_CONFIG_HOME}/qq-flags.conf" ]]; then
    while IFS= read -r line || [[ -n "$line" ]]; do
        line="$(echo "$line" | sed 's/#.*//;s/^[[:space:]]*//;s/[[:space:]]*$//')"
        [[ -n "$line" ]] && QQ_FLAGS+=("$line")
    done < "${XDG_CONFIG_HOME}/qq-flags.conf"
fi

# 4. Privacy Sandbox via Bubblewrap (if installed)
# - Direct host $HOME mapping ensures drag-and-drop file sending & native dialogs work
# - Mask ~/.ssh and ~/.gnupg with empty tmpfs to protect user keys
# - Pass through GPU (/dev/dri) and Audio (/dev/snd) for hardware acceleration and calls
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

    exec bwrap "${BWRAP_ARGS[@]}" "${QQ_BIN}" "${QQ_FLAGS[@]}" "$@"
else
    exec "${QQ_BIN}" "${QQ_FLAGS[@]}" "$@"
fi
