# Maintainer: Your Name <TheRetikGM@gmail.com>
pkgname=2048-curses
pkgver=1.2
pkgrel=0
pkgdesc="Curses based popular game 2048 written in C"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/theretikgm/2048-curses"
license=('GPL')
depends=('ncurses>=6.0-0' 'git')
source=("git+https://github.com/theretikgm/2048-curses.git")
sha256sums=('SKIP')
build() {
	cd "${srcdir}/${pkgname}/src"
	make
}

package() {
	install "${srcdir}/${pkgname}/src/${pkgname}" -D "${pkgdir}/usr/bin/${pkgname}"
}
