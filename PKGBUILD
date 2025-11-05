# Maintainer: Alessandro Maestri <umpire274@gmail.com>

pkgname=rfortune
pkgver=0.5.3
pkgrel=1
pkgdesc="A Rust-based clone of the classic 'fortune' command"
arch=('x86_64')
url="https://github.com/umpire274/rFortune"
license=('MIT')
depends=()
provides=('rfortune')
conflicts=('rfortune')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rfortune-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('9d50f9bf24b836cb9799a2792e108f2d685e9288ef2749bf6fe86010f951670d')

# Keywords: fortune

package() {
  install -Dm755 "target/release/rfortune" "$pkgdir/usr/bin/rfortune"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

