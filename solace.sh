#!/bin/sh

exec env WINEDEBUG=-all wine start /unix "/usr/share/solace/solace.exe" "$@"

