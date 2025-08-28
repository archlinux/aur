# Gitkraken-standalone AUR Package
Forked from [Azd325](https://travis-ci.org/Azd325/gitkraken)'s GitKraken AUR repository with changes required to build/install the [stand-alone version](https://help.gitkraken.com/gitkraken-desktop/serverless/).

## Update package

* Update package version in PKGBUILD
* Generate new checksums with `updpkgsums`
* Test install `makepkg -si`
* Update .SRCINFO `makepkg --printsrcinfo > .SRCINFO`
