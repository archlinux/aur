# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.1
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
sha256sums_x86_64=('092aa4904e877fe4f445adcbb01c86ebc25197e0462871348d02667867a0fa36')
sha256sums_aarch64=('197427301bdc62375ca094974b4cb0691b56cd243da177b1a0a7da85e6d49886')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
