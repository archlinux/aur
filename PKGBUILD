# Maintainer: therock
pkgname=the-house
pkgver=1.0.2
pkgrel=7
pkgdesc="A cursed command line casino suite. Russian roulette, blackjack, and more"
arch=('any')
url="https://github.com/therock444/the-house"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/therock444/the-house/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")
sha256sums=('8aab28bc5e9d5a388d6f1bce77980046e52940cf3e0bb84e25c175ec16e65be0')

package() {
  install -Dm755 "$srcdir/$pkgname/the-house" "$pkgdir/usr/bin/the-house"
  install -d "$pkgdir/usr/lib/$pkgname/games"
  install -m755 "$srcdir/$pkgname/games/"*.sh "$pkgdir/usr/lib/$pkgname/games/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

