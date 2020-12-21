# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=20201221T023843
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('b224b4fb4cac93fdf034eceefe8b720402bb8c814294528ba624d978e3baa241')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
