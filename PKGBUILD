# Maintainer: Dominik Chwirot dchwirot01@gmail.com
pkgname=sealsay
pkgver=1.1.3
pkgrel=1
pkgdesc="CLI app that generates ASCII art of a seal saying a message"
arch=(any)
url="https://github.com/phantypengy/sealsay"
license=('GPL-3.0-or-later')
depends=(python)

source=("$pkgname-$pkgver.tar.gz::https://github.com/phantypengy/sealsay/archive/v$pkgver.tar.gz")
sha256sums=('e04bd9e943e70a606c2c05496cdc1afaca850f07a3acc0443a940e44fab6fa47')

package() {
    install -Dm755 "$srcdir/sealsay-$pkgver/sealsay" "$pkgdir/usr/bin/sealsay"
    mkdir -p "$pkgdir/usr/share/sealsay/seals"
    install -Dm644 "$srcdir/sealsay-$pkgver/seals/"* "$pkgdir/usr/share/sealsay/seals/"
}