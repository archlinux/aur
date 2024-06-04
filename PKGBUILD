# Maintainer: Dima Volkov <dimaac@bk.ru>
pkgname=strings
pkgver=1.0
pkgrel=1
pkgdesc="Strings is another bad static string library, written in C."
arch=('any')
url="https://github.com/dimalmfao/strings"
license=('GPL-3.0')
depends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimalmfao/strings/archive/master.tar.gz")
sha256sums=('55b6df89380a44f546989454fcf8e3451d1fdea1698d1e0537677366d1d384cb')

build() {
  cd "$srcdir/strings-master"
  make compile lib
}

package() {
  cd "$srcdir/strings-master"
  make install DESTDIR="$pkgdir"
}


