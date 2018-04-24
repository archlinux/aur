# Maintainer: Andrew Rabert <ar at nullsum dot net>
# Contributor: Andrew Rabert <ar at nullsum dot net>
pkgname=python-undervolt
pkgver=0.2.4
pkgrel=1
pkgdesc="Undervolt Intel CPUs under Linux"
arch=(any)
url="https://github.com/georgewhewell/undervolt"
license=(GPL2)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/72/06/0b589ab9d20fd58596cc20ba8e14c21b42612b608ede43851263b13a927c/undervolt-${pkgver}.tar.gz")
sha256sums=('d352aaaab2d00bca1d045998b7db3a833ba560537cf6ad442040dbd967c2e48b')

package() {
  cd "${srcdir}/undervolt-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
