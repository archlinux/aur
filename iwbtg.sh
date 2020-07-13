#!/bin/bash
unset WINEPRIFIX
if [ ! -d "$HOME"/.iwbtg ] ; then
    mkdir -p "$HOME"/.iwbtg || exit 1
    ln -s /usr/share/iwbtg/iwbtg.exe "$HOME"/.iwbtg/iwbtg.exe || exit 1
fi

WINEDEBUG=-all wine "$HOME"/.iwbtg/iwbtg "$@"
