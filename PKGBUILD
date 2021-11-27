# Maintainer: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello-bin
pkgver=1.4.5
pkgrel=1
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('x86_64')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
provides=('jello')
conflicts=('jello')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/jello-$pkgver-linux-x86_64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/README.md"
        "jello-$pkgver.1::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/man/jello.1")
sha256sums=('03952622fe7b7846f3ab6928a151643f84ca9cc48562d14b5215e01c826d2f9e'
            '1a404c97debd32c80005736bd368078ccc8f858c8ebafa2576b0c3919afb92c4'
            'f10f10bb8493389be3085f9b44a0d8262d12810820addd5eab2c81cb445b0c6a'
            '6b40e5edc2f97bae087f640450fef96e3397c3c8b8b93ad136530f10ea291bed')

package() {
  install -D jello -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "jello-$pkgver.1" "$pkgdir/usr/share/man/man1/jello.1"
}

# vim: ts=2 sw=2 et:
