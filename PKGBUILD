# Maintainer: Anthony25 <Anthony Ruhier>

pkgname=python-pyqos
pkgver=0.2.2
pkgrel=1
pkgdesc="QoS framework using tc for Python"
arch=(any)
url="https://github.com/Anthony25/pyqos"
license=(BSD)
makedepends=(
  python-setuptools
)
depends=(
  python-argparse
)
options=(!emptydirs)
source=("https://github.com/Anthony25/pyqos/archive/${pkgver}.tar.gz")
sha256sums=('81001a6ee8e9cb8de079b8d54f73c96036857457a38c6c6e10996d682cc0567b')

package() {
  cd "${srcdir}/pyqos-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
