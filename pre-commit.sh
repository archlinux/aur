#!/bin/bash
# git pre-commit hook: Generate the .SRCINFO file and add it to the commit if it changed

# Generate the .SRCINFO file based on the PKGBUILD file
mksrcinfo

# Check if the .SRCINFO file changed
if [ -n "$(git diff --name-only | grep ^.SRCINFO$)" ]; then
  printf "Updated .SRCINFO file\n"
  git diff .SRCINFO
  git add .SRCINFO
  printf "\nAdded .SRCINFO file to the commit\n"
fi
