# Maintaner: Dennis Börm <allspark@wormhole.eu>
pkgname=('shorewall6-lite')
pkgver=4.6.11
pkgrel=1
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
pkgdesc="An iptables-based firewall for Linux systems (with IPv6 support) ('lite' version)"
depends=('iptables' 'iproute2' "shorewall-core=${pkgver}")
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-4.6.11/shorewall6-lite-$pkgver.tar.bz2)
sha256sums=('fb9a4a42d39e3277c7f49fc09eacb6e347bc08485281c578cacce8429a055a84')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
