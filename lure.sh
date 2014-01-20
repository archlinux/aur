#!/bin/bash

# remove path from skript name
lang="${0##*/}"
# remove lure from skript name
lang="${lang#lure}"
# remove hyphen from skript name
lang="${lang#-}"

# launch scummvm in correct data dir
scummvm "$@" -p /usr/share/lure/$lang lure
