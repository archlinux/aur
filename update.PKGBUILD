#!/bin/bash
#source PKGBUILD
_gitname=babl
srcdir=$PWD/src

declare -A dep_versions
readonly -a deps=(gobject-introspection lcms vapigen)

echo "##update sources"
makepkg -Cod
echo "##finish updating sources"

## probe meson.build for dependencies versions
for dep in "${deps[@]}";do
	dep_versions["_${dep}_version"]=$(grep -oP "dependency\('${dep}.*?',\s*version:\s*'[<>=]*\K.*(?=')"  "${srcdir}"/${_gitname}/meson.build)
done

echo "##probed deps versions:" >&2
for key in ${!dep_versions[*]};do echo "$key:${dep_versions[$key]}";done >&2

echo "##generate PKGBUILD" >&2
cp -v --backup=numbered PKGBUILD.in PKGBUILD
for key in ${!dep_versions[*]};do sed -i "s/@${key}@/${dep_versions[${key}]}/" PKGBUILD;done >&2
echo "##finish generating PKGBUILD"

echo "##update pkgver"
makepkg -eod
echo "##finish updating pkgver"

echo "##generate .SRCINFO" >&2
makepkg --printsrcinfo > .SRCINFO
echo "##finish updating package" >&2
