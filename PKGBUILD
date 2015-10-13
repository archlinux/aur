# Maintainer: morning_star <livef3@aol.com>

pkgname=kbtin
pkgver=1.0.14
pkgrel=2
pkgdesc="KBtin is a very heavily extended clone of well-known TinTin++."
arch=('i686' 'x86_64')
url="http://kbtin.sourceforge.net/"
license=('GPL2')
depends=('zlib' 'pcre')
options=('strip')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz)
md5sums=('407ae55dea60bd43fb17879ed7d8e4ce')

build() {
  cd $srcdir/$pkgname-$pkgver
  sh configure --prefix=/usr
  make

}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

