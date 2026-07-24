# Maintainer: Xuepoo <xuepoo@carryctx.dev>
pkgname=carryctx
pkgver=0.3.0
pkgrel=1
pkgdesc="Persistent project context for coding agents"
arch=('x86_64')
url="https://carryctx.dev"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.3.0/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('670a9ea716c16a401a9cbf03fa59406632b67e2c8ac4f98aa208564ee26567b3')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
