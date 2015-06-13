# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname="python2-jaydebeapi"
pkgver=0.1.4
pkgrel=1
pkgdesc="A bridge from JDBC database drivers to Python DB-API"
arch=(any)
url="https://launchpad.net/jaydebeapi"
license=('GPL3')
makedepends=('python2')
depends=('python2' 'jpype')
source=("https://pypi.python.org/packages/source/J/JayDeBeApi/JayDeBeApi-${pkgver}.tar.gz")
md5sums=('71db1776c90d2ba77d889aeb4b193627')

package() {
  cd "JayDeBeApi-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

