#!/bin/bash
#source PKGBUILD
_gitname=gimp
srcdir=$PWD/src

declare -A dep_versions
#readonly -a deps=(pygtk gexiv2 poppler poppler_data libmypaint gtkdoc cairo babl lcms wmf gexiv2 rsvg openexr libmypaint appstream_glib introspection)
readonly -a deps=(atk babl cairo fontconfig freetype2 gdk_pixbuf gegl exiv2 gexiv2 glib gtk3 harfbuzz lcms libmypaint pango rsvg appstream_glib libtiff liblzma libpng openexr webp libheif webkit poppler poppler_data cairopdf wmf openjpeg jpegxl python3 native_glib )

## add legacy deps from autotools, missing from meson
dep_versions["_gtkdoc_version"]="1.0"
dep_versions["_introspection_version"]="1.32.0"

echo "##update sources"
makepkg -Co
echo "##finish updating sources"

## probe meson.build for dependencies versions
# the rest have standard form of "[{dep_name}_raqured_version], [{version}]"
for dep in "${deps[@]}";do
	dep_versions["_${dep}_version"]=$(grep -oP "^${dep}_minver\s+=\s+'[<>=]*\K[0-9.]+(?='$)" "${srcdir}"/${_gitname}/meson.build)
done

echo "##probed deps versions:" >&2
for key in ${!dep_versions[*]};do echo "$key:${dep_versions[$key]}";done >&2

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
