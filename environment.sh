#!/usr/bin/env sh

default_pp_flags="-D_FORTIFY_SOURCE=2"
default_compiler_flags="$default_pp_flags -mtune=generic -O2 -pipe -fno-plt"
default_linker_flags="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"

export CPPFLAGS="$default_pp_flags $CPPFLAGS"
export CFLAGS="$default_compiler_flags $CFLAGS"
export CXXFLAGS="$default_compiler_flags $CXXFLAGS"
export LDFLAGS="$default_linker_flags $LDFLAGS"
