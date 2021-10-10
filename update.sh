#!/bin/bash
cd `dirname $0`; pwd
updpkgsums
git add PKGBUILD .SRCINFO update.sh
git commit -m 'Updated by update.sh'
git push -u ssh://aur@aur.archlinux.org/vesta-rpm.git

