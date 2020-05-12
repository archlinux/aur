#!/bin/sh
DEFAULT="${XDG_DATA_HOME:-$HOME/.local/share}/dungeon-revealer"
exec env "DATA_DIRECTORY=${DATA_DIRECTORY:-$DEFAULT}" /usr/lib/dungeon-revealer/main
