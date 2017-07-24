#!/bin/bash
set -e

pkgver=$(curl -s https://www.dropboxforum.com/t5/Desktop-client-builds/bd-p/101003016 | grep -Eo ">Beta Build [0-9]+\.3\.[0-9]+</a>" | grep -Eo '[0-9]+\.3\.[0-9]+' | sort -rV | head -1)
sed "s/^pkgver=.*/pkgver=$pkgver/" -i PKGBUILD
updpkgsums
