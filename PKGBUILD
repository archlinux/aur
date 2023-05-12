# Maintainer: Anthony25 <Anthony Ruhier>

pkgname=python-pyqos
pkgver=0.3.0
pkgrel=2
pkgdesc="QoS framework using tc for Python"
arch=(any)
url="https://github.com/Anthony25/pyqos"
license=(BSD)
makedepends=(
  python-setuptools
)
depends=()
options=(!emptydirs)
source=("https://github.com/Anthony25/pyqos/archive/${pkgver}.tar.gz")
sha256sums=('934955a79f88ab97537ac9d83bb8e0165db2460b42754c4150c2e8654c5f804a')

package() {
  cd "${srcdir}/pyqos-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
