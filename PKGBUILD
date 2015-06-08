# Maintaner: Dennis Börm <allspark@wormhole.eu
pkgname=('shorewall6-lite')
pkgver=4.6.5
pkgrel=1
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
pkgdesc="An iptables-based firewall for Linux systems (with IPv6 support) ('lite' version)"
depends=('iptables' 'iproute2')
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-$pkgver/shorewall6-lite-$pkgver.tar.bz2)
md5sums=('50c3b9839209a6dbb97d45b16f83e1ce')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
