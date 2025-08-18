# Maintainer: Night Kaly <night@night0721.xyz>
pkgname=fnf
pkgver=0.4
pkgrel=2
pkgdesc="A simple fuzzy finder for the terminal"
arch=('x86_64')
url="https://github.com/leo-arch/fnf"
license=('MIT')
optdepends=('clifm: to use with clifm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leo-arch/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('13aa1c1bddfa6be4f458af3e077ed0c1bbd91400d89cf670c1a10cafd525c8f5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
