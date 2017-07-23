#!/bin/bash

waifu2x="/usr/share/waifu2x/waifu2x.lua"

if [[ -n "$1" ]]; then
    exec luajit "$waifu2x" "$@"
else
    exec luajit "$waifu2x" -h "$@"
fi
