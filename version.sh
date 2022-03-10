#!/usr/bin/env sh

curl -sL "https://raw.githubusercontent.com/microsoft/pylance-release/main/CHANGELOG.md" |\
    grep '##' |\
    head -n 1 |\
    sed -r -e 's/^## //' \
    -e 's/ \(.*\)//'
