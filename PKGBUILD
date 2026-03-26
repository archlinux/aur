# Maintainer: Dominik Chwirot dchwirot01@gmail.com
pkgname=sealsay
pkgver=1.1.1
pkgrel=2
pkgdesc="CLI app that generates ASCII art of a seal saying a message"
arch=(any)
url="https://github.com/phantypengy/sealsay"
license=('GPL-3.0-or-later')
depends=(python)

source=("$pkgname-$pkgver.tar.gz::https://github.com/phantypengy/sealsay/archive/v$pkgver.tar.gz")
sha256sums=('e8e37fc2e3076d883d8cde1aebc63aa5fe9eec284138a153af0245fc6e526a66')

package() {
    install -Dm755 "$srcdir/sealsay-$pkgver/sealsay" "$pkgdir/usr/bin/sealsay"
    install -Dm644 "$srcdir/sealsay-$pkgver/seals/"* "$pkgdir/usr/share/seals/"
}