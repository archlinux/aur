pkgname=msgcardmaker
pkgver=1.0.0
pkgrel=1
pkgdesc="A tiny tool that generates a simple message card file from input text"
arch=('any')
url="https://github.com/supergamerpugs-afk/msgcardmaker"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/msgcardmaker" "$pkgdir/usr/bin/msgcardmaker"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
