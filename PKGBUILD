pkgname=rextedi
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal text editor written in Rust"
arch=('x86_64')
url="https://github.com/M-Brachtl/Rextedi"
license=('MIT')
depends=()
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://github.com/M-Brachtl/Rextedi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/*/
  cargo build --release
}

package() {
  cd "$srcdir"/*/
  install -Dm755 target/release/rextedi "$pkgdir/usr/bin/rextedi"
}
