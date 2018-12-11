# Maintainer: Michael Clayfield <me@michaelclayfield.com>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director
pkgver=1.6.0
pkgrel=1
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('db8a65240fd768542d14bfb8cc104bc28e3798005e3fb06d0767bce70cf9b9ea')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #mkdir -p "$pkgdir/etc/webapps/icingaweb2/modules/director"
  mkdir -p "$pkgdir/etc/icingaweb2/modules/director"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  cp -r application contrib doc library public schema test \
    configuration.php module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/icingaweb2/LICENSE"
}
