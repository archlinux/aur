# Maintainer: Michael Clayfield <me@michaelclayfield.com>

pkgname=icingaweb2-module-ipl
pkgver=0.3.0
pkgrel=1
pkgdesc="The Icinga PHP library for Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2dc82adfd995c45d01f1d136d9eed8d8f1a942a97aacc52476402f750e1d3808')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/ipl"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/ipl"

  cp -r vendor composer.json composer.lock module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/ipl"
}
