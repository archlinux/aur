#!/bin/bash
pushd /usr/share/words-PKGVER >/dev/null
./words "$@"
popd >/dev/null
