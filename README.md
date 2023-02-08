# LR2oraja PKGBUILD

Automatically install LR2oraja with the bare minimum required to launch + a desktop entry. 

## Caveats

- Does not install `libjportaudio.so` to `/usr/lib/libjportaudio.so`, I'm unsure how to install this one and including it alongside everything else felt wrong. Not sure if an existing package includes this or if theres a better way to handle this 

# Install

```sh
git clone https://github.com/pfych/lr2oraja-pkgbuild
cd ./lr2oraja-pkgbuild
makepkg
sudo pacman -U <package>
```
