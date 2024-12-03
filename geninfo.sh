#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums', need install: jq yq python-packaging

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
pytoml="src/${_pipname}-${pkgver}/pyproject.toml"
pyreq="src/${_pipname}-${pkgver}/requirements.txt"

makepkg -do
pkgdesc=$(yq eval -o=json "$pytoml" | jq -r '.project.description')
depends=$(./geninfo.py "$pyreq" |
    tr 'A-Z' 'a-z' |
    grep -oP "^[a-z0-9_-]+" |
    sed 's|^|python-|' |
    sed 's|python-python-|python-|' |
    sed '/^python-python$/d' |
    sed 's|python-importlib-resources|python-importlib_resources|' |
    sed 's|python-jaraco-|python-jaraco.|' |
    sed 's|python-jinja2|python-jinja|' |
    sed 's|python-typing-|python-typing_|' |
    sed 's|python-zc-lockfile|python-zc.lockfile|' |
    sort -u |
    tr '\n' ' ' |
    sed 's| $||'
)

sed -e "s|^pkgdesc=.*|pkgdesc=\"$pkgdesc\"|" \
    -e "s|^depends=.*|depends=(${depends})|" \
    -i PKGBUILD
