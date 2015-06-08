#!/usr/bin/env bash

cd /usr/share/wart
if command which rlwrap >&/dev/null
then
  rlwrap -C wart /usr/bin/wart_bin $*
else
  /usr/bin/wart_bin $*
fi
