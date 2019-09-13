#!/bin/sh

sed -r -i 's@^(pkg(name|base) ?= ?)[^ ]+@\1'"$1@" PKGBUILD .SRCINFO

git add PKGBUILD .SRCINFO modify.sh
git commit --amend --reset-author --no-edit

git fetch aur:$1 master:$1
AUR_OVERWRITE=1 git push -f aur:$1 master
