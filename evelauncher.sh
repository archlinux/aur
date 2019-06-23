#!/bin/sh

set -e

check_env() {
    if [ -d "$CONFDIR" ] ;then
	if [ -r "$CONFDIR/EVE.conf" ] ;then
	    SHAREDIR=$(grep SharedCacheFolder $CONFDIR/EVE.conf | cut -d= -f2)
	fi
    fi
    SHAREDIR=${SHAREDIR:-$HOME/.eve/}
    [ ! -d "$SHAREDIR" ] && SHAREDIR=""
    if [ "x$SHAREDIR" != "x$EVEDIR/SharedCache/" ] ;then
	desktop_msg "Please wait, preparing environment in $EVEDIR"
	mkdir -p $CONFDIR
	echo "[General]" >$CONFDIR/EVE.conf
	echo "SharedCacheFolder=$EVEDIR/SharedCache/" >>$CONFDIR/EVE.conf
	echo "UseCustomWine=true" >>$CONFDIR/EVE.conf
	echo "CustomWinePath=$WINEPATH/wine" >>$CONFDIR/EVE.conf
	mkdir -p $EVEDIR/SharedCache
	tar xf $SETUPDIR/lib/launcher-$ELVER.tar.xz -C $EVEDIR
	if [ -d "$SHAREDIR/ResFiles/" ] ;then
	    mv $SHAREDIR/ResFiles/ $EVEDIR/SharedCache/
	    mv $SHAREDIR/*.txt $EVEDIR/SharedCache/
	    rm -rf $SHAREDIR
	fi
    fi
}

check_steam() {
    if [ ! -r "$LAUNCHER/steam_appid.txt" -a -x "$(which steam 2>/dev/null)" ] ;then
	echo "8500" >$LAUNCHER/steam_appid.txt
    fi
}

ELVER=""
QTVER="5.11"
SHAREDIR=""
CONFDIR="$HOME/.config/CCP"
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
