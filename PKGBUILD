# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=python-zbarlight
_pkgname=zbarlight
pkgver=1.0.1
pkgrel=2
pkgdesc='A simple wrapper for zbar'
arch=(any)
url=https://github.com/Polyconseil/zbarlight
license=('MIT')
depends=(zbar-headless)
makedepends=(python-setuptools unzip)
source=(https://github.com/Polyconseil/${_pkgname}/archive/${pkgver}.zip)
md5sums=('67844fda033adac1d1c3c09547fd29fc')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
