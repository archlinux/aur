#!/usr/bin/env bash

CURA_PATH=/opt/ultimaker-cura
LD_LIBRARY_PATH="$CURA_PATH" QT_QPA_PLATFORMTHEME=gtk3 "$CURA_PATH/Ultimaker-Cura" "$@"
