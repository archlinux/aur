#!/bin/sh
_dirname="/opt/xnview-xnsketch"
export LD_LIBRARY_PATH="${dirname}/lib:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${dirname}/lib:${QT_PLUGIN_PATH}"
exec "${_dirname}/XnSketch" "$@"