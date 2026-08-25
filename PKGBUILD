# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-sdk-bin
pkgver=0.7.18
pkgrel=1
pkgdesc="OA SDK — C++ headers, CMake package, shader sources, and example tools (pre-built binaries)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=("oa=${pkgver}")
provides=("oa-sdk=${pkgver}")
conflicts=('oa-sdk')
options=('!strip' '!debug')
source=("https://github.com/realminc/oa/releases/download/v${pkgver}/oa-sdk-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('fd9c9fe9969f5a1f10c2414ce33a5619fb6ca5b060355b2d0b261d535f47262e')

package() {
  tar -xzf "$srcdir/oa-sdk-${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"
}
