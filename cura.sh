#!/bin/sh

# For easier maintainability
CURA_VERSION="4.10.0"
CURA_BIN_PATH="/opt/Ultimaker_Cura/Ultimaker_Cura-$CURA_VERSION.AppImage"

# Get full path to avoid Error Message in cura 
[[ -n $(dirname "$1") ]] && filePath="$(realpath "$1")" || filePath="$1"

# Start cura-appimage without Parameter if not given. ( Avoiding cura Error Message "No file found" )
[[ -z $filePath ]] && $CURA_BIN_PATH || $CURA_BIN_PATH $filePath

exit