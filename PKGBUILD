pkgname=swagsh
pkgver=0.6.0
pkgrel=1
pkgdesc="A sleek, high-performance Linux shell built in Rust for speed and reliability."
arch=('x86_64')
url="https://github.com/takashialpha/swagsh"
license=('Apache-2.0')

source=("https://github.com/takashialpha/swagsh/releases/download/v${pkgver}/swagsh-v${pkgver}-x86_64-linux.tar.gz"
"LICENSE::https://raw.githubusercontent.com/takashialpha/swagsh/v${pkgver}/LICENSE")
sha256sums=('SKIP' 'SKIP')

package() {
  cd "$srcdir"

  # Install the binary
  install -Dm755 swagsh-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/swagsh"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
