# Maintainer: Dima Volkov <dimaac@bk.ru>
pkgname=dimanet
pkgver=1.3
pkgrel=1
pkgdesc="DimaNet is another bad integration of a neural network library written in ANSI C."
arch=('any')
url="https://github.com/dimalmfao/dimanet"
license=('GPL-3.0')
depends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimalmfao/dimanet/archive/master.tar.gz")
sha256sums=('bf89eb6c4188618d6873db83f277a713a5b7614edb1157ac12b063335b96fdfd')

build() {
  cd "$srcdir/dimanet-master"
  make compile lib
}

package() {
  cd "$srcdir/dimanet-master"
  make install DESTDIR="$pkgdir"
}

