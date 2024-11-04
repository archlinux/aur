#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums', require install yq and jq.

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
pytoml="src/${_pipname}-${pkgver}/pyproject.toml"

makepkg -do
pkgdesc=$(yq eval -o=json "$pytoml" | jq -r '.tool.poetry.description')
depends=$(yq eval -o=json "$pytoml" | jq -r '.tool.poetry.dependencies | to_entries | map(select(.value | type != "object")) | .[].key' | tr 'A-Z' 'a-z' | sort -u | sed 's|^|python-|' | sed 's|python-python-|python-|' | sed '/^python-python$/d' | tr '\n' ' ' | sed 's| $||')
optdepends=$(yq eval -o=json "$pytoml" |  jq -r '.tool.poetry.extras.[].[]' | tr 'A-Z' 'a-z' | sort -u | sed 's|^|python-|' | sed 's|python-python-|python-|' | sed '/^python-python$/d' | tr '\n' ' ' | sed 's| $||')
# url=$(yq eval -o=json "$pytoml" | jq -r '.tool.poetry.homepage')

sed -e "s|^pkgdesc=.*|pkgdesc=\"$pkgdesc\"|" \
    -e "s|^depends=.*|depends=(${depends})|" \
    -e "s|^optdepends=.*|optdepends=(${optdepends})|" \
    -i PKGBUILD
