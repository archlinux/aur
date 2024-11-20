# Maintainer: bitSheriff <root@bitsheriff.dev>
pkgname=dunst-timer
pkgver=1.00.05
pkgrel=1
pkgdesc="A Python script for setting timers with progress bar notifications in Dunst"
arch=('any')
url="https://github.com/bitSheriff/dunst-timer"
license=('MIT')
depends=('python' 'dunst')
source=("https://github.com/bitSheriff/dunst-timer/archive/v$pkgver.tar.gz")
sha256sums=('5d7d73178a55ae00bd4980376a4843995f85e36b3b41e05087cab30b5d111ef9')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/dunst-timer.py" "$pkgdir/usr/bin/dunst-timer"
    chmod +x "$pkgdir/usr/bin/dunst-timer"
}
