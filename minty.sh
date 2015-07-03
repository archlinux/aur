#!/usr/bin/env bash

flashplayer /usr/share/PPP/minty/minty.swf --class $(basename "${0%.*}") "$@"
