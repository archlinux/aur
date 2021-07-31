# kbct

This is a [PKGBUILD](https://wiki.archlinux.org/title/PKGBUILD) script
for [kbct](https://github.com/samvel1024/kbct) -- keyboard keycode
mapping utility for Linux supporting layered configuration.

## Installation

```sh
$ git clone https://aur.archlinux.org/kbct-git.git
$ cd kbct-git
$ makepkg -si
```

## Configuration

The config is expected to be in `/etc/kbct/config.yml`. After you
finish the configuration, you can enable the service:

```sh
$ systemctl start kbct
```
