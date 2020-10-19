# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname="pagemon"
pkgver="0.01.20"
pkgrel=1
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

sha256sums=('2f5b968c6b5981f9e72a45b5817900f30003e36b856a9497955cfbcc1fe20dd6')
