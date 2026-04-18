# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.5
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
sha256sums_x86_64=('f19af686a33e0dad4db1eca29668480090e4d462f3e3d510368b1d4ed2edcdb6')
sha256sums_aarch64=('0e187f603a32fc1525591ca848db0ef4ca307568ff838fcd7047ab6f323125e2')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
