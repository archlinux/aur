# Maintainer: BitYoungjae <bityoungjae@gmail.com>
pkgname=chalkak-bin
pkgver=0.5.0
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
sha256sums=('c4111cc5fb9f745d47ccb8315d7f33206a80a56f8252685790c7a46d27ed3ce1')

package() {
  install -Dm755 "chalkak" "$pkgdir/usr/bin/chalkak"
}
