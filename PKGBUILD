# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=pdepend
pkgver=2.1.0
pkgrel=1
pkgdesc='A tool for PHP software metrics'
url="http://pdepend.org/"
arch=('any')
license=('GPLv3')
depends=('php')
source=("http://static.pdepend.org/php/${pkgver}/pdepend.phar"
				"pdepend.install")
md5sums=('a865a41bc90c8ad121f6055e633f9442'
         '301f5f1b4a50992db3d93f1b5178bad5')

package() {
  install -D -m 755 "${srcdir}/pdepend.phar" "${pkgdir}/usr/share/webapps/bin/pdepend.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/pdepend.phar "${pkgdir}/usr/bin/pdepend"
}
