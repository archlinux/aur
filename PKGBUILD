# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmatrix
_pkgname=wmMatrix
pkgver=0.2
pkgrel=1
pkgdesc="Dock app that simulates the text scrolls from the movie \"The Matrix\""
url="http://nis-www.lanl.gov/~mgh/WindowMaker/DockApps.shtml"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxpm')
source=("http://gentoo.osuosl.org/distfiles/$_pkgname-$pkgver.tar.gz")
md5sums=('4e9f0c94e78ad65ea9a564fba5f7a187')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make clean
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm0755 wmMatrix "$pkgdir/usr/bin/wmMatrix"
}

# vim: set sw=2 et:
