#!/bin/sh
# Domestic edition: separate user data and agent data roots. Electron keys its
# single-instance lock on userData, and ZCode keeps settings, workspaces and
# sessions under $ZCODE_DATA_BASE_DIR/.zcode, so without this the second
# edition would just focus the first one instead of starting.
export ZCODE_DESKTOP_USER_DATA_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ZCode-CN"
export ZCODE_DATA_BASE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zcode-cn"
# The app stores localePreference "system" on first run and then follows LANG
# (it ignores --lang for the UI), so a Chinese UI needs a Chinese locale in the
# environment, not just the Chromium switch below.
export LANG=zh_CN.UTF-8
# --class only affects the Wayland app_id; this package owns the canonical
# zcode.desktop id, and Electron's X11 WM_CLASS stays "zcode" either way.
exec /opt/zcode-cn/zcode --class=zcode --lang=zh-CN "$@"
