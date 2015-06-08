#!/bin/sh

export PKG_CONFIG_LIBDIR=/usr/psp/lib/pkgconfig

export PKG_CONFIG_PATH=$PKG_CONFIG_LIBDIR:$PKG_CONFIG_PATH_CUSTOM

# Now just execute pkg-config with the given command line args.
pkg-config $@
