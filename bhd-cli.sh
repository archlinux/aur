#!/bin/sh
mkdir -p $HOME/.cache/BitcoinHD/data
btchd-cli -datadir=$HOME/.cache/BitcoinHD/data/ "$@"
