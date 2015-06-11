#!/bin/sh
BIN=ltbin
LT_HOME=/opt/LightTable

ARGS="$@"
CORRECTED=${ARGS//-/<d>}
CORRECTED=${CORRECTED// /<s>}

if [ -t 0 ] && [ $# != 0 ]; then
  #We're in a terminal...
  LD_LIBRARY_PATH="$LT_HOME:$LD_LIBRARY_PATH" $LT_HOME/$BIN "<d><d>dir=`pwd`<s>$CORRECTED" &
else
  #We were double clicked
  LD_LIBRARY_PATH="$LT_HOME:$LD_LIBRARY_PATH" $LT_HOME/$BIN &
fi
