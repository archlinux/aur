# README

A build of keepalived for openrc deployment - nothing fancy, nothing special.

### Get

NOTE: we recommend cloning into the ~/.aur/ directory - its not necessary but documentation assumes this location.

- get PKGBUILD: `cd ~/.aur && git clone git@gitlab.com:drad/keepalived.git`

### Build

Build with: `cd ~/.aur/keepalived && makepkg -src`


### Install

Install with: `cd ~/.aur/keepalived && sudo pacman -U keepalived{version}.pkg.tar.zst`

### Remove

Remove with: `sudo pacman -R keepalived`

