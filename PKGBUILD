# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-intelhex
pkgver=2.1
pkgrel=1
pkgdesc='library provides support for reading, modifying, writing Intel HEX files'
arch=('any')
url='https://github.com/bialix/intelhex'
license=(BSD)
depends=(python2)
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/I/IntelHex/intelhex-$pkgver.tar.gz)
sha1sums=('5da7d20625c714bf931de92c115d8d3e21275fbb')

package() {
  cd intelhex-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/license.txt"
}
