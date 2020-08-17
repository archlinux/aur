# AUR Package for Conduit (Matrix Homeserver)

An AUR package for [Conduit](https://git.koesters.xyz/timo/conduit)

## Requisites

- AUR compatible distribution
- systemd (as this package installs a systemd-service and uses other systemd specific mechanisms)

## Install

From this repository:

```bash
git clone https://github.com/S7evinK/conduit-archlinux
cd conduit-archlinux
makepkg -i
```

Using your favorite AUR Helper:

```bash
yay -S matrix-conduit-git
pacaur -S matrix-conduit-git
```
