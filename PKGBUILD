pkgname=bun-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/Jarred-Sumner/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/Jarred-Sumner/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('SKIP')


package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
