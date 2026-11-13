# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.5.2
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
sha256sums_x86_64=('924d5d730f9f76c7a08945acbd97d8d4b47cf1b88cc7cb51f33191dd07969ac8')
sha256sums_aarch64=('c22cc175ef523aaf1712ebe8214d4abbaf9e3ab53409143554f415369fc3764e')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
