# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=snake-ncurses
pkgver=8.7
pkgrel=1
pkgdesc="snake game clone written in C and ncurses"
arch=(i686 x86_64)
license=('GPL3')
url="https://github.com/FedeDP/Snake"
groups=('games')
depends=('ncurses')
source=("snake.c" "makefile")
md5sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
