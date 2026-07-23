# Maintainer: Xuepoo <xuepoo@carryctx.dev>
pkgname=carryctx
pkgver=0.1.0
pkgrel=1
pkgdesc="Persistent project context for coding agents"
arch=('x86_64')
url="https://carryctx.dev"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.1.0/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('329329639e5d3cd8384d552c7d5c1e668bbc68669fbb3b3aea2af9967c937efc')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
