# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=hmr-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A slim, fast CLI for Home Assistant"
arch=('x86_64')
url="https://github.com/byteowlz/hmr"
license=('MIT')
provides=('hmr')
conflicts=('hmr')
depends=('gcc-libs')
source=("hmr-${pkgver}.tar.gz::https://github.com/byteowlz/hmr/releases/download/v${pkgver}/hmr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('34958616e18aa901c9d6e5175a19a253abfb4debcab5a65add71982dcf26b8ad')

package() {
    install -Dm755 hmr "$pkgdir/usr/bin/hmr"
}
