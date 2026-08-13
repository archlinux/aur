# arch-manwarn-bin-aur

PKGBUILD mirror for the `arch-manwarn-bin` AUR package.

How to update the package on the AUR:

```bash
# Edit PKGBUILD manually:
# update pkgver, source, and sha256sums if necessary

updpkgsums

makepkg --printsrcinfo > .SRCINFO

git add PKGBUILD .SRCINFO README.md
git commit -m "Update PKGBUILD version, checksums, and .SRCINFO"

git push aur master
git push origin master
```
