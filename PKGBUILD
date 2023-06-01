pkgname=bun-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('ae6ae2bd9cb4ce29b1701f032dc42d8fac7293d8336d4e2cee1716bec26a8fd31e278e2befdb204271deeef977953209957bd70d46b03ea3410791cd51a56cfc')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
