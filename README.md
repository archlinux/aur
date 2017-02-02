# AUR files for larryshell

This should be run the server that hosts the files required by `PKGBUILD` (currently [jhoughton.me](https://jhoughton.me/larryshell)).

Simply running `./build.sh` will build and update package sources. The version number is the SHA hash of the latest [larryshell](https://github.com/Devon-Austin-Wood-Thomas/larryshell) commit. 
To install the package without pushing to AUR or just to test to see if the build worked you can run
```shell
pkgbuild
pacman --noconfirm -U larryshell*.tar.gz
```
To push to the AUR (with its own SSH key), first fetch the repository
```shell
git init
git remote add aur ssh://aur@aur.archlinux.org/larryshell.git
git fetch
```
and then push, making sure that there are no commits that violate the AUR's rules
```
git push aur master
```
