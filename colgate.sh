#!/usr/bin/env bash

flashplayer /usr/share/PPP/colgate/colgate.swf --class $(basename "${0%.*}") "$@"
