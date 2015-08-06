#!/bin/sh
export SDL_AUDIODRIVER="alsa"
cd /usr/share/enemy-territory
LD_PRELOAD="/usr/lib32/et-sdl-sound.so ${LD_PRELOAD}" exec ./et.x86 $*

