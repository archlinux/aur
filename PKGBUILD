# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.5.0
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
sha256sums_x86_64=('c9892073b22f9f9604bb28ecfe90ac1ed617f189a18ed1a769e4076120cd9b09')
sha256sums_aarch64=('16a1152121b7b78ca42a11dc97a1d1264b8352d5e728cd6e3535513f9ee7d53d')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
