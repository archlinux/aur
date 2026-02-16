# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=cmfy-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A flexible ComfyUI CLI"
arch=('x86_64')
url="https://github.com/byteowlz/cmfy"
license=('MIT')
provides=('cmfy')
conflicts=('cmfy')
source=("cmfy-${pkgver}.tar.gz::https://github.com/byteowlz/cmfy/releases/download/v${pkgver}/cmfy-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('1884702bc9c0aef8ef8fe8687588703f068ee3398d4132875ecc6a740e5b17e9')

package() {
    install -Dm755 cmfy "$pkgdir/usr/bin/cmfy"
}
