#!/bin/sh
WINEDEBUG=-all wine /usr/share/eac3to/thdmerge.exe "$@"

# Reset terminal colors
tput init
