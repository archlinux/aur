#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums', require install yq and jq.

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
pytoml="src/${_pipname}-${pkgver}/pyproject.toml"

makepkg -do
pkgdesc=$(yq eval -o=json "$pytoml" | jq -r '.project.description')
url=$(yq eval -o=json "$pytoml" | jq -r '.project.urls.Repository')
depends=$(yq eval -o=json "$pytoml" | jq -r '.project.dependencies[]' | tr 'A-Z' 'a-z' | grep -oP '^[a-z0-9_\-]+' | sed 's|^|python-|' | sed 's|python-python-|python-|' | sed '/^python-python$/d' | sed 's|_|-|g' | sort -u | tr '\n' ' ' | sed 's| $||')

sed -e "s|^pkgdesc=.*|pkgdesc=\"$pkgdesc\"|" \
    -e "s|^url=.*|url=\"${url}\"|" \
    -e "s|^depends=.*|depends=(${depends})|" \
    -i PKGBUILD
