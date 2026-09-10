# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.11
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
sha256sums_x86_64=('4f3dba3fabf153716662a73ec54e33bfeec7581374b58204d25fccad97d1839e')
sha256sums_aarch64=('f4294b79c05736b2e8baf70607a088113eda244c3428ffafa2cc93268e0f4f58')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
