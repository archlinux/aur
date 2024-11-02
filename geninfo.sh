#!/usr/bin/env bash

pkgbase=opentelemetry-python-contrib
pkgver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
urlbase="https://github.com/open-telemetry/${pkgbase}"

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

cd "src/${pkgbase}-${pkgver}"
pkgs=$(find . -mindepth 1 -maxdepth 2 -type d -name "opentelemetry-*" | awk -F '/' '{print $NF}' | grep -v "docker-test" | sort -u)

## pkgname
echo "pkgname=("
echo "$pkgs" | sed 's|^|    \"python-|' | sed 's|$|\"|'
echo ")"

## _pkgdescs
echo "_pkgdescs=("
for pkg in $pkgs; do
    dirname=$(_get_dirname "$pkg")
    pkgdesc=$(awk -F '"' '/description = /{print $2}' "${dirname}${pkg}/pyproject.toml")
    echo "    \"$pkgdesc\""
done
echo ")"

## _urls
echo "_urls=("
for pkg in $pkgs; do
    dirname=$(_get_dirname "$pkg")
    echo "    \"\${_url}/tree/main/${dirname}${pkg}\""
done
echo ")"

## _depends
echo "_depends=("
for pkg in $pkgs; do
    dirname=$(_get_dirname "$pkg")
    depends=($(awk '/dependencies *= *\[/,/\]/' "${dirname}${pkg}/pyproject.toml" | awk -F '"' '{print $2}' | sed '/^$/d' | awk -F ' |=|~|>' '{print $1}' | sed 's|^|python-|' | sed 's|python-python-|python-|' | sort))
    echo "    \""${depends[@]}"\""
done
echo ")"
