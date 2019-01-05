#!/bin/sh

# check if last arg is a path to configure, else use parent
for last; do true; done
if test -x "${last}/configure"; then
  config_path="$last"
else
  config_path=".."
fi

default_mingw_pp_flags="-D_FORTIFY_SOURCE=2"
default_mingw_compiler_flags="-O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4"
default_mingw_linker_flags="-Wl,-O1,--sort-common,--as-needed"

export CPPFLAGS="${MINGW_CPPFLAGS:-$default_mingw_pp_flags $CPPFLAGS}"
export CFLAGS="${MINGW_CFLAGS:-$default_mingw_compiler_flags $CFLAGS}"
export CXXFLAGS="${MINGW_CXXFLAGS:-$default_mingw_compiler_flags $CXXFLAGS}"
export LDFLAGS="${MINGW_LDFLAGS:-$default_mingw_linker_flags $LDFLAGS}"

${config_path}/configure \
  --host=@TRIPLE@ --target=@TRIPLE@ --build="$CHOST" \
  --prefix=/usr/@TRIPLE@ --libdir=/usr/@TRIPLE@/lib --includedir=/usr/@TRIPLE@/include \
  --enable-shared --enable-static "$@"
