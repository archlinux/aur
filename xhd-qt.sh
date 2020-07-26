#!/bin/sh
mkdir -p $HOME/.xrphd
LD_LIBRARY_PATH=/usr/lib/xrphd xrphd-qt -datadir=$HOME/.xrphd/ "$@"
