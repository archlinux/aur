pkgname=bun-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('567ab8fec5353deaf3dce004a4604d18a52222fc8ca0a7e7cf134412f6640cb9f3b20a16c21ee97a348dcca19d38db14ac834798eb56f0b94ca5be672e73a408')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
