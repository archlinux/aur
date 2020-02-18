# haur

[![Build Status](https://travis-ci.com/karx1/haur.svg?branch=master)](https://travis-ci.com/karx1/haur) [![AUR version](https://img.shields.io/aur/version/haur)](https://aur.archlinux.org/packages/haur)

*H*elper for the *A*rch *U*ser *R*epository

## Installlation

```bash
git clone https://aur.archlinux.org/haur.git
cd haur
makepkg -si
```

## Usage

Usage is pretty simple.

To install:
```bash
haur <package name>
```

To remove:
```bash
haur -r <package name>
```

Deleting a package only removes it from pacman, not the disk. To clear removed packages:
```bash
haur-clear-cache
```


If you have any problems, please leave a comment on the AUR page and/or create a GitHub issue
