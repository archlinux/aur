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
sha256sums=('be9955241a40232d102402b6fb085ffefcee87d758879e7afb2d1d2fcdb739af')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/dunst-timer.py" "$pkgdir/usr/bin/dunst-timer"
}
