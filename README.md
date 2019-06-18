# Gitkraken-standalone AUR Package
Forked from [Azd325](https://travis-ci.org/Azd325/gitkraken)'s GitKraken AUR repository with changes required to build/install the [stand-alone version](https://support.gitkraken.com/standalone/standalone).

## Update package

* Update package version in PKGBUILD
* Generate new checksums with `updpkgsums`
* Test install `makepkg -si`
* Update .SRCINFO `makepkg --printsrcinfo > .SRCINFO`
