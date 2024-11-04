#!/usr/bin/env bash

pkgbase=$(awk -F= '/pkgbase=/{print $2}' PKGBUILD)
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
tmp_pkgname=$(mktemp)
tmp_pkgdescs=$(mktemp)
tmp_urls=$(mktemp)
tmp_depends=$(mktemp)

trap "rm $tmp_pkgname $tmp_pkgdescs $tmp_urls $tmp_depends" EXIT 

_get_dirname() {
    case $1 in
        opentelemetry-exporter-*)        echo "exporter/";;
        opentelemetry-instrumentation-*) echo "instrumentation/";;
        opentelemetry-processor-*)       echo "processor/";;
        opentelemetry-propagator-*)      echo "propagator/";;
        opentelemetry-resource-*)        echo "resource/";;
        opentelemetry-sdk-extension-*)   echo "sdk-extension/";;
        opentelemetry-util-*)            echo "util/";;
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
        pkgdesc=$(awk -F '"' '/description = /{print $2}' "src/${pkgbase}-${pkgver}/${dirname}${pkg}/pyproject.toml")
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
        depends=($(awk '/dependencies *= *\[/,/\]/' "src/${pkgbase}-${pkgver}/${dirname}${pkg}/pyproject.toml" | awk -F '"' '{print $2}' | sed '/^$/d' | awk -F ' |=|~|>' '{print $1}' | sed 's|^|python-|' | sed 's|python-python-|python-|' | sort))
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

sed -e "/^pkgname=(/,/)/c\pkgname=(" \
    -e "/^_pkgdescs=(/,/)/c\_pkgdescs=(" \
    -e "/^_urls=(/,/)/c\_urls=(" \
    -e "/^_depends=(/,/)/c\_depends=(" \
    -i PKGBUILD

sed -e "/^pkgname=/r $tmp_pkgname" \
    -e "/^_pkgdescs=/r $tmp_pkgdescs" \
    -e "/^_urls=/r $tmp_urls" \
    -e "/^_depends=/r $tmp_depends" \
    -i PKGBUILD
