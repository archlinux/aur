# Maintainer: Patrick Salecker <mail at salecker dot org>


pkgname=python-kismet-rest
pkgver=2019.05.02
pkgrel=1
pkgdesc="Kismet REST Python API"
arch=('any')
url="https://github.com/kismetwireless/python-kismet-rest"
license=('GPL2')
depends=('python-requests')
source=("https://github.com/kismetwireless/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6a26d0ce0f86501d93812e28744c0591441e1e114103cb5041431d7f6ea6f414')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
