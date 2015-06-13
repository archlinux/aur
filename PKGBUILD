# Maintainer: loafer <davemogan353 at btinternet dot com>

pkgname=xstdcmap
pkgver=1.0.3
pkgrel=1
pkgdesc="A X standard colormap utility"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('GPL')
depends=(libxmu)
source=(http://xorg.freedesktop.org/releases/individual/app/"$pkgname-$pkgver".tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
md5sums=('eb5473acaef15a5db9b50df29c6a7f90')
