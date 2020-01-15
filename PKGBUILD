# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>
# Contributer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clojure-lsp-bin
pkgver=20200114T225020
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('0b2e89da311b9941c8be189a9ed13f1a899c701b6326aeea1b2ec074be3da2bb')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
