# Maintaner: Dennis Börm <allspark@wormhole.eu>
pkgname=('shorewall-lite')
pkgver=4.6.11.1
pkgrel=1
pkgdesc="An iptables-based firewall for Linux systems ('lite' version)"
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
depends=('iptables' 'iproute2' "shorewall-core=${pkgver}")
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-4.6.11/$pkgname-$pkgver.tar.bz2)
sha256sums=('650f9ade5a31b0d84ba25154d302c91a70ae10d3ed986d7570eede2155ab5b4b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
