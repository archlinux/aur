# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phploc
pkgver=2.1.3
pkgrel=1
pkgdesc='A tool for quickly measuring the size of a PHP project'
url="https://github.com/sebastianbergmann/phploc"
arch=('any')
license=('BSD')
depends=('php')
source=("https://phar.phpunit.de/phploc-${pkgver}.phar")
md5sums=('4304b744b31f44d5f476b2654caaade5')

package() {
  install -D -m 755 "${srcdir}/phploc-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/phploc.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/phploc.phar "${pkgdir}/usr/bin/phploc"
}
