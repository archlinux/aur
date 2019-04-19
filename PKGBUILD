# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=mysql-shell
pkgver=8.0.15
pkgrel=1
pkgdesc="An interactive Javascript, Python, or SQL interface supporting development and administration for the MySQL Server."
arch=('x86_64')
url="https://dev.mysql.com/downloads/shell/"
license=('GPL')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://dev.mysql.com/get/Downloads/MySQL-Shell/${pkgname}-${pkgver}-linux-glibc2.12-x86-64bit.tar.gz)
md5sums=('b5fd5361709fa79e7cdb8e773dfbdbd9')
# mysql-build@oss.oracle.com
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-linux-glibc2.12-x86-64bit"
  install -d "${pkgdir}/usr/"
  cp -a * "${pkgdir}/usr/"
}
