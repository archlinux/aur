# Maintainer: Night Kaly <night@night0721.xyz>
pkgname=fnf
pkgver=0.1
pkgrel=2
pkgdesc="A simple fuzzy finder for the terminal"
arch=('x86_64')
url="https://github.com/leo-arch/fnf"
license=('MIT')
optdepends=('clifm: to use with clifm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leo-arch/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('878eae406a5fdc9e8b88d28c264f772da258ddad8378c50b8e08cbc9ce0df07a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	sudo make PREFIX="/usr" install
}
