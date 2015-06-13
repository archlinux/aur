#!/bin/sh
BF_DIST_BIN=`dirname "$0"`/data
BF_PROGRAM32="blenderplayer-i386"
BF_PROGRAM64="blenderplayer-x86_64"
exitcode=0

LD_LIBRARY_PATH32=${BF_DIST_BIN}/lib32:${LD_LIBRARY_PATH32}
LD_LIBRARY_PATH64=${BF_DIST_BIN}/lib64:${LD_LIBRARY_PATH64}

if [ `uname -m` = "i686" ]; then
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH32}
	export LD_LIBRARY_PATH
	aoss "$BF_DIST_BIN/$BF_PROGRAM32" -w 1280 720 32 60 ./data/levels/episode_02/episode_02.blend
	exitcode=$?
	exit $exitcode
fi

if [ `uname -m` = "x86_64" ]; then
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH64}
	export LD_LIBRARY_PATH
	aoss "$BF_DIST_BIN/$BF_PROGRAM64" -w 1280 720 32 60 ./data/levels/episode_02/episode_02.blend
	exitcode=$?
	exit $exitcode
fi
