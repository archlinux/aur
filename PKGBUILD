# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gimji
pkgver=0.1.3
pkgrel=1
pkgdesc="Minimal local-first notes for projects, tasks, boards, calendars, and markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/gimji"
license=('MIT')
depends=('gcc-libs')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/gimji-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/gimji-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('7050fa68790a48e0efc65095852fe82c703228684cfd7751a4b366fc6c0ad3a5')
sha256sums_aarch64=('05c9e4581cd6ac952fdb3e453fd5e8bffba8024d99dab0b46543d64b00af479e')

package() {
  install -Dm755 gimji "$pkgdir/usr/bin/gimji"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
