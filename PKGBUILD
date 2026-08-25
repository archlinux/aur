# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-sdk-bin
pkgver=0.7.17
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
sha256sums=('a392338a50adb91f09713373e448fed19a9f8af4ba3548a6b90ff4c1d0840a2f')

package() {
  tar -xzf "$srcdir/oa-sdk-${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"
}
