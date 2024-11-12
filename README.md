# mergiraf-bin

An AUR package for [Mergiraf](https://mergiraf.org/) using prebuilt binaries.

## Update package

1. Make changes
1. Update checksums in `PKGBUILD` based on `makepkg --geninteg`
1. Update `pkgver` if Mergiraf itself updated
1. Update `pkgrel` if `pkgver` did not, but `PKGBUILD` did, and users should rebuild ([more](https://wiki.archlinux.org/title/Arch_package_guidelines#Package_versioning))
1. Update `.SRCINFO`with `makepkg --printsrcinfo > .SRCINFO`
1. Test with `namcap PKGBUILD`
1. And `namcap *.pkg.tar.zst`

## Install package

```sh
makepkg --install
```
