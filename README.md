pacfolder
=========

Generate a folder with subfolders for each package managed by pacman containing symlinks to all files belonging to that package.

Install
=======

```bash
cd $(mktemp -d)
wget https://github.com/zvynar/pacfolder/raw/master/PKGBUILD
makepkg
sudo pacman -U "*.pkg.tar.xz"
```
