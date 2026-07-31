# Maintainer: Alex Krieger <alex@ai-krieger.de>
pkgname=aurelia-tui-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Terminal UI for the Aurelia Steam CLI - browse, install, update, and launch Steam games (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Drackrath/Aurelia-TUI"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib' 'brotli' 'zstd' 'aurelia>=0.1.11')
provides=('aurelia-tui')
conflicts=('aurelia-tui')
source_x86_64=("aurelia-tui-$pkgver::$url/releases/download/v$pkgver/aurelia_tui_linux_x86_64")
source_aarch64=("aurelia-tui-$pkgver::$url/releases/download/v$pkgver/aurelia_tui_linux_arm64")
sha256sums_x86_64=('c24d6c11a3a039d29bf57090da3a9dee2f31445951c1c221e410eb1035e69882')
sha256sums_aarch64=('8784c6709236a20a99c494771af06e8bd0db0029b8f409c521fcff0abaf3e492')

package() {
  install -Dm755 "$srcdir/aurelia-tui-$pkgver" "$pkgdir/usr/bin/aurelia-tui"
}
