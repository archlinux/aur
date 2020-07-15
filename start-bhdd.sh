#!/bin/sh
mkdir -p $HOME/.cache/BitcoinHD/data
btchdd -datadir=$HOME/.cache/BitcoinHD/data/ "$@"
