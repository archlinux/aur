pkgname=bun-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('8e5c50770bb40ab2bf445866f4da881abd79f599a63c895ef2de0a8e2cfde3c1f5821c9d69005f45e5bbc150c542ac3c1221f90bf96d3596e438dd4da208f9d4')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
