# Maintainer: Tasos Latsas <tlatsas@gmx.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: damir <damir@archlinux.org>
# Development: http://closure.ath.cx/aur-dev

pkgname=bs
pkgver=2.10
pkgrel=1
pkgdesc="The classic game of Battleships against the computer. Ncurses."
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/bs/"
license=('GPL2')
depends=('ncurses')
source=("http://www.catb.org/~esr/bs/bs-$pkgver.tar.gz")
sha1sums=('63179f97929c6cb9b6598440798e4ebd82069d4a')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 bs "$pkgdir"/usr/bin/bs
  install -Dm644 bs.6 "$pkgdir"/usr/share/man/man6/bs.6
}
