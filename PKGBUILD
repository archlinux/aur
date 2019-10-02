# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>
# Contributer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clojure-lsp-bin
pkgver=20190926T214237
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('4a431213252b1918313b9942b8ed28434f1255a5f3bd2b8b54bd5410393133ee')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
