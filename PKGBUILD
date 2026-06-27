# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('10bc720e67f55b87a6291dad84e14ab4f2613d16e63d266f6984e25850d16912')
sha256sums_aarch64=('a0519429bc98551ff45b7a68f9dc8a78f67973611ac262e98dd8cb2894fdc39e')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
