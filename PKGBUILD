# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=devdrop
pkgver=0.1.0
pkgrel=1
pkgdesc="Local-first workspace sync for developers"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/devdrop"
license=('MIT')
depends=('gcc-libs')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/devdrop-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/devdrop-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('3bf051daaf60cd9484ec1bcde3626a1f24e0b46232567b2c3f6b6744cd40a2d1')
sha256sums_aarch64=('57fc7e07d667ffbdfd7cbd388dc5f1c1254be6991cc6f786014f522788105234')

package() {
  install -Dm755 devdrop "$pkgdir/usr/bin/devdrop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
