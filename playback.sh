#!/bin/bash
export QT_QPA_PLATFORM=xcb
exec /opt/appimages/Playback.AppImage "$@"
