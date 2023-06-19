#!/bin/bash -e
# requires devtools to be installed

# needed for removing old contents but sparing our files
shopt -s extglob

# cleanup
if [ -d cups ]; then
    rm -r cups
fi
if ls !("_create_package.sh"|"_patch.sed"|"_docker_validate.sh") >/dev/null 2>/dev/null; then
    rm -r !("_create_package.sh"|"_patch.sed"|"_docker_validate.sh")
fi

# get upstream cups package
pkgctl repo clone --protocol=https cups
rm -rf cups/.git/
mv cups/* ./
rmdir cups

# apply our patches
sed -Ef _patch.sed -i PKGBUILD

# seemingly the AUR does not like subdirectories
rm -r -- */

# update metadata
makepkg --printsrcinfo > .SRCINFO

echo "[ ] Validating package using docker"
docker run --rm -e MAKEFLAGS -v "$(pwd):/source:ro" archlinux /source/_docker_validate.sh || (echo "[!] Failed to validate package using docker" && exit 1)
echo "[#] Validated package using docker"
