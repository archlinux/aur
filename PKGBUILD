# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=pdepend
pkgver=2.1.0
pkgrel=1
pkgdesc='A tool for PHP software metrics'
url="http://pdepend.org/"
arch=('any')
license=('BSD')
depends=('php')
install='pdepend.install'
source=("http://static.pdepend.org/php/${pkgver}/pdepend.phar"
        "pdepend.install")
md5sums=('a865a41bc90c8ad121f6055e633f9442'
         '2ac82322f6c7bf452459d422ce1f8bc3')

package() {
  install -D -m 755 "${srcdir}/pdepend.phar" "${pkgdir}/usr/share/webapps/bin/pdepend.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/pdepend.phar "${pkgdir}/usr/bin/pdepend"
}
