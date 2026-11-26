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

mkdir -p "${CORE_DIR}" || exit 1

LIB_DIR=/usr/lib/gui-for-singbox
binary=GUI.for.SingBox
if [[ -x "${LIB_DIR}/GUI.for.SingBox-v3" ]] &&
    LC_ALL=C /usr/lib/ld-linux-x86-64.so.2 --help 2>/dev/null |
        grep -Eq '^[[:space:]]*x86-64-v3 \(supported, searched\)[[:space:]]*$'; then
    binary=GUI.for.SingBox-v3
fi

source_binary="${LIB_DIR}/${binary}"
cached_binary="${APP_DIR}/${binary}"
if [[ ! -x "$cached_binary" ]] || ! cmp -s "$source_binary" "$cached_binary"; then
    staged=$(mktemp "${APP_DIR}/.${binary}.XXXXXXXX") || exit 1
    trap 'rm -f -- "$staged"' EXIT
    install -m755 "$source_binary" "$staged" && mv -fT -- "$staged" "$cached_binary" || exit 1
    trap - EXIT
fi

if [ ! -L "${CORE_DIR}/sing-box" ]; then
    ln -sf /usr/bin/sing-box "${CORE_DIR}/sing-box"
fi

cd "${APP_DIR}" || exit 1
exec "$cached_binary" "$@"
