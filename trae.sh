#!/usr/bin/env bash

set -u

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
FLAGS_FILE="${XDG_CONFIG_HOME}/trae-flags.conf"

declare -a TRAE_USER_FLAGS=()

# Safely load user flags
if [[ -f "$FLAGS_FILE" ]]; then
    while read -r line || [[ -n "$line" ]]; do
        trimmed="${line#"${line%%[![:space:]]*}"}"
        trimmed="${trimmed%"${trimmed##*[![:space:]]}"}"

        if [[ -n "$trimmed" && ! "$trimmed" =~ ^# ]]; then
            TRAE_USER_FLAGS+=("$trimmed")
        fi
    done < "$FLAGS_FILE"
fi

# Wayland 下 AI 悬浮聊天窗口（floatingChat）会创建成空白、无边框且不可拖动的窗口。
# 上游把这个开关默认设为开启且没有命令行参数，只能在用户设置里关闭；这里在首次
# 启动时写入该键（之后用户仍可在设置里改回），不修改上游 JS。
SETTINGS="${XDG_CONFIG_HOME}/Trae/User/settings.json"
if [[ -f "$SETTINGS" ]] && grep -qE '^[[:space:]]*\{\s*\}\s*$' "$SETTINGS"; then
    printf '{\n  "trae.floatingChat.enabled": false\n}\n' > "$SETTINGS"
elif [[ ! -e "$SETTINGS" ]]; then
    mkdir -p "${SETTINGS%/*}"
    printf '{\n  "trae.floatingChat.enabled": false\n}\n' > "$SETTINGS"
elif ! grep -qF '"trae.floatingChat.enabled"' "$SETTINGS"; then
    sed -i '0,/^[[:space:]]*{/s//{\n  "trae.floatingChat.enabled": false,/' "$SETTINGS"
fi

exec /opt/trae/trae "${TRAE_USER_FLAGS[@]}" "$@"
