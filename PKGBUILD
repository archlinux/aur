# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libxdf
pkgver=0.94
pkgrel=1
pkgdesc="A C++ library for loading XDF files"
arch=('i686' 'x86_64')
url="https://github.com/Yida-Lin/libxdf"
license=('GPL')
groups=()
depends=()
makedepends=('qt5-base')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/Yida-Lin/libxdf/archive/$pkgver.zip)
noextract=()
sha1sums=('f2953bf5904569a8787e0460fa9d7ff05b385e61')

build() {
  cd "$srcdir/libxdf-$pkgver"
  qmake
  make
}

package() {
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/lib"
  cp "$srcdir/libxdf-$pkgver/xdf.h" "$pkgdir/usr/include"
  cp "$srcdir/libxdf-$pkgver/libxdf.a" "$pkgdir/usr/lib"
}
