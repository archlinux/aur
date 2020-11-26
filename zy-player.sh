#!/bin/sh
#DESKTOPINTEGRATION=no /opt/appimages/zy-player.AppImage "$@"
export LD_LIBRARY_PATH=/opt/zy-player/:/opt/zy-player/usr/lib:$LD_LIBRARY_PATH
DESKTOPINTEGRATION=no /opt/zy-player/zy-player "$@"
