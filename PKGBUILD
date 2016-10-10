# Maintainer: yadieet <yadieet@gmail.com>

pkgname=terbilang
pkgver=1.4
pkgrel=1
pkgdesc="Number-To-Text / Number-To-Words  converter utility for Bahasa Indonesia or Indonesian Rupiah (IDR) currency."
url="https://github.com/yadieet/c-programming-examples/tree/master/terbilang"
license=('GPL3')
source=("https://raw.githubusercontent.com/yadieet/c-programming-examples/master/terbilang/terbilang.c")
sha256sums=('2fecfd89a6de12b4db0faf165fb4852893534288c741cce1cd6cbbea28f3ba06')
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
