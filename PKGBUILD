# Maintainer: wodim <neikokz@gmail.com>

pkgname=xorsearch
pkgver=1.9.2
pkgrel=1
pkgdesc="Program to search for a given string in an XOR, ROL or ROT encoded binary file."
arch=('i686' 'x86_64')
url="http://blog.didierstevens.com/programs/xorsearch/"
license="Public domain"
source=('https://didierstevens.com/files/software/XORSearch_V1_9_2.zip')
sha256sums=('90793BEB9D429EF40458AE224117A90E6C4282DD1C9B0456E7E7148165B8EF32')

build() {
  gcc -o xorsearch XORSearch.c
}

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
