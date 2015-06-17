# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: sofa5000 <marco.praher@gmx.at>

pkgname=veriwell
pkgver=2.8.7
pkgrel=1
pkgdesc='The Verilog Simulator'
arch=(i686 x86_64)
url='http://veriwell.sourceforge.net/'
license=(GPL)
source=(http://downloads.sourceforge.net/project/veriwell/VeriWell/Veriwell%20$pkgver/$pkgname-$pkgver.tar.gz)
sha1sums=('9ef4e6a25a4fd65db325a89ed89b199547fabbd6')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
