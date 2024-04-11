#!/bin/sh
export WINEDEBUG=-all
export DISPLAY=""
exec wine /opt/rcedit/rcedit-x64.exe "$@"
