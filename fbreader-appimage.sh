#!/bin/sh
# /usr/bin/fbreader-appimage (installed by PKGBUILD)
# small wrapper so Exec=fbreader-appimage works correctly

# set necessary env and exec AppImage (forward all args)
exec env QT_QPA_PLATFORM=xcb /opt/appimages/fbreader.AppImage "$@"