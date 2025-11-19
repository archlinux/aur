pkgname=meloic
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple TUI music listening tool written in Rust"
arch=('x86_64')
url="https://github.com/Huseynteymurzade28/meloic"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/meloic"
  cargo build --release --locked
}

package() {
  cd "$srcdir/meloic"
  install -Dm755 "target/release/meloic" "$pkgdir/usr/bin/meloic"
}

