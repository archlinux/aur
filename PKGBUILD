# Maintainer: Xuepoo <xuepoo@users.noreply.github.com>
pkgname=carryctx
pkgver=0.12.0
pkgrel=1
pkgdesc="Local-first memory for coding agents"
arch=('x86_64')
url="https://carryctx.xuepoo.xyz"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.12.0/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('88826a02c18cc8754a301c4da8678c6d8ed7f4cdd2ce7dfc2004f27a36176a63')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
