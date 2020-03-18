# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

pkgname=$_target-environment
pkgver=1.0.0
pkgrel=1
pkgdesc='A script for loading the aarch64 env'
arch=(x86_64)
url='http://fedoraproject.org/wiki/MinGW'
license=(GPL)
depends=($_target-gcc)
options=()
source=(
  'environment.sh'
)
sha256sums=(
  '8412dc4e48795a0751d9b3993a6c626f39762377e501be4d71db7d827e22e74c'
)

package() {
  install -m 755 -D environment.sh "$pkgdir"/usr/bin/$_target-environment
}
