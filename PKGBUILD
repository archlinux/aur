# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.9
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
sha256sums_x86_64=('8ddbd8319d8c1657dd96390d3a3cc5d1c9b3bac989244c34380851a0d3290f4d')
sha256sums_aarch64=('10c8c63024a226c25945efdbcc9578c97849a35230c7be0646768defd836cbca')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
