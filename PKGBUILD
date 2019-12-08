# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-google-i18n-address
_pkgname=google-i18n-address
pkgver=2.3.5
pkgrel=1
pkgdesc='Library providing a mutable, self-balancing interval tree for Python.'
arch=(any)
url=https://github.com/mirumee/google-i18n-address.git
license=('Apache')
depends=(python)
makedepends=(python-setuptools)
source=(${_pkgname}-$pkgver.tar.gz::https://github.com/mirumee/${_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('235d619fdf126d9c8607e0bd3ad86784eed6d2357e148ae647e48c66549d01a7')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
