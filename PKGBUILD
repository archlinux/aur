# Maintainer: Luca Mathias <lmathias@pm.me>
pkgname=basecv-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line converter between number bases (decimal, hex, binary, octal, 2-36)"
arch=('x86_64')
url="https://codeberg.org/lmathias/basecv"
license=('MIT')
provides=('basecv')
conflicts=('basecv')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/lmathias/basecv/releases/download/v$pkgver/basecv-$pkgver-linux-x64.tar.gz")
sha256sums=('ab7bcc9601c6cfa1f127736a14147c77cb4615f74038f7f54617d025d08613a7')

package() {
  install -Dm755 "$srcdir/basecv-$pkgver-linux-x64" "$pkgdir/usr/bin/basecv"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
