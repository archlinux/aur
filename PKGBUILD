# Maintaner: Dennis Börm <allspark@wormhole.eu>
pkgname=('shorewall-lite')
pkgver=4.6.5
pkgrel=2
pkgdesc="An iptables-based firewall for Linux systems ('lite' version)"
arch=('any')
url="http://www.shorewall.net/"
license=('GPL')
depends=('iptables' 'iproute2' 'shorewall-core')
source=(http://www.shorewall.net/pub/shorewall/4.6/shorewall-$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('1794cfb56ba1dd67b38498081160e291')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:
