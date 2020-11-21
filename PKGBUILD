# Maintainer: xhyinne <xhyi AT gmx DOT us>

pkgname=xcat
pkgver=1.0
pkgrel=1
pkgdesc="A simple cat clone with xor key"
arch=('any')
url="https://gist.github.com/xdrie/c3081151707a071acf1aea53d0d1bfd5"
license=('MIT')
source=("https://gist.githubusercontent.com/xdrie/c3081151707a071acf1aea53d0d1bfd5/raw/0cb2e2807c10d410500989cc3233e6ec5630fda0/xcat.c")
sha256sums=('17815481b6143f9136c0dcc72a00eddef1c9cc7bfaf66ed6ce477709c66236b4')

build() {
  cd "${srcdir}"

  gcc -O3 -Wall -o xcat xcat.c
}

package() {
  cd "${srcdir}"

  mkdir -p "$pkgdir/usr/bin"
  cp xcat "$pkgdir/usr/bin/xcat"
}
