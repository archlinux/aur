#!/bin/sh

if pgrep festival &> /dev/null
  then
    xastir
  else
    festival --server & xastir
    pkill festival
fi
