#!/bin/sh
WINEDEBUG=-all wine /usr/share/eac3to/eac3to.exe "$@"

# Reset terminal colors
tput init
