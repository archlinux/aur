# Archlinux PKGBUILD for swow

This is PKGBUILD for swow, "develop" branch.

## Usage

You may clone this via [github, "git" branch](https://github.com/swow/PKGBUILD/tree/git) or [aur](https://aur.archlinux.org/php-swow-git.git) and use `makepkg` to make archlinux packages

```bash
# clone it
git clone --branch=git https://github.com/swow/PKGBUILD php-swow-git
# cd into it
cd php-swow-git
# make package
makepkg -Cf
# install it
pacman -U php-swow-git-<ver>.tar.zst
```

Or, use an aur helper

```
yay -S php-swow-git
# or
aurman -S php-swow-git
```
