pkgname=bun-bin
pkgver=0.6.12
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('ef90d84455411c1a3c486a3cbab60047a4ef4d96fb7856017574d05c13a88fc35131e264610a77ccfbda89aab51eca53a2847b7796ff72fc39d7238fa9727465')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
