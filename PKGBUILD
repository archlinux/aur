# Maintainer: flear <teymurzadehuseyn14 at gmail dot com>
pkgname=butaglyph-bin
pkgver=0.5.0
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
sha256sums_x86_64=('b17ae6fba57810dabf8b5341f7d03a9223d3cf4c35b0c3f22fe4b47ad53abb74')
sha256sums_aarch64=('9fe0e178a807e32b583338ad4e08d2a98103d70e0f08b4cef87dfc6a7d9eaa66')

package() {
  install -Dm755 buta "$pkgdir/usr/bin/buta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
