# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=catbath
pkgver=0.1.0
pkgrel=1
pkgdesc="a tiny terminal text editor with search, undo, mouse."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/catbath"
license=('MIT')
depends=('gcc-libs')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$url/releases/download/v$pkgver/catbath-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.tar.gz::$url/releases/download/v$pkgver/catbath-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('2527ee5da3381f75608e46687bc2709d7634ae53318403467cb364fdd33eb0ce')
sha256sums_aarch64=('a2030fb1584a72a6571e1d0c16c74cb25e8d2b6972ec1744d7fa24c510335ef4')

package() {
  install -Dm755 catbath "$pkgdir/usr/bin/catbath"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
