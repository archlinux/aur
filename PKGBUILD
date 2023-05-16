pkgname=bun-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('3fc3f99cd59c2fc9cc6b84282e14d7a20c2c02a3a7d9a940b6817b84508a1663b5ac11ae55cbead26f7d9cbe1d08db0116ff91a87be781dfcb7109b4b286661b')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
