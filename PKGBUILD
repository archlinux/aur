pkgname=ninvaders
pkgver=0.1.1
pkgrel=3
pkgdesc='Ncurses based space invaders clone'
arch=('i686' 'x86_64')
url='http://ninvaders.sourceforge.net/'
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/ninvaders/$pkgname-$pkgver.tar.gz)
md5sums=('97b2c3fb082241ab5c56ab728522622b')

build() {
  cd $pkgname-$pkgver
  make CFLAGS="${CFLAGS}"
}

package() {
  cd $pkgname-$pkgver
  install -m755 -D nInvaders $pkgdir/usr/bin/$pkgname
}
