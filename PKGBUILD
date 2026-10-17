# Maintainer: flear <teymurzadehuseyn14 at gmail dot com>
pkgname=butaglyph-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Fast prompt for bash, zsh, fish and PowerShell, with presets, gradients and its own git reader (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/Huseynteymurzade28/butaglyph'
license=('MIT')
options=('!debug')
optdepends=('ttf-nerd-fonts-symbols: icons for the default look and most presets')
provides=('butaglyph')
conflicts=('butaglyph')
source_x86_64=("buta-v$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/buta-v$pkgver-x86_64-linux.tar.gz")
source_aarch64=("buta-v$pkgver-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/buta-v$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('9acc4dd9a55e5549b49ea43c5dd95f0a4829668177cc7bfb949edd8bc4248538')
sha256sums_aarch64=('90b3f8203982ab86e8fc199609af9f9797425733f69aca68666fc5fdf4d6d6f8')

package() {
  install -Dm755 buta "$pkgdir/usr/bin/buta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
