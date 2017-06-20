#!/bin/sh
rm -rf src/
[[ -f "config.def.h" ]] && rm config.def.h
[[ "$(hostname)" == "uh-x200s" ]] && cp config.def.h.x200s config.def.h
[[ "$(hostname)" == "uh-x230" ]] && cp config.def.h.x230 config.def.h
[[ "$(hostname)" == "uh-lin" ]] && cp config.def.h.work config.def.h
updpkgsums
makepkg -fi --noconfirm
rm -rf dwm/
rm config.def.h
