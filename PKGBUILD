# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev

pkgname=slint-lsp-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A language server protocol implementation for slint"
arch=("x86_64")
url="https://slint-ui.com"
license=("GPL3")
source=("slint-lsp-$pkgver.tar.gz::https://github.com/slint-ui/slint/releases/download/v$pkgver/slint-lsp-linux.tar.gz")
sha256sums=('cabbe5c9c67abd2f5571c6eadc399a3fe72d460e9215196708ca40bd2655aceb')
provides=("slint-lsp")
depends=("qt5-base")

package() {
  cd "$srcdir/slint-lsp"
  install -Dm 755 slint-lsp "${pkgdir}/usr/bin/slint-lsp"
}
