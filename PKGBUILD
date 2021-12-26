# Maintainer: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello-bin
pkgver=1.5.2
pkgrel=1
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('x86_64')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
depends=('gcc-libs')
provides=('jello')
conflicts=('jello')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/jello-$pkgver-linux-x86_64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/README.md"
        "jello-$pkgver-man.1::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/man/jello.1")
sha256sums=('a776437476f1b217fbf05f254f1288737cf9a0c6bb06c66dfd1f79088f164adb'
            '1a404c97debd32c80005736bd368078ccc8f858c8ebafa2576b0c3919afb92c4'
            '25e80d9dec5aba1e2a01ba7b0964253732c1015680caf076b3199e5717896a0d'
            '7d8b60ad4794d9f647b5f899375a76e3dfbe7a96fb998c1c274f50b57d03e707')

package() {
  install -D jello -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "jello-$pkgver-man.1" "$pkgdir/usr/share/man/man1/jello.1"
}

# vim: ts=2 sw=2 et:
