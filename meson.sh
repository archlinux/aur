#!/usr/bin/env sh

TARGET=aarch64-linux-gnu

CROSS_FILE=/usr/share/aarch64/toolchain.meson

source $TARGET-environment

exec meson setup \
  --buildtype release \
  --wrap-mode nofallback \
  -D strip=true \
  --cross-file $CROSS_FILE \
  --default-library shared \
  "$@"
