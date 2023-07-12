pkgname=bun-bin
pkgver=0.6.14
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('b7e262b79b96e05dc3685ba300cb96e3fb9bc7104bab61fe15877e61a0a61c3b60edff2090417d902955553d4a20542d616e4fc77346a51cdc60ff3046638550')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
