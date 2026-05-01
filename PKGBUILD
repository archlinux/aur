# Maintainer: Fauna <aur@bertie.io>
pkgname=meowdo
pkgver=1.3.5
pkgrel=1
pkgdesc='A cute, keyboard-driven todo list with a cat sidekick.'
arch=(x86_64)
url='https://github.com/Sycorlax/Meowdo'
license=('GPL-3.0-or-later')
depends=(ncurses)
makedepends=(make gcc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sycorlax/Meowdo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86b470afc24548d24e1b8d08a95abc872661058776be339b3bc33b037d769027')


build() {
	cd "$srcdir/Meowdo-$pkgver"
	make
}

package() {
	cd "$srcdir/Meowdo-$pkgver"
	install -Dm755 meowdo "$pkgdir/usr/bin/meowdo"
}
