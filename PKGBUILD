# Maintainer: Xuepoo <xuepoo@carryctx.dev>
pkgname=carryctx
pkgver=0.5.7
pkgrel=1
pkgdesc="Local-first memory for coding agents"
arch=('x86_64')
url="https://carryctx.dev"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.5.7/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('42e503eae987851b515a85465e32476f855d5bfebcbce0b0042bf01278b4e0d2')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
