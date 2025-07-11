#!/usr/bin/env bash

## run './geninfo.sh' after run 'updpkgsums', need install: jq go-yq python-packaging

_pkgname=$(awk -F= '/_pkgname=/{print $2}' PKGBUILD)
_pipname="${_pkgname//-/_}"
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
pytoml="src/${_pipname}-${pkgver}/pyproject.toml"
pyreq="src/${_pipname}-${pkgver}/requirements.txt"

trap "rm depends.txt" EXIT
makepkg -do
sudo pacman -Sy --noconfirm --noprogressbar --needed jq go-yq python-packaging
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
    sed 's|^|    \"|' |
    sed 's|$|\"|'
)
echo -e "${depends}\n)" > depends.txt
# optdepends=$(yq eval -o=json "$pytoml" | 
#     jq ".'dependency-groups'.docker.dependencies | keys" | 
#     jq -r '.[]' |
#     tr 'A-Z' 'a-z' | 
#     sed 's|^|python-|' | 
#     sed 's|python-python-|python-|' | 
#     sed '/^python-python$/d' | 
#     sed 's|^|\"|g' |
#     sed 's|$|\"|g' |
#     sed '$a "flexget-webui: webui v2"' |
#     sed '$a "flexget-webui-v1: webui v1"' |
#     sed 's|^|    |g' |
#     sort -u
# )
# echo -e "${optdepends}\n)" > optdepends.txt

sed -e "/^depends=(/,/)/c\depends=(" -i PKGBUILD
sed -e "/^depends=/r depends.txt" -i PKGBUILD
