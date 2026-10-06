#!/bin/sh
# The prebuilt binary looks for why3server under Debian's OCaml 5.3.0 libdir,
# which why3-bin does not provide. Point Why3 to a directory holding only the
# helper executables (not why3-bin's plugins, built for a different OCaml).
: "${WHY3LIB:=/usr/lib/easycrypt/why3lib}"
export WHY3LIB
exec /usr/lib/easycrypt/easycrypt "$@"
