pkgname=bun-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('60711c88adb6b3d226bbca06f0e149417b0d7b90c5ee05707b68723ecc8d07c8a326d67e315c431502155a48675737b964d04d50e2b757add909cf97056b17c9')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
