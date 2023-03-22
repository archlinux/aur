# Maintainer: Emma Tebibyte <emma@tebibyte.media>

pkgname="bike"
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool that prints “bike” to the standard output."
arch=("any")
url="https://git.tebibyte.media/emma/bike"
license=("CC0")
source=("https://git.tebibyte.media/emma/bike/archive/1.0.0.tar.gz")
provides=("bike")

sha256sums=("SKIP")

build() {
  cd "$srcdir/bike"
  "$CC" -o bike bike.c
}

package() {
  cd "$srcdir/bike"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  cp bike "$pkgdir/usr/bin"
  cp bike.1 "$pkgdir/usr/share/man/man1"
}
