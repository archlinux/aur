#!/bin/sh

function verify
{
    git clean -fdx
    makepkg --verifysource
}

function srcinfo
{
    makepkg --printsrcinfo > SRCINFO \
        && mv SRCINFO .SRCINFO
}

case "$1" in
    "srcinfo")
        srcinfo
        ;;
    "verify")
        verify
        ;;
    "update")
        verify || (updpkgsums \
                       && sed -e "s/^\(pkgver=\).*/\1$(date +%y.%m.%d)/g" \
                              -e "s/\.0/\./g" \
                              -i PKGBUILD \
                       &&  srcinfo \
                       && git add PKGBUILD .SRCINFO \
                       && git commit -m "Update src checksum")
        ;;
esac
