#!/bin/bash -e
# requires asp to be installed

# needed for removing old contents but sparing our files
shopt -s extglob

# cleanup
if [ -d cups ]; then
    rm -r cups
fi
if ls !("_create_package.sh"|"_patch.sed") >/dev/null 2>/dev/null; then
    rm -r !("_create_package.sh"|"_patch.sed")
fi

# get upstream cups package
asp export cups
mv cups/* ./
rmdir cups

# apply our patches
sed -Ef _patch.sed -i PKGBUILD

# seemingly the AUR does not like subdirectories
rm -r -- */

# update metadata
makepkg --printsrcinfo > .SRCINFO
