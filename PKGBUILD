# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.5.19
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('60d2e03f495f7c363293ef2831d2e42ab4c36c11a09e18afaec0163027df6639')
sha256sums_aarch64=('9bf33a09e09299c3e7ea5830b01d958ea5abe0e4f38d8e04125a6612ad0957d9')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
