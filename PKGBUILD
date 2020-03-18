# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

pkgname=$_target-configure
pkgver=1.0.0
pkgrel=1
pkgdesc='A configure wrapper for the ARM64 target'
arch=(x86_64)
url='http://fedoraproject.org/wiki/MinGW'
license=(GPL)
depends=($_target-gcc $_target-pkg-config $_target-environment)
makedepends=()
options=()
source=('configure.sh')
sha256sums=('bf13d26c868e66341770002dd3e3c6a77b10f453bc2b43dda477e2827d5172e0')

package() {
  install -m 755 -D configure.sh "$pkgdir"/usr/bin/$_target-configure
}
