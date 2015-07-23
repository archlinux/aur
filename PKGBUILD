# Maintainer: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>
pkgname=python-arrow
pkgver=0.6.0
pkgrel=1
pkgdesc="Better dates and times for Python"
arch=('any')
url="http://crsmithdev.com/arrow/"
license=('GPL')
depends=('python')
source=("https://github.com/crsmithdev/arrow/archive/${pkgver}.tar.gz")
sha256sums=("297a9287e5d4256ef7e3f66271fc20fbc54cf790260d6cdd3a1e7495e95bfdd2")

package() {
  cd "${srcdir}/arrow-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et: