pkgname=bun-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('88f1bb4bb5ad3d65a3755652364a4abf960dfffd2e0cbed40c1b565fafd6535ce2bd494026cdb4159fcafdd2d207e87c03afe07d7ff94365ae8212805dcbe8d7')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
