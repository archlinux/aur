# Maintainer: Lieven Moors <lievenmoors@gmail.com>
# Contributor: Jérémie Astor <astor.jeremie@wanadoo.fr>

pkgname=njconnect
pkgver=1.3
pkgrel=1
pkgdesc="Curses Jack connection manager, based on naconnect by Nedko Arnaudov"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/njconnect"
license=('GPL')
depends=('jack' 'ncurses')
provides=('njconnect')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('c53b86546a3d6bc4833077147273e4ba')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
