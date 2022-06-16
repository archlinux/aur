#!/bin/sh
export XDG_SESSION_TYPE=x11
export QT_QPA_PLATFORM=xcb
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_STYLE_OVERRIDE=fusion # 解决使用自带qt情况下，字体颜色全白看不到的问题
export IBUS_USE_PORTAL=1 # fix ibus
FONTCONFIG_DIR=$HOME/.config/fontconfig
unset WAYLAND_DISPLAY

# if pipewire-pulse installed
if [ -f /usr/bin/pipewire-pulse ]; then
    export PULSE_LATENCY_MSEC=20
fi;

if [ -f "/usr/bin/bwrap" ];then
    mkdir -p $FONTCONFIG_DIR
    bwrap --dev-bind / / --tmpfs $HOME/.config --ro-bind $FONTCONFIG_DIR $FONTCONFIG_DIR /opt/wemeet/bin/wemeetapp $*;
else
    exec /opt/wemeet/bin/wemeetapp $*;
fi;
