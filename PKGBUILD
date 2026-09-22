# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.13
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
sha256sums_x86_64=('7aec2b775e33fc2e8b1cec42d97ffe80bdbbf2e783ee80b837fabb29f8c1d770')
sha256sums_aarch64=('14d254d58d4254c5814becb94c3c97001a43161073202c2c79bbf4b8ae2646e7')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
