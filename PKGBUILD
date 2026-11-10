# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.4.2
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
sha256sums_x86_64=('b8df84b472414a1745970c738da8503af14ab6f0875c9477640ca3218d60ec76')
sha256sums_aarch64=('34d28257c8111ba110c4b4f125b8d779970da7431ab5a009992a8f5ff9ef47f7')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
