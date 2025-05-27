#!/bin/sh

makepkg --printsrcinfo >.SRCINFO
git add PKGBUILD .SRCINFO kak-tree-sitter.install
git commit -m "bumped version"
git push
