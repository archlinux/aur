# Maintaner: Dennis Börm <allspark@wormhole.eu>
pkgname=('shorewall6-lite')
pkgver=4.6.10.1
pkgrel=1
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
pkgdesc="An iptables-based firewall for Linux systems (with IPv6 support) ('lite' version)"
depends=('iptables' 'iproute2' "shorewall-core=${pkgver}")
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-4.6.10/shorewall6-lite-$pkgver.tar.bz2)
sha256sums=('ce19583541f5eb39acad33099af087d030374d467eb64aa4415ac9b18e65c5a8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
