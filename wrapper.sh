#!/bin/sh
export PULSE_PROP_OVERRIDE="application.name='RuneScape' application.icon_name='runescape' media.role='game'"
export LD_PRELOAD="/usr/lib/libcurl.so.3"
export SDL_VIDEO_X11_WMCLASS="RuneScape"
exec /usr/bin/runescape-launcher.real "$@"
