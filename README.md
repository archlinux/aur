# mergiraf-bin

An AUR package for [Mergiraf](https://mergiraf.org/) using the pre-built binary release

## Update package

1. Make changes
1. Update `pkgver` if Mergiraf itself updated
1. Update `pkgrel` if `pkgver` did not, but `PKGBUILD` did, and users should rebuild ([more](https://wiki.archlinux.org/title/Arch_package_guidelines#Package_versioning))
1. Update checksums in `PKGBUILD` by pasting in the result of `make sums`
1. Update `.SRCINFO`with `make srcinfo`
1. Test with `make test`
1. `git commit` your changes

## Install package

```sh
make install
```
