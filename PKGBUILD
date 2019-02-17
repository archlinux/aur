# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=20181120T050154
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")
sha256sums=('db4825bffb13a9077c1c445e655c70925ddea7958b6aff5db5354fce9df27b46')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
