#!/bin/bash

set -e
set -o pipefail

startdir="$PWD"

[[ ! -f PebbleSDK*.tar.gz ]] && (source PKGBUILD; wget "${source[0]}")
tar xzvvf PebbleSDK*.tar.gz

cd PebbleSDK-*/Pebble
./waf 2>/dev/null || true
cd .waf*

sed 's/"python \(.*\)"\.format(/"'\''{}'\'' \1".format(sys.executable, /' \
    waflib/extras/process_resources.py > waflib/extras/process_resources.py.new

diff -u waflib/extras/process_resources.py \
    waflib/extras/process_resources.py.new > "$startdir/python-waf.patch"
