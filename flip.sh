#!/bin/bash

if [ "$2" == "v" ]; then
    magick "$1" -flip "$1"
fi

if [ "$2" == "h" ]; then
    magick "$1" -flop "$1"
fi
