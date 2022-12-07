#!/bin/bash
USER_RUN_DIR="/run/user/$(id -u)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
FONTCONFIG_DIR="$CONFIG_DIR/fontconfig"
KDE_ICON_CACHE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/icon-cache.kcache"
QQ_APP_DIR="${CONFIG_DIR}/QQ"
DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD)"
cd /opt/QQ
bwrap --new-session --die-with-parent --cap-drop ALL --unshare-user-try --unshare-pid --unshare-cgroup-try \
    --symlink usr/lib /lib \
    --symlink usr/lib64 /lib64 \
    --ro-bind /usr /usr \
    --ro-bind /opt/QQ /opt/QQ \
    --dev-bind /dev /dev \
    --ro-bind /sys /sys \
    --proc /proc \
    --dev-bind /run/dbus /run/dbus \
    --dev-bind "$USER_RUN_DIR" "$USER_RUN_DIR" \
    --ro-bind-try /etc/fonts /etc/fonts \
    --ro-bind-try "$FONTCONFIG_DIR" "$FONTCONFIG_DIR" \
    --bind-try "$KDE_ICON_CACHE_FILE" "$KDE_ICON_CACHE_FILE" \
    --dir "$XDG_RUNTIME_DIR" \
    --ro-bind-try "$XDG_RUNTIME_DIR/pipewire-0" "$XDG_RUNTIME_DIR/pipewire-0" \
    --ro-bind-try "$XDG_RUNTIME_DIR/pulse" "$XDG_RUNTIME_DIR/pulse" \
    --bind /tmp /tmp \
    --bind "$HOME/.pki" "$HOME/.pki" \
    --ro-bind "$HOME/.Xauthority" "$HOME/.Xauthority" \
    --bind "${DOWNLOAD_DIR}" "${DOWNLOAD_DIR}" \
    --bind "$QQ_APP_DIR" "$QQ_APP_DIR" \
    /opt/QQ/qq "$@"

rm -rf "$QQ_APP_DIR/crash_files"
