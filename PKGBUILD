# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.1.5
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
sha256sums_x86_64=('961a4efbdb9129b8eb518bf52e559c84eec45b2393e042d03d6dbc1385872a9c')
sha256sums_aarch64=('d57aa5aebd1d965ed0d69c0bfe074cf94a3c6892c9e7a2fe97e11ec181964a3d')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
