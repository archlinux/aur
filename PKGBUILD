# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=tkhtml
pkgver=3a17
pkgrel=1
pkgdesc="A Tcl/Tk widget that displays HTML"
url="https://github.com/Geballin/tkhtml3"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk')
optdepends=()
makedepends=(make gcc)
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/Geballin/tkhtml3/archive/Alpha-17.tar.gz")

md5sums=(a3e223dda4340471fdd38abc172bf16a)

build() {
  cd ${srcdir}/tkhtml3-Alpha-17
  ./configure --prefix=/usr --with-tcl=/usr/lib --with-tk=/usr/lib
  make
}

package() {
  cd ${srcdir}/tkhtml3-Alpha-17
  make DESTDIR="${pkgdir}" install
}
