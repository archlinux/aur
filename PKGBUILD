# Maintaner: Dennis Börm <allspark@wormhole.eu>
pkgname=('shorewall-lite')
pkgver=4.6.10.1
pkgrel=1
pkgdesc="An iptables-based firewall for Linux systems ('lite' version)"
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
depends=('iptables' 'iproute2' "shorewall-core=${pkgver}")
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-4.6.10/$pkgname-$pkgver.tar.bz2)
sha256sums=('9944da74b9496fe29afe6ebab8f4a37cfb24a6a701282231dd6916831e064c38')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
