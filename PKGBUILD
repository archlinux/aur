# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-intelhex
pkgver=2.0
pkgrel=1
pkgdesc='library provides support for reading, modifying, writing Intel HEX files'
arch=('any')
url='http://www.bialix.com/intelhex/'
license=(BSD)
depends=(python2)
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/I/IntelHex/intelhex-$pkgver.tar.gz)
sha1sums=('a817f12d2cd3f2f3030102e7cd4f37917cb5a30c')

package() {
  cd intelhex-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/license.txt"
}
