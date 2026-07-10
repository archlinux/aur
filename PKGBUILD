# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="OA — High-performance C++ compute engine for ML, audio, and graphics (pre-built binaries)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=('liburing')
source=("https://github.com/realminc/oa/releases/download/v${pkgver}/oa-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('e8f26eab3b5fa26eb3ec443ce8d4db07ea998b724cf5be738068b3e88f66126e')

package() {
  tar -xzf "$srcdir/oa-${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"
}
