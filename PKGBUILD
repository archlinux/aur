pkgname=bun-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('19d25b1f17badc708ad3e1c75bb896840c846b231526fb100b29ee0230bfdb96cac01fca13f115eadc2e3f0286c93c20f5989d71dedaf6ca9e55b0e0553187ef')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
