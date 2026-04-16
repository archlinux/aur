# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.1.3
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
sha256sums_x86_64=('5fdbd51f149e7c454d1ddb7de33cc20c202b2d628e3e300804594abb58e50f2c')
sha256sums_aarch64=('3b8026ae9f4c9117232a934941e44c9a76c2890c15d2dabc7bd4b1e0d72d8385')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
