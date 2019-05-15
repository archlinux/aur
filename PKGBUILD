# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=gifblock
pkgver=1.0
pkgrel=1
pkgdesc="A Gifblock is a TCL library to Manipulate GIF images streams."
url="https://github.com/Geballin/Gifblock"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl')
optdepends=()
makedepends=(make gcc)
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/Geballin/Gifblock/archive/1.0.tar.gz")

md5sums=(2b3351838b0ac446b0e8fb2222f122da)

build() {
  cd ${srcdir}/Gifblock-1.0
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/Gifblock-1.0
  make DESTDIR="${pkgdir}" install
}
