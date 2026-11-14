#!/bin/sh
# Upstream renders through GLX and only supports the X11 (xcb) platform,
# so run under X11/XWayland unless the user chooses otherwise.
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-xcb}"
exec /opt/odadrawingsexplorer/ODADrawingsExplorer "$@"
