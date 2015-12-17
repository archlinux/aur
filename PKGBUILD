# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=uwsgi-plugin-cares
pkgver=1.0
pkgrel=1
pkgdesc="uWSGI plugin for integration with the c-ares async dns library"
url="https://github.com/unbit/uwsgi-cares"
arch=('x86_64' 'i686')
license=('MIT')
depends=('uwsgi' 'c-ares')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=

build() {
  uwsgi --build-plugin https://github.com/unbit/uwsgi-cares
}

package() {
  install -Dm755 cares_plugin.so "$pkgdir/usr/lib/uwsgi/cares_plugin.so"
}

# vim:set ts=2 sw=2 et:
