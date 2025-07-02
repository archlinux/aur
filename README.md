# OBS for Arch Linux with websockets

This repository provides a PKGBUILD for OBS Studio on Arch Linux, including WebSocket support.

The problem with obs-studio is that it does not include websockets.
Since I use streamdeck and need a way to communicate to obs, I maintain this hack, until this gets merged:

https://bugs.archlinux.org/task/76710?project=5&string=obs-studio
https://github.com/obsproject/obs-studio/pull/7475

The github action in this repository creates a tarball with alle the plugins (including websockets). This version includes Websockets, but disables NVenc.

## Manual Installation

```
yay -S qrcodegencpp-cmake #this is an AUR depenendcy that must be installed beforehand
git clone https://aur.archlinux.org/obs-studio-with-websockets.git
MAKEFLAGS="-j$(nproc)" makepkg -Acs
sudo pacman -U obs-studio-with-websockets-31.0.4-1-x86_64.pkg.tar.zst
```

## Installation with yay

This is the package here:

https://aur.archlinux.org/packages/obs-studio-with-websockets

```
yay -S obs-studio-with-websockets
```

## Release (maintainers only)

To create a release, run

```
rm .SRCINFO && makepkg --printsrcinfo > .SRCINFO
```