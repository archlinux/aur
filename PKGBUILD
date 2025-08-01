# Maintainer: Night Kaly <night@night0721.xyz>
pkgname=fnf
pkgver=0.3.1
pkgrel=2
pkgdesc="A simple fuzzy finder for the terminal"
arch=('x86_64')
url="https://github.com/leo-arch/fnf"
license=('MIT')
optdepends=('clifm: to use with clifm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leo-arch/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3a65de45f68419528e5fa57d9857aa208f4802ba85de267a09734d7231b6d1eb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	sudo make PREFIX="/usr" install
}
