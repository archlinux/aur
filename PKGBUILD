# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-sdk-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="OA SDK — Development headers, CMake configs, and shader sources (pre-built binaries)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=("oa-bin=${pkgver}")
source=("https://github.com/realminc/oa/releases/download/v${pkgver}/oa-sdk-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('d90ad02dfff37bd09995f585b237002d4c1e01b409fbe410aa00eec83b2e0628')

package() {
  tar -xzf "$srcdir/oa-sdk-${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"
}
