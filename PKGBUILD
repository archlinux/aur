# Maintainer: symphonic-navigator <navigator4223@gmail.com>
pkgname=passpony
pkgver=1.0.0
pkgrel=1
pkgdesc="Cute and secure Diceware-style passphrase generator"
arch=('any')
url="https://github.com/symphonic-navigator/passpony"
license=('GPL3')
depends=('python') 
source=("$pkgname-$pkgver.tar.gz")
install=$pkgname.install
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 passpony "$pkgdir/usr/bin/passpony"
  install -Dm644 clean_wordlist.txt "$pkgdir/usr/share/passpony/clean_wordlist.txt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
