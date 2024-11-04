#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums', require install yq and jq.

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
pytoml="src/${_pipname}-${pkgver}/pyproject.toml"

makepkg -do
depends=$(
    yq eval -o=json "$pytoml" | \
    jq -r '.project.dependencies[]' | \
    grep -vP 'python_version ?<|win32' | \
    grep -oP '^([a-zA-Z0-9_-]+)' | \
    tr 'A-Z' 'a-z' | \
    sort -u | \
    sed 's|^|python-|' | \
    sed 's|python-python-|python-|' | \
    sed '/^python-python$/d' | \
    sed 's|python-uvicorn|uvicorn|' | \
    sed 's|importlib-resources|importlib_resources|' | \
    tr '\n' ' ' | \
    sed 's| $||'
)

sed -e "s|^depends=.*|depends=(${depends})|" -i PKGBUILD
