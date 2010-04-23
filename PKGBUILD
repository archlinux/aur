# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$
pkgname=libtrace
pkgver=3.0.6
pkgrel=1
pkgdesc="libtrace is a library for trace processing"
arch=(i686 x86_64)
url="http://research.wand.net.nz/software/libtrace.php"
license=('GPL')
depends=(libpcap zlib)
makedepends=(automake flex bison)
source=(http://research.wand.net.nz/software/libtrace/$pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

md5sums=('285ef7bc2955aba18f8b6a48c9a0c8ee')
md5sums=('285ef7bc2955aba18f8b6a48c9a0c8ee')
