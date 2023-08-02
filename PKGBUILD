pkgname=bun-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('cd96cffeb20a0183204e3905880f14bf7c972a4852497c4b3388eac3a5c0e75da54ff19a73f02030bc47c0b6814a588fe38f00e21d2b25b97056942ed031fb7a')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
