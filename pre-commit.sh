#!/bin/bash
# git pre-commit hook:
# - Generate the .SRCINFO file and add it to the commit if it changed
# - Generate the sha256sums in the PKGBUILD file and add it to the commit if it changed

# Generate the .SRCINFO file based on the PKGBUILD file
mksrcinfo

# Check if the .SRCINFO file changed
if [ -n "$(git diff --name-only | grep '^.SRCINFO$')" ]; then
  printf "Updated the .SRCINFO file\n"
  git diff .SRCINFO
  git add .SRCINFO
  printf "\nAdded the .SRCINFO file to the commit\n"
fi

# Generate the sha256sums in the PKGBUILD file
updpkgsums

# Remove the archive downloaded by updpkgsums
rm *.tar.gz

# Check if the sha256sums in the PKGBUILD file changed
if [ -n "$(git diff PKGBUILD | grep '^+sha256sums=(.*)$')" ]; then
  printf "Updated the sha256sums in the PKGBUILD file\n"
  git diff PKGBUILD
  git add PKGBUILD
  printf "\nAdded the PKGBUILD file to the commit\n"
fi
