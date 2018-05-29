aur-activitywatch-bin
=====================

An AUR package for ActivityWatch using prebuilt binaries.


## How to update the AUR package

You need:
 - Maintainer rights to the AUR package
 - Your AUR ssh key configured

After checking that the package builds correctly (using `make package`) simply run:

```sh
make srcinfo
git add srcinfo
git commit -m "Updated .SRCINFO"
git remote add aur aur@aur.archlinux.org/activitywatch-bin.git
git push aur
```
