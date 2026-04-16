# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.1.2
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
sha256sums_x86_64=('27e3e442abb30c8fe9154d612efb88190b047fd4cdb572ccb2199f3f03d24690')
sha256sums_aarch64=('543fa1d25bfcca8d58cb76855eb36c64a53253ea3cf1ff56ddfac67b86a20090')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
