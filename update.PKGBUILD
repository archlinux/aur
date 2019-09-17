#!/bin/bash
#source PKGBUILD
_gitname=gimp
srcdir=$PWD/src

declare -A dep_versions
readonly -a deps=(pygtk gexiv2 poppler poppler_data libmypaint gtkdoc cairo babl lcms wmf gexiv2 rsvg openexr libmypaint appstream_glib introspection)

echo "##update sources"
makepkg -Co
echo "##finish updating sources"

## probe configure.ac for dependencies versions
# gegl version is broken to major_minor|micro those need to be probled separately
dep_versions["_gegl_version"]=$(printf "%s.%s" $(grep -oP '\[gegl_(major_minor|micro)_version\], \[\K[0-9.]*' ${srcdir}/${_gitname}/configure.ac))
# the rest have standard form of "[{dep_name}_raqured_version], [{version}]"
for dep in ${deps[*]};do
	dep_versions["_${dep}_version"]=$(grep -oP "(\[${dep}_required_version\], \[)\K[0-9.]*" ${srcdir}/${_gitname}/configure.ac)
done

echo "##probed deps versions:" >&2
for key in ${!dep_versions[*]};do echo $key:${dep_versions[$key]};done >&2

echo "##generate PKGBUILD" >&2
cp -v --backup=numbered PKGBUILD.in PKGBUILD
for key in ${!dep_versions[*]};do sed -i "s/@${key}@/${dep_versions[${key}]}/" PKGBUILD;done >&2
echo "##finish generating PKGBUILD"

echo "##update pkgver"
makepkg -eo
echo "##finish updating pkgver"

echo "##generate .SRCINFO" >&2
makepkg --printsrcinfo > .SRCINFO
echo "##finish updating package" >&2
