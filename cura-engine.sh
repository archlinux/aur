#!/usr/bin/env bash

CURA_PATH=/opt/ultimaker-cura
LD_LIBRARY_PATH="$CURA_PATH" "$CURA_PATH/CuraEngine" "$@"
