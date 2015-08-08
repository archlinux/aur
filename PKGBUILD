# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Contributor:  Alexandre Dantas <eu @ alexdantas DOT net>

pkgname=nsnake
pkgver=3.0.1
pkgrel=2
pkgdesc="Customizable Snake game with ncurses for the terminal"
arch=('x86_64' 'i686')
url="http://nsnake.alexdantas.net/"
license=('GPL3')
depends=('ncurses')
source=(https://github.com/alexdantas/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('bb024bdf8f95989b38c4893a99228d34')

build() {
  cd "$srcdir/nSnake-$pkgver"

  make
}

package() {
  cd "$srcdir/nSnake-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

