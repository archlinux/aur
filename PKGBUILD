# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev

pkgname=slint-lsp-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="A language server protocol implementation for slint"
arch=("x86_64")
url="https://slint-ui.com"
license=("GPL3")
source=("slint-lsp-$pkgver.tar.gz::https://github.com/slint-ui/slint/releases/download/v$pkgver/slint-lsp-linux.tar.gz")
sha256sums=('19a7bbbff1c9ea430e364e3f51dec29e733cb957cf5c0b4b223ac1dc3f501395')
provides=("slint-lsp")
depends=("qt5-base")

package() {
  cd "$srcdir/slint-lsp"
  install -Dm 755 slint-lsp "${pkgdir}/usr/bin/slint-lsp"
}
