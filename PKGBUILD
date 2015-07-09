# Maintaner: Dennis Börm <allspark@wormhole.eu>
pkgname=('shorewall-lite')
pkgver=4.6.11
pkgrel=1
pkgdesc="An iptables-based firewall for Linux systems ('lite' version)"
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
depends=('iptables' 'iproute2' "shorewall-core=${pkgver}")
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-4.6.11/$pkgname-$pkgver.tar.bz2)
sha256sums=('6b939754c685dc2e218ebb1f5bd4d81b1c73df8c99545d83644e5c7fa50dd568')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
