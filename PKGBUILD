# Maintainer: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>
pkgname=python-arrow
pkgver=0.7.0
pkgrel=1
pkgdesc="Better dates and times for Python"
arch=('any')
url="http://crsmithdev.com/arrow/"
license=('GPL')
depends=('python' 'python-dateutil' 'python-nose')
source=("https://github.com/crsmithdev/arrow/archive/${pkgver}.tar.gz")
sha256sums=("b09bb271247f134f53fcecc8aa09395c23b04633bdd3db22e28f3efb8ccfcabc")

package() {
  cd "${srcdir}/arrow-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
