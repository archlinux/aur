# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.7
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
sha256sums_x86_64=('23aadcf9f3f831aca78aaa1fcd5745bbc606ce387f01f4a70fa426ae8720f322')
sha256sums_aarch64=('76a1e099738221a24c1db885af1d1a4c5c9135d29149a108502f11ff386be114')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
