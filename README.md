# arch-manwarn-aur

PKGBUILD Mirror

How to update package on the aur:

```
# Edit PKGBUILD manually (update version, source, etc.)

updpkgsums

makepkg --printsrcinfo > .SRCINFO

git add .
git commit -m "Update PKGBUILD version, checksums, and .SRCINFO"

git push aur master
git push origin master
```
