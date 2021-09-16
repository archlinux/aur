# Maintainer: Funami
pkgname=wasm-pack-bin
pkgver=0.10.1
pkgrel=2
pkgdesc="Your favorite rust -> wasm workflow tool!"
arch=('x86_64')
url="https://github.com/rustwasm/wasm-pack"
license=('APACHE' 'MIT')
provides=('wasm-pack')
conflicts=('wasm-pack')
source=("https://github.com/rustwasm/wasm-pack/releases/download/v$pkgver/wasm-pack-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('524f8333e69c7157239c14c3140ee485b8cb4000d530344d62984e544f27c67f')

package() {
  cd "wasm-pack-v$pkgver-x86_64-unknown-linux-musl"
  install -Dm755 wasm-pack -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/wasm-pack"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wasm-pack"
}
