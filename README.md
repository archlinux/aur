# Lokalise AUR Package
[![Build Status](https://travis-ci.org/famoser/symfony-cli-aur.svg?branch=master)](https://travis-ci.org/famoser/symfony-cli-aur)

## Update package

0. Get newest version from https://github.com/symfony/cli/releases
1. Update package version in PKGBUILD
2. Generate new checksums with `updpkgsums`
3. Test install `makepkg -si`
4. Update .SRCINFO `makepkg --printsrcinfo > .SRCINFO`
5. `git remote add arch ssh://aur@aur.archlinux.org/symfony-cli.git`
6. `git push arch`
