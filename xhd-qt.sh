#!/bin/sh
mkdir -p $HOME/.XRPHD
LD_LIBRARY_PATH=/usr/lib/xrphd xrphd-qt -datadir=$HOME/.XRPHD/ "$@"
