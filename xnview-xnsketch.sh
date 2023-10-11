#!/bin/sh
dirname="/opt/xnview-xnsketch"
export LD_LIBRARY_PATH="${dirname}/lib"
export QT_PLUGIN_PATH="${dirname}/lib"
"${dirname}/XnSketch" "$@"