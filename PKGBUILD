# Maintainer: Fauna <aur@bertie.io>
pkgname=meowdo
pkgver=1.2.0
pkgrel=1
pkgdesc='A cute, keyboard-driven todo list with a cat sidekick.'
arch=(x86_64)
url='https://github.com/Sycorlax/Meowdo'
license=('GPL-3.0-or-later')
depends=(ncurses)
makedepends=(make gcc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sycorlax/Meowdo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f406695adefbd030a18b88ea1735706eed735a66cd075a50eb291b1f4e10a22')


build() {
	cd "$srcdir/Meowdo-$pkgver"
	make
}

package() {
	cd "$srcdir/Meowdo-$pkgver"
	install -Dm755 meowdo "$pkgdir/usr/bin/meowdo"
}
