pkgname=bun-bin
pkgver=0.6.9
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('47d9ce4e46d9eed3d48c40d50e9c82f1d7536bff29239044aea09e469d5fefd61d823203ac3c37a48255dae57d684d090469d61c57129d43a3ca7833cdad5c9d')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
