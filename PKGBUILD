# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=glorytun
pkgver=0.1.2
pkgrel=1
pkgdesc="A small, simple and secure VPN"
arch=(x86_64)
url="https://github.com/angt/glorytun"
license=('BSD')
depends=('libsodium' 'iproute2')
makedepends=('libsodium')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('b2554215f50d0097131b0054050aa534')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install
}
