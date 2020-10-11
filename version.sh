#!/usr/bin/env sh

curl -sL "https://github.com/microsoft/pylance-release/raw/master/CHANGELOG.md" |\
    grep '##' |\
    head -n 1 |\
    sed -r -e 's/^## //' \
    -e 's/ \(.*\)//'
