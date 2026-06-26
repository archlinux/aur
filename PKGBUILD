# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('ac53761d1b96f4604e76448938f9dd15caed2d9c266c78ed4e17b97e19bf07b9')
sha256sums_aarch64=('c0f1ad4905556682863ff7245045d35f00dd497048709f0da2934ae08438ff89')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
