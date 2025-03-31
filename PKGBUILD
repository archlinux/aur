#Maintainer: gingrspacecadet@github.comi
pkgname=hyprpad
pkgver=0.1
pkgrel=1
pkgdesc="A simple, fast text editor with Vim keybinds"
arch=('x86_64')
url="https://github.com/gingrspacecadet/hyprpad"
license=('AGPL')
depends=('glibc' 'ncurses')
makedepends=('gcc' 'make')
source=("hyprpad.c" "Makefile")
sha256sums=('SKIP' 'SKIP')

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	make DESTDIR="$pkgdir" install
}
