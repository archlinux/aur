#!/bin/sh

mkdir -p ~/.fheroes2/files/save
cd ~/.fheroes2
ln -sf /usr/share/fheroes2/* .
exec ./fheroes2 $*
