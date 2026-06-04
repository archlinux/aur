#!/usr/bin/env bash

pkgbase=$(awk -F= '/pkgbase=/{print $2}' PKGBUILD)
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
tmp_pkgname=$(mktemp)
tmp_pkgdescs=$(mktemp)
tmp_urls=$(mktemp)
tmp_depends=$(mktemp)
tmp_optdepends=$(mktemp)

trap "rm $tmp_pkgname $tmp_pkgdescs $tmp_urls $tmp_depends $tmp_optdepends" EXIT

## pkgname
_gen_pkgname() {
    echo "$infos" | awk -F '/' '{print $NF}' | sed 's|^|    \"python-|' | sed 's|$|\"|'
    echo ")"
}

## _pkgdescs
_gen_pkgdescs() {
    for info in $infos; do
        pkgdesc=$(python3 -c "
import tomllib
with open('src/${pkgbase}/${info}/pyproject.toml', 'rb') as f:
    data = tomllib.load(f)
print(data.get('project', {}).get('description', ''))
")
        echo "    \"$pkgdesc\""
    done
    echo ")"
}

## _urls
_gen_urls() {
    for info in $infos; do
        echo "    \"\${_url}/tree/main/${info}\""
    done
    echo ")"
}

## _depends
_gen_depends() {
    for info in $infos; do
        depends=($(
            python3 -c "
import tomllib, sys
with open('src/${pkgbase}/${info}/pyproject.toml', 'rb') as f:
    data = tomllib.load(f)
deps = data.get('project', {}).get('dependencies', [])
for dep in deps:
    name = dep.split('>')[0].split('<')[0].split('=')[0].split('~')[0].split('!')[0].strip().lower().replace('_', '-').replace('.', '-')
    if name:
        print(f'python-{name}')
" 2>/dev/null | \
            sed 's|python-python|python|' | \
            sort -u
        ))
        if [[ -z ${depends[@]} ]]; then
            depends=( "python" )
        fi
        echo "    \""${depends[@]}"\""
    done
    echo ")"
}

## _optdepends
_gen_optdepends() {
    for info in $infos; do
        depends=($(
            python3 -c "
import tomllib, sys
with open('src/${pkgbase}/${info}/pyproject.toml', 'rb') as f:
    data = tomllib.load(f)
opt = data.get('project', {}).get('optional-dependencies', {})
for group, deps in opt.items():
    for dep in deps:
        name = dep.split('>')[0].split('<')[0].split('=')[0].split('~')[0].split('!')[0].strip().lower().replace('_', '-').replace('.', '-')
        if name:
            print(f'python-{name}')
" 2>/dev/null | \
            sed 's|python-python|python|' | \
            sed 's|-python||g' | \
            sed 's|_|-|g' | \
            sed 's|python-psycopg2-binary|python-psycopg2|g' | \
            sed 's|python-jinja2|python-jinja|g' | \
            sort -u
        ))
        echo "    \""${depends[@]}"\""
    done
    echo ")"
}

makepkg -do
infos=$(find "src/${pkgbase}" -mindepth 2 -type f -name "pyproject.toml" |
    grep -vP '.git|_template' |
    sed -e "s|^src/${pkgbase}/||g" -e "s|/pyproject.toml$||g" |
    tr 'A-Z' 'a-z' |
    sort -u
)
_gen_pkgname > $tmp_pkgname
_gen_pkgdescs > $tmp_pkgdescs
_gen_urls > $tmp_urls
_gen_depends > $tmp_depends
_gen_optdepends > $tmp_optdepends

sed -e "/^pkgname=(/,/)/c\pkgname=(" \
    -e "/^_pkgdescs=(/,/)/c\_pkgdescs=(" \
    -e "/^_urls=(/,/)/c\_urls=(" \
    -e "/^_depends=(/,/)/c\_depends=(" \
    -e "/^_optdepends=(/,/)/c\_optdepends=(" \
    -i PKGBUILD

sed -e "/^pkgname=/r $tmp_pkgname" \
    -e "/^_pkgdescs=/r $tmp_pkgdescs" \
    -e "/^_urls=/r $tmp_urls" \
    -e "/^_depends=/r $tmp_depends" \
    -e "/^_optdepends=/r $tmp_optdepends" \
    -i PKGBUILD
