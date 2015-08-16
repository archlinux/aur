# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python2-jaydebeapi
pkgver=0.1.4
pkgrel=2
pkgdesc="A bridge from JDBC database drivers to Python DB-API"
arch=('any')
url="https://github.com/baztian/jaydebeapi"
license=('GPL3')
makedepends=('python2')
depends=('python2' 'python2-jpype1' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/J/JayDeBeApi/JayDeBeApi-${pkgver}.tar.gz")
sha256sums=('a08cdb69038904215ae84b5adf28e21fc8d9efeaded1401a6c3d23632c47f07a')

package() {
  cd "JayDeBeApi-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

