#!/usr/bin/env bash

## need install yq and jq

pkgbase=$(awk -F= '/pkgbase=/{print $2}' PKGBUILD)
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
tmp_pkgname=$(mktemp)
tmp_pkgdescs=$(mktemp)
tmp_urls=$(mktemp)
tmp_depends=$(mktemp)
tmp_optdepends=$(mktemp)

trap "rm $tmp_pkgname $tmp_pkgdescs $tmp_urls $tmp_depends $tmp_optdepends" EXIT 

_get_dirname() {
    case $1 in
        opentelemetry-exporter-*)               echo "exporter/";;
        opentelemetry-instrumentation-openai-*) echo "instrumentation-genai/";;
        opentelemetry-instrumentation-*)        echo "instrumentation/";;
        opentelemetry-processor-*)              echo "processor/";;
        opentelemetry-propagator-*)             echo "propagator/";;
        opentelemetry-resource-*)               echo "resource/";;
        opentelemetry-sdk-extension-*)          echo "sdk-extension/";;
        opentelemetry-util-*)                   echo "util/";;
        *) ;;
    esac
}

## pkgname
_gen_pkgname() {
    echo "$pkgs" | sed 's|^|    \"python-|' | sed 's|$|\"|'
    echo ")"
}

## _pkgdescs
_gen_pkgdescs() {
    for pkg in $pkgs; do
        dirname=$(_get_dirname "$pkg")
        pkgdesc=$(yq eval -o=json "src/${pkgbase}-${pkgver}/${dirname}${pkg}/pyproject.toml" | jq -r '.project.description')
        echo "    \"$pkgdesc\""
    done
    echo ")"
}

## _urls
_gen_urls() {
    for pkg in $pkgs; do
        dirname=$(_get_dirname "$pkg")
        echo "    \"\${_url}/tree/main/${dirname}${pkg}\""
    done
    echo ")"
}

## _depends
_gen_depends() {
    for pkg in $pkgs; do
        dirname=$(_get_dirname "$pkg")
        depends=($(
            yq eval -o=json "src/${pkgbase}-${pkgver}/${dirname}${pkg}/pyproject.toml" | \
            jq -r '.project.dependencies.[]' 2>/dev/null | \
            grep -oP '^([a-zA-Z0-9_-]+)' | \
            tr 'A-Z' 'a-z' | \
            sed 's|^|python-|' | \
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
    for pkg in $pkgs; do
        dirname=$(_get_dirname "$pkg")
        depends=($(
            yq eval -o=json "src/${pkgbase}-${pkgver}/${dirname}${pkg}/pyproject.toml" | \
            jq -r '.project."optional-dependencies".[].[]' 2>/dev/null | \
            grep -oP '^([a-zA-Z0-9_-]+)' | \
            tr 'A-Z' 'a-z' | \
            sed 's|^|python-|' | \
            sed 's|-python||g' | \
            sed 's|_|-|g' | \
            sort -u
        ))
        echo "    \""${depends[@]}"\""
    done
    echo ")"
}

makepkg -do
pkgs=$(find "src/${pkgbase}-${pkgver}" -type f -name "pyproject.toml" | grep -vP '.git|_template' | awk -F '/' '{print $((NF-1))}' | grep -v "${pkgbase}-${pkgver}" | tr 'A-Z' 'a-z' | sort -u)
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
