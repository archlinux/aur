# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname="pagemon"
pkgver="0.01.14"
pkgrel=2
pkgdesc="Interactive memory/page monitoring tool"
url="https://kernel.ubuntu.com/~cking/pagemon/"
depends=('ncurses')
license=('GPL2')
arch=('x86_64')
source=("https://github.com/ColinIanKing/pagemon/archive/V${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  make BINDIR=/usr/bin
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" BINDIR=/usr/bin install
}

sha256sums=('45214c845c49454465fc39fce60277602b95a474d572d9311224e56b709f029c')
