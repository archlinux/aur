# Maintainer: Horace Liu <im.liuhq@gmail.com>

pkgname=ironbar-script-net-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A network speed monitoring script for Ironbar"
arch=('x86_64')
url="https://github.com/liuhq/ironbar-script-net"
license=('MIT')
source=("$url/releases/download/$pkgver/ironbar-script-net"
    "LICENSE-SOURCE")
sha256sums=('dedc225cbcc3df69da72d37b0d086355f6df40e6c378f410f5384639a148488f'
    '5d63954f8750743a7c406a705cc9d8ee800b1c555b03ebef43454f80075f6969')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" \
        "$srcdir/ironbar-script-net"

    install -Dm644 "$srcdir/LICENSE-SOURCE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

