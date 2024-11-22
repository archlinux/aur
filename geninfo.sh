#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums'

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
pyreq="src/${_pipname}-${pkgver}/requirements.txt"

makepkg -do
depends=$(cat "$pyreq" | 
    grep -vP '^\s*#|^\s*-' |
    grep -oP '^([a-zA-Z0-9_-]+)' | \
    sed '/^$/d' |
    tr 'A-Z' 'a-z' | \
    sed 's|^|python-|' | \
    sed 's|python-python-|python-|' | \
    sed '/^python-python$/d' | \
    sort -u | \
    tr '\n' ' ' | \
    sed 's| $||'
)

sed -e "s|^depends=.*|depends=(${depends})|" -i PKGBUILD
