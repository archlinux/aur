#!/usr/bin/env bash

if [ -x "$(which xboard 2> /dev/null)" ] ; then
  exec xboard -variant shogi -firstChessProgram fairy-stockfish \
    -useBoardTexture true -overrideLineGap 1 -trueColors true \
    -liteBackTextureFile ~~/themes/textures/wood_d.png \
    -darkBackTextureFile ~~/themes/textures/wood_d.png \
    -pieceImageDirectory ~~/themes/shogi
fi

_message=''
_message+=$'xboard not found.'

if tty -s ; then
  echo "$_message"
else
  [ ! -e "$XDG_CONFIG_HOME/thorium" ] && notify-send -a "xboard shogi" -t 7500 "$_message"
fi
