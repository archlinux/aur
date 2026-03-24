# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=cmfy-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="A flexible ComfyUI CLI"
arch=('x86_64')
url="https://github.com/byteowlz/cmfy"
license=('MIT')
provides=('cmfy')
conflicts=('cmfy')
source=("cmfy-${pkgver}.tar.gz::https://github.com/byteowlz/cmfy/releases/download/v${pkgver}/cmfy-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c5ae0c079b59294319e78e7f03439d9eec1b9e1206e28cdc891f45f30219f3aa')

package() {
    install -Dm755 cmfy "$pkgdir/usr/bin/cmfy"
}
