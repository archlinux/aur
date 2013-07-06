PDF Decrypt
===========

Removes password-protection from a PDF-document permanently.

Installation
------------

On Arch Linux simply do:
```bash
cd $(mktemp -d)
wget https://github.com/zvynar/pdf-decrypt/raw/master/PKGBUILD
makepkg
sudo pacman -U *.pkg.tar.xz
```
or
```bash
yaourt -S pdf-decrypt
```

Dependencies:
 - qpdf, a PDF-transformation-program (pdf-decrypt is actually just a small
   wrapper of it).
 - bash (what means: I use bash-features like extended `test` or `function`s)


The bash-file works out of the box, no installation needed. If you want to have
it integrated in your desktop-environment, you can use the desktop-file and
icons. Remember to change the path in the .desktop-file if you do not copy the
files as follows:
 - `pdf-decrypt.bash` -> `/usr/bin/pdf-decrypt`
 - `pdf-decrypt.desktop` -> `/usr/share/applications/pdf-decrypt.desktop`
 - `pdf-decrypt.png` -> `/usr/share/pixmaps/pdf-decrypt.png`

Usage
-----

```bash
pdf-decrypt encrypted.pdf
```
The program will ask for a password and replace the encrypted PDF-file with an
unencrypted version preserving the content (including notes and comments inside
the encrypted version).
