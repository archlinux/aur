#!/bin/sh

TALON_LIB="/usr/lib/talon"
TALON_RESOURCES="/usr/share/talon/resources"

unset QT_AUTO_SCREEN_SCALE_FACTOR QT_SCALE_FACTOR
export LC_NUMERIC=C
export QT_PLUGIN_PATH="$TALON_LIB/plugins"
export LD_LIBRARY_PATH="$TALON_LIB:$TALON_RESOURCES/python/lib:$TALON_RESOURCES/pypy/lib"

cd /usr/share/talon
exec "/usr/share/talon/talon-bin" "$@"
