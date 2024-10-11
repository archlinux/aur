# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev

pkgname=slint-lsp-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="A language server protocol implementation for slint"
arch=("x86_64")
url="https://slint-ui.com"
license=("GPL3")
source=("slint-lsp-$pkgver.tar.gz::https://github.com/slint-ui/slint/releases/download/v$pkgver/slint-lsp-linux.tar.gz")
sha256sums=('b6ae2b6cae8711a7098b85a547bfa80f91171eb7b15c0b1064708207eb17ed93')
provides=("slint-lsp")
depends=("qt5-base")

package() {
  cd "$srcdir/slint-lsp"
  install -Dm 755 slint-lsp "${pkgdir}/usr/bin/slint-lsp"
}
