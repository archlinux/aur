# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="OA — High-performance C++ compute engine for ML, audio, and graphics (pre-built binaries)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=('liburing')
source=("https://github.com/realminc/oa/releases/download/v${pkgver}/oa-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('8be5600fd5c0ecc29d36cc190e95e56a76060d8c3465ac61ed4c912107331c3c')

package() {
  tar -xzf "$srcdir/oa-${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"
}
