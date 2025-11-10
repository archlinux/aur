# Maintainer: Alessandro Maestri <umpire274@gmail.com>

pkgname=rfortune
pkgver=0.5.5
pkgrel=1
pkgdesc="A Rust-based clone of the classic 'fortune' command"
arch=('x86_64')
url="https://github.com/umpire274/rFortune"
license=('MIT')
depends=()
provides=('rfortune')
conflicts=('rfortune')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rfortune-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a1cb9e7fdd2c828246866e97e99f2952c9e5f5b602d731d554f65e7c85ebc33a')

# Keywords: fortune

package() {
  install -Dm755 "target/release/rfortune" "$pkgdir/usr/bin/rfortune"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

