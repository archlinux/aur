# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('308ec7fb06dd9345b319ff824666d5eff1e952c273a49bde01f3ddefa3fcdadd')
sha256sums_aarch64=('b75e3a89cb29556e480b92747813d44a3a27b5b3bd4c3fd9f03d8ff10c88b221')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
