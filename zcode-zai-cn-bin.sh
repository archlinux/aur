#!/bin/sh
# Z.ai China edition: separate user data and agent data roots. Electron keys
# its single-instance lock on userData, and ZCode keeps settings, workspaces
# and sessions under $ZCODE_DATA_BASE_DIR/.zcode, so without this another
# edition would just focus the first one instead of starting.
export ZCODE_DESKTOP_USER_DATA_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ZCode-Zai-CN"
export ZCODE_DATA_BASE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zcode-zai-cn"
# --class only affects the Wayland app_id; Electron's X11 WM_CLASS stays
# "zcode" either way.
exec /opt/zcode-zai-cn/zcode --class=zcode "$@"
