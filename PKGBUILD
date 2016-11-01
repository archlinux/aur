# Maintainer: jerry73204 <jerry73204@gmail.com>

pkgname=xorsearch
pkgver=1.11.1
pkgrel=2
pkgdesc="Program to search for a given string in an XOR, ROL or ROT encoded binary file."
arch=('i686' 'x86_64')
url="http://blog.didierstevens.com/programs/xorsearch/"
license=("Public domain")
source=("https://didierstevens.com/files/software/XORSearch_V$(tr '.' '_' <<< $pkgver).zip")
sha256sums=('15e9aae87e7f25cf7966cdf0f8dfcb2648099585d08ead522737e72c5faca50a')

build() {
  gcc -O3 -o xorsearch XORSearch.c
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
