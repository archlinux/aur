#!/bin/sh
set -eu
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_STYLE_OVERRIDE=fusion # 解决使用自带 Qt 情况下，字体颜色全白看不到的问题
export IBUS_USE_PORTAL=1        # fix ibus
export LD_LIBRARY_PATH="/usr/lib/wemeet:$PATH" # 否则启动失败
LD_PRELOAD_WRAP="${LD_PRELOAD:-}:/usr/lib/wemeet/libwemeetwrap.so:/usr/lib/wemeet/libhook.so"

if [ "$(basename "$0")" = 'wemeet-x11' ]; then
    # force x11
    export XDG_SESSION_TYPE=x11
    export EGL_PLATFORM=x11
    export QT_QPA_PLATFORM=xcb
    unset WAYLAND_DISPLAY
fi
export LD_PRELOAD="$LD_PRELOAD_WRAP"
exec /opt/wemeet/bin/wemeetapp "$@"
