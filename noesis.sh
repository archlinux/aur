#!/bin/sh
export WINEDEBUG=-all
wine "/opt/noesis/Noesis64.exe" "$@"
