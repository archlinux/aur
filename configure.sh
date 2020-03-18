#!/bin/sh

TARGET=aarch64-linux-gnu

PREFIX=/usr/$TARGET

source $TARGET-environment

# check if last arg is a path to configure, else use parent
for last; do true; done
if test -x "${last}/configure"; then
  config_path="$last"
else
  config_path=".."
fi

${config_path}/configure \
  --host=$TARGET --target=$TARGET --build="$CHOST" \
  --prefix=$PREFIX \
  --enable-shared --enable-static "$@"
