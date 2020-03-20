# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

pkgname=$_target-meson
pkgver=1.0.1
pkgrel=2
pkgdesc='A meson wrapper for the ARM64 target'
arch=(x86_64)
url='http://fedoraproject.org/wiki/MinGW'
license=(GPL)
depends=(meson $_target-gcc $_target-pkg-config $_target-environment qemu-arch-extra)
makedepends=()
options=()
source=(
  'meson.sh'
  'toolchain.meson'
)
sha256sums=(
  '39847155adb2118daec62992a456d2a042dcc00d1a7c27402aff7eb1da97f500'
  '5ebb68b9069548b4998c88d312376271245387d0844357b4c3aa826a933210e1'
)

package() {
  install -m 755 -D meson.sh "$pkgdir"/usr/bin/aarch64-linux-gnu-meson
  install -m 755 -D toolchain.meson "$pkgdir"/usr/share/aarch64/toolchain.meson
}
