#!/bin/bash

if [ -f "${1%.*}.png" ]; then
    DEST="${1%.*}2.png"
else
    DEST="${1%.*}.png"
fi

magick "$1" $DEST

if [[ "$2" == "del" ]]; then
    rm "$1"
fi
