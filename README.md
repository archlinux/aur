# Lokalise AUR Package
[![Build Status](https://travis-ci.com/famoser/symfony-cli-aur.svg?branch=master)](https://travis-ci.com/famoser/symfony-cli-aur)

## Update package

0. Get newest version from https://github.com/symfony/cli/releases
1. Update package version in PKGBUILD
2. Execute `update.sh`

or 

3. Generate new checksums with `updpkgsums`
4. Test install `makepkg -si`
5. Update .SRCINFO `makepkg --printsrcinfo > .SRCINFO`
6. `git remote add arch ssh://aur@aur.archlinux.org/symfony-cli.git`
7. `git push arch`
