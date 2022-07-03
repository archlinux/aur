#!/bin/bash
cd `dirname $0`; pwd
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO update.sh zshrc LICENSE easy-zsh-config.install
git commit -m 'Updated by update.sh'
git push
git push github

