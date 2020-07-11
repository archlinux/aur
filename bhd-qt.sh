#!/bin/sh
mkdir -p /home/ben/.cache/BitcoinHD/data
btchd-qt -datadir=$HOME/.cache/BitcoinHD/data/ "$@"
