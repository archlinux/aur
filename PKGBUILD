# Maintainer: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello-bin
pkgver=1.4.6
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
sha256sums=('309cc9fa2b104091859b9474cd7995061bfcbc672f64a5abddf528f7ab39c572'
            '1a404c97debd32c80005736bd368078ccc8f858c8ebafa2576b0c3919afb92c4'
            'df6d796253f8c00a6b985fc1637b4fd5c6bc86f96c68dde3799b5949fea69419'
            '1756d8d7b8d24d510d5f43e4e3b6ffaf4003d73d4de2569b346afb766c5b9ef8')

package() {
  install -D jello -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "jello-$pkgver.1" "$pkgdir/usr/share/man/man1/jello.1"
}

# vim: ts=2 sw=2 et:
