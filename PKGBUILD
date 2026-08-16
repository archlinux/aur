# Maintainer: BitYoungjae <bityoungjae@gmail.com>
pkgname=chalkak-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Hyprland screenshot preview and editor utility (prebuilt binary)"
arch=('x86_64')
url="https://github.com/bityoungjae/chalkak"
license=('MIT' 'Apache-2.0')
depends=('gtk4' 'hyprland' 'grim' 'slurp' 'wl-clipboard')
optdepends=('chalkak-ocr-models: OCR text recognition support')
provides=('chalkak')
conflicts=('chalkak')
source=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/chalkak-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ae2d064e706d83b1ffef5d98943c79b52ed3ce5fc102df6d3f409419707092f1')

package() {
  install -Dm755 "chalkak" "$pkgdir/usr/bin/chalkak"
}
