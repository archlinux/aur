#!/bin/sh
export LINGO_VER_HOME=/usr/share/lingo
#
# export LD_LIBRARY_PATH=$LINGO_VER_HOME/bin/linux64:$LD_LIBRARY_PATH
#
export FONTPATH=$LINGO_VER_HOME/fonts/charting
#
export QT_QPA_FONTDIR=$LINGO_VER_HOME/fonts/gui
#
exec /usr/lib/lingo/runlingo.bin "$@"
