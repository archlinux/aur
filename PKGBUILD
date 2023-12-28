# Maintainer: RickaPrincy <rckprincy@gmail.com>

pkgname=tcolor
pkgver=1.0.0
pkgrel=1
pkgdesc="tcolor is a simple header file that provides you with options to print text in color within the terminal"
arch=('any')
url="https://github.com/RickaPrincy/TColor.hpp"
license=('MIT')
makedepends=("cmake")
source=("TColor.tar.gz::https://github.com/RickaPrincy/TColor.hpp/releases/download/v$pkgver/TColor.tar.gz")
sha256sums=("697e410c550ee639b28f15ad317fac13198e14a6559df644bffb23b1538d0bec")

build() {
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}