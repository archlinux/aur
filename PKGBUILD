# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('a49d4e1d1fd5fce4e7c71d7fedd862ad4f070767280f73cfa736b6ef84b96bd7')
sha256sums_aarch64=('7df130837018ed75d7a0a0171f7b1aaae6fcf101c12a2083f94c4e566ea8a37e')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
