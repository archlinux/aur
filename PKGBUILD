# Maintainer: mmoya <mmoya at mmoya dot org>

pkgname=maki-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="An efficient AI coding agent"
arch=('x86_64')
url="https://github.com/tontinton/maki"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/maki-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('6499801f60c15406c1e71c6c1f6d786ad2cc619c5da4a7434ded717c2dbcfdbe')
options=('!debug')

package() {
    install -Dm755 maki "${pkgdir}/usr/bin/maki"
}
