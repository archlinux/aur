# Maintainer: Andrew Rabert <ar at nullsum dot net>
# Contributor: Andrew Rabert <ar at nullsum dot net>
pkgname=python-undervolt
pkgver=0.2.6
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
sha256sums=('b14d201d1cc4b1d4424ee8ece16656dd5d90fd40bf50dd1f225e9cc7c93c39a3')

package() {
  cd "${srcdir}/${pyname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
