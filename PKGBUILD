# Maintainer: mmoya <mmoya at mmoya dot org>

pkgname=maki-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="An efficient AI coding agent"
arch=('x86_64')
url="https://github.com/tontinton/maki"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/maki-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('c0eae4643e0f6ff0a405d38f4ed586b9f03afa4a71bf27755f575ebeb92e37ab')
options=('!debug')

package() {
    install -Dm755 maki "${pkgdir}/usr/bin/maki"
}
