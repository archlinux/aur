#!/bin/sh

# The vendor ships its own Qt; desktop Qt themes/plugins may use another ABI.
unset QT_PLUGIN_PATH QT_QPA_PLATFORM_PLUGIN_PATH QT_QPA_PLATFORMTHEME
export QT_QPA_PLATFORM=xcb

exec /opt/tang-dynasty-bin/bin/td.sh "$@"
