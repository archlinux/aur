#!/bin/sh
cd /usr/lib32/dwarffortress-phoebus
export SDL_DISABLE_LOCK_KEYS=1 # Work around for bug in Debian/Ubuntu SDL patch.
#export SDL_VIDEO_CENTERED=1 # Centre the screen.  Messes up resizing.
LD_PRELOAD="/usr/lib32/libz.so.1 /usr/lib32/dwarffortress-phoebus/libgraphics.so /usr/lib32/libgcc_s.so.1 /usr/lib32/libstdc++.so.6" \
/usr/lib32/dwarffortress-phoebus/libs/Dwarf_Fortress $* # Go, go, go! :)
