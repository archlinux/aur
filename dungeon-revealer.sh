#!/bin/sh
exec env "DATA_DIRECTORY=${XDG_DATA_HOME:-$HOME/.local/share}/dungeon-revealer" /usr/bin/dungeon-revealer-internal
