# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-intelhex
pkgver=1.5
pkgrel=1
pkgdesc='library provides support for reading, modifying, writing Intel HEX files'
arch=('any')
url='http://www.bialix.com/intelhex/'
license=(BSD)
depends=(python2)
makedepends=('python2-setuptools')
source=(https://launchpad.net/intelhex/trunk/1.5/+download/intelhex-$pkgver.tar.gz)
sha1sums=('37657539645754d75e6718bc06274ce55751e782')

package() {
  cd intelhex-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/license.txt"
}
