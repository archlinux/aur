# Maintainer: flear <teymurzadehuseyn14 at gmail dot com>
pkgname=butaglyph-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Fast prompt for bash, zsh, fish and PowerShell, with presets, gradients and its own git reader (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/Huseynteymurzade28/butaglyph'
license=('MIT')
options=('!debug')
optdepends=('ttf-nerd-fonts-symbols: icons with .glyphs = .nerd')
provides=('butaglyph')
conflicts=('butaglyph')
source_x86_64=("buta-v$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/buta-v$pkgver-x86_64-linux.tar.gz")
source_aarch64=("buta-v$pkgver-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/buta-v$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('693a1165a9708205b3187c71071267b7c8eb962a4f94c4ca3ecd64d831d928be')
sha256sums_aarch64=('f05bc96e896db77b0da0d0c73d5ceed7053ea6ccd0697ce0b644f0a4a943f7cc')

package() {
  install -Dm755 buta "$pkgdir/usr/bin/buta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
