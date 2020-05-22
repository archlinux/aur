#!/bin/sh
GAME_DATA_DIR=/usr/share/dave_gnukem
GAME_EXECUTABLE=/usr/lib/dave_gnukem/dave_gnukem
cd $GAME_DATA_DIR && exec $GAME_EXECUTABLE "$@"