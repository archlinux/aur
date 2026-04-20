#!/usr/bin/env sh
# Dev helper: print the latest stable pylance version tagged on
# microsoft/pylance-release. Use to decide when to bump pkgver.

curl -sL "https://raw.githubusercontent.com/microsoft/pylance-release/main/CHANGELOG.md" |
    grep -E '^## .* Release$' |
    head -n 1 |
    sed -E 's/^## //; s/ \(.*\)//; s/ Release$//'
