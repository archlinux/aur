# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gimji
pkgver=0.1.4
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

sha256sums_x86_64=('9ddd74db0f78b161c28af5b100fa85b4f84b7b384325b750d4134d52aa3beef2')
sha256sums_aarch64=('aeb9ff0f935b3d66b856480e4a7575569e485bcb9999369f2a82acd4ae726832')

package() {
  install -Dm755 gimji "$pkgdir/usr/bin/gimji"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
