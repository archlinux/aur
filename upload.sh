#!/bin/bash
echo "Enter the commit message: "
read commit_message
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO upload.sh
git commit -m "$commit_message"
