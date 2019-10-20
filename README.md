# Lokalise AUR Package
[![Build Status](https://travis-ci.org/famoser/lokalise-aur.svg?branch=master)](https://travis-ci.org/famoser/lokalise-aur)

## Update package

0. Get package version from https://docs.lokalise.com/api-and-cli/lokalise-cli-tool
1. Update package version in PKGBUILD
2. Generate new checksums with `updpkgsums`
3. Test install `makepkg -si`
4. Update .SRCINFO `makepkg --printsrcinfo > .SRCINFO`
5. `git remote add arch ssh://aur@aur.archlinux.org/lokalise.git`
6. `git push arch`
