#!/bin/sh
BF_DIST_BIN=`dirname "$0"`/data
BF_PROGRAM32="blenderplayer-i386"
BF_PROGRAM64="blenderplayer-x86_64"
exitcode=0

LD_LIBRARY_PATH32=${BF_DIST_BIN}/lib32:${LD_LIBRARY_PATH32}
LD_LIBRARY_PATH64=${BF_DIST_BIN}/lib64:${LD_LIBRARY_PATH64}

if [ `uname -m` = "i686" ]; then
	export LD_LIBRARY_PATH32
	aoss "$BF_DIST_BIN/$BF_PROGRAM32" ./data/levels/episode_01/episode_01.blend
	exitcode=$?
	exit $exitcode
fi

if [ `uname -m` = "x86_64" ]; then
	export LD_LIBRARY_PATH64
	aoss "$BF_DIST_BIN/$BF_PROGRAM64" ./data/levels/episode_01/episode_01.blend
	exitcode=$?
	exit $exitcode
fi





