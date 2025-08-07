#!/usr/bin/bash

cd /opt/netease/netease-cloud-music/
export LD_LIBRARY_PATH=/opt/netease/netease-cloud-music/libs
export QT_PLUGIN_PATH=/opt/netease/netease-cloud-music/plugins 
export QT_QPA_PLATFORM_PLUGIN_PATH=/opt/netease/netease-cloud-music/plugins/platforms
export QT_QPA_PLATFORM=xcb
export LD_PRELOAD=/opt/netease/netease-cloud-music/libnetease-patch.so
/opt/netease/netease-cloud-music/netease-cloud-music --ozone-platform-hint=auto $@
