#!/bin/sh
mkdir -p $HOME/.hddcash
LD_LIBRARY_PATH=/usr/lib/hddcash hddcash-qt -datadir=$HOME/.hddcash/ "$@"
