# Maintainer: Uko Koknevics <perkontevs@gmail.com>
# Python package author: Charles Leifer <UNKNOWN>
pkgname=python-unqlite
pkgver=0.7.1
pkgrel=1
pkgdesc="Fast Python bindings for the UnQLite embedded NoSQL database."
arch=(any)
url="https://github.com/coleifer/unqlite-python"
license=(MIT)
makedepends=("python" "python-pip")
build() {
  pip install --no-deps --target="unqlite" unqlite
}
package() {
  mkdir -p $pkgdir/usr/lib/python3.6/site-packages/
  cp -r $srcdir/unqlite/* $pkgdir/usr/lib/python3.6/site-packages/
}
