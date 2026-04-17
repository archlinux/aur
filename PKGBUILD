# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.1.8
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
sha256sums_x86_64=('6b43a25adcf4b74c607a77e2e10ebe7a72a55a922b7332abea90be1ed52ded4b')
sha256sums_aarch64=('abaa7ca1b2fdeb1c99e690b7ff7ce9f5b1bd45f4470530e4d0407fb2f96bc5af')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
