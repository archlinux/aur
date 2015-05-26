#!/usr/bin/env bash
flashplayer /usr/share/games/pony-creator/Pony-Creator-v3.swf --class $(basename "${0%.*}") "$@"
