#!/usr/bin/env sh
exec env RENPY_BASE=${RENPY_BASE:-/usr/share/renpy/} python2 -OO "/usr/share/donttakeitpersonally/don't take it personally, babe.py" /usr/share/donttakeitpersonally "$@"
