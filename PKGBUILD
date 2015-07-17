# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phpmetrics
pkgver=1.1.1
pkgrel=1
pkgdesc=''
url="http://www.phpmetrics.org/"
arch=('any')
license=('MIT')
depends=('php')
source=("https://github.com/Halleck45/PhpMetrics/raw/v${pkgver}/build/phpmetrics.phar")
md5sums=('fbc5f2d0f3930f0a941077bd2566a594')

package() {
  install -D -m 755 "${srcdir}/phpmetrics.phar" "${pkgdir}/usr/share/webapps/bin/phpmetrics.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/phpmetrics.phar "${pkgdir}/usr/bin/phpmetrics"
}
