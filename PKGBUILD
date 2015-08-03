# Maintainer: Tasos Latsas <tlatsas@gmx.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: damir <damir@archlinux.org>
# Development: http://closure.ath.cx/aur-dev

pkgname=bs
pkgver=2.9
pkgrel=1
pkgdesc="The classic game of Battleships against the computer. Ncurses."
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/bs/"
license=('GPL2')
depends=('ncurses')
source=($url/$pkgname-$pkgver.tar.gz)

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 bs $pkgdir/usr/bin/bs
  install -Dm644 bs.6 $pkgdir/usr/share/man/man6/bs.6
}

md5sums=('4d4eec59c1789cffacf367d993e724f4')
