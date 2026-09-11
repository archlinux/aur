# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.12
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
sha256sums_x86_64=('3ff3231b018e1fa82312c5a24e564d9f670967b0ade69c20a9808e1697f6bad3')
sha256sums_aarch64=('29c8c3cc8715fb0cbd464a209052e338c044fa2815993f244367a14418113d0a')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
