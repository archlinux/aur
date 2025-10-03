# Maintainer: Alessandro Maestri <umpire274@gmail.com>

pkgname=rfortune
pkgver=0.5.0
pkgrel=1
pkgdesc="A Rust-based clone of the classic 'fortune' command"
arch=('x86_64')
url="https://github.com/umpire274/rFortune"
license=('MIT')
depends=()
provides=('rfortune')
conflicts=('rfortune')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rfortune-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a18b9690641608c8fcf40c99f7af0f3ee9f5f038f9f3718f856c6c62833564e5')

# Keywords: fortune

package() {
  install -Dm755 "target/release/rfortune" "$pkgdir/usr/bin/rfortune"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

