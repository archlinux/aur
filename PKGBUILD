# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=cmake-usedoxygen
pkgver=1.3.3
pkgrel=1
pkgdesc="CMake module to add Doxygen rule into Makefile"
arch=("any")
url="http://tobias.rautenkranz.ch/cmake/doxygen/"
license=("BSD")
source=(http://tobias.rautenkranz.ch/cmake/doxygen/releases/UseDoxygen-$pkgver.tar.gz)
depends=("cmake")
md5sums=('696423a0fb4438ffd88c209f67b41690')

build() {
  cd "$srcdir/UseDoxygen"
  cmake .
}

package() {
  cd "$srcdir/UseDoxygen"
  make DESTDIR="$pkgdir" install
}
