#!/bin/sh
cd /opt/df_linux
export SDL_DISABLE_LOCK_KEYS=1 # Work around for bug in Debian/Ubuntu SDL patch.
#export SDL_VIDEO_CENTERED=1    # Centre the screen.  Messes up resizing.

umask 0002 # Make sure that any saves created get 775/664
exec ./libs/Dwarf_Fortress "$@"
