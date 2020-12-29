# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=20201229T001654
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("${pkgname}-${pkgver}::https://github.com/clojure-lsp/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('c7878a495241ca0b387b62b5ad6d82576ffebfb81c05d06b7ddddb8ae903c000')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
