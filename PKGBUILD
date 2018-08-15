# Maintainer: Andrew Rabert <ar at nullsum dot net>
# Contributor: Andrew Rabert <ar at nullsum dot net>
pkgname=python-undervolt
pkgver=0.2.8
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
sha256sums=('45a6c7b09332b0187080081c720ffa97a2172326b6b7b54cd49a7335c54f73d0')

package() {
  cd "${srcdir}/${pyname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
