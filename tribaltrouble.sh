#!/bin/sh

cd /usr/share/games/tribaltrouble/common
exec java -ea -Djava.library.path=${PWD}/lib/native -Dorg.lwjgl.util.Debug=false -Xmx400m -cp .:./lib/'*' com.oddlabs.tt.Main --silent
