#!/usr/bin/sh
export EASOTOPE_LOG_DIR="${XDG_DATA_HOME:-$HOME}/.easotope-client"
mkdir -p $EASOTOPE_LOG_DIR
exec /opt/easotope-client/linux.gtk.x86_64/eclipse/easotope -data "$EASOTOPE_LOG_DIR"
