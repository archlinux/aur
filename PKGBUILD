# Maintainer: Horace Liu <im.liuhq@gmail.com>

pkgname=ironbar-script-net-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A network speed monitoring script for Ironbar"
arch=('x86_64')
url="https://github.com/liuhq/ironbar-script-net"
license=('MIT')
source=("$url/releases/download/$pkgver/ironbar-script-net_$pkgver"
    "LICENSE-SOURCE")
sha256sums=('7fc7dd0d7dd743532251675904ced73eb4ef6b58f09e00ed16208f3f02afe414'
    '5d63954f8750743a7c406a705cc9d8ee800b1c555b03ebef43454f80075f6969')

package() {
    install -Dm755 "$srcdir/ironbar-script-net_$pkgver" \
        "$pkgdir/usr/bin/ironbar-script-net"

    install -Dm644 "$srcdir/LICENSE-SOURCE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

