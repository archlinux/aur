# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.5.22
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('e5e62d0d36b237db89b066ae0abf48eba5bd7b6a4a1f88997d94679b480d543e')
sha256sums_aarch64=('f3837db95635b6e7620d516078de9efa6b3736cbb6505eaf8b62b1e0d2541d49')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
