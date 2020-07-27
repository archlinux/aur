#!/bin/sh
mkdir -p $HOME/.litecoinhd
LD_LIBRARY_PATH=/usr/lib/ltchd ltchd-qt -datadir=$HOME/.litecoinhd/ "$@"
