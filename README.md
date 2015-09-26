# Arch User Repository nginx-passenger-git

### Maintainer: [illuser](mailto:lykouleon.eve@gmail.com)

## Goals

* Maintain PKGBUILD symmetrically with [[extra/nginx]](https://www.archlinux.org/packages/extra/x86_64/nginx)
* Avoid PKGBUILD bloat and unnecessary dependencies
* [Freedom](https://wiki.installgentoo.com/index.php/Freedom)

## Sources
* [Nginx Stable](http://nginx.org/en/download.html)
* [Phusion Passenger](https://github.com/phusion/passenger)

## Dependencies
* openssl
* pcre
* zlib
* geoip
* ruby
* hardening-wrapper (make)
* git (make)

## Optional Dependencies
* nodejs: Support for webapps running on nodejs
* iojs: Support for webapps running on nodejs, using iojs's fork of nodejs
* python: Support for webapps running on python (django, grok, flask, pylons, pyramid...)
* meteorjs: Support for webapps running on meteorjs
* clang: Faster compiling of nginx
* ccache: Faster re-compiling of nginx

## Installation

From AUR4

```bash
yaourt -S nginx-passenger-git

packer -S nginx-passenger-git

aura -A nginx-passenger-git
```

From source
```bash
git clone https://github.com/illuser/aur-nginx-passenger-git
cd aur-nginx-passenger-git
makepkg # --clean --syncdeps --install
(sudo) pacman -U nginx-passenger-git*.pkg.tar.xz
```

## Licenses
* [nginx](http://nginx.org/LICENSE)
* [Phusion Passenger](https://raw.githubusercontent.com/phusion/passenger/stable-5.0/LICENSE)
