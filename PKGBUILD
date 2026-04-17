# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.2
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
sha256sums_x86_64=('67452bfb1c998f609a147512c6a8672b4972d7642813191ef9f3469ce12b5a43')
sha256sums_aarch64=('98db6631449f46873d07a08009eab279a1c165d5441391b11b459a8b837aa7e5')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
