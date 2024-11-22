#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums'

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)

makepkg -do
wget -q -O src/requirements_ort.txt "https://github.com/RapidAI/RapidOCR/raw/refs/tags/v${pkgver}/python/requirements_ort.txt"
pyreq="src/requirements_ort.txt"

depends=$(cat "$pyreq" | 
    grep -oP '^([a-zA-Z0-9_-]+)' |
    sed '/^$/d' |
    tr 'A-Z' 'a-z' |
    sed 's|^|python-|' |
    sed 's|python-python-|python-|' |
    sed '/^python-python$/d' |
    sed 's|opencv_python|opencv|' |
    sort -u |
    tr '\n' ' ' |
    sed 's| $||'
)

sed -e "s|^depends=.*|depends=(${depends})|" -i PKGBUILD
