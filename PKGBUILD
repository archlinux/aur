# Maintainer: Xuepoo <xuepoo@carryctx.dev>
pkgname=carryctx
pkgver=0.4.3
pkgrel=1
pkgdesc="Local-first memory for coding agents"
arch=('x86_64')
url="https://carryctx.dev"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.4.3/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('1f90e9a3d02efbddd0d6a708563f5d20ecb7d9882f867e7d78e4da7f21e2d0a1')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
