# Maintainer: flear <teymurzadehuseyn14 at gmail dot com>
pkgname=butaglyph-bin
pkgver=0.3.0
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
sha256sums_x86_64=('5e73e1c5c7e1c5812dc5bf5042522805acafb9e35d19129ccd297a820a119eee')
sha256sums_aarch64=('bb5ccc28564a0517732afd16a6c807605ba29b520f39eb1c145f81c18221dcb3')

package() {
  install -Dm755 buta "$pkgdir/usr/bin/buta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
