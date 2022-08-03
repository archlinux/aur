#!/bin/sh

# For easier maintainability
CURA_VERSION="VERSION_PLACEHOLDER"
CURA_BIN_PATH="/opt/Ultimaker-Cura/Ultimaker-Cura-$CURA_VERSION.AppImage"
FIXUPS="LD_PRELOAD=/usr/lib/libstdc++.so.6"

[ -n "$WAYLAND_DISPLAY" ] && FIXUPS="$FIXUPS QT_QPA_PLATFORMN=xcb"

# Get full path to avoid Error Message in cura 
[ -n $(dirname "$1") ] && filePath="$(realpath "$1")" || filePath="$1"

# Start cura-appimage without Parameter if not given. ( Avoiding cura Error Message "No file found" )
if [ -z $filePath ]; then
  env ${FIXUPS} $CURA_BIN_PATH
else
  env ${FIXUPS} $CURA_BIN_PATH "$filePath"
fi
