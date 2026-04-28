# Maintainer: mmoya <mmoya at mmoya dot org>

pkgname=maki-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="An efficient AI coding agent"
arch=('x86_64')
url="https://github.com/tontinton/maki"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/maki-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('bc2e6e97bd808ce79b54909c13f2740d82bbf645510348666f7591e069468e28')
options=('!debug')

package() {
    install -Dm755 maki "${pkgdir}/usr/bin/maki"
}
