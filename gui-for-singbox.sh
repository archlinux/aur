#!/bin/bash

# --- 1. Wayland & GTK 环境规范化 (仅作用于当前子进程，安全隔离) ---
export GTK_USE_PORTAL=1

if command -v gsettings >/dev/null 2>&1; then
    COLOR_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null)
    if [[ "$COLOR_SCHEME" == *'prefer-dark'* ]]; then
        export GTK_THEME="${GTK_THEME:-Adwaita:dark}"
    fi
fi

# --- 2. 核心数据隔离逻辑 ---
APP_DIR="${HOME}/.local/share/GUI.for.SingBox"
CORE_DIR="${APP_DIR}/data/sing-box"

mkdir -p "${CORE_DIR}"

if ! cmp -s /usr/lib/gui-for-singbox/GUI.for.SingBox "${APP_DIR}/GUI.for.SingBox"; then
    rm -f "${APP_DIR}/GUI.for.SingBox"
    cp /usr/lib/gui-for-singbox/GUI.for.SingBox "${APP_DIR}/GUI.for.SingBox"
    chmod +x "${APP_DIR}/GUI.for.SingBox"
fi

if [ ! -L "${CORE_DIR}/sing-box" ]; then
    ln -sf /usr/bin/sing-box "${CORE_DIR}/sing-box"
fi

cd "${APP_DIR}"
exec "${APP_DIR}/GUI.for.SingBox" "$@"