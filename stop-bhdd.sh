#!/bin/sh
mkdir -p /home/ben/.cache/BitcoinHD/data
btchd-cli -datadir=$HOME/.cache/BitcoinHD/data/ "$@" stop
