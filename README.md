# README

A build of keepalived for openrc deployment - nothing fancy, nothing special.

### Get

NOTE: we recommend cloning into the ~/.aur/ directory - its not necessary but documentation assumes this location.

NOTE: if you are running this as root you will need to preface all commands with `su user -c "command"`

- get PKGBUILD: `cd ~/.aur && git clone https://gitlab.com/drad/keepalived.git`

### Build

Build with: `cd ~/.aur/keepalived && makepkg -src`


### Install

Install with: `cd ~/.aur/keepalived && sudo pacman -U keepalived{version}.pkg.tar.zst`

### Remove

Remove with: `sudo pacman -R keepalived`

