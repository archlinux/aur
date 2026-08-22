# Maintainer: Xuepoo <xuepoo@carryctx.dev>
pkgname=carryctx
pkgver=0.6.1
pkgrel=1
pkgdesc="Local-first memory for coding agents"
arch=('x86_64')
url="https://carryctx.dev"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.6.1/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('61cfa60632ef8854700d1f569aff34fabd6cd5100065dd10e4dd8466186255b9')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
