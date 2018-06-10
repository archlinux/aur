# Maintainer: Andrew Rabert <ar at nullsum dot net>
# Contributor: Andrew Rabert <ar at nullsum dot net>
pkgname=python-undervolt
pkgver=0.2.5
pkgrel=1
pkgdesc="Undervolt Intel CPUs under Linux"
arch=(any)
url="https://github.com/georgewhewell/undervolt"
license=(GPL2)
depends=(python)
makedepends=(python-setuptools)
conflicts=(undervolt)
source=("https://files.pythonhosted.org/packages/ce/b8/91d88d8bef9b07cd6555b6bdbf995d921a49504e894a1d739e22cc19f5d5/undervolt-0.2.5.tar.gz")
sha256sums=('3a0a822c31fa4cec5b50a23b960625c30a4a006007f066a7ac655964a81f48b6')

package() {
  cd "${srcdir}/undervolt-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
