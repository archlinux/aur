# Maintainer: Federico Di Pierro <nierro92@gmail.com> 

pkgname=minefield
pkgver=2.2
pkgrel=1
pkgdesc="Minefield game written in C and ncurses"
arch=(i686 x86_64)
license=('GPL3')
url="https://github.com/FedeDP/minefield"
groups=('games')
depends=('ncurses')
source=("$pkgname.c" "makefile")
md5sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
