#!/bin/sh
appname=`basename "$0" | sed s,\.sh$,,`

dirname="/opt/evelauncher"
LD_LIBRARY_PATH="$dirname:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH
export QTDIR=$dirname
export QT_PLUGIN_PATH=$dirname/plugins
"$dirname/$appname" "$@"
