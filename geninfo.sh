#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums', require install yq and jq.

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
pysetup="src/${_pipname}-${pkgver}/setup.py"

makepkg -do
depends=$(awk '/install_requires *= *\[/,/\s\]/' "$pysetup" | 
    sed '1s/.*\[//; $s/\s\+\].*//' | 
    sed 's|,||g' | 
    sed '/^$/d' | 
    sed 's|\s||g' | 
    sed 's|\"||g' | \
    grep -oP '^([a-zA-Z0-9_-]+)' | \
    tr 'A-Z' 'a-z' | \
    sed 's|^|python-|' | \
    sed 's|python-python-|python-|' | \
    sed '/^python-python$/d' | \
    sort -u | \
    tr '\n' ' ' | \
    sed 's| $||'
)

sed -e "s|^depends=.*|depends=(${depends})|" -i PKGBUILD
