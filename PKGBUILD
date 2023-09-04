# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev

pkgname=slint-lsp-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A language server protocol implementation for slint"
arch=("x86_64")
url="https://slint-ui.com"
license=("GPL3")
source=("slint-lsp-$pkgver.tar.gz::https://github.com/slint-ui/slint/releases/download/v$pkgver/slint-lsp-linux.tar.gz")
sha256sums=('a2220c2662fd6b6bad78597719bf824788f7bf77d7e7adaeecba6683396bf0c4')
provides=("slint-lsp")
depends=("qt5-base")

package() {
  cd "$srcdir/slint-lsp"
  install -Dm 755 slint-lsp "${pkgdir}/usr/bin/slint-lsp"
}
