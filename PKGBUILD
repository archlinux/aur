# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Zhang Li <msfxzi at sina.com>

pkgname=arpoison
pkgver=0.7
pkgrel=1
pkgdesc="The UNIX arp cache update utility"
arch=(i686 x86_64)
url="http://www.arpoison.net"
license=('GPL')
depends=('libnet')
source=("http://www.arpoison.net/$pkgname-$pkgver.tar.gz")
md5sums=('0e86186eb18c9aabf78afa9706b40530')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/arpoison" "$pkgdir/usr/bin/arpoison"
}

