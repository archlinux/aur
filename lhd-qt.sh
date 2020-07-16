#!/bin/sh
mkdir -p $HOME/.cache/LitecoinHD/data
LD_LIBRARY_PATH=/usr/lib/ltchd ltchd-qt -datadir=$HOME/.cache/LitecoinHD/data/ "$@"
