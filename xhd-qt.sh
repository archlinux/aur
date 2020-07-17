#!/bin/sh
mkdir -p $HOME/.cache/XRPHD/data
LD_LIBRARY_PATH=/usr/lib/xrphd xrphd-qt -datadir=$HOME/.cache/XRPHD/data/ "$@"
