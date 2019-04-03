# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=20190331T074339
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")
sha256sums=('912c07bf395c4cdc0099030d1b49598be8416dd73ee4699d3112ffdf5c220844')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
