#!/usr/bin/env bash
# git pre-commit hook:
# - Generate the checksums in the PKGBUILD file and add it to the commit if needed
# - Generate the .SRCINFO file and add it to the commit if needed
# - Validate the PKGBUILD file

# Generate the checksums in the PKGBUILD file
updpkgsums

# Remove the archive downloaded by updpkgsums
rm *.tar.gz

# Check if the checksums in the PKGBUILD file changed
if [ -n "$(git diff PKGBUILD | grep '^+md5sums=(.*)$')" ]; then
  printf "Updated the checksums in the PKGBUILD file\n"
  git add PKGBUILD
  printf "Added the PKGBUILD file to the commit\n"
fi

# Generate the .SRCINFO file based on the PKGBUILD file
mksrcinfo

# Check if the .SRCINFO file was created/changed
if [ -n "$(git status --short | grep ' .SRCINFO$')" ]; then
  printf "Updated the .SRCINFO file\n"
  git add .SRCINFO
  printf "Added the .SRCINFO file to the commit\n"
fi

# Validate the PKGBUILD file by "making" it
makepkg

# Check if the package was successfully built
if [ $? -eq 0 ]; then
  printf "The package was successfully built\n"
fi

# Remove directories and files created/downloaded by makepkg
rm --force --recursive pkg src *.pkg.tar.xz *.tar.gz
