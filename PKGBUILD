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
sha256sums_x86_64=('684cc75cfea7a78b4bff7a568497e32d0fb5542eec009b1ff06d59459a632727')
sha256sums_aarch64=('e5f338c458a171f57be062ff52c0c7d0da171324c09b7918e341dae94bacb670')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
