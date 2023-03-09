# osbuild-composer PKGBUILD

PKGBUILD for https://github.com/osbuild/osbuild-composer

AUR: https://aur.archlinux.org/packages/osbuild-composer


## Update process

1. Update the `pkgver` variable to the latest release.
2. Run `makepkg --geninteg` and replace the `sha256sums` array with the new hash.
3. Run `makepkg --printsrcinfo > .SRCINFO` and to update the SRCINFO file.
4. Commit changes and push.

## Test changes

You can use the `cleanbuild` script to test that the package builds in a clean
environment and the unit tests pass.
