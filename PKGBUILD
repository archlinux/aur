# Maintainer: Lieven Moors <lievenmoors@gmail.com>
# Contributor: Jérémie Astor <astor.jeremie@wanadoo.fr>

pkgname=njconnect
pkgver=1.6
pkgrel=1
pkgdesc="Curses Jack connection manager, based on naconnect by Nedko Arnaudov"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/njconnect"
license=('GPL')
depends=('jack')
provides=('njconnect')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('4be367a2caf0218a373e039e8741da26')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
