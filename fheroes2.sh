#!/bin/sh

CONFIG_DIR=~/.fheroes2

mkdir -p $CONFIG_DIR
cd $CONFIG_DIR || exit
exec fheroes2 $*
