# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Rime input method init and update tool with Wanxiang, Ice, Frost, and Mint support"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/snout"
license=('MIT')
depends=()
provides=('snout')
conflicts=('snout')
source_x86_64=("snout-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/snout-v${pkgver}-linux-x86_64")
source_aarch64=("snout-${pkgver}-linux-aarch64::${url}/releases/download/v${pkgver}/snout-v${pkgver}-linux-aarch64")
sha256sums_x86_64=('3e263ea48c5d6acbc6ca52fd10b5bef021cdcc5ca36d1759bb4f23028d3c220c')
sha256sums_aarch64=('54e624d21e10e4dece193749ef51cc8a679c15e7a8dfe933ca33aa86ffce3216')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
