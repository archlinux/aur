# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

pkgname=vstr
pkgver=1.0.15
pkgrel=1
pkgdesc="manipulate c strings in obscene, obtuse, and profane ways!"
url='http://and.org/vstr'
license=('MIT')
arch=('x86_64' 'i686')
source=('http://www.and.org/vstr/latest/vstr-1.0.15.tar.bz2')
b2sums=('8dfd7a45efd4944e311add8ad5936fa3b642d38c609bdc4416444a8db6f2fa4cccbf55a5c2d6664dfd79bd0db2e1209fdbc5dfc999f428830a2fa562c87edb93')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
