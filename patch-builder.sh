#!/bin/sh

# path:   /home/klassiker/.local/share/repos/aur/rxvt-unicode-truecolor-wide-glyphs/patch-builder.sh
# author: klassiker [mrdotx]
# url:    https://aur.archlinux.org/packages/rxvt-unicode-truecolor-wide-glyphs
# date:   2026-05-17T05:04:13+0200

# config
pkgname="rxvt-unicode"
pkgversion="9.31"
extension="tar.bz2"
initial="a"
modified="b"

# helper
build_patch() {
    # prepare patch
    rm -rf "$initial"
    cp -rf "$modified" "$initial"

    # patch modified
    patch -Nup1 -d "$modified" -i "../$1.patch"

    # create new patch
    diff -Naur "$initial/" "$modified/" \
        | sed -e"/^diff -Naur /d" \
                -e "s/^--- \([^ ]*[a-zA-Z]\).*/--- \1/g" \
                -e "s/^+++ \([^ ]*[a-zA-Z]\).*/+++ \1/g" \
            > "$1_new.patch"
}

# prepare release
rm -rf "$initial" "$modified"
tar xvf "$pkgname-$pkgversion.$extension"
mv "$pkgname-$pkgversion" "$modified"

# build patches
build_patch "7-bit-queries"
build_patch "lines-rewrap"
build_patch "24-bit-color"
build_patch "enable-wide-glyphs"
build_patch "improve-font-rendering"
build_patch "osc-110-112-reset"
build_patch "linear-interpolation"
