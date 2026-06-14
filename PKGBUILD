# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.5.18
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('7c5e4024879ae851d641bc6ea12d7a19a2642131da610ed0e238395889d7630d')
sha256sums_aarch64=('99f04690a3b90d9845d98c5904f1b2f774f5f9de6074e657812f9caa4209abd3')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
