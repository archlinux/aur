# Contributor: Dragonlord <archlinux[at]dragonlord[.]cz>

pkgname=kudus
pkgver=0.3.0
_pkgver=0.3
pkgrel=1
pkgdesc="Sudoku puzzle generator and solver for KDE."
arch=('i686')
url="http://www.leonscape.co.uk/linux/kudus"
license=('GPL')
depends=('kdelibs' 'qt3')
makedepends=('kdegames')
source=(http://www.leonscape.co.uk/linux/$pkgname/$pkgname-$pkgver.tar.bz2)

md5sums=('0244e9d4b282d193cffb86bbfe8fa10b')

build() {
  cd "$startdir/src/$pkgname-$_pkgver"

  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
