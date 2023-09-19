# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev

pkgname=slint-lsp-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A language server protocol implementation for slint"
arch=("x86_64")
url="https://slint-ui.com"
license=("GPL3")
source=("slint-lsp-$pkgver.tar.gz::https://github.com/slint-ui/slint/releases/download/v$pkgver/slint-lsp-linux.tar.gz")
sha256sums=('67c5b1e1b2aa26b6a1b38ad3bd797b78394e087d8c4942cb5e53de0a1e5701ba')
provides=("slint-lsp")
depends=("qt5-base")

package() {
  cd "$srcdir/slint-lsp"
  install -Dm 755 slint-lsp "${pkgdir}/usr/bin/slint-lsp"
}
