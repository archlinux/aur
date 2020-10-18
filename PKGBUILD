pkgname=libworld
pkgdesc="NEUTRINO WORLD Library"
pkgver=1.0.0
arch=(any)
pkgrel=0
depends=(clang)
makedepends=(cmake ninja)
source=("git+https://github.com/kokkiemouse/World.git")
md5sums=(SKIP)
package() {
  cd "$srcdir/World/"
  cd build
  cmake .. -GNinja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  ninja install
}
