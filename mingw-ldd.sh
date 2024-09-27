#!/bin/sh

set -e

/usr/bin/mingw-ldd "$@" --dll-lookup-dirs /usr/@TRIPLE@/bin
