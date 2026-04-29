# Maintainer: Fauna <aur@bertie.io>
pkgname=meowdo
pkgver=1.3.0
pkgrel=1
pkgdesc='A cute, keyboard-driven todo list with a cat sidekick.'
arch=(x86_64)
url='https://github.com/Sycorlax/Meowdo'
license=('GPL-3.0-or-later')
depends=(ncurses)
makedepends=(make gcc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sycorlax/Meowdo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d85d0ae642e5e0e2416addf01f01f55f5f605a4004ef2e861397cf4dc380fbf')


build() {
	cd "$srcdir/Meowdo-$pkgver"
	make
}

package() {
	cd "$srcdir/Meowdo-$pkgver"
	install -Dm755 meowdo "$pkgdir/usr/bin/meowdo"
}
