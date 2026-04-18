# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.4
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
sha256sums_x86_64=('ba4505d766883875713f280d0625588dfc7460a8d922579f0e0f7a2d64b45719')
sha256sums_aarch64=('5d17fbc19792ef3c8693c43dcb0e6cc1b7a8ea7b3a47118ca33d3a06672b4c13')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
