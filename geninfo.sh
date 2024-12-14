#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums', need install: jq yq python-packaging

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
pytoml="src/${_pipname}-${pkgver}/pyproject.toml"
pyreq="src/${_pipname}-${pkgver}/requirements.txt"

trap "rm depends.txt optdepends.txt" EXIT
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
    sed '$a python-telegram-bot' |
    sed '$a python-socksio' |
    sort -u |
    sed 's|^|    \"|' |
    sed 's|$|\"|'
)
echo -e "${depends}\n)" > depends.txt
optdepends=$(yq eval -o=json "$pytoml" | 
    jq '.tool.poetry.group.docker.dependencies | keys' | 
    jq -r '.[]' |
    tr 'A-Z' 'a-z' | 
    sed 's|^|python-|' | 
    sed 's|python-python-|python-|' | 
    sed '/^python-python$/d' | 
    sed '/python-telegram-bot/d' |
    sed 's|^|\"|g' |
    sed 's|$|\"|g' |
    sed '$a "flexget-webui: webui v2"' |
    sed '$a "flexget-webui-v1: webui v1"' |
    sed 's|^|    |g' |
    sort -u
)
echo -e "${optdepends}\n)" > optdepends.txt

sed -e "s|^pkgdesc=.*|pkgdesc=\"$pkgdesc\"|" \
    -e "/^depends=(/,/)/c\depends=(" \
    -e "/^optdepends=(/,/)/c\optdepends=(" \
    -i PKGBUILD

sed -e "/^depends=/r depends.txt" \
    -e "/^optdepends=/r optdepends.txt" \
    -i PKGBUILD
