# Maintainer: Michael Clayfield <me@michaelclayfield.com>

pkgname=icingaweb2-module-reactbundle
pkgver=0.8.0
pkgrel=1
pkgdesc="ReactPHP-based 3rd party libraries for Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d9519638e99c64ddc7d832846698b78db78fabbf31681e670a9dabb9c983d14f')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/reactbundle"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/reactbundle"

  cp -r vendor composer.json composer.lock module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/reactbundle"
}
