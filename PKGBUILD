# Maintainer: Aneesh Sambu <sambuaneesh@gmail.com>

pkgname=codex-shwap-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Secure, keyboard-first TUI account switcher for Codex (prebuilt binary)'
arch=('x86_64')
url='https://github.com/sambuaneesh/codex-shwap'
license=('MIT')
depends=('gcc-libs')
provides=("codex-shwap=$pkgver")
conflicts=('codex-shwap')
options=('!strip' '!debug')
source=("codex-shwap-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/codex-shwap-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('17cf1de5f4277b10130c01c26c4b11de76c83c5f646724914497c10ec63fcb3f')

package() {
  install -Dm755 "$srcdir/codex-shwap-$pkgver-x86_64-unknown-linux-gnu/codex-shwap" "$pkgdir/usr/bin/codex-shwap"
  install -Dm644 "$srcdir/codex-shwap-$pkgver-x86_64-unknown-linux-gnu/LICENSE" "$pkgdir/usr/share/licenses/codex-shwap/LICENSE"
}
