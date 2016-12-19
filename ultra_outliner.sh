#!/bin/sh
export QT_QPA_FONTDIR=/usr/share/fonts/TTF
cd /opt/ultra_outliner
exec ./ultra_outliner "$@"
