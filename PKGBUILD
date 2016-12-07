# Maintainer: Tasos Latsas <tlatsas@gmx.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: damir <damir@archlinux.org>
# Development: http://closure.ath.cx/aur-dev

pkgname=bs
pkgver=2.10
pkgrel=2
pkgdesc="The classic game of Battleships against the computer. Ncurses."
arch=('i686' 'x86_64')
url="https://www.catb.org/~esr/bs/"
license=('GPL2')
depends=('ncurses' 'hicolor-icon-theme')
source=("http://www.catb.org/~esr/bs/bs-$pkgver.tar.gz")
sha256sums=('1f8c1541fd13f481ff96df26d668658a7465da064801ae22ee584bd50f3a3107')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
