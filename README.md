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

Usage
=====

```bash
pacfolder /apps/
```
This will make a new folder _/apps/_ and put one folder for each package inside it. Each of these folders gets
filled with sumbolic links to the files belonging to that package. Files in typical folders like _/etc/_ or _/usr/bin/_ will
be put into sub-folders like _/apps/[package-name]/config_ or _/apps/[package-name]/binaries_ ect.. Files that can not be
catigoriced go to _/apps/[package-name]/misc_.
