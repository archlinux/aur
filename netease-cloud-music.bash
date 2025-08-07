#!/usr/bin/bash

cd /opt/netease/netease-cloud-music/
export LD_LIBRARY_PATH=/opt/netease/netease-cloud-music/libs
export QT_PLUGIN_PATH=/opt/netease/netease-cloud-music/plugins
export QT_QPA_PLATFORM_PLUGIN_PATH=/opt/netease/netease-cloud-music/overlay
export QT_QPA_PLATFORM=xcb
export LD_PRELOAD=/opt/netease/netease-cloud-music/libnetease-patch.so

/usr/bin/bwrap --dev-bind / / \
	--overlay-src /usr/lib/qt/plugins/platforms \
	--overlay-src /opt/netease/netease-cloud-music/plugins/platforms \
	--ro-overlay /opt/netease/netease-cloud-music/overlay -- \
		/opt/netease/netease-cloud-music/netease-cloud-music $@
