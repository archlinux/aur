# Maintaner: Dennis Börm <allspark@wormhole.eu
pkgname=('shorewall6-lite')
pkgver=4.6.10
pkgrel=1
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
pkgdesc="An iptables-based firewall for Linux systems (with IPv6 support) ('lite' version)"
depends=('iptables' 'iproute2' 'shorewall-core=4.6.10')
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-$pkgver/shorewall6-lite-$pkgver.tar.bz2)
sha256sums=('651120aa33bf9177b226e75bf7f8f1b3a2cf7050ac6d6038899aaf795d2ed1d5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
