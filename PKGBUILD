# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.1.1
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
sha256sums_x86_64=('876f72f3d139dcd0161e75507cc432d2d588bf86271c4c49610864a304a0a92d')
sha256sums_aarch64=('448de829305894fffd46e1c4c79705d2bc2e3c97387886a245edcded2a86ddd8')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
