# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=python2-gwebsockets
_pkgname=gwebsockets
pkgver=0.4
pkgrel=2
pkgdesc="GLib based websocket server written in python"
arch=('any')
url="https://github.com/dnarvaez/gwebsockets"
license=('Apache')
depends=('python2-gobject')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dnarvaez/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('001d42a7d3adf2613f29e072a6488048c93800af3e3288df1c24e3e69da7e7e9')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
