#!/bin/sh
export PATH=$PATH:/opt/wemeet/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/wemeet
export QT_PLUGIN_PATH="/usr/lib/qt/plugins"
export XDG_SESSION_TYPE=x11
export QT_QPA_PLATFORM=xcb
export QT_AUTO_SCREEN_SCALE_FACTOR=1
unset WAYLAND_DISPLAY
if [ -f "/usr/bin/bwrap" ];then
    bwrap --dev-bind / / --tmpfs $HOME/.config --ro-bind $HOME/.config/fontconfig $HOME/.config/fontconfig wemeetapp $*;
else
    exec wemeetapp $*;
fi; 
