# TypoPRO fonts for Archlinux

Archlinux PKGBUILD to install the TypoPRO fonts collection from http://typopro.org/


## Installation

    git clone https://github.com/rshk/ttf-typopro
    cd ttf-typopro
    makepgk .
    sudo pacman -U ttf-typopro-3.4.4-1-any.pkg.tar.xz


## Updating package

To generate ``.SRCINFO``:

    makepkg --printsrcinfo > .SRCINFO


## Note about the license

The official
[package.json](https://github.com/rse/typopro/blob/master/package.json#L6)
lists MIT, Apache 2.0, OFL and CC0 as licenses for the fonts; actually
the *.txt files inside the archive seem to be listing even more of
them -- not sure if this might be a problem when submitting to the
[AUR](https://aur.archlinux.org/)?
