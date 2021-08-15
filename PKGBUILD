# Maintainer: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello-bin
pkgver=1.4.4
pkgrel=1
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('x86_64')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
depends=('python-pygments')
provides=('jello')
conflicts=('jello')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/jello-$pkgver-linux-x86_64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/README.md"
        "jello-$pkgver.1::https://raw.githubusercontent.com/kellyjonbrazil/jello/v$pkgver/man/jello.1")
sha256sums=('56348cd387d244e87b6c0c6e652172536013965578b29e99571b0346ef1c3212'
            '1a404c97debd32c80005736bd368078ccc8f858c8ebafa2576b0c3919afb92c4'
            'beaaf3551e39f89e2883ae0d54d0b581e581124c2553ce2493acd12ee2a5ad23'
            'f8bf6563747618790c8c12679c284e23d04aad749063afc4ac471be37c949ac4')

package() {
  install -Dm755 jello -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-$pkgver.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "jello-$pkgver.1" "$pkgdir/usr/share/man/man1/jello.1"
}

# vim: ts=2 sw=2 et:
