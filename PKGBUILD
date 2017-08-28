# Maintainer: Maziar Saleh Ziabari <helasraizam gmail com>

pkgname=aspell6-fa
pkgver=0.11_0
pkgrel=1
pkgdesc="Farsi dictionary for aspell"
arch=('any')
url="http://ftp.gnu.org/gnu/aspell/dict/fa/"
license=('GPL')
depends=('aspell>=0.60')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/fa/$pkgname-${pkgver//_/-}.tar.bz2")
md5sums=('47c8599e529fc291a096c12f0b8372ca')

build() {
  cd "$pkgname-${pkgver//_/-}"
  ./configure --vars DESTDIR="/usr"
  make
}

package () {
  cd "$pkgname-${pkgver//_/-}"
  make DESTDIR="$pkgdir/" install
}
