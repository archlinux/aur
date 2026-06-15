# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gimji
pkgver=0.1.0
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

sha256sums_x86_64=('69258f657a5c6acf67c0559acd4d9eb3193568a7756faa2706ef99d5a89ddbab')
sha256sums_aarch64=('b67cdaffaf961302b4712c80be7e605851ae069bb617118a08eb414c83cb9134')

package() {
  install -Dm755 gimji "$pkgdir/usr/bin/gimji"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
