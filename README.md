# Termius
 Arch User Repository libqtolm-git

## Update package

* Update package version in PKGBUILD
* Generate new checksums with

```$ updpkgsums```

* Test install

```$ makepkg -si```

* Update .SRCINFO 

```$ makepkg --printsrcinfo > .SRCINFO```
