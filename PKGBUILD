# Maintainer: Andrew Rabert <ar at nullsum dot net>
# Contributor: Andrew Rabert <ar at nullsum dot net>
pkgname=python-undervolt
pkgver=0.2.11
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
sha256sums=('9d4926419ab9334579e0b312b4ec907dd000bc4d0f5441a2dfeecb12d17daad4')

package() {
  cd "${srcdir}/${pyname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
