#!/usr/bin/env bash

git add PKGBUILD .gitignore .SRCINFO .gitignore
source ./PKGBUILD
git commit -m "feature: Update to ${pkgver}"
