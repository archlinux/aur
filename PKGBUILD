# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python2-jaydebeapi
pkgver=0.1.6
pkgrel=1
pkgdesc="A bridge from JDBC database drivers to Python DB-API"
arch=('any')
url="https://github.com/baztian/jaydebeapi"
license=('GPL3')
makedepends=('python2')
depends=('python2' 'python2-jpype1' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/J/JayDeBeApi/JayDeBeApi-${pkgver}.tar.gz")
sha256sums=('3234c39d2d3d36f876dab9919db13a2eb4d76382a21c92cee047c19da8332b31')

package() {
  cd "JayDeBeApi-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

