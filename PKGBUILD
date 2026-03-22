# Maintainer: Dominik Chwirot dchwirot01@gmail.com
pkgname=sealsay
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI app that generates ASCII art of a seal saying a message"
arch=(any)
url="https://github.com/phantypengy/sealsay"
license=('GPL-3.0-or-later')
depends=(python)

source=("$pkgname-$pkgver.tar.gz::https://github.com/phantypengy/sealsay/archive/v$pkgver.tar.gz")
sha256sums=('ec9f86883202b6b11c5a94860e270a45266e667ff65e7d0b78edc847ae95f86b')

package() {
    install -Dm755 "$srcdir/sealsay-$pkgver/sealsay" "$pkgdir/usr/bin/sealsay"
}