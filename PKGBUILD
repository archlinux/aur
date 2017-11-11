# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director
pkgver=1.4.2
pkgrel=1
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a62f48da777ab8c04c64a933f68e30e956b6d5c7b89874703f2c2ddb6363936a')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #mkdir -p "$pkgdir/etc/webapps/icingaweb2/modules/director"
  mkdir -p "$pkgdir/etc/icingaweb2/modules/director"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  cp -r application doc library public schema test \
    configuration.php module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/icingaweb2/LICENSE"
}
