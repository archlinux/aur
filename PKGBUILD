# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=python2-pyodbc
_srcname=pyodbc
pkgver=3.0.7
pkgrel=1
pkgdesc="ODBC module for Python 2"
arch=('i686' 'x86_64')
url="https://code.google.com/p/pyodbc/"
license=('MIT')
depends=('python2' 'unixodbc')
makedepends=()
options=(!emptydirs)
source=(
  "https://pyodbc.googlecode.com/files/${_srcname}-${pkgver}.zip"
)
sha256sums=(
  'd8355f2d43b10386070e8564aa973119fdb6e10864e1bbd73f3224cd3baab351'
)

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
