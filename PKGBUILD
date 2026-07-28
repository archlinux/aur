# Maintainer: Xuepoo <xuepoo@carryctx.dev>
pkgname=carryctx
pkgver=0.4.4
pkgrel=1
pkgdesc="Local-first memory for coding agents"
arch=('x86_64')
url="https://carryctx.dev"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.4.4/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('2d8f92f830d924216ad3bbc7f14bd443c381b01416a3d49d0c247a98138b8759')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
