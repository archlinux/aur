# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director
pkgver=1.2.0
pkgrel=1
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cbcbcb8b985e853626d4c7fe0974f7a68d718b63f725b0ec0d9cf105b3fec371')

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
