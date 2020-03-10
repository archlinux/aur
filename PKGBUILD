# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-mouselog
pkgver=0.1.0
pkgrel=1
pkgdesc='Log mouse movement'
arch=(any)
url='https://github.com/xyproto/mouselog'
license=(GPL2)
depends=(python)
makedepends=(git python-setuptools)
# tag: 0.1.0
source=("git+$url#commit=28eae03f7d813358d37b0b9224f5ae809dc359da")
md5sums=('SKIP')

build() {
  cd mouselog
  python setup.py build
}

package() {
  cd mouselog
  python setup.py install --root="$pkgdir" --optimize=1
}

# getver: github.com/xyproto/mouselog
# vim: ts=2 sw=2 et:
