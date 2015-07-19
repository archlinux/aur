# Maintaner: Dennis Börm <allspark@wormhole.eu>
pkgname=('shorewall6-lite')
pkgver=4.6.11.1
pkgrel=1
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
pkgdesc="An iptables-based firewall for Linux systems (with IPv6 support) ('lite' version)"
depends=('iptables' 'iproute2' "shorewall-core=${pkgver}")
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-4.6.11/shorewall6-lite-$pkgver.tar.bz2)
sha256sums=('652eea165ce004e2835dcace2468d249d8c363654842c89ffc0bb3ee7712be78')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
