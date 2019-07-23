#!/bin/sh

set -e

ELVER=""
QTVER="5.11"
EVEDIR="$HOME/.local/lib/EVE"
LAUNCHER="$EVEDIR/Launcher"
SETUPDIR="/opt/evesetup"
WINEPATH="/usr/bin"

. $SETUPDIR/lib/evelauncher.shlib

check_env
check_wine
check_steam

cd $EVEDIR
exec $LAUNCHER/evelauncher.sh
