aur-activitywatch-bin
=====================

An AUR package for ActivityWatch using prebuilt binaries.


## How to update the AUR package

You need:
 - Maintainer rights to the AUR package
 - Your AUR ssh key configured

After modifying `PKGBUILD` as appropriate, and testing the package on your machine, run the following to:
 - build the package
   - updates checksums with `updpkgsums`
   - regenerates `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`
 - commit the changes
 - push to the AUR
```sh
make package
git add PKGBUILD .SRCINFO
git commit -m "Updated .SRCINFO"
git remote add aur aur@aur.archlinux.org/activitywatch-bin.git
git push aur
```
