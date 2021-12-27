#!/usr/bin/env sh

export LD_PRELOAD=/opt/steam-screensaver-fix/lib/libSDLsteam.so:/opt/steam-screensaver-fix/lib32/libSDLsteam.so
"$@"
