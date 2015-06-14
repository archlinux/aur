# Maintainer: Thayne McCombs <>
pkgname=celestia-m42-plugin
pkgver=1
pkgrel=2
pkgdesc="Celestia Plugin for M42 (The Orion Nebula)"
arch=('any')
url="http://celestiamotherlode.net/catalog/messiernebulae.php"
license=('unknown')
depends=('celestia')
source=('http://celestiamotherlode.net/creators/praesepe/M42.zip')
md5sums=('74401d4bdac85d5a7cb9a3093d47b7cd')

package() {
  cd "$srcdir"
  install -dD "$pkgdir/usr/share/celestia/extras"
  cp -r M42 "$pkgdir/usr/share/celestia/extras"
}

# vim:set ts=2 sw=2 et:
