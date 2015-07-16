# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=rapsearch
pkgver=2.23
pkgrel=1
pkgdesc="Reduced Alphabet based Protein similarity Search"
arch=('x86_64')
url="http://rapsearch2.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/rapsearch2/RAPSearch${pkgver}_64bits.tar.gz)
md5sums=('1fe5e42dd65d97fd54dc142e6d8ec68d')

build() {
  cd $srcdir/RAPSearch${pkgver}_64bits/Src

  make
}

package() {
  cd $srcdir/RAPSearch${pkgver}_64bits/Src

  install -d $pkgdir/usr/bin

  install -m755 rapsearch prerapsearch $pkgdir/usr/bin
}
