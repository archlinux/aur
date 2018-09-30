# Maintainer: Uko Koknevics <perkontevs@gmail.com>
# Python package author: Charles Leifer <UNKNOWN>
pkgname=python2-unqlite
pkgver=0.7.1
pkgrel=1
pkgdesc="Fast Python bindings for the UnQLite embedded NoSQL database."
arch=(any)
url="https://github.com/coleifer/unqlite-python"
license=(MIT)
makedepends=("python2" "python2-pip")
build() {
  pip2 install --no-deps --target="unqlite" unqlite
}
package() {
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  cp -r $srcdir/unqlite/* $pkgdir/usr/lib/python2.7/site-packages/
}
