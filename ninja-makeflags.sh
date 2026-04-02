#!/usr/bin/env bash

if [[ "$MAKEFLAGS" =~ -j[[:space:]]*([0-9]+) ]]; then
  # e.g. -j8 or -j 8
  jobs="${BASH_REMATCH[1]}"
elif [[ "$MAKEFLAGS" =~ (^|[[:space:]])-j($|[[:space:]]) ]]; then
  # bare -j -> unlimited
  jobs=0
else
  # no -j -> Make default is 1
  jobs=1
fi

exec ninja -j"$jobs" "$@"