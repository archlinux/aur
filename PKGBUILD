# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname="pagemon"
pkgver="0.01.16"
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

sha256sums=('41e493134e2a574df7fcdaf019e460f7ecf2eb764afae5e8f1dc5e02b9787aca')
