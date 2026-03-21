# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=cmfy-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A flexible ComfyUI CLI"
arch=('x86_64')
url="https://github.com/byteowlz/cmfy"
license=('MIT')
provides=('cmfy')
conflicts=('cmfy')
source=("cmfy-${pkgver}.tar.gz::https://github.com/byteowlz/cmfy/releases/download/v${pkgver}/cmfy-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('662692df08c4f80542cd82c0d6fc1e5c3aed5c8a9b92f003dd69b72a2b5e483e')

package() {
    install -Dm755 cmfy "$pkgdir/usr/bin/cmfy"
}
