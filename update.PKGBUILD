#!/bin/bash
#source PKGBUILD
_gitname=gegl
srcdir=$PWD/src

declare -A dep_versions
readonly -a deps=(babl)

echo "##update sources"
makepkg -Cod
echo "##finish updating sources"

## probe configure.ac for dependencies versions
# the rest have standard form of "[{dep_name}_raqured_version], [{version}]"
for dep in ${deps[*]};do
	dep_versions["_${dep}_version"]=$(grep -oP "dependency\('babl'.*version: *'>=\K.*(?='\))"  ${srcdir}/${_gitname}/meson.build)
done

echo "##probed deps versions:" >&2
for key in ${!dep_versions[*]};do echo $key:${dep_versions[$key]};done >&2

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
