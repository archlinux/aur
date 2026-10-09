# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.14
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
sha256sums_x86_64=('3fd2eb45abf00d326d8ee1145344cdacf24a72f927c5c4a3f79ed5d5066f509e')
sha256sums_aarch64=('7e51f864b9609e7b90751860076cd74b5753e32d90000b7c4ab81dd17ba4ff8f')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
