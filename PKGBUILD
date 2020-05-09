# Maintainer: Andrea Orru <andrea at orru dot io>
# Contributor: Andrew Rabert <ar at nullsum dot net>
pkgname=python-undervolt
pkgver=0.3.0
pyname=undervolt
pkgrel=1
pkgdesc="Undervolt Intel CPUs under Linux"
arch=(any)
url="https://github.com/georgewhewell/undervolt"
license=(GPL2)
depends=(python)
makedepends=(python-setuptools)
conflicts=(undervolt)
source=("https://files.pythonhosted.org/packages/source/${pyname:0:1}/${pyname}/${pyname}-${pkgver}.tar.gz")
sha256sums=('ae8d49526ecb68acc15faac860404f6692208b540a0b33781d96396cac862767')

package() {
  cd "${srcdir}/${pyname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
