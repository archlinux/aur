#!/bin/bash
#source PKGBUILD
_gitname=gegl
srcdir=$PWD/src

declare -A dep_versions
#readonly -a deps=(babl)

echo "##update sources"
makepkg -Cod
echo "##finish updating sources"

## probe meson.build for dependencies versions
# the rest have standard form of "[{dep_name}_raqured_version], [{version}]"
#for dep in "${deps[@]}";do
#	dep_versions["_${dep}_version"]=$(grep -oPz "dep_ver = {\n  '$dep'\s*: '>=\K.*(?=')" "${srcdir}"/${_gitname}/meson.build)
#done
while IFS=: read -r name version; do
		name=$(grep -oP "'\K.*(?=')"<<<"$name")
		version=$(grep -oP "\s*'[<>=]*\K[0-9.]*" <<<"$version";)
		dep_versions["_${name}_version"]="$version"
done < <(grep -zoP "(?s)dep_ver\s\+?=\s{\s*\n\K.*?(?=})" "${srcdir}"/${_gitname}/meson.build)

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
