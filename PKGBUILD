# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.8
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
sha256sums_x86_64=('c87d05a98b531d3a95f856ba094ee3eb8a02020de63fa73871fa3b22d75b12eb')
sha256sums_aarch64=('f0f8a7dbf5037c926d05f0c18e37cd0b7edc29a2e231ffc8fe0b59805ebd8b25')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
