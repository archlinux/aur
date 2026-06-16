# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.5.20
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('48dc08a6186549fb839075af556f14d359ca51c2fb2e742903cd6bf08e59af9b')
sha256sums_aarch64=('af69aaa23220dd62229a0008f5544c0cf464c2e2f9915a525691c6ed4bd19553')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
