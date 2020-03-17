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

To install a package:
```bash
haur <package names>
```

To search for a package:
```bash
haur <package names>
```

To upgrade a package:
```bash
haur -u <package names>
```

To remove a package:
```bash
haur -r <package names>
```

Deleting a package only removes it from pacman, not the disk. To clear removed packages:
```bash
haur -c
```

## Configuration file

You can use the configuration file to change the behaviour of haur. By default, the configuration file is stored in `/usr/share/haur/haurrc`. However, you can also copy it to `~/.config/haurrc`. These are currently the only supported options.

To disable colors (even if your terminal supports them), set `HAUR_NO_COLORS="y"`

To clear cache even without specifying `-c`, set `HAUR_ALWAYS_CLEAR_CACHE="y"`

If you think of another useful configuration option, tell me in a GitHub issue/pull request and/or an AUR comment.

## Reporting issues

If you have any problems, please leave a comment on the AUR page and/or create a GitHub issue
