#!/usr/bin/env bash

flashplayer /usr/share/PPP/minuette/minuette.swf --class $(basename "${0%.*}") "$@"
