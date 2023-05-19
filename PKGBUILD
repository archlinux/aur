pkgname=bun-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('dc517d1b1a6e4e88b612af67355c09388e0e31e4cfdeca0c039b25f8ff21f0682e2b23affe6f59530bf613ee12ca4713a4ea46bce5dcb5d133710356a67b6751')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
