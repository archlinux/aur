# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python2-jaydebeapi
pkgver=0.1.5
pkgrel=1
pkgdesc="A bridge from JDBC database drivers to Python DB-API"
arch=('any')
url="https://github.com/baztian/jaydebeapi"
license=('GPL3')
makedepends=('python2')
depends=('python2' 'python2-jpype1' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/J/JayDeBeApi/JayDeBeApi-${pkgver}.tar.gz")
sha256sums=('37d065a1033a08aa716bff049cf61b989102e7f5141501cb9d4df39769de0b33')

package() {
  cd "JayDeBeApi-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

