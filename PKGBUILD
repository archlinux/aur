# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.5.1
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
sha256sums_x86_64=('0b8e3cdf526ecdb41216b593e5304f1ecdfc59d6578551237df193f511c43a78')
sha256sums_aarch64=('501fb3bb72f539745db4d604a226e0ae2999b9fe1d14df161076064f7cde3172')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
