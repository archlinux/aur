# Maintainer: Martin Fracker <martin.frackerjr@gmail.com>
pkgname=fruit-di
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="A dependency injection library for C++"
arch=('x86_64' 'i686')
url="https://github.com/google/fruit/releases"
license=('Apache')
groups=()
depends=('gcc-libs>=4.8')
makedepends=('make' 'cmake>=2.8' 'gcc>=4.8')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/google/fruit/archive/v1.0.2.tar.gz")
noextract=()
sha256sums=('f2d72c0b027fecbe10772b1ff27dabb8e5f9fba09970a7bff9f1863ac57d154c')

build() {
  cd "fruit-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr .
  make -j
}

package() {
  cd "fruit-$pkgver"
  make install
}
