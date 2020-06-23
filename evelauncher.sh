#!/bin/sh

set -e

ELVER=""
QTVER="5.11"
EVEDIR="$HOME/.local/lib/EVE"
SETUPDIR=""
LAUNCHER="$EVEDIR/Launcher"
WINEPATH="/usr/bin"

. ./evesetup.shlib

check_env
check_elv
check_wine
check_steam

if [ ! -r "$LAUNCHER/translations/qt_en.qm" ] ;then
    if [ -r "$LAUNCHER/libQt5Core.so.$QTVER.0" ] ;then
	for eta in ./eve-transl${QTVER}-??.tar.gz ;do
	    tar xf $eta -C $LAUNCHER
	done
    fi
fi

cd $EVEDIR
exec $LAUNCHER/evelauncher.sh
