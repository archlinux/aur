# mergiraf-bin

An AUR package for [Mergiraf](https://mergiraf.org/) using the pre-built binary release from <https://codeberg.org/mergiraf/mergiraf/releases> ([link to AUR](https://aur.archlinux.org/packages/mergiraf-bin)). See [extra/mergiraf](https://archlinux.org/packages/extra/x86_64/mergiraf/) and [AUR/mergiraf-git](https://aur.archlinux.org/packages/mergiraf-git) for alternatives.

## Update package

1. Make changes
1. Update `pkgver` in `PKGBUILD` if Mergiraf itself updated, and reset `pkgrel` to `1`
1. Update `pkgrel` if `pkgver` did not change, but `PKGBUILD` did, and users should rebuild ([more](https://wiki.archlinux.org/title/Arch_package_guidelines#Package_versioning))
1. Update checksums in `PKGBUILD` by pasting in the result of `make sums`
1. Update `.SRCINFO`with `make srcinfo`
1. Test with `make test`
1. `git add`, `commit` and `push` your changes

## Install package

```sh
make install
```
