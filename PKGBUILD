# Maintainer: Xuepoo <xuepoo@carryctx.dev>
pkgname=carryctx
pkgver=0.0.3
pkgrel=1
pkgdesc="Persistent project context for coding agents"
arch=('x86_64')
url="https://carryctx.dev"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.0.3/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('1289921d755585fa38c9a90d92d0e9104582b9ccfbc679fd371f1ed884d7e937')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
