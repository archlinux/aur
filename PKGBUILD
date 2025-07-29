# Maintainer: Alessandro Maestri <umpire274@gmail.com>

pkgname=rfortune
pkgver=0.2.1
pkgrel=1
pkgdesc="A Rust-based clone of the classic 'fortune' command"
arch=('x86_64')
url="https://github.com/umpire274/rFortune"
license=('MIT')
depends=()
provides=('rfortune')
conflicts=('rfortune')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rfortune-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ea2e3bb42de6583a3d7bd725bf4a3c04f093133f84e0909edddee67dd554ca30')

# Keywords: fortune

package() {
  install -Dm755 "target/release/rfortune" "$pkgdir/usr/bin/rfortune"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/CHAANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

