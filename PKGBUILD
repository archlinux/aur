# Maintainer: void09  <sgmihai@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: triaxx
 
pkgname=gnuclad
pkgver=0.2.4
pkgrel=3
pkgdesc="A cladogram tree generator mainly used by GNU/Linux distro 
timeline project"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/gnuclad"
makedepends=('binutils' 'gcc' 'make')
depends=()
source=(https://github.com/FabioLolix/gnuclad/archive/master.zip)
md5sums=('SKIP')
 
build() {
  cd "$srcdir/$pkgname-master"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "$srcdir/$pkgname-master"
  make DESTDIR="$pkgdir" install
}
