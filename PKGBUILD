# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python2-jaydebeapi
pkgver=0.2.0
pkgrel=1
pkgdesc="A bridge from JDBC database drivers to Python DB-API"
arch=('any')
url="https://github.com/baztian/jaydebeapi"
license=('GPL3')
makedepends=('python2')
depends=('python2' 'python2-jpype1' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/J/JayDeBeApi/JayDeBeApi-${pkgver}.tar.gz")
sha256sums=('f34f7d8215207fd8c597bdf547c56ef6fe29cebd8114b9729746757f53133cfa')

package() {
  cd "JayDeBeApi-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

