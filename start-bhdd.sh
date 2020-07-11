#!/bin/sh
mkdir -p /home/ben/.cache/BitcoinHD/data
btchdd -datadir=$HOME/.cache/BitcoinHD/data/ "$@"
