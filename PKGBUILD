# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Kohichi Aoki <drikin@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=tty-clock-borderless
gitname=tty-clock
pkgver=0.1
pkgrel=1
pkgdesc="fork of tty-clock with borderless-option"
arch=('i686' 'x86_64')
url="http://github.com/drikin/tty-clock"
license=('BSD')
depends=('ncurses')
makedepends=('git')
source=("git://github.com/drikin/$gitname.git")
md5sums=("SKIP")

build() {
  cd "$srcdir/$gitname"
  make
}

package() {
  cd "$srcdir/$gitname"
  install -d "$pkgdir/usr/bin"
  install -m 755 $gitname "$pkgdir/usr/bin/$gitname"
}
