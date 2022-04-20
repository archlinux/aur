# Maintainer: Polis Minus <polisminus2247@tuta.io>
pkgname=okay
pkgver=1.0
pkgrel=1
pkgdesc="Prints Okay"
arch=("x86_64")

url=''
makedepends=(gcc)
depends=()
license=('GPL')
sha512sums=('9e8553e57e43a1c07560d073aeea18b16a4b76d8bceadd5147ff23a2e865027128ba232112ece78e9feb95959e984e0b0af96cc0056cb17cbff41f80168d60fa')

source=(okay.cpp)

build(){
  cd "$srcdir"
  g++ okay.cpp -o okay
}

package(){
  install -D "$srcdir"/okay "$pkgdir/usr/bin/okay"
}
