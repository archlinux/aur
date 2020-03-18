# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

pkgname=$_target-cmake
pkgver=1.0.0
pkgrel=1
pkgdesc='A cmake wrapper for the ARM64 target'
arch=(x86_64)
url='http://fedoraproject.org/wiki/MinGW'
license=(GPL)
depends=(cmake $_target-gcc $_target-pkg-config $_target-environment)
makedepends=()
options=()
source=(
  'cmake.sh'
  'toolchain.cmake'
)
sha256sums=(
  '1a1ba7c6d678c6d457bc0aa60534648c317fbb84ad1b5499459b22b51ed6d920'
  '00a70a8daeab537588250d913f3ed12dcf0c18cd9a63e4de32d28ecefd27f36e'
)

package() {
  install -m 755 -D cmake.sh "$pkgdir"/usr/bin/aarch64-linux-gnu-cmake
  install -m 755 -D toolchain.cmake "$pkgdir"/usr/share/aarch64/toolchain.cmake
}
