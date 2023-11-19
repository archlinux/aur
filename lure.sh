#!/bin/bash

# remove path from skript name
lang="${0##*/}"
# remove lure and hyphen from skript name
lang="${lang#lure-}"

# launch scummvm in correct data dir
scummvm "$@" -p /usr/share/lure/$lang lure
