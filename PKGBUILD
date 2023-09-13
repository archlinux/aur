# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-python-tests
pkgver=0.3.0
pkgrel=1
pkgdesc='Osmocom tools for testing VTY/CTRL interfaces'
url='https://gitea.osmocom.org/cellular-infrastructure/osmo-python-tests'
license=('GPL')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/osmo-python-tests.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
