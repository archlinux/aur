# Maintainer: Polis Minus <polisminus2247@tuta.io>
pkgname=donut.c
pkgver=1.0
pkgrel=1
pkgdesc="A donut-shaped .C code that outputs a 3D spinning donut"
arch=("x86_64")

url='https://www.a1k0n.net/'
makedepends=('clang')
license=('none')
sha512sums=('a886d3a20f68afca69207e45bb2f933d5ea653fb62b151489d1f095b770d92d207edf9ec3a100614be950899449df045aa634df7f736ce74bef9b4bfdb40c5cc')

source=(donut.c)

build() {
  clang donut.c -w -o donut
}

package() {
  install -D donut "$pkgdir/usr/bin/donut.c"
}
