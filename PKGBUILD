# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="OA — High-performance C++ compute engine for ML, audio, and graphics (pre-built binaries)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=('liburing')
source=("https://github.com/realminc/oa/releases/download/v${pkgver}/oa-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('779dda32cdd47aab06863816021323c3caa9285c0b0fd48a2a9b8bc8ce8922d0')

package() {
  tar -xzf "$srcdir/oa-${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"
}
