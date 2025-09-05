#!/bin/sh
set -eu
set -m
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_STYLE_OVERRIDE=fusion # 解决使用自带 Qt 情况下，字体颜色全白看不到的问题
export IBUS_USE_PORTAL=1        # fix ibus
export LD_LIBRARY_PATH="/usr/lib/wemeet:$PATH" # 否则启动失败
export LD_PRELOAD="/usr/lib/wemeet/libX11.so.6:/usr/lib/wemeet/libhook.so"
env -u XDG_SESSION_TYPE -u WAYLAND_DISPLAY QT_QPA_PLATFORM=xcb /opt/wemeet/bin/wemeetapp "$@"
