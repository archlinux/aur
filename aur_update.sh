#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 \"commit message\""
    exit 1
fi

./dev/uninstall.sh

if ! git remote | grep -q "^origin$"; then
    git remote add origin ssh://aur@aur.archlinux.org/cmdcreate.git
fi

cd AUR || exit

nano PKGBUILD

makepkg --printsrcinfo > .SRCINFO 2> /dev/null

git add PKGBUILD .SRCINFO

if git diff-index --quiet HEAD --; then
    echo "No changes to commit, skipping commit step."
else
    git commit -m "$1"
fi

git pull --rebase origin master

git push origin master

echo -e "\ndone"
