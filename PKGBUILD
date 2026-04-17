# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.1.6
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
sha256sums_x86_64=('964b54f8993100c3aeba8b746cb180775e93022f5f8f15334334fa0c2f18b061')
sha256sums_aarch64=('3e1308aeb3642e4219b0dccef7ca7989a06d50625dd7ec690b0725b601350a70')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
