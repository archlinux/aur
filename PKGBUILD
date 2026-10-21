# Maintainer: Alex Krieger <alex@ai-krieger.de>
pkgname=aurelia-tui-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Terminal UI for the Aurelia Steam CLI - browse, install, update, and launch Steam games (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Drackrath/Aurelia-TUI"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib' 'brotli' 'zstd' 'aurelia>=0.1.40')
provides=('aurelia-tui')
conflicts=('aurelia-tui')
source_x86_64=("aurelia-tui-$pkgver-x86_64::$url/releases/download/v$pkgver/aurelia_tui_linux_x86_64")
source_aarch64=("aurelia-tui-$pkgver-aarch64::$url/releases/download/v$pkgver/aurelia_tui_linux_arm64")
sha256sums_x86_64=('14577eedd208ef327abbb54dcc1d869cf3a6d018b09749be10ddd945f764f194')
sha256sums_aarch64=('3eb11f9a02f62dd0d2495f91dd96a47c28bde07e5925c961741506234fb75849')

package() {
  install -Dm755 "$srcdir/aurelia-tui-$pkgver-$CARCH" "$pkgdir/usr/bin/aurelia-tui"
}
