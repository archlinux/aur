# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=hmr-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A slim, fast CLI for Home Assistant"
arch=('x86_64')
url="https://github.com/byteowlz/hmr"
license=('MIT')
provides=('hmr')
conflicts=('hmr')
depends=('gcc-libs')
source=("hmr-${pkgver}.tar.gz::https://github.com/byteowlz/hmr/releases/download/v${pkgver}/hmr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('2efca53dc709f9db89f9fafd2543f2709a6a2e1883938d6b0d0ac38961518721')

package() {
    install -Dm755 hmr "$pkgdir/usr/bin/hmr"
}
