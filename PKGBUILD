# Maintainer: Esben Haabendal <esben@haabendal.dk>

pkgname=aspell-da
pkgver=0.50.1
pkgrel=1
pkgdesc="Danish dictionary for aspell"
arch=('any')
depends=('aspell')
url="http://aspell.net/"
source=(ftp://ftp.gnu.org/gnu/aspell/dict/da/$pkgname-$pkgver-0.tar.bz2)
md5sums=('1bf582a9aa0e0f8007a2ba9d52964e7e')

build() {
  cd $pkgname-$pkgver-0
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver-0
  make DESTDIR=${pkgdir} install
}