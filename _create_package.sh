#!/bin/bash -e
# requires devtools to be installed

# needed for removing old contents but sparing our files
shopt -s extglob

# cleanup
if [ -d cups ]; then
    echo "[ ] Removing old cups directory"
    rm -r cups
fi
if ls !("_create_package.sh"|"_patch.sed"|"_docker_validate.sh") >/dev/null 2>/dev/null; then
    echo "[ ] Removing old files (except ours)"
    rm -r !("_create_package.sh"|"_patch.sed"|"_docker_validate.sh")
fi

echo "[ ] Cloning cups"
pkgctl repo clone --protocol=https cups
echo "[#] Cloned cups"
rm -rf cups/.git/
mv cups/* ./
rmdir cups

# apply our patches
echo "[ ] Applying patches"
sed -Ef _patch.sed -i PKGBUILD
echo "[#] Applied patches"

# seemingly the AUR does not like subdirectories
echo "[ ] Removing subdirectories"
rm -vr -- */

# update metadata
echo "[ ] Updating metadata"
makepkg --printsrcinfo > .SRCINFO

echo "[ ] Validating package using docker"
docker pull archlinux
docker run --rm -e MAKEFLAGS -v "$(pwd):/source:ro" archlinux /source/_docker_validate.sh || (echo "[!] Failed to validate package using docker" && exit 1)
echo "[#] Validated package using docker"
