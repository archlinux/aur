# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev

pkgname=typst-lsp-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A brand-new language server for Typst,"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/nvarner/typst-lsp"
license=("GPL3")

source_x86_64=("typst-lsp-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-x64")
source_armv7h=("typst-lsp-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-armhf")
source_aarch64=("typst-lsp-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-arm64")

sha256sums_x86_64=('8927a35f00e34908c1b015a5f6da626e187a56fdb4bd4232ff2809076f420389')
sha256sums_armv7h=('8927a35f00e34908c1b015a5f6da626e187a56fdb4bd4232ff2809076f420389')
sha256sums_aarch64=('8927a35f00e34908c1b015a5f6da626e187a56fdb4bd4232ff2809076f420389')

provides=("typst-lsp")
depends=("qt5-base")

package() {
  cd "$srcdir/"
  install -Dm 755 typst-lsp-$pkgver "${pkgdir}/usr/bin/typst-lsp"
}
