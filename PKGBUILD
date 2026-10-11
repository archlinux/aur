# Maintainer: mmoya <mmoya at mmoya dot org>

pkgname=maki-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="An efficient AI coding agent"
arch=('x86_64')
url="https://github.com/tontinton/maki"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/maki-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('55c81674e9671d03aacc984af26bb63b9c33721b26521d5c1fe44bcb09aab0e4')
options=('!debug')

package() {
    install -Dm755 maki "${pkgdir}/usr/bin/maki"
}
