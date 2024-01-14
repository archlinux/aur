# Maintainer: Letu Ren <fantasquex@gmail.com>
pkgname=millw
pkgver=0.4.11
pkgrel=1
pkgdesc="Mill Wrapper Script"
arch=(x86_64)
url="https://github.com/lefou/millw"
license=('Apache-2.0')
source=("https://github.com/lefou/millw/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4fd413ec28ff9b249c192e62780b0e658c555b71fcbcf676a626ff57c286a0f7')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t ${pkgdir}/usr/bin millw
}

