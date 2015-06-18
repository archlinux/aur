# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=python2-darts.util.lru
_pyname=darts.util.lru
pkgver=0.5
pkgrel=1
pkgdesc="Library that provides a simple dictionary with LRU behaviour"
url="https://pypi.python.org/pypi/darts.util.lru"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/d/${_pyname}/${_pyname}-${pkgver}.tar.gz)
sha512sums=('900734e1c93dd91aa844179ed5eb144d2c43e8ce7760d08e5216d87b700e6bdb0062f7585237449708cd95284a353870c9051637199ee95ebe9b54e67ff866e9')

package() {
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
