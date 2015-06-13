# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=tty-clock
pkgver=0.1
pkgrel=1
pkgdesc="Analog clock in ncurses"
arch=('i686' 'x86_64')
url="http://github.com/xorg62/tty-clock"
license=('unknown')
depends=('ncurses')
makedepends=('git')
source=("git://github.com/xorg62/tty-clock.git#tag=v$pkgver")
md5sums=("SKIP")

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/bin"
  install -m 755 $pkgname "$pkgdir/usr/bin/$pkgname"
} 
