# Maintainer: yadieet <yadieet@gmail.com>

pkgname=terbilang
pkgver=1.3
pkgrel=1
pkgdesc="Number-To-Text / Number-To-Words  converter utility for Bahasa Indonesia or Indonesian Rupiah (IDR) currency."
url="https://github.com/yadieet/c-programming-examples/tree/master/terbilang"
license=('GPL3')
source=("https://raw.githubusercontent.com/yadieet/c-programming-examples/master/terbilang/terbilang.c")
sha256sums=('e1f6b4c22e0c5964e217e2055c2f275d98774503905400dd9d55fd72b949d028')
arch=('x86_64')
depends=('gmp')

build() {
	cd "$srcdir"
	gcc -Wall -Wextra -std=c11 -pedantic -o "ysa-terbilang" "terbilang.c" -lgmp
}

package() {
	cd "$srcdir"
  	install -D -m755 ysa-terbilang ${pkgdir}/usr/bin/ysa-terbilang
}
