# Maintainer: structwafel <aur@structwafel.dev>

pkgname=ferrishot-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="A screenshot tool written in Rust"
arch=('x86_64')
url="https://github.com/nik-rev/ferrishot"
license=('MIT' 'Apache')
depends=()
makedepends=()
options=()
source=("$pkgname-$pkgver.tar.xz::https://github.com/nik-rev/ferrishot/releases/download/v$pkgver/ferrishot-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('b4befbdaeca03e7881985b9568f717631f2a4216bc17f778de8bc64f1f7d241b')

package() {
  # Install binary
  install -Dm755 "$srcdir/ferrishot-x86_64-unknown-linux-gnu/ferrishot" "$pkgdir/usr/bin/ferrishot"
  
  # Install license files
  install -Dm644 "$srcdir/ferrishot-x86_64-unknown-linux-gnu/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "$srcdir/ferrishot-x86_64-unknown-linux-gnu/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  
  # Install documentation
  install -Dm644 "$srcdir/ferrishot-x86_64-unknown-linux-gnu/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/ferrishot-x86_64-unknown-linux-gnu/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
