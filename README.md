# AUR files for larryshell

This should be run the server that hosts the files required by `PKGBUILD` (currently `jhoughton.me`).

Simply running `make` or `make build` will build and update package sources for the specific version in `PKGBUILD` and `Makefile`.  
To install the package without pushing to AUR or just to test to see if the build worked you can run
```shell
pkgbuild
pacman --noconfirm -U larryshell*.tar.gz
```
To push to the AUR (with its one SSH key), first fetch the repository
```shell
git init
git remote add aur ssh://aur@aur.archlinux.org/larryshell.git
git fetch
```
and then push, making sure that there are no commits that violate the AUR's rules
```
git push aur master
```
