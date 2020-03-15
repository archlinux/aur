# Maintainer: Michael Clayfield <me@michaelclayfield.com>

pkgname=icingaweb2-module-ipl
pkgver=0.5.0
pkgrel=1
pkgdesc="The Icinga PHP library for Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3f6caac4d06e7b0f1915640ad3afeb584033731afa504f574e79d74810f160c7')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/ipl"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/ipl"

  cp -r vendor composer.json composer.lock module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/ipl"
}
