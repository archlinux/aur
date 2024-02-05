#!/usr/bin/env bash

if [ -x "$(which xboard 2> /dev/null)" ] ; then
  exec xboard -variant xiangqi -firstChessProgram fairy-stockfish \
    -useBoardTexture true -overrideLineGap 0 -trueColors true \
    -liteBackTextureFile ~~/themes/textures/xqboard-9x10.png \
    -darkBackTextureFile ~~/themes/textures/xqboard-9x10.png \
    -pieceImageDirectory ~~/themes/xiangqi
fi

_message=''
_message+=$'xboard not found.'

if tty -s ; then
  echo "$_message"
else
  [ ! -e "$XDG_CONFIG_HOME/thorium" ] && notify-send -a "xboard xiangqi" -t 7500 "$_message"
fi
