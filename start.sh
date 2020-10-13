#!/bin/sh

unset QT_AUTO_SCREEN_SCALE_FACTOR QT_SCALE_FACTOR
export LC_NUMERIC=C
export QT_PLUGIN_PATH="/usr/lib/talon/plugins"
export LD_LIBRARY_PATH="/usr/lib/talon:/usr/share/talon/resources/python/lib"
exec /usr/share/talon/talon-bin "$@"
