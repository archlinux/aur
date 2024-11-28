#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums', require install yq and jq.

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
pytoml="src/${_pipname}-${pkgver}/pyproject.toml"

makepkg -do
pkgdesc=$(yq eval -o=json "$pytoml" | jq -r '.tool.poetry.description')
optdepends=$(yq eval -o=json "$pytoml" | 
    jq -r '.tool.poetry.extras.[].[]' | 
    tr 'A-Z' 'a-z' | 
    sed 's|^|python-|' | 
    sed 's|python-python-|python-|' | 
    sed '/^python-python$/d' | 
    sort -u | 
    tr '\n' ' ' | 
    sed 's| $||'
)
depends=$(yq eval -o=json "$pytoml" | 
    jq '.tool.poetry.dependencies | keys' | 
    jq -r '.[]' |
    tr 'A-Z' 'a-z' | 
    sed 's|^|python-|' | 
    sed 's|python-python-|python-|' | 
    sed '/^python-python$/d' | 
    grep -vP "^(${optdepends// /\|})$" |
    sort -u | 
    tr '\n' ' ' | 
    sed 's| $||'
)
# url=$(yq eval -o=json "$pytoml" | jq -r '.tool.poetry.homepage')

sed -e "s|^pkgdesc=.*|pkgdesc=\"$pkgdesc\"|" \
    -e "s|^depends=.*|depends=(${depends})|" \
    -e "s|^optdepends=.*|optdepends=(${optdepends})|" \
    -i PKGBUILD
