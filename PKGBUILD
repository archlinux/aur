# Maintainer: Your Name <TheRetikGM@gmail.com>
pkgname=2048-curses
pkgver=1.0
pkgrel=1
pkgdesc="Curses based popular game 2048 written in C"
arch=('any')
url="https://github.com/theretikgm/2048-curses"
license=('GPL')
depends=('ncurses>=6.0-0')
source=("https://raw.githubusercontent.com/TheRetikGM/2048-curses/master/src/2048-curses.c"
        "https://raw.githubusercontent.com/TheRetikGM/2048-curses/master/src/dialog.c"
	"https://raw.githubusercontent.com/TheRetikGM/2048-curses/master/src/dialog.h"
	"https://raw.githubusercontent.com/TheRetikGM/2048-curses/master/src/Makefile")
build() {
	cd "${srcdir}"
	make
}

package() {
	install "${srcdir}/${pkgname}" -D "${pkgdir}/usr/bin/${pkgname}"
}
md5sums=('49881827fb297a998c49dd03899ae126'
         'a1d9f8f1e1f46ae809cd356fa8c6fe00'
         '666c1d0f43be2dd2e92a759ece3dfb5a'
         'e277d0071243798818031dfe915bdf1b')
