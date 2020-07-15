#!/bin/sh
mkdir -p $HOME/.cache/BitcoinHD/data
btchd-qt -datadir=$HOME/.cache/BitcoinHD/data/ "$@"
