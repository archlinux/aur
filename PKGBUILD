# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('c92ced179e50d0d0e5c2a012b010cef0aea48e3d160d351adea42cd35c1b5225')
sha256sums_aarch64=('f8cf5258a786f7f8ecbf1e59f75a95bc9fb5588b61849d2dac5b2003615352f6')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
