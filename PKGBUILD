# Maintainer: Xuepoo <xuepoo@carryctx.dev>
pkgname=carryctx
pkgver=0.2.0
pkgrel=1
pkgdesc="Persistent project context for coding agents"
arch=('x86_64')
url="https://carryctx.dev"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.2.0/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('58149926be03c49fe4b27e0e8c55224a016c9b6292bf34ed34adc4f9d122c934')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
