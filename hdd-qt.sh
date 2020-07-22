#!/bin/sh
mkdir -p $HOME/.cache/HDDCash/data
LD_LIBRARY_PATH=/usr/lib/hddcash hddcash-qt -datadir=$HOME/.cache/HDDCash/data/ "$@"
