# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=cmfy-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A flexible ComfyUI CLI"
arch=('x86_64')
url="https://github.com/byteowlz/cmfy"
license=('MIT')
provides=('cmfy')
conflicts=('cmfy')
source=("cmfy-${pkgver}.tar.gz::https://github.com/byteowlz/cmfy/releases/download/v${pkgver}/cmfy-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('dd11476a30c0a1b3b5add4ac502cb3f1e4f1f743a4df2b9b98de5e86f85077d1')

package() {
    install -Dm755 cmfy "$pkgdir/usr/bin/cmfy"
}
