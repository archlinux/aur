# Maintainer: Xuepoo <xuepoo@carryctx.dev>
pkgname=carryctx
pkgver=0.8.0
pkgrel=1
pkgdesc="Local-first project lifecycle control for coding agents"
arch=('x86_64')
url="https://carryctx.xuepoo.xyz"
license=('MIT')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/Xuepoo/carryctx/releases/download/v0.8.0/carryctx-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('42041cf1eee8f097310cf6c8c2533c779f1fd3404135c548b4cc8b0fe90bdb0a')

package() {
  install -Dm755 "${srcdir}/carryctx-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/carryctx"
}
