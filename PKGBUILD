pkgname=libpkgbuild
pkgdesc="This is a pkgbuild parse library"
pkgver=1.0.0
arch=(any)
pkgrel=0
depends=(clang)
makedepends=(cmake ninja)
source=("git+https://github.com/FascodeNet/libpkgbuild.git")
md5sums=(SKIP)
package() {
  cd "$srcdir/libpkgbuild/"
  mkdir build
  cd build
  cmake .. -GNinja -DCMAKE_INSTALL_PREFIX="$pkgdir"
  ninja install
}
