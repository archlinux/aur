#!/bin/sh
rm -rf src/
[[ -f "config.def.h" ]] && rm config.def.h
[[ "$(hostname)" == "uh-x200s" ]] && cp config.def.h.x200s config.def.h
[[ "$(hostname)" == "uh-lin" ]] && cp config.def.h.work config.def.h
makepkg -g > md5sums
makepkg -fi
