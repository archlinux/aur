# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gimji
pkgver=0.1.2
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

sha256sums_x86_64=('f66b913131f2681e71619d67895dbca5cca6975c4f578e8a46af0e1549a486cd')
sha256sums_aarch64=('1b730b16a88a8ddba55631ba69152e109041dd9ee3119eb45da1dfebeae555d7')

package() {
  install -Dm755 gimji "$pkgdir/usr/bin/gimji"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
