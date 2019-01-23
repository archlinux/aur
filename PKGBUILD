# Maintainer: Philipp Fent <philipp@fent.de>
pkgname=cppmake
pkgver=2016.03.31
pkgrel=3
pkgdesc="cppmake. A small make tool that is largely GNU make compatible, but faster."
arch=('x86_64')
url="https://db.in.tum.de/~neumann/cppmake/"
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::http://www-db.in.tum.de/~neumann/cppmake/cppmake.tgz")
sha256sums=('587815c9a95678d6971bdec743f9ccf2202576239699fe68721a4425530d30b9')

build() {
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 bin/cppmake "$pkgdir/usr/bin"
}
