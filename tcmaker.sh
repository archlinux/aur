#!/bin/sh

exec env WINEDEBUG=-all wine start /unix "/usr/share/fml-tcmaker/CardMaker.exe" "$@"

