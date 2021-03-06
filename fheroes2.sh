#!/bin/sh

CONFIG_DIR=~/.fheroes2

mkdir -p $CONFIG_DIR/files/save
cd $CONFIG_DIR || exit
ln -sf /usr/share/fheroes2/* .
exec ./fheroes2 $*
