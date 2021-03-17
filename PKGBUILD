pkgname=crystalhd-headers
pkgver=20131127
pkgrel=3
pkgdesc="Broadcom Crystal HD headers for kernel driver and library"
arch=('i686' 'x86_64')
url="https://github.com/crystalhd-arch/crystalhd-headers"
license=('LGPLv2.1')
source=("https://github.com/crystalhd-arch/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2901627e5dd86e5468ff3935318296c79978c2551066430489b9163fccff57eb987ad9f2ef2db7f09af96bcd9574aa9493e0d4cd6b82f401be00210f77025e16')


package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/include
  make DESTDIR="$pkgdir" PREFIX=/usr/ install
}
# vim:syntax=sh
