# Maintaner: Dennis Börm <allspark@wormhole.eu>
pkgname=('shorewall-lite')
pkgver=4.6.10
pkgrel=1
pkgdesc="An iptables-based firewall for Linux systems ('lite' version)"
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
depends=('iptables' 'iproute2' 'shorewall-core=4.6.10')
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('543d8cda89e2d649b943633c7892aaa04336dbf76a570300bbb1406dc3af1fa1')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
