# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.1.7
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
sha256sums_x86_64=('eb8bcb589ce95c521bac01c0ef84c5bfe6b9146fd91f59aee629b056a9bf1a58')
sha256sums_aarch64=('0097204cf5f8b417536d29d1169a14e9b711c2d15340daf85d3a78e61a045f69')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
